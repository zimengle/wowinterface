local trinketId = nil

local f = CreateFrame("Frame")
f:SetScript("OnUpdate", function()
  if(IsMounted()) then
    local itemId = GetInventoryItemID("player", 13)
    if(itemId) then
      if(itemId ~= 11122) then
        trinketId = itemId
        EquipItemByName(11122, 13) -- Carrot on a Stick
      end
    else
      trinketId = nil
      EquipItemByName(11122, 13) -- Carrot on a Stick
    end
  else
    local itemId = GetInventoryItemID("player", 13)
    if(itemId) then
      if(itemId ~= 11122) then
        trinketId = itemId
      elseif(trinketId) then
        EquipItemByName(trinketId, 13)
      end
      EquipItemByName(trinketId, 13)
    else
      trinketId = nil
    end
  end
end)
