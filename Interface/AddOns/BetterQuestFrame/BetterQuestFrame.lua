local NAME, S = ...
local NAME, ns = ...
	ns[1] = {} -- C, config
	ns[2] = {} -- G, globals (Optionnal)

local C, G = unpack(select(2, ...))
G.Ccolors = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[select(2, UnitClass("player"))] -- Class color / 職業顏色
	--local MediaFolder = "Interface\\AddOns\\EKMinimap\\Media\\"
	
	-----

	-----------
-- Fonts --
-----------

	G.font = STANDARD_TEXT_FONT		-- 字型 / Font
	-- Minimap
	G.fontSize = 14
	G.fontFlag = "THINOUTLINE"
	-- QuestWatchFrame
	G.QfontSize = 18
	G.QfontFlag = "OUTLINE"
	----
	-------------
-- Texture --
-------------

	G.Tex = "Interface\\Buttons\\WHITE8x8"
	G.report = "Interface\\HelpFrame\\HelpIcon-ReportLag.blp"
	---
	
	
BetterQuestFrame = CreateFrame("Frame", nil, UIParent)
local FirstLoad = true
local BQF = BetterQuestFrame
local AnchorFrame = CreateFrame("Frame")
local ClickFrames = {}
local db
local frameWidth = 250

local defaults = {
	db_version = 2,
	point = {"TOPRIGHT", "MinimapCluster", "BOTTOMRIGHT", 0, 0},
}

function BQF:Initialize()

	AnchorFrame:SetSize(1, 1)
	self:SetFrameStrata("BACKGROUND")
	self:SetMovable(true)
	self:SetClampedToScreen(true)
	self:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background"})
	self:SetBackdropColor(0, 0, 0, 0)
	

	
	self:RegisterForDrag("LeftButton")
	self:SetScript("OnDragStart", self.StartMoving)
	self:SetScript("OnDragStop", function(frame)
		frame:StopMovingOrSizing()
		frame:SetUserPlaced(false) -- we dont want it to be a character-specific UIParent managed frame
		local effectiveScale = UIParent:GetEffectiveScale()
		local right = frame:GetRight() * effectiveScale
		local top = frame:GetTop() * effectiveScale
		db.point = {"TOPRIGHT", "UIParent", "BOTTOMLEFT", right, top}
	end)

	-- block FramePositionDelegate.UIParentManageFramePositions from moving this on every OnAttributeChanged
	local oldSetPoint = self.SetPoint
	self.SetPoint = function(frame, point, relativeTo, relativePoint, x, y, override)
		if override then
			oldSetPoint(frame, point, relativeTo, relativePoint, x, y)
		end
	end
	
	self.header  = self:CreateFontString(nil, nil, "GameFontNormalLarge")
	self.header:SetText("任务")
	self.header:SetPoint("TOPLEFT", 0, 0)

	self.fontStrings = {};
	
end

