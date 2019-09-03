select(2, ...) 'aux.core.post'

local aux = require 'aux'
local info = require 'aux.util.info'
local stack = require 'aux.core.stack'

local state

StaticPopupDialogs.AUX_POST_HARDWARE_EVENT = {
    text = '确定发布这项拍卖？',
    button1 = '确定',
    timeout = 0,
}

function aux.handle.CLOSE()
	stop()
end

function process()
	if state.posted < state.count then

		local stacking_complete

		local send_signal, signal_received = aux.signal()
		aux.when(signal_received, function()
			local slot = signal_received()[1]
			if slot then
				return post_auction(slot, process)
			else
				return stop()
			end
		end)

		return stack.start(state.item_key, state.stack_size, send_signal)
	end

	return stop()
end

function post_auction(slot, k)
	local item_info = info.container_item(unpack(slot))
	if item_info.item_key == state.item_key and info.auctionable(item_info.tooltip, nil, true) and item_info.aux_quantity == state.stack_size then

		ClearCursor()
		ClickAuctionSellItemButton()
		ClearCursor()
		PickupContainerItem(unpack(slot))
		ClickAuctionSellItemButton()
		ClearCursor()

        StaticPopupDialogs.AUX_POST_HARDWARE_EVENT.OnAccept = function()
            PostAuction(max(1, aux.round(state.unit_start_price * item_info.aux_quantity)), aux.round(state.unit_buyout_price * item_info.aux_quantity), state.duration, item_info.count) -- TODO retail
            StaticPopup_Hide('AUX_POST_HARDWARE_EVENT')
        end

        StaticPopup_Show('AUX_POST_HARDWARE_EVENT')

        aux.when(function()
            return not GetContainerItemInfo(unpack(slot))
        end, function()
            state.posted = state.posted + 1
            return k()
        end)

--        local send_signal, signal_received = aux.signal()
--        aux.when(signal_received, function()
--            state.posted = state.posted + 1
--            return k()
--        end)
--
--        aux.event_listener('CHAT_MSG_SYSTEM', function(kill, arg1)
--            if arg1 == ERR_AUCTION_STARTED then
--                send_signal()
--                kill()
--            end
--        end)
    else
		return stop()
	end
end

function M.stop()
	if state then
        StaticPopup_Hide('AUX_POST_HARDWARE_EVENT')

		aux.kill_thread(state.thread_id)

		local callback = state.callback
		local posted = state.posted

		state = nil

		if callback then
			callback(posted)
		end
	end
end

function M.start(item_key, stack_size, duration, unit_start_price, unit_buyout_price, count, callback)
	stop()
	state = {
		thread_id = aux.thread(process),
		item_key = item_key,
		stack_size = stack_size,
		duration = duration,
		unit_start_price = unit_start_price,
		unit_buyout_price = unit_buyout_price,
		count = count,
		posted = 0,
		callback = callback,
	}
end