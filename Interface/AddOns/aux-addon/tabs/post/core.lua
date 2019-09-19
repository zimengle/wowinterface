select(2, ...) 'aux.tabs.post'

local T = require 'T'
local aux = require 'aux'
local info = require 'aux.util.info'
local sort_util = require 'aux.util.sort'
local persistence = require 'aux.util.persistence'
local money = require 'aux.util.money'
local scan_util = require 'aux.util.scan'
local stack = require 'aux.core.stack'
local scan = require 'aux.core.scan'
local history = require 'aux.core.history'
local item_listing = require 'aux.gui.item_listing'
local al = require 'aux.gui.auction_listing'
local gui = require 'aux.gui'

local tab = aux.tab '出售'

local settings_schema = {'tuple', '#', {duration='number'}, {start_price='number'}, {buyout_price='number'}, {hidden='boolean'}}

local scan_id, inventory_records, bid_records, buyout_records = 0, {}, {}, {}

M.DURATION_2, M.DURATION_8, M.DURATION_24 = 1, 2, 3

refresh = true

selected_item = nil

prepared_stack_slot = nil

function get_default_settings()
	return T.map('duration', aux.account_data.post_duration, 'start_price', 0, 'buyout_price', 0, 'hidden', false)
end

function aux.handle.LOAD2()
	data = aux.faction_data.post
end

function read_settings(item_key)
	item_key = item_key or selected_item.key
	return data[item_key] and persistence.read(settings_schema, data[item_key]) or get_default_settings()
end
function write_settings(settings, item_key)
	item_key = item_key or selected_item.key
	data[item_key] = persistence.write(settings_schema, settings)
end

do
	local bid_selections, buyout_selections = {}, {}
	function get_bid_selection()
		return bid_selections[selected_item.key]
	end
	function set_bid_selection(record)
		bid_selections[selected_item.key] = record
	end
	function get_buyout_selection()
		return buyout_selections[selected_item.key]
	end
	function set_buyout_selection(record)
		buyout_selections[selected_item.key] = record
	end
end

function refresh_button_click()
	scan.abort(scan_id)
	refresh_entries()
	refresh = true
end

function tab.OPEN()
    frame:Show()
    update_inventory_records()
    refresh = true
end

function tab.CLOSE()
    selected_item = nil
    ClearCursor()
    ClickAuctionSellItemButton()
    ClearCursor()
    aux.kill_thread(post_thread_id)
    frame:Hide()
end

function tab.USE_ITEM(item_id, suffix_id)
	select_item(item_id .. ':' .. suffix_id)
end

function get_unit_start_price()
	return selected_item and read_settings().start_price or 0
end

function set_unit_start_price(amount)
	local settings = read_settings()
	settings.start_price = amount
	write_settings(settings)
end

function get_unit_buyout_price()
	return selected_item and read_settings().buyout_price or 0
end

function set_unit_buyout_price(amount)
	local settings = read_settings()
	settings.buyout_price = amount
	write_settings(settings)
end

function update_inventory_listing()
	local records = aux.values(aux.filter(aux.copy(inventory_records), function(record)
		local settings = read_settings(record.key)
		return record.aux_quantity > 0 and (not settings.hidden or show_hidden_checkbox:GetChecked())
	end))
	sort(records, function(a, b) return a.name < b.name end)
	item_listing.populate(inventory_listing, records)
end

function update_auction_listing(listing, records, reference)
	local rows = T.acquire()
	if selected_item then
		local historical_value = history.value(selected_item.key)
		local stack_size = stack_size_slider:GetValue()
		for _, record in pairs(records[selected_item.key] or T.empty) do
			local price_color = undercut(record, stack_size_slider:GetValue(), listing == 'bid') < reference and aux.color.red
			local price = record.unit_price * (listing == 'bid' and record.stack_size or 1)
			tinsert(rows, T.map(
				'cols', T.list(
				T.map('value', record.own and aux.color.green(record.count) or record.count),
				T.map('value', al.time_left(record.duration)),
				T.map('value', record.stack_size == stack_size and aux.color.green(record.stack_size) or record.stack_size),
				T.map('value', money.to_string(price, true, nil, price_color)),
				T.map('value', historical_value and gui.percentage_historical(aux.round(price / historical_value * 100)) or '---')
			),
				'record', record
			))
		end
		if historical_value then
			tinsert(rows, T.map(
				'cols', T.list(
				T.map('value', '---'),
				T.map('value', '---'),
				T.map('value', '---'),
				T.map('value', money.to_string(historical_value * (listing == 'bid' and stack_size_slider:GetValue() or 1), true, nil, aux.color.green)),
				T.map('value', historical_value and gui.percentage_historical(100) or '---')
			),
				'record', T.map('historical_value', true, 'stack_size', stack_size, 'unit_price', historical_value, 'own', true)
			))
		end
		sort(rows, function(a, b)
			return sort_util.multi_lt(
				a.record.unit_price * (listing == 'bid' and a.record.stack_size or 1),
				b.record.unit_price * (listing == 'bid' and b.record.stack_size or 1),

				a.record.historical_value and 1 or 0,
				b.record.historical_value and 1 or 0,

				b.record.own and 0 or 1,
				a.record.own and 0 or 1,

				a.record.stack_size,
				b.record.stack_size,

				a.record.duration,
				b.record.duration
			)
		end)
	end
	if listing == 'bid' then
		bid_listing:SetData(rows)
	elseif listing == 'buyout' then
		buyout_listing:SetData(rows)
	end