function BQF:LoadQuests()

	if QuestWatchFrame:IsVisible() then
		QuestWatchFrame:Hide()
	end
	
	QuestWatchFrame.Show = QuestWatchFrame.Hide
	
	for i = 1, table.getn(self.fontStrings), 1 do
		self.fontStrings[i]:Hide()
		self.fontStrings[i] = nil;
	end
	
	local numEntries, _ = GetNumQuestLogEntries()
	local questCount = 0
	local l = 0
	
	for i = 1, numEntries, 1
	do
		local title, level, _, isHeader, _, isComplete, _, questID, _, displayQuestID, _, _, _, _ = GetQuestLogTitle(i);
		
		if not isHeader then
		
			l = l + 1
			questCount = questCount + 1
	
			self.fontStrings[l] = self:CreateFontString(nil, nil, "GameFontNormal")
			--self.fontStrings[l]:SetText(title .. "  (" .. level .. ")")---任务等级
      self.fontStrings[l]:SetText(title .. "  ")---任务等级
					self.fontStrings[l]:SetJustifyH("LEFT")
			
			if isComplete then
				self.fontStrings[l]:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b) -- 1, .82, 0			
			else
				self.fontStrings[l]:SetTextColor(.75, .61, 0)
				self.fontStrings[l]:SetFont(G.font, 16, G.QfontFlag)---任务标题
			end
			
			if l == 1 then			
				self.fontStrings[l]:SetPoint("TOPLEFT", self.header, "BOTTOMLEFT", 5, -25)
			else
				self.fontStrings[l]:SetPoint("TOPLEFT", self.fontStrings[l - 1], "BOTTOMLEFT", 0, -10)
			end
			
			self.fontStrings[l]:SetPoint("RIGHT", self, "RIGHT", -5, 0)
			
			local objectivesCount = GetNumQuestLeaderBoards(i)
			local objectives = {}
			
			if objectivesCount > 0 then			
				for j = 1, objectivesCount, 1
				do
					l = l + 1
					
					local desc, _, done = GetQuestLogLeaderBoard(j, i)
					
					self.fontStrings[l] = self:CreateFontString(nil, nil, "GameFontNormal")				
					self.fontStrings[l]:SetText(" - " .. desc)
					self.fontStrings[l]:SetJustifyH("LEFT")
					
					if done then
						self.fontStrings[l]:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b) -- 1, 1, 1
					else
						self.fontStrings[l]:SetTextColor(.8, .8, .8)
						self.fontStrings[l]:SetFont(G.font, 16, G.QfontFlag)
					end
					
					self.fontStrings[l]:SetPoint("TOPLEFT", self.fontStrings[l - 1], "BOTTOMLEFT", 0, -1)
					self.fontStrings[l]:SetPoint("RIGHT", self, "RIGHT", -5, 0)
					
					local objective = {}
					objective.text = self.fontStrings[l]
					objective.done = done
					tinsert(objectives, objective)
				end
			else
				l = l + 1			
				
				SelectQuestLogEntry(i);
				local _, desc = GetQuestLogQuestText()
				
				self.fontStrings[l] = self:CreateFontString(nil, nil, "GameFontNormal")				
				self.fontStrings[l]:SetText(" - " .. desc)
				self.fontStrings[l]:SetJustifyH("LEFT")
				self.fontStrings[l]:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b) -- 1, 1, 1
				self.fontStrings[l]:SetPoint("TOPLEFT", self.fontStrings[l - 1], "BOTTOMLEFT", 0, -1)
				self.fontStrings[l]:SetPoint("RIGHT", self, "RIGHT", -5, 0)
				
				local objective = {}
				objective.text = self.fontStrings[l]
				objective.done = true
				tinsert(objectives, objective)
				
				objectivesCount = 1
			end
			
			BQF:SetClickFrame(i, self.fontStrings[l - objectivesCount], objectives, isComplete)
		end
	end
	
	if table.getn(self.fontStrings) > l then
		for i = l, table.getn(self.fontStrings), 1 do
			self.fontStrings = nil;
		end
	end
	
	local frameHeight = 0
	
	for _, text in pairs(self.fontStrings) do
		frameHeight = frameHeight + text:GetHeight()
	end
	
	frameHeight = frameHeight + 10						-- Spacing between title and first quest
	frameHeight = frameHeight + ((questCount - 1) * 5)	-- Spacing before all quest titles but the first
	frameHeight = frameHeight + ((l - questCount) * 1)	-- Spacing before each quest objectives
	frameHeight = frameHeight + l							-- General spacing between each FontString
	
	self:SetSize(frameWidth, frameHeight)
	self.header:SetText(" 现有任务 (" .. questCount .. "/20)")
		self.header:SetTextColor(G.Ccolors.r, G.Ccolors.g, G.Ccolors.b)
	self.header:SetFont(G.font, G.QfontSize, G.QfontFlag)
end

local function OnMouseUp(self)
	if IsShiftKeyDown() then -- untrack quest
		local questID = GetQuestIDFromLogIndex(self.questIndex)
		for index, value in ipairs(QUEST_WATCH_LIST) do
			if value.id == questID then
				tremove(QUEST_WATCH_LIST, index)
			end
		end
		RemoveQuestWatch(self.questIndex)
		QuestWatch_Update()
	else -- open to quest log
		if QuestLogEx then -- https://www.wowinterface.com/downloads/info24980-QuestLogEx.html
			ShowUIPanel(QuestLogExFrame)
			QuestLogEx:QuestLog_SetSelection(self.questIndex)
			QuestLogEx:Maximize()
		elseif ClassicQuestLog then -- https://www.wowinterface.com/downloads/info24937-ClassicQuestLogforClassic.html
			ShowUIPanel(ClassicQuestLog)
			QuestLog_SetSelection(self.questIndex)
		else
			ShowUIPanel(QuestLogFrame)
			QuestLog_SetSelection(self.questIndex)
			local valueStep = QuestLogListScrollFrame.ScrollBar:GetValueStep()
			QuestLogListScrollFrame.ScrollBar:SetValue(self.questIndex*valueStep/2)
		end
	end
end

local function OnEnter(self)
	if self.completed then
		-- use normal colors instead as highlight
		self.headerText:SetTextColor(.75, .61, 0)

		for _, objective in ipairs(self.objectives) do
			objective.text:SetTextColor(.8, .8, .8)

		end
	else
		self.headerText:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b) -- 1, .82, 0
		for _, objective in ipairs(self.objectives) do
			objective.text:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b) -- 1, 1, 1
		end
	end
