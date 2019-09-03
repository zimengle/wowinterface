select(2, ...) 'aux.tabs.bids'

local T = require 'T'
local aux = require 'aux'
local info = require 'aux.util.info'
local scan_util = require 'aux.util.scan'
local scan = require 'aux.core.scan'

local tab = aux.tab '竞标'

auction_records = {}

function aux.LOAD()
    aux.event_listener('AUCTION_BIDDER_LIST_UPDATE', function()
        refresh = true
    end)
end

function tab.OPEN()
    frame:Show()
    refresh = true
end

function tab.CLOSE()
    frame:Hide()
end

function update_listing()
    listing:SetDatabase(auction_records)
end

function M.scan_auctions()

    status_bar:update_status(0, 0)
    status_bar:set_text('正在扫描…')

    T.wipe(auction_records)
    update_listing()
    scan.start{
        type = 'bidder',
        on_auction = function(auction_record)
            tinsert(auction_records, auction_record)
        end,
        on_complete = function()
            status_bar:update_status(1, 1)
            status_bar:set_text('扫描完毕')
            update_listing()
        end,
        on_abort = function()
            status_bar:update_status(1, 1)
            status_bar:set_text('取消扫描')
        end,
    }
end

do
    local scan_id = 0
    local IDLE, SEARCHING, FOUND = aux.enum(3)
    local state = IDLE
    local found_index

    function find_auction(record)
        if not listing:ContainsRecord(record) then return end

        scan.abort(scan_id)
        state = SEARCHING
        scan_id = scan_util.find(
            record,
            status_bar,
            function() state = IDLE end,
            function()
                state = IDLE
                listing:RemoveAuctionRecord(record)
            end,
            function(index)
                state = FOUND
                found_index = index

                if not record.high_bidder then
                    bid_button:SetScript('OnClick', function()
                        if scan_util.test(record, index) and listing:ContainsRecord(record) then
                            aux.place_bid('bidder', index, record.bid_price, record.bid_price < record.buyout_price and function()
                                info.bid_update(record)
                                listing:SetDatabase()
                            end or function() listing:RemoveAuctionRecord(record) end)
                        end
                    end)
                    bid_button:Enable()
                else
	                bid_button:Disable()
                end

                if record.buyout_price > 0 then
                    buyout_button:SetScript('OnClick', function()
                        if scan_util.test(record, index) and listing:ContainsRecord(record) then
                            aux.place_bid('bidder', index, record.buyout_price, function() listing:RemoveAuctionRecord(record) end)
                        end
                    end)
                    buyout_button:Enable()
                else
	                buyout_button:Disable()
                end
            end
        )
    end

    function on_update()
        if refresh then
            refresh = false
            scan_auctions()
        end

        if state == IDLE or state == SEARCHING then
            buyout_button:Disable()
            bid_button:Disable()
        end

        if state == SEARCHING then return end

        local selection = listing:GetSelection()
        if not selection then
            state = IDLE
        elseif selection and state == IDLE then
            find_auction(selection.record)
        elseif state == FOUND and not scan_util.test(selection.record, found_index) then
            buyout_button:Disable()
            bid_button:Disable()
            if not aux.bid_in_progress() then state = IDLE end
        end
    end
end