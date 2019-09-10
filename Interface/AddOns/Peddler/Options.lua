local _, ns = ...

local frame = CreateFrame("Frame", nil, InterfaceOptionsFramePanelContainer)
frame.name = "Peddler"
frame:Hide()

frame:SetScript("OnShow", function(self)
	self:CreateOptions()
	self:SetScript("OnShow", nil)
end)

local function createCheckBox(parent, anchor, number, property, label, tooltip)
	local checkbox = CreateFrame("CheckButton", "PeddlerCheckBox" .. number, parent, "ChatConfigCheckButtonTemplate")
	checkbox:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 16, number * -26)

	local checkboxLabel = _G[checkbox:GetName() .. "Text"]
	checkboxLabel:SetText(label)
	checkboxLabel:SetPoint("TOPLEFT", checkbox, "RIGHT", 5, 7)

	checkbox.tooltip = tooltip
	checkbox:SetChecked(property)

	return checkbox
end

local function changeModifierKey(self)
	UIDropDownMenu_SetSelectedID(ModifierKeyDropDown, self:GetID())
	ModifierKey = self.value
end

local function initModifierKeys(self, level)
	local modifierKeys = {"CTRL", "ALT", "SHIFT", "CTRL-SHIFT", "CTRL-ALT", "ALT-SHIFT"}
	for index, modifierKey in pairs(modifierKeys) do
		local modifierKeyOption = UIDropDownMenu_CreateInfo()
		modifierKeyOption.text = modifierKey
		modifierKeyOption.value = modifierKey
		modifierKeyOption.func = changeModifierKey
		UIDropDownMenu_AddButton(modifierKeyOption)

		if modifierKey == ModifierKey then
			UIDropDownMenu_SetSelectedID(ModifierKeyDropDown, index)
		end
	end
end

local function changeIconPlacement(self)
	UIDropDownMenu_SetSelectedID(IconPlacementDropDown, self:GetID())
	IconPlacement = self.value
end

local function initIconPlacement(self, level)
	local iconPlacements = {"TOPLEFT", "TOPRIGHT", "BOTTOMLEFT", "BOTTOMRIGHT"}
	for index, iconPlacement in pairs(iconPlacements) do
		local iconPlacementOption = UIDropDownMenu_CreateInfo()
		iconPlacementOption.text = iconPlacement
		iconPlacementOption.value = iconPlacement
		iconPlacementOption.func = changeIconPlacement
		UIDropDownMenu_AddButton(iconPlacementOption)

		if iconPlacement == IconPlacement then
			UIDropDownMenu_SetSelectedID(IconPlacementDropDown, index)
		end
	end
end

function frame:CreateOptions()
	local title = self:CreateFontString(nil, nil, "GameFontNormalLarge")
	title:SetPoint("TOPLEFT", 16, -16)
	title:SetText("Peddler v5.0")

	local sellLimit = createCheckBox(self, title, 1, SellLimit, "卖出限制", "限制一次性销售的商品数量.")
	sellLimit:SetScript("PostClick", function(self, button, down)
		SellLimit = self:GetChecked()
	end)

	local silentMode = createCheckBox(self, title, 2, Silent, "静音模式", "停止在聊天框出现任何插件信息")
	silentMode:SetScript("PostClick", function(self, button, down)
		Silent = self:GetChecked()
	end)

	local silenceSaleSummary = createCheckBox(self, title, 3, SilenceSaleSummary, "禁止出售总结", "关闭聊天框的出售总结")
	silenceSaleSummary:SetScript("PostClick", function(self, button, down)
		SilenceSaleSummary = self:GetChecked()
	end)
	silenceSaleSummary:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 190, 2 * -26)

	local modifierKeyLabel = self:CreateFontString(nil, nil, "GameFontNormal")
	modifierKeyLabel:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 16, -90)
	modifierKeyLabel:SetText("修改键 (与右键单击一起使用，可标记/取消标记的物品):")

	local modifierKey = CreateFrame("Button", "ModifierKeyDropDown", self, "UIDropDownMenuTemplate")
	modifierKey:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 16, -107)
	UIDropDownMenu_Initialize(ModifierKeyDropDown, initModifierKeys)
	UIDropDownMenu_SetWidth(ModifierKeyDropDown, 90);
	UIDropDownMenu_SetButtonWidth(ModifierKeyDropDown, 90)

	local iconPlacementLabel = self:CreateFontString(nil, nil, "GameFontNormal")
	iconPlacementLabel:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 16, -150)
	iconPlacementLabel:SetText("图标位置 (金币图标出现的角落-需要重载ui):")

	local iconPlacement = CreateFrame("Button", "IconPlacementDropDown", self, "UIDropDownMenuTemplate")
	iconPlacement:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 16, -167)
	UIDropDownMenu_Initialize(IconPlacementDropDown, initIconPlacement)
	UIDropDownMenu_SetWidth(IconPlacementDropDown, 110);
	UIDropDownMenu_SetButtonWidth(IconPlacementDropDown, 110);

	local autoSellLabel = self:CreateFontString(nil, nil, "GameFontNormal")
	autoSellLabel:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 16, -210)
	autoSellLabel:SetText("自动出售...")

	local autoSellSoulboundOnly = createCheckBox(self, title, 8, SoulboundOnly, "仅出售标记物品", "仅允许自动出售标记物品（自然不限制灰色物品）.")
	autoSellSoulboundOnly:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 120, -205)
	autoSellSoulboundOnly:SetScript("PostClick", function(self, button, down)
		SoulboundOnly = self:GetChecked()
		ns.markWares()
	end)

	local autoSellGreyItems = createCheckBox(self, title, 9, AutoSellGreyItems, "灰色物品", "自动出售灰色物品")
	autoSellGreyItems:SetScript("PostClick", function(self, button, down)
		AutoSellGreyItems = self:GetChecked()
		ns.markWares()
	end)

	local autoSellWhiteItems = createCheckBox(self, title, 10, AutoSellWhiteItems, "白色物品", "自动出售白色物品")
	autoSellWhiteItems:SetScript("PostClick", function(self, button, down)
		AutoSellWhiteItems = self:GetChecked()
		ns.markWares()
	end)

	local autoSellGreenItems = createCheckBox(self, title, 11, AutoSellGreenItems, "绿色物品", "自动出售绿色物品")
	autoSellGreenItems:SetScript("PostClick", function(self, button, down)
		AutoSellGreenItems = self:GetChecked()
		ns.markWares()
	end)

	local autoSellBlueItems = createCheckBox(self, title, 12, AutoSellBlueItems, "蓝色物品", "自动出售蓝色物品")
	autoSellBlueItems:SetScript("PostClick", function(self, button, down)
		AutoSellBlueItems = self:GetChecked()
		ns.markWares()
	end)

	local autoSellPurpleItems = createCheckBox(self, title, 13, AutoSellPurpleItems, "紫色物品", "自动出售紫色物品")
	autoSellPurpleItems:SetScript("PostClick", function(self, button, down)
		AutoSellPurpleItems = self:GetChecked()
		ns.markWares()
	end)

	local autoSellUnwantedItems = createCheckBox(self, title, 14, AutoSellUnwantedItems, "无用的物品", "自动出售当前等级不需要的所有物品（例如牧师不需要板甲，所以所有板甲都会被标记）")
	autoSellUnwantedItems:SetScript("PostClick", function(self, button, down)
		AutoSellUnwantedItems = self:GetChecked()
		ns.markWares()
	end)

	local clearWaresList = CreateFrame("Button", nil, self, "UIPanelButtonTemplate")
	clearWaresList:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 16, -420)
	clearWaresList:SetWidth(110)
	clearWaresList:SetText("清除物品列表")
	clearWaresList:SetScript("PostClick", function(self, button, down)
		ItemsToSell = {}
		ns.markWares()
	end)

	local clearWaresLabel = self:CreateFontString(nil, nil, "GameFontHighlightSmall")
	clearWaresLabel:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 19, -450)
	clearWaresLabel:SetText("清除该角色的已标记物品")