end

function update_auction_listings()
	update_auction_listing('bid', bid_records, get_unit_start_price())
	update_auction_listing('buyout', buyout_records, get_unit_buyout_price())
end

function M.select_item(item_key)
    for _, inventory_record in pairs(aux.filter(aux.copy(inventory_records), function(record) return record.aux_quantity > 0 end)) do
        if inventory_record.key == item_key then
            update_item(inventory_record)
            return
        end
    end
end

function price_update()
    if selected_item then
        local historical_value = history.value(selected_item.key)
        if get_bid_selection() or get_buyout_selection() then
	        set_unit_start_price(undercut(get_bid_selection() or get_buyout_selection(), stack_size_slider:GetValue(), get_bid_selection()))
	        unit_start_price_input:SetText(money.to_string(get_unit_start_price(), true, nil, nil, true))
        end
        if get_buyout_selection() then
	        set_unit_buyout_price(undercut(get_buyout_selection(), stack_size_slider:GetValue()))
	        unit_buyout_price_input:SetText(money.to_string(get_unit_buyout_price(), true, nil, nil, true))
        end
        start_price_percentage:SetText(historical_value and gui.percentage_historical(aux.round(get_unit_start_price() / historical_value * 100)) or '---')
        buyout_price_percentage:SetText(historical_value and gui.percentage_historical(aux.round(get_unit_buyout_price() / historical_value * 100)) or '---')
    end
end

function post_auction()
    local slot = prepared_stack_slot
    local item_key = selected_item.key

    local unit_start_price = get_unit_start_price()
    local unit_buyout_price = get_unit_buyout_price()
    local stack_size = stack_size_slider:GetValue()
    local start_price = max(1, aux.round(get_unit_start_price() * stack_size)) -- TODO retail
    local buyout_price = aux.round(get_unit_buyout_price() * stack_size)
    local duration = UIDropDownMenu_GetSelectedValue(duration_dropdown)

    local item_info = info.container_item(unpack(slot))
    if not item_info or item_info.item_key ~= item_key or item_info.aux_quantity ~= stack_size then
        prepare_stack()
        return
    end

    ClearCursor()
    ClickAuctionSellItemButton()
    ClearCursor()
    PickupContainerItem(unpack(slot))
    ClickAuctionSellItemButton()
    ClearCursor()

    if not GetAuctionSellItemInfo() then
        prepare_stack()
        return
    end

    PostAuction(start_price, buyout_price, duration, stack_size)

    post_thread_id = aux.thread(
        aux.when,
        function()
            return not GetContainerItemInfo(unpack(slot))
        end,
        function()
            if not frame:IsShown() then
                return
            end
            record_auction(item_key, stack_size, unit_start_price, unit_buyout_price, duration, UnitName'player')
            update_inventory_records()
            local same
            for _, record in pairs(inventory_records) do
                if record.key == item_key then
                    same = record
                    break
                end
            end
            if same then
                update_item(same)
            else
                selected_item = nil
            end
            post_thread_id = nil
            refresh = true
        end
    )
end

function validate_parameters()
    if get_unit_buyout_price() > 0 and get_unit_start_price() > get_unit_buyout_price() then
        post_button:Disable()
        return
    end
    if get_unit_start_price() == 0 then
        post_button:Disable()
        return
    end
    if post_thread_id or not selected_item or not prepared_stack_slot or select(3, GetContainerItemInfo(unpack(prepared_stack_slot))) then
        post_button:Disable()
        return
    end
    -- TODO what if cannot afford deposit
    post_button:Enable()
end

function update_item_configuration()
	if not selected_item then
        refresh_button:Disable()

        item.texture:SetTexture(nil)
        item.count:SetText()
        item.name:SetTextColor(aux.color.label.enabled())
        item.name:SetText('未选择物品')

        unit_start_price_input:Hide()
        unit_buyout_price_input:Hide()
        stack_size_slider:Hide()
        deposit:Hide()
        duration_dropdown:Hide()
        hide_checkbox:Hide()
    else
		unit_start_price_input:Show()
        unit_buyout_price_input:Show()
        stack_size_slider:Show()
        deposit:Show()
        duration_dropdown:Show()
        hide_checkbox:Show()

        item.texture:SetTexture(selected_item.texture)
        item.name:SetText('[' .. selected_item.name .. ']')
		do
	        local color = ITEM_QUALITY_COLORS[selected_item.quality]
	        item.name:SetTextColor(color.r, color.g, color.b)
        end
		if selected_item.aux_quantity > 1 then
            item.count:SetText(selected_item.aux_quantity)
		else
            item.count:SetText()
        end

        stack_size_slider.editbox:SetNumber(stack_size_slider:GetValue())

        do
            local deposit_factor = UnitFactionGroup'npc' and .05 or .25
            local duration_factor = info.duration_hours(UIDropDownMenu_GetSelectedValue(duration_dropdown)) / 2
            local stack_size = selected_item.max_charges and 1 or stack_size_slider:GetValue()
            local amount = floor(selected_item.unit_vendor_price * deposit_factor * stack_size) * duration_factor
            deposit:SetText('押金: ' .. money.to_string(amount, nil, nil, aux.color.text.enabled))
        end

        refresh_button:Enable()
	end
end

function undercut(record, stack_size, stack)
    local price = ceil(record.unit_price * (stack and record.stack_size or stack_size))
    if not record.own then
	    price = price - 1
    end
    return price / stack_size
end

function prepare_stack()
    prepared_stack_slot = nil
    if selected_item then
        stack.start(selected_item.key, stack_size_slider:GetValue(), function(slot)
            prepared_stack_slot = slot
        end)
    end
end

function unit_vendor_price(item_key)
    for slot in info.inventory() do
	    T.temp(slot)
        local item_info = T.temp-info.container_item(unpack(slot))
        if item_info and item_info.item_key == item_key then
            if info.auctionable(item_info.tooltip, nil, true) and not item_info.lootable then
                ClearCursor()
                ClickAuctionSellItemButton()
                ClearCursor()
                PickupContainerItem(unpack(slot))
                ClickAuctionSellItemButton()
                local auction_sell_item = T.temp-info.auction_sell_item()
                ClearCursor()
                ClickAuctionSellItemButton()
                ClearCursor()
                if auction_sell_item then
                    return auction_sell_item.vendor_price / auction_sell_item.count
                end
            end
        end
    end
end

function update_item(item)
    local settings = read_settings(item.key)

    item.unit_vendor_price = unit_vendor_price(item.key)
    if not item.unit_vendor_price then
        settings.hidden = true
        write_settings(settings, item.key)
        refresh = true
        return
    end

    scan.abort(scan_id)

    UIDropDownMenu_Initialize(duration_dropdown, initialize_duration_dropdown)
    UIDropDownMenu_SetSelectedValue(duration_dropdown, settings.duration)

    hide_checkbox:SetChecked(settings.hidden)

    if item.max_charges then
	    for i = item.max_charges, 1, -1 do
			if item.availability[i] > 0 then
				stack_size_slider:SetMinMaxValues(1, i)
				break
			end
	    end
    else
	    stack_size_slider:SetMinMaxValues(1, min(item.max_stack, item.aux_quantity))
    end

    unit_start_price_input:SetText(money.to_string(settings.start_price, true, nil, nil, true))
    unit_buyout_price_input:SetText(money.to_string(settings.buyout_price, true, nil, nil, true))

    write_settings(settings, item.key)


    if not selected_item or selected_item.key ~= item.key then
        stack_size_slider:SetValue(math.huge)
    end
    selected_item = item

    if not bid_records[selected_item.key] then
        refresh_entries()
    end

    prepare_stack()

    refresh = true
end

function update_inventory_records()
    local auctionable_map = T.temp-T.acquire()
    for slot in info.inventory() do
	    T.temp(slot)
	    local item_info = T.temp-info.container_item(unpack(slot))
        if item_info then
            local charge_class = item_info.charges or 0
            if info.auctionable(item_info.tooltip, nil, true) and not item_info.lootable then
                if not auctionable_map[item_info.item_key] then
                    local availability = T.acquire()
                    for i = 0, 10 do
                        availability[i] = 0
                    end
                    availability[charge_class] = item_info.count
                    auctionable_map[item_info.item_key] = T.map(
	                    'item_id', item_info.item_id,
	                    'suffix_id', item_info.suffix_id,
	                    'key', item_info.item_key,
	                    'link', item_info.link,
	                    'name', item_info.name,
	                    'texture', item_info.texture,
	                    'quality', item_info.quality,
	                    'aux_quantity', item_info.charges or item_info.count,
	                    'max_stack', item_info.max_stack,
	                    'max_charges', item_info.max_charges,
	                    'availability', availability
                    )
                else
                    local auctionable = auctionable_map[item_info.item_key]
                    auctionable.availability[charge_class] = (auctionable.availability[charge_class] or 0) + item_info.count
                    auctionable.aux_quantity = auctionable.aux_quantity + (item_info.charges or item_info.count)
                end
            end
        end
    end
    T.release(inventory_records)
    inventory_records = aux.values(auctionable_map)
    refresh = true
end

function refresh_entries()
	if selected_item then
        local item_key = selected_item.key
		set_bid_selection()
        set_buyout_selection()
        bid_records[item_key], buyout_records[item_key] = nil, nil
        local query = scan_util.item_query(selected_item.item_id)
        status_bar:update_status(0, 0)
        status_bar:set_text('扫描拍卖中...')

		scan_id = scan.start{
            type = 'list',
            ignore_owner = true,
			queries = T.list(query),
			on_page_loaded = function(page, total_pages)
                status_bar:update_status(page / total_pages, 0) -- TODO
                status_bar:set_text(format('扫描: %d / %d', page, total_pages))
			end,
			on_auction = function(auction_record)
				if auction_record.item_key == item_key then
                    record_auction(
                        auction_record.item_key,
                        auction_record.aux_quantity,
                        auction_record.unit_blizzard_bid,
                        auction_record.unit_buyout_price,
                        auction_record.duration,
                        auction_record.owner
                    )
				end
			end,
			on_abort = function()
				bid_records[item_key], buyout_records[item_key] = nil, nil
                status_bar:update_status(1, 1)
                status_bar:set_text('扫描中止')
			end,
			on_complete = function()
				bid_records[item_key] = bid_records[item_key] or T.acquire()
				buyout_records[item_key] = buyout_records[item_key] or T.acquire()
                refresh = true
                status_bar:update_status(1, 1)
                status_bar:set_text('扫描完成')
            end,
		}
	end
end

function record_auction(key, aux_quantity, unit_blizzard_bid, unit_buyout_price, duration, owner)
    bid_records[key] = bid_records[key] or T.acquire()
    do
	    local entry
	    for _, record in pairs(bid_records[key]) do
	        if unit_blizzard_bid == record.unit_price and aux_quantity == record.stack_size and duration == record.duration and info.is_player(owner) == record.own then
	            entry = record
	        end
	    end
	    if not entry then
	        entry = T.map('stack_size', aux_quantity, 'unit_price', unit_blizzard_bid, 'duration', duration, 'own', info.is_player(owner), 'count', 0)
	        tinsert(bid_records[key], entry)
	    end
	    entry.count = entry.count + 1
    end
    buyout_records[key] = buyout_records[key] or T.acquire()
    if unit_buyout_price == 0 then return end
    do
	    local entry
	    for _, record in pairs(buyout_records[key]) do
		    if unit_buyout_price == record.unit_price and aux_quantity == record.stack_size and duration == record.duration and info.is_player(owner) == record.own then
			    entry = record
		    end
	    end
	    if not entry then
		    entry = T.map('stack_size', aux_quantity, 'unit_price', unit_buyout_price, 'duration', duration, 'own', info.is_player(owner), 'count', 0)
		    tinsert(buyout_records[key], entry)
	    end
	    entry.count = entry.count + 1
    end
end

function on_update()
    if refresh then
        refresh = false
        price_update()
        update_item_configuration()
        update_inventory_listing()
        update_auction_listings()
    end
    validate_parameters()
end

function initialize_duration_dropdown()
    local function on_click(self)
        UIDropDownMenu_SetSelectedValue(duration_dropdown, self.value)
        local settings = read_settings()
        settings.duration = self.value
        write_settings(settings)
        refresh = true
    end
    UIDropDownMenu_AddButton{
        text = '2 小时',
        value = DURATION_2,
        func = on_click,
    }
    UIDropDownMenu_AddButton{
        text = '8 小时',
        value = DURATION_8,
        func = on_click,
    }
    UIDropDownMenu_AddButton{
        text = '24 小时',
        value = DURATION_24,
        func = on_click,
    }
end