end

local function OnLeave(self)
	if self.completed then
		self.headerText:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b) -- 1, .82, 0
		for _, objective in ipairs(self.objectives) do
			objective.text:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b) -- 1, 1, 1
		end
	else
		self.headerText:SetTextColor(.75, .61, 0)
		self.headerText:SetFont(G.font, 16, G.QfontFlag)---鼠标悬停任务栏字体
		for _, objective in ipairs(self.objectives) do
			if objective.done then
				objective.text:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b) -- 1, 1, 1
			else
				objective.text:SetTextColor(.8, .8, .8)
								objective.text:SetFont(G.font, 16, G.QfontFlag)---鼠标悬停任务栏字体
			end
		end
	end
end

function BQF:SetClickFrame(questIndex, headerText, objectives, completed)
	if not ClickFrames[questIndex] then
		ClickFrames[questIndex] = CreateFrame("Frame")
		ClickFrames[questIndex]:SetScript("OnMouseUp", OnMouseUp)
		ClickFrames[questIndex]:SetScript("OnEnter", OnEnter)
		ClickFrames[questIndex]:SetScript("OnLeave", OnLeave)
	end
	local f = ClickFrames[questIndex]
	f:SetAllPoints(headerText)
	f.questIndex = questIndex
	f.headerText = headerText
	f.objectives = objectives
	f.completed = completed
end

-- use a separate anchor frame to make it expand down/leftwards only
function BQF:SetPosition(point, relativeTo, relativePoint, x, y)
	AnchorFrame:ClearAllPoints()
	AnchorFrame:SetPoint(point, relativeTo, relativePoint, x, y)
	self:ClearAllPoints()
	self:SetPoint("TOPRIGHT", AnchorFrame, "TOPRIGHT", 0, 0, true)
end

function BQF:ADDON_LOADED(addon)
	if addon == NAME then
		if not BetterQuestFrameDB or BetterQuestFrameDB.db_version < defaults.db_version then
			BetterQuestFrameDB = CopyTable(defaults)
		end
		db = BetterQuestFrameDB
		self:Initialize()
		self:SetPosition(unpack(db.point))
		self:UnregisterEvent("ADDON_LOADED")
	end
end

function BQF:QUEST_LOG_UPDATE(unitTarget)
	self:LoadQuests()
end

-- only make the frame movable when mouseovering and pressing alt
function BQF:MODIFIER_STATE_CHANGED()
	if self:IsMouseOver() then
		if IsAltKeyDown() then -- easier than checking for event payload imo
			self:EnableMouse(true)
			self:SetBackdropColor(0, 1, 0, .5)
		else
			self:EnableMouse(false)
			self:SetBackdropColor(0, 0, 0, 0)
			-- avoid getting stuck to the cursor when alt is released while dragging
			self:StopMovingOrSizing()
		end
	else
		if self:IsMouseEnabled() then
			-- avoid leaving the backdrop enabled when alt is still pressed but not mouseovering
			self:EnableMouse(false)
			self:SetBackdropColor(0, 0, 0, 0)
		end
	end
end

function BQF:OnEvent(event, ...)
	self[event](self, ...)
end

-- DEFAULT_CHAT_FRAME:AddMessage("Test")

BQF:RegisterEvent("ADDON_LOADED")
BQF:RegisterEvent("QUEST_LOG_UPDATE")
BQF:RegisterEvent("MODIFIER_STATE_CHANGED")
BQF:SetScript("OnEvent", BQF.OnEvent)


----------横线
	-- [[ Style ]] --

local HeaderBar = CreateFrame("StatusBar", nil, QWF)

	-- title line
	HeaderBar:SetSize(120, 1.5)
	HeaderBar:SetPoint("TOPLEFT", BQF, 0, -20)
	HeaderBar:SetStatusBarTexture(G.Tex)
	HeaderBar:SetStatusBarColor(G.Ccolors.r, G.Ccolors.g, G.Ccolors.b)
		-- title line shadow
	sd = CreateFrame("Frame", nil, HeaderBar)
	sd:SetPoint("TOPLEFT", -2, 2)
	sd:SetPoint("BOTTOMRIGHT", 2, -2)
	sd:SetFrameStrata(HeaderBar:GetFrameStrata())
	sd:SetFrameLevel(0)
	sd:SetBackdrop({edgeFile = G.glow, edgeSize = 3,})
	sd:SetBackdropBorderColor(0, 0, 0)
	