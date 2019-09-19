if not AutoCarrotDB then
    AutoCarrotDB = { enabled = true, ridingGloves = true, mithrilSpurs = true }
end

local f = CreateFrame("Frame")
f:RegisterEvent('PLAYER_LOGIN')
f:RegisterEvent('BAG_UPDATE')
f:SetScript("OnUpdate", function()
    if(not AutoCarrotDB.enabled) then return end
    if(IsMounted()) then
        local itemId = GetInventoryItemID("player", 13) -- trinket slot 1
        if(itemId) then
            if(itemId ~= 11122) then
                AutoCarrotDB.trinketId = itemId
                EquipItemByName(11122, 13)
            end
        else
            AutoCarrotDB.trinketId = nil
            EquipItemByName(11122, 13)
        end
        if(AutoCarrotDB.ridingGloves and AutoCarrotDB.enchantHandsId) then
            itemId = GetInventoryItemID("player", 10) -- hands
            if(itemId) then
                if(itemId ~= AutoCarrotDB.enchantHandsId) then
                    AutoCarrotDB.handsId = itemId
                    EquipItemByName(AutoCarrotDB.enchantHandsId, 10)
                end
            else
                AutoCarrotDB.handsId = nil
                EquipItemByName(AutoCarrotDB.enchantHandsId, 10)
            end
        end
        if(AutoCarrotDB.mithrilSpurs and AutoCarrotDB.enchantBootsId) then    
            itemId = GetInventoryItemID("player", 8) -- feet
            if(itemId) then
                if(itemId ~= AutoCarrotDB.enchantBootsId) then
                    AutoCarrotDB.bootsId = itemId
                    EquipItemByName(AutoCarrotDB.enchantBootsId, 8)
                end
            else
                AutoCarrotDB.bootsId = nil
                EquipItemByName(AutoCarrotDB.enchantBootsId, 8)
            end
        end
    else
        local itemId = GetInventoryItemID("player", 13) -- trinket
        if(itemId) then
            if(itemId ~= 11122) then
                AutoCarrotDB.trinketId = itemId
            elseif(AutoCarrotDB.trinketId) then
                EquipItemByName(AutoCarrotDB.trinketId, 13)
            end
        else
            AutoCarrotDB.trinketId = nil
        end
        if(AutoCarrotDB.ridingGloves and AutoCarrotDB.enchantHandsId) then
            itemId = GetInventoryItemID("player", 10) -- hands
            if(itemId) then
                if(itemId ~= AutoCarrotDB.enchantHandsId) then
                    AutoCarrotDB.handsId = itemId
                elseif(AutoCarrotDB.handsId) then
                    EquipItemByName(AutoCarrotDB.handsId, 10)
                end
            else
                AutoCarrotDB.handsId = nil
            end
        end
        if(AutoCarrotDB.mithrilSpurs and AutoCarrotDB.enchantBootsId) then 
            itemId = GetInventoryItemID("player", 8) -- feet
            if(itemId) then
                if(itemId ~= AutoCarrotDB.enchantBootsId) then
                    AutoCarrotDB.bootsId = itemId
                elseif(AutoCarrotDB.bootsId) then
                    EquipItemByName(AutoCarrotDB.bootsId, 8)
                end
            else
                AutoCarrotDB.bootsId = nil
            end
        end    
    end
end)
f:SetScript('OnEvent', function(self, event, ...)
    for bag = 0, NUM_BAG_SLOTS do
        for slot = 0, GetContainerNumSlots(bag) do
            local link = GetContainerItemLink(bag, slot)
            if(link) then
                local itemId, enchantId = link:match("item:(%d+):(%d+)")
                if(enchantId == "930") then -- riding gloves
                    AutoCarrotDB.enchantHandsId = tonumber(itemId)
                elseif(enchantId == "464") then -- mithril spurs
                    AutoCarrotDB.enchantBootsId = tonumber(itemId)
                end
            end
        end
    end
end)

-- Print handler
function AutoCarrot_Print(msg)
	print("|cff00ff00Auto|cffed9121Carrot|r: "..(msg or ""))
end

-- Slash handler
local function OnSlash(key, value, ...)
    if key and key ~= "" then
        if key == "enabled" and tonumber(value) then
            local enable = tonumber(value) == 1 and true or false
            AutoCarrotDB.enabled = enable
            AutoCarrot_Print("'enabled' set: "..( enable and "true" or "false" ))
        elseif key == "ridinggloves" and tonumber(value) then
            local enable = tonumber(value) == 1 and true or false
            AutoCarrotDB.ridingGloves = enable
            AutoCarrot_Print("'ridingGloves' set: "..( enable and "true" or "false" ))
        elseif key == "mithrilspurs" and tonumber(value) then
            local enable = tonumber(value) == 1 and true or false
            AutoCarrotDB.mithrilSpurs = enable
            AutoCarrot_Print("'mithrilSpurs' set: "..( enable and "true" or "false" ))

        end
    else
        AutoCarrot_Print("Slash commands")
        AutoCarrot_Print(" - enabled 0/1")
        AutoCarrot_Print(" - ridingGloves 0/1")
        AutoCarrot_Print(" - mithrilSpurs 0/1")
    end
end

SLASH_AUTOCARROT1 = "/autocarrot";
SLASH_AUTOCARROT2 = "/ac";
SlashCmdList["AUTOCARROT"] = function(msg)
    msg = string.lower(msg)
    msg = { string.split(" ", msg) }
    if #msg >= 1 then
        local exec = table.remove(msg, 1)
        OnSlash(exec, unpack(msg))
    end
end

