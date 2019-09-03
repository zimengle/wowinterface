---------------------------------------------------------------
-- Popup.lua: Redirect cursor to an appropriate popup on show
---------------------------------------------------------------
-- Since popups normally appear in response to an event or
-- crucial action, the UI cursor will automatically move to
-- a popup when it is shown. StaticPopup1 has first priority.

local oldNode

local popups = {
	[StaticPopup1] = false,
	[StaticPopup2] = StaticPopup1,
	[StaticPopup3] = StaticPopup2,
	[StaticPopup4] = StaticPopup3,
}

local visible = {}

for Popup, previous in pairs(popups) do
	Popup:HookScript("OnShow", function(self)
		visible[self] = true
		self:EnableKeyboard(false)
		if not InCombatLockdown() then
			local priorityPopup = popups[previous]
			if not priorityPopup or ( priorityPopup and not priorityPopup:IsVisible() ) then
				local current = ConsolePort:GetCurrentNode()
				if current and not popups[current:GetParent()] then
					oldNode = current
				end
				ConsolePort:SetCurrentNode(self.button1)
			end
		end
	end)
	Popup:HookScript("OnHide", function(self)
		visible[self] = nil
		if not next(visible) and not InCombatLockdown() and oldNode then
			ConsolePort:SetCurrentNode(oldNode)
		end
	end)
end

---------------------------------------------------------------
-- Popup restyling: temporarily re-style popups 
---------------------------------------------------------------
local _, db = ...
local popup, defaultBackdrop

function ConsolePort:ShowPopup(...)
	StaticPopup_Hide(...)
	popup = StaticPopup_Show(...)
	if popup then
		defaultBackdrop = popup:GetBackdrop()
		popup:EnableKeyboard(false)
		popup:SetBackdrop(db.Atlas.Backdrops.FullSmall)
		return popup
	end
end

function ConsolePort:ClearPopup()
	if popup then
		popup:SetBackdrop(defaultBackdrop)
		popup = nil
	end
end