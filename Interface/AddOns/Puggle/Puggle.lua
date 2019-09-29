--[[
	* Copyright (c) 2019 by Antoine Desmarets.
	* Cixi of Remulos Oceanic / WoW Classic
	*
	* Puggle is distributed in the hope that it will be useful and entertaining,
	* but WITHOUT ANY WARRANTY
]]--


local version = "1.9"  --change here, and in TOC
local reqPrefix = "Puggle;"
local dispFrequency = 5  -- display refresh every x seconds
local whoFrequency = 10  -- seconds before allowing another /who
local idleTimeout = 300	 --remove entries after x seconds

local wholib		--library to process /who requests

local _G = getfenv(0)

local users = {}
local zones = {}
local nbUsers = 0

local frames = {} --frames created (to delete them later)

local dungeonNames = {}
-- Name defaults
dungeonNames["VC"] = 	"死亡矿井"
dungeonNames["WC"] = 	"哀嚎洞穴"
dungeonNames["RFC"] = 	"怒焰裂谷"
dungeonNames["SFK"] = 	"影牙城堡"
dungeonNames["STK"] = 	"监狱"
dungeonNames["BFD"] = 	"黑暗深渊"
dungeonNames["GNO"] = 	"诺莫瑞根"
dungeonNames["RFK"] = 	"剃刀沼泽"
dungeonNames["SMG"] = 	"血色修道院: 墓地"
dungeonNames["SML"] = 	"血色修道院: 图书馆"
dungeonNames["SMA"] = 	"血色修道院: 武器库"
dungeonNames["SMC"] = 	"血色修道院: 大教堂"
dungeonNames["RFD"] = 	"剃刀高地"
dungeonNames["ULD"] = 	"奥达曼"
dungeonNames["ZF"] = 	"祖尔法拉克"
dungeonNames["MAR"] = 	"玛拉顿"
dungeonNames["ST"] = 	"沉没的神庙"
dungeonNames["BRD"] = 	"黑石深渊"
dungeonNames["DME"] = 	"厄运之槌: 东"
dungeonNames["DMN"] = 	"厄运之槌: 北"
dungeonNames["DMW"] = 	"厄运之槌: 西"
dungeonNames["STL"] = 		"斯坦索姆: 血色区"
dungeonNames["STU"] = 	"斯坦索姆: DK区"
dungeonNames["SCH"] = 	"通灵学院"
dungeonNames["LBRS"] = 	"黑石塔下层"
dungeonNames["UBRS"] = 	"黑石塔上层"
dungeonNames["ONY"] = 	 "奥妮克希亚巢穴"
dungeonNames["MC"] = 		"熔火之心"
dungeonNames["ZG"] = 		"祖尔格拉布"
dungeonNames["AQ20"] = 	"安琪拉废墟"
dungeonNames["BWL"] = 	"黑翼之巢"
dungeonNames["AQ40"] = 	"安其拉神殿"
dungeonNames["NAX"] = 	"纳克萨玛斯"
dungeonNames["WSG"] = 	"战歌峡谷"
dungeonNames["AB"] = 		"阿拉希盆地"
dungeonNames["AV"] = 		"奥特兰克山谷"
dungeonNames["MISC"] = 	"其他"
dungeonNames["UD1"] = 	"用户自定义 1"
dungeonNames["UD2"] = 	"用户自定义 2"
dungeonNames["UD3"] = 	"用户自定义 3"


local dungeonTags = {}
-- Search tags defaults
dungeonTags["RFC"] = 	{ "怒焰", "NY","怒焰裂谷", "怒焰峡谷"} 
dungeonTags["WC"] = 	{ "哀嚎", "AH", "哀嚎洞穴"} 
dungeonTags["VC"] = 	{ "SW", "SK", "死矿", "死亡矿井"} 
dungeonTags["SFK"] = 	{ "影牙", "YY"} 
dungeonTags["STK"] = 	{ "监狱", "JY"} 
dungeonTags["BFD"] = 	{ "黑暗深渊"} 
dungeonTags["GNO"] =  	{"矮子", "诺莫瑞根"} 
dungeonTags["RFK"] = 	{"剃刀沼泽", "剃刀"} 
dungeonTags["SMG"] = 	{"血色", "墓地"} 
dungeonTags["SML"] = 	{"血色", "图书馆"} 
dungeonTags["SMA"] = 	{"血色", "武器库", "兵器库"} 
dungeonTags["SMC"] =  	{"血色", "教堂", "大教堂"}
dungeonTags["RFD"] = 	{"剃刀", "高地"} 
dungeonTags["ULD"] = 	{"奥达曼", "ADM", "adm"} 
dungeonTags["ZF"] = 		{"zf", "zul", "ZF", "FLK", "祖尔", "祖尔法拉克"} 
dungeonTags["MAR"] = 	{"玛拉顿", "mara", "MLD", "mld" } 
dungeonTags["ST"] = 	 	{"st", "神庙"} 
dungeonTags["BRD"] = 	{"黑石", "黑石深渊", "深渊"}
dungeonTags["DME"] =  	{"厄运", "东"}
dungeonTags["DMN"] = 	{"厄运", "北"}
dungeonTags["DMW"] = 	{"厄运", "西"}
dungeonTags["STL"] = 	{"stsm", "血色区", "STSM"}
dungeonTags["STU"] = 	{"stsm", "DK", "STSM"}
dungeonTags["SCH"] = 	{"TL", "通灵"}
dungeonTags["LBRS"] = 	{"黑下"}
dungeonTags["UBRS"] =  {"黑上"}
dungeonTags["ONY"] = 	{"onyxia", "ony"}
dungeonTags["MC"] = 		{"molten", "core", "mc"}
dungeonTags["ZG"] = 	 	{"zg", "gurub", "zul'gurub", "zulgurub"}
dungeonTags["AQ20"] = 	{"ruins", "aq20"}
dungeonTags["BWL"] = 	{"blackwing", "lair", "bwl"}
dungeonTags["AQ40"] =  {"temple", "aq40"}
dungeonTags["NAX"] = 	{"naxxramas", "nax", "naxx"}
dungeonTags["WSG"] = 	{"wsg", "warsong"}
dungeonTags["AB"] = 		{"ab", "arathi", "basin"}
dungeonTags["AV"] = 		{"av", "alterac", "valley"}
dungeonTags["MISC"] = 	{}  
dungeonTags["UD1"] = 	{} 
dungeonTags["UD2"] = 	{} 
dungeonTags["UD3"] = 	{} 

local dungeons = {}
-- SortOrder, LvlRange Low, LvlRange High, LvlMin
dungeons["RFC"] = 		{ 1, 		13, 	18, 	8	 }
dungeons["WC"] = 		{ 2, 		17, 	24, 	10 }
dungeons["VC"] = 		{ 3, 		17, 	26, 	10 }
dungeons["SFK"] = 		{ 4,  	22, 	30, 	14 }
dungeons["STK"] = 		{ 5,		24, 	32, 	15 }
dungeons["BFD"] = 		{ 6, 		24, 	32, 	15 }
dungeons["GNO"] = 	{ 7, 		29, 	38, 	19 }
dungeons["RFK"] = 		{ 8, 		29, 	38, 	19 }
dungeons["SMG"] = 	{ 9, 	 	34, 	45, 	21 }
dungeons["SML"] = 		{ 10, 	36, 	45, 	21 }
dungeons["SMA"] = 	{ 11, 	38, 	45, 	21 }
dungeons["SMC"] = 	{ 12, 	40, 	45, 	21 }
dungeons["RFD"] = 		{ 14,	37, 	46, 	25 }
dungeons["ULD"] = 		{ 15, 	41, 	51, 	30 }
dungeons["ZF"] = 		{ 16, 	42, 	46, 	35 }
dungeons["MAR"] = 	{ 17, 	46, 	55, 	35 }
dungeons["ST"] = 		{ 18, 	50, 	55, 	35 }
dungeons["BRD"] = 		{ 19, 	52, 	60, 	40 }
dungeons["DME"] = 	{ 20, 	55, 	60, 	45 }
dungeons["DMN"] = 	{ 21, 	55, 	60, 	45 }
dungeons["DMW"] = 	{ 22, 	55, 	60, 	45 }
dungeons["STL"] = 		{ 23, 	58, 	60, 	45 }
dungeons["STU"] = 		{ 24, 	58, 	60, 	45 }
dungeons["SCH"] = 		{ 25, 	58, 	60, 	45 }
dungeons["LBRS"] = 	{ 26, 	55, 	60, 	45 }
dungeons["UBRS"] = 	{ 27, 	58, 	60, 	45 }
dungeons["ONY"] = 	{ 28, 	60, 	60, 	50 }
dungeons["MC"] = 		{ 29, 	60, 	60, 	58 }	
dungeons["ZG"] = 		{ 30, 	60, 	60, 	60 }
dungeons["AQ20"] = 	{ 31, 	60, 	60, 	60 }
dungeons["BWL"] = 	{ 32, 	60, 	60, 	60 }
dungeons["AQ40"] = 	{ 33, 	60, 	60, 	60 }
dungeons["NAX"] = 		{ 34, 	60, 	60, 	60 }
dungeons["WSG"] = 	{ 35, 	10, 	60, 	10 }
dungeons["AB"] = 		{ 36, 	20, 	60, 	20 }
dungeons["AV"] = 		{ 37, 	51, 	60, 	51 }
dungeons["MISC"] = 	{ 38, 	1, 	60, 	1	 }
dungeons["UD1"] = 	{ 39, 	1, 	60, 	1	 }
dungeons["UD2"] = 	{ 40, 	1, 	60, 	1	 }
dungeons["UD3"] = 	{ 41, 	1, 	60, 	1	 }

local searchTags = { "缺", "求组", "组", "来人", "来2个", "来3个", "来", "1=4", "2=3", "3=2", "4=1", "任务队", "dps", "DPS","治疗", "T", "来个", "q1", "q2", "q3" }


local playerLevel = 1;

local loadTime = 0	-- time addon loaded
local dispTime = 0	-- time of last UI List display
local whoTime = 0
local elapsed = 0
local whoOk = true 	-- ok to run a /who

-------------------------------------------------------------------------

function Puggle_OnLoad()
	wholib = wholib or LibStub:GetLibrary("LibWho-2.0", true)
	myTabContainerFrame:RegisterEvent("ADDON_LOADED");				--Initialisation
	myTabContainerFrame:RegisterEvent("CHAT_MSG_CHANNEL");			--Get Puggle requests
	myTabContainerFrame:RegisterEvent("CHAT_MSG_SYSTEM");			--To retrieve /who results		
end

-------------------------------------------------------------------------

function Puggle_OnEvent(event, ...)
	local arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg, arg9 = ...
	
	if event == "ADDON_LOADED" and arg1 == "Puggle" then
		DEFAULT_CHAT_FRAME:AddMessage("Puggle v."..version.." by Cixi@Remulos. Type /puggle or /pug to get started,")
		DEFAULT_CHAT_FRAME:AddMessage("or use the minimap button to toggle the app.")
		loadTime = time()
		
		if (Puggle_minimapPos == nil) then Puggle_minimapPos = 30; end
		if (Puggle_showMinimapButton == nil) then Puggle_showMinimapButton = true; end
		if (Puggle_showMessageOnNewRequest == nil) then Puggle_showMessageOnNewRequest = false; end
		if (Puggle_playSoundOnNewRequest== nil) then Puggle_playSoundOnNewRequest = true; end
		if (Puggle_showLevelColorCoding== nil) then Puggle_showLevelColorCoding = true; end
		if (Puggle_showOnlyRelevant== nil) then Puggle_showOnlyRelevant = false; end
		if (Puggle_idleTimeout == nil) then Puggle_idleTimeout = idleTimeout; end
		if (Puggle_sortLatestFirst== nil) then Puggle_sortLatestFirst = false; end

		--check new install (all variables empty)
		if (Puggle_dungeonTags == nil) then Puggle_dungeonTags = dungeonTags;	end
		if (Puggle_dungeonNames == nil) then Puggle_dungeonNames = dungeonNames;	end
		if (Puggle_searchTags == nil) then Puggle_searchTags = searchTags;	end
		if (Puggle_dungeonShow == nil) then 
			Puggle_dungeonShow = {} 
			for is, s in pairs(Puggle_dungeonNames) do Puggle_dungeonShow[is] = true;	end 
		end
		
		--check updates -- get all customised ones, and add new ones with defaults
		for is, s in pairs(dungeonNames) do if Puggle_dungeonNames[is] == nil then Puggle_dungeonNames[is] = dungeonNames[is]	end end
		for is, s in pairs(dungeonTags) do 
			if Puggle_dungeonTags[is] == nil then Puggle_dungeonTags[is] = dungeonTags[is]	end
			if Puggle_dungeonShow[is] == nil then Puggle_dungeonShow[is] = true	end 
		end

		playerLevel = UnitLevel("player")
		
		--pingTime = loadTime
		Puggle_MinimapButton_Reposition()
		
		if Puggle_showMinimapButton then Puggle_MinimapButton:Show() else Puggle_MinimapButton:Hide() end
		Puggle_ShowEditTags()
	end

	if event == "CHAT_MSG_CHANNEL" then
			Puggle_ProcessRandom(arg1, arg2)
	end
	
	if event == "CHAT_MSG_SYSTEM" then
		--only look at results from /who
		if string.find(arg1, " 等级 ") then
			Puggle_ExtractWho(arg1)
		end
	end
	
end

-------------------------------------------------------------------------

function Puggle_ExtractWho(arg1) 

	t = split(arg1, " ");
	local toon  = string.gsub(t[1], "|", "!")	-- unescape player link
	toon  = string.sub(toon, string.find(toon, "%[") +1, string.len(toon)) -- remove front
	toon  = string.sub(toon, 1, string.find(toon, "%]")-1 ) -- remove back
	
	--find the toons request and update his level/class
	for iu, u in pairs(users) do
		users[iu] = string.gsub(u, toon..":0:0:", toon..":"..t[3]..":"..string.upper(t[5])..":"); 	
	end
end

-------------------------------------------------------------------------


function Puggle_ExtractWhoLibResults(query, result, complete)
	if complete then
		--find the toons request and update his level/class
		for iu, u in pairs(users) do
			users[iu] = string.gsub(u, result[1].Name..":0:0:", result[1].Name..":"..result[1].Level..":"..result[1].NoLocaleClass..":"); 	
		end
	end

end

-------------------------------------------------------------------------

function Puggle_UpdateList()
	
	Puggle_cleanRequests()
	
	--Hiding all frames
	for i, f in pairs(frames) do
		_G[f]:Hide()
		--_G[f]:SetParent(nil)
		--	table.remove(frames, i)
	end
	
	
	
	if (count(users) == 0) then 
		--DEFAULT_CHAT_FRAME:AddMessage("Count of Players: "..count(users))	
		myTabPage1_nobody:Show()
		myTabPage1_synopsis:SetText("个玩家对下面的副本表示了兴趣 (有些可能被你的设置隐藏):")
		
	else 
		myTabPage1_nobody:Hide()
		zones = {}
			
		if count(users) == 1 then myTabPage1_synopsis:SetText("1个玩家对下面的副本表示了兴趣 (有些可能被你的设置隐藏):")
		else myTabPage1_synopsis:SetText(count(users) .. "个玩家对下面的副本表示了兴趣 (有些可能被你的设置隐藏):")
		end
		
		--DEFAULT_CHAT_FRAME:AddMessage("Count of Players: "..count(users))	
		for iu, u in pairs(users) do

			local chat = split(u, ";")
			--local tag = chat[1]
		
			local player = split(chat[2], ":")
			--local pRoles  = split(chat[3], ":")
			local pSelected = split(chat[4], ":")
			local pTime = chat[5]
			local pElapsed = time() - pTime	--request elapsed time
			
			--Add players to the right zones
			for iz, z in pairs(pSelected) do
				local show = true
				if (playerLevel < dungeons[z][2] or playerLevel > dungeons[z][3]) and Puggle_showOnlyRelevant then show = false end
		
				if show then 
					-- only show if the user has selected that zone
					if Puggle_dungeonShow[z] then 
						if zones[z] == nil then zones[z] = {} end
						zones[z][count(zones[z])+1] = u..";"..pElapsed
					end 
				end 
			end
		end
		
		
		local atLeastOneMisc = false
		
		table.sort(zones)
		local str = ""
		local yy = 0
		
		-- this uses an custom sorting function ordering by zone ascending
		szones = spairs(zones, function(t,a,b) 
			--print(a.." / "..b)
			return dungeons[b][1] > dungeons[a][1]
		end)
		
		
		for iz, z in szones do
					
			local ft = nil
			
			-- let's find out if we need to create this tite frame or if we can reuse it
			local exist = false
			for _, f in ipairs(frames) do if f == "title-"..iz then exist = true end end
			
			if exist == false then 
				CreateFrame("Frame", "title-"..iz, Puggle_ScrollChildFrame, "Puggle_TitleTemplate")
				table.insert(frames, "title-"..iz)
			end
			
			local prefix = ""
			local suffix = ""
	
			-- color off those instances the player is not in the level bracket of
			if Puggle_showLevelColorCoding then   --check setting first
				if playerLevel < dungeons[iz][2] then 
					prefix = "|cffff4040"
					suffix = "|r"
				end
				if playerLevel > dungeons[iz][3] then 
					prefix = "|cff00ff00"
					suffix = "|r"
				end
			end
			
			if (iz ~= "MISC") then 
				_G["title-"..iz.."_title"]:SetText(prefix..Puggle_dungeonNames[iz].."  (等级 "..dungeons[iz][2].."-"..dungeons[iz][3]..")"..suffix)
			else 
				_G["title-"..iz.."_title"]:SetText(prefix..Puggle_dungeonNames[iz]..suffix) -- Misc category doesn't need level range
			end
			_G["title-"..iz.."_title"]:SetPoint("TOPLEFT", Puggle_ScrollChildFrame, "TOPLEFT", 40, yy);
			_G["title-"..iz]:Show()
			_G["title-"..iz]:SetParent(Puggle_ScrollChildFrame)
			yy = yy - 20
			
			-- custom sort to show players who have been waiting the most first.
			for is, s in spairs(zones[iz], function(t,a,b) 
					local chata = split(t[a], ";")
					reqTimea = chata[6]
					local chatb = split(t[b], ";")
					reqTimeb = chatb[6]
					--DEFAULT_CHAT_FRAME:AddMessage("Comparing " .. reqTimeb .. " with " .. reqTimea)	
					if Puggle_sortLatestFirst then return reqTimea > reqTimeb end
					return reqTimeb > reqTimea end) do

				local chat = split(s, ";")
				local player = split(chat[2], ":")
				local playername = split(player[1], "-")[1]  --remove realm name
				local pRoles  = split(chat[3], ":")
				local pTime = chat[5]
				local pElapsed = time() - pTime	--request elapsed time
				
				
				--depending on setting, might not show MISC request if not within 5levels of player
				--if not misc or no setting, then go through
				if (iz ~= "MISC") or (player[2] == "0") or (not Puggle_showOnlyRelevant) or (Puggle_showOnlyRelevant and (playerLevel >= player[2] - 5 and playerLevel <= player[2] +5)) then
					
					if iz=="MISC" then atLeastOneMisc = true end  --this is to know whether or not to show the MISC title, or to hide it later on
				
					local exist = false
					for _, f in ipairs(frames) do if f == "toon:"..iz..":"..is then exist = true end end
					if exist == false then 
						CreateFrame("Frame", "toon:"..iz..":"..is, Puggle_ScrollChildFrame, "Puggle_CharTemplate") 
						table.insert(frames, "toon:"..iz..":"..is)
					end 
					_G["toon:"..iz..":"..is]:SetParent(Puggle_ScrollChildFrame)
					if (player[4] == "0" or player[4] == nil) then 
						_G["toon:"..iz..":"..is.."_name"]:SetText(""..playername)
					else 
						_G["toon:"..iz..":"..is.."_name"]:SetText(""..playername .. "  (+" .. player[4] .. ")")
					end
					_G["toon:"..iz..":"..is.."_msg"]:SetText(""..string.sub(chat[3], 1, 55))
					_G["toon:"..iz..":"..is.."_level"]:SetText(""..player[2])
					_G["toon:"..iz..":"..is.."_classIcon"]:SetNormalTexture(Puggle_classIcon(player[3]));
						
					_G["toon:"..iz..":"..is.."_time"]:SetText(""..formatTime(pElapsed))
					if (UnitName("player") == player[1]) then 
						_G["toon:"..iz..":"..is.."_whisper"]:Disable()
					else 
						_G["toon:"..iz..":"..is.."_whisper"]:Enable()

					end 
					
					if player[2] ~= "0" then 	
						_G["toon:"..iz..":"..is.."_requestWho"]:Hide() 
						_G["toon:"..iz..":"..is.."_classIcon"]:Show() 
					else 
						_G["toon:"..iz..":"..is.."_requestWho"]:Show() 
						if whoOk then _G["toon:"..iz..":"..is.."_requestWho"]:Enable() 
						else _G["toon:"..iz..":"..is.."_requestWho"]:Disable() end
						_G["toon:"..iz..":"..is.."_classIcon"]:Hide() 
					end
							
					_G["toon:"..iz..":"..is]:SetPoint("TOPLEFT", Puggle_ScrollChildFrame, "TOPLEFT", 60, yy);			
					_G["toon:"..iz..":"..is]:Show()
				
					yy = yy - 25
				end
			end
			yy = yy - 15
		end
		
		
		-- check if we removed all MISC requests (because of level filter). If none left, remove title
		if not atLeastOneMisc then 
			if _G["title-MISC"] ~= nil then 
				_G["title-MISC"]:Hide()  -- call in protected mode as there might not be a MISC yet
				yy = yy + 20
			end
		end
		
		Puggle_ScrollChildFrame:SetHeight(-yy)
		Puggle_ScrollChildFrame:SetWidth(676)	
		Puggle_ScrollFrame:SetScrollChild(Puggle_ScrollChildFrame)
	
	end
end 

-------------------------------------------------------------------------

function Puggle_SendWhisper(self)
	local s = split(self:GetName(), ":")
	local c = split(s[3], "_")	--remove "_invite" from last bit
	local ind = tonumber(c[1])
	local chat = split(zones[s[2]][ind], ";")
	local player = split(chat[2], ":")

	ChatFrame_OpenChat("/w "..player[1].." ") --open whisper chat
end

-------------------------------------------------------------------------

function Puggle_ShowEditTags()

	CreateFrame("Frame", "tags_LFG", myTabPage2Tags, "Puggle_EditTagsTemplate")

	_G["tags_LFG_instCode"]:SetText("求组关键字")
	_G["tags_LFG_instName"]:Hide()
	_G["tags_LFG_instName2"]:SetText("    (每个关键字需空格分隔)")
	_G["tags_LFG_instName2"]:Show()
	_G["tags_LFG_pick"]:Hide()
	

	local allTags = "";
	for idt, dt in pairs(Puggle_searchTags) do
		allTags = allTags .. dt .. " "
	end
	_G["tags_LFG_instTags"]:SetText(allTags)
	
	_G["tags_LFG"]:SetPoint("TOPLEFT", myTabPage2Tags, "TOPLEFT", 30, -150);			
	_G["tags_LFG"]:Show()


	local yy = -10	
	--DEFAULT_CHAT_FRAME:AddMessage("Count of Players: "..count(users))	
	for id, d in spairs(dungeons, function(t,a,b) 
			return dungeons[b][1] > dungeons[a][1]
		end)
		do

		if id ~= "MISC"  then 
			--print(id)
			CreateFrame("Frame", "tags_"..id, Puggle_ScrollChildFrameEditTags, "Puggle_EditTagsTemplate")

			_G["tags_"..id.."_instCode"]:SetText(id)
			if Puggle_dungeonNames[id] == nil then 
				_G["tags_"..id.."_instName"]:SetText(dungeonNames[id])
				_G["tags_"..id.."_pick"]:SetChecked(true)
			else 
				_G["tags_"..id.."_instName"]:SetText(Puggle_dungeonNames[id])
				_G["tags_"..id.."_pick"]:SetChecked(Puggle_dungeonShow[id])
			end
			_G["tags_"..id.."_pickText"]:SetText("显示")
			
	
			
			if Puggle_dungeonTags[id] ~= nil then --safeguarding for newer (empty) dungeons
				allTags = "";
				for idt, dt in pairs(Puggle_dungeonTags[id]) do
					allTags = allTags .. dt .. " "
				end	
				_G["tags_"..id.."_instTags"]:SetText(allTags)
				
				_G["tags_"..id]:SetPoint("TOPLEFT", Puggle_ScrollChildFrameEditTags, "TOPLEFT", 40, yy);			
				_G["tags_"..id]:Show()
			end		
			yy = yy - 40
		end 
	end
	
	Puggle_ScrollChildFrameEditTags:SetHeight(-yy)
	Puggle_ScrollChildFrameEditTags:SetWidth(676)	
	Puggle_ScrollFrameEditTags:SetScrollChild(Puggle_ScrollChildFrameEditTags)

end 

-------------------------------------------------------------------------

function Puggle_ValidateInstName(self) 

	local code = split(self:GetName() , "_")[2]
	
	if (self:GetText() == nil) then 
		Puggle_dungeonNames[code] = dungeonNames[code]
	else 
		if (self:GetText() == "") then 
			Puggle_dungeonNames[code] = dungeonNames[code]
			_G["tags_"..code.."_instName"]:SetText(Puggle_dungeonNames[code])
			print("Puggle: Resetting dungeon name for "..code.. " to its default")
		else
			Puggle_dungeonNames[code] = self:GetText()
		end
	end
end 

-------------------------------------------------------------------------

function Puggle_TogglePickInstance(self) 

	local code = split(self:GetName() , "_")[2]
	Puggle_dungeonShow[code] = self:GetChecked();
end 

-------------------------------------------------------------------------

function Puggle_ValidateInstTags(self) 

	local code = split(self:GetName() , "_")[2]
	local search = false;
	if code == "LFG" then search = true end
	
	if (self:GetText() == nil) then 
		if search then Puggle_searchTags = searchTags
		else Puggle_dungeonTags[code] = dungeonTags[code] end
	else 
		if (self:GetText() == "") then 
			if search then 
				Puggle_searchTags = searchTags
				local allTags = "";
				for idt, dt in pairs(Puggle_searchTags) do allTags = allTags .. dt .. " "	end

				_G["tags_LFG_instTags"]:SetText(allTags)
				print("Puggle: Resetting search tags to their defaults")	
			else 
				Puggle_dungeonTags[code] = dungeonTags[code] 
				local allTags = "";
				for idt, dt in pairs(Puggle_dungeonTags[code]) do allTags = allTags .. dt .. " "	end

				_G["tags_"..code.."_instTags"]:SetText(allTags)
				print("Puggle: Resetting tags for "..code.. " to their defaults")
			end
		else
			if search then Puggle_searchTags = split(self:GetText(), " ")
			else Puggle_dungeonTags[code] = split(self:GetText(), " ") end
		end
	end

end 

-------------------------------------------------------------------------

function formatTime(sec) 

	local s, m, h
	local str
	if (sec<60) then 
		str = ""..sec.."秒"
	else
		minutes = math.floor(sec/60)
		sec = sec - (minutes*60)
		str =  ""..minutes.."分"
		if (sec > 0) then str = str .. " "..sec.."秒" end
	end
	return str
end

-------------------------------------------------------------------------

function Puggle_ProcessRandom(req, sender) 
	--DEFAULT_CHAT_FRAME:AddMessage("" .. sender .. " : " .. req)
	
	local playername = split(sender, "-")[1]
	
	local newUser = true
	local newInst = true
	local userDetails = ""
	local existingReq = -1
	local existingStart = 0
	
	req = string.gsub(req, ";", "%.");		--remove semicolons as they break the string
	local sel = Puggle_ExtractDungeon(string.lower(req))
	
	--if request is valid, proceed
	if next(sel) ~= nil then
	
		for is, s in pairs(sel) do

			--check if user is already listed
			if (count(users)==0) then
				--no one there, add it
				newUser = true
				newInst = true
			else
				for iu, u in pairs(users) do
					local chat = split(u, ";")
					local user = split(chat[2], ":")
					local inst = chat[4];
					
					if (playername == user[1]) then
						-- already there, exists
						newUser = false
						userDetails = chat[2]
						if inst == s then
							newInst = false
							existingReq = iu
							existingStart = chat[5]
							break
						end 
					else
						-- new user, add
						newUser = true
						newInst = true
					end
				end
			end
			
			if  (newUser) then 
				users[nbUsers] = reqPrefix..playername..":0:0:0;"..req..";" .. s .. ";"..time()..";"..time() --adding a timestamp of last ping
				nbUsers = nbUsers + 1		

				if Puggle_showMessageOnNewRequest then DEFAULT_CHAT_FRAME:AddMessage("New Puggle request by " .. playername .. " for " .. Puggle_dungeonNames[s]) end 
				if Puggle_playSoundOnNewRequest then   PlaySoundFile("sound/interface/pickup/putdownring.ogg") end
			
			else 
				--player reapplyin LFG. can be same instance or an new one
				if newInst then
					-- add new request, but no need to get the /who details. retrieve from earlier request
					users[nbUsers] = reqPrefix..userDetails..";"..req..";" .. s .. ";"..time()..";"..time() -- new request
					--print(users[nbUsers])
					nbUsers = nbUsers + 1		

					if Puggle_showMessageOnNewRequest then DEFAULT_CHAT_FRAME:AddMessage("New Puggle request by " .. playername .. " for " .. Puggle_dungeonNames[s]) end 
					if Puggle_playSoundOnNewRequest then   PlaySoundFile("sound/interface/pickup/putdownring.ogg") end				
					
				else 
					-- refresh timeer and message on current request
					users[existingReq] = reqPrefix..userDetails..";"..req..";" .. s .. ";"..existingStart..";"..time() --refreshing timestamp of last ping
					--print(users[existingReq])
				end
			
			end
		end
		
		Puggle_UpdateList()  --refresh displayed list
	end	
end

-------------------------------------------------------------------------

function Puggle_requestWho(whofor) 
	if whoOk then 
		whoOk = false
		whoTime = time()
		Puggle_UpdateList()

		if wholib then
			wholib:Who("x-".. whofor, {
				queue = wholib.WHOLIB_QUEUE_QUIET,
				flags = 0,
				callback = Puggle_ExtractWhoLibResults
			})
	--				else
	--					DEFAULT_CHAT_FRAME.editBox:SetText("/who" .. playername) ChatEdit_SendText(DEFAULT_CHAT_FRAME.editBox, 0)
		end
	end
end 

-------------------------------------------------------------------------

function Puggle_requestWhoClicked(self) 

	local s = split(self:GetName(), ":")
	local c = split(s[3], "_")	
	local ind = tonumber(c[1])
	local chat = split(zones[s[2]][ind], ";")
	local player = split(chat[2], ":")
	Puggle_requestWho(player[1]) 
	
end

-------------------------------------------------------------------------

function Puggle_ExtractDungeon(req) 

	local sel = {}
	
	req = string.gsub(req, " ", "+");
	req = string.gsub(req, "%.", "+");
	req = string.gsub(req, ",", "+");
	req = string.gsub(req, "%/", "+");
	req = string.gsub(req, "'", "+");
	req = string.gsub(req, "?", "+");
	req = string.gsub(req, "!", "+");
	local parts = split(req, "+")
	--print(req)
	
	local valid = false;
	-- Two pass request parsing. lfg tags,  then dungeon
		
	-- First check that this is an actual request for group
	for il, l in pairs(Puggle_searchTags) do --check all LFG tags
		for ip, p in pairs(parts) do
			if (p == l) then 
				valid = true
				break
			end
		end
	end
	
	
	if valid then 
		-- Then identify what instance it is for, or throw in a Misc/Other bucket	 if can't understand it (99)
		for id, d in pairs(dungeons) do --check all dungeons
		--	for is, s in pairs(d[7]) do --check all acronyms
			for is, s in pairs(Puggle_dungeonTags[id]) do --check all acronyms
				for ip, p in pairs(parts) do
					if (p == s) then 
						local found = false
						--check the dungeon isn't already in the selection (prevent dupes like "lfg wailing caverns") 
						for iss, ss in pairs(sel) do --check selection
							if ss == id then found = true end
						end
						if not found then table.insert(sel, id) end
					end
				end
			end	
		end
		if next(sel) == nil then table.insert(sel, "MISC") end 
		
	end
	
	return sel
end 

-------------------------------------------------------------------------

function Puggle_Show()
		local class, classCode = UnitClass("player");
--		charName:SetText(UnitName("player"))
--		charInfo:SetText("Level " ..  UnitLevel("player") .. " " .. class )
		myTabContainerFrame:Show() 

		myTabPage1:Show();
		myTabPage2:Hide();		
		myTabPage2Tags:Hide();
		
		maintitle:SetText("Puggle  v"..version)
		myTabPage2_version:SetText("Version "..version)
		_G["myTabPage2_showMinimapButtonText"]:SetText(myTabPage2_showMinimapButton:GetText())
		_G["myTabPage2_showMessageOnNewRequestText"]:SetText(myTabPage2_showMessageOnNewRequest:GetText())
		_G["myTabPage2_playSoundOnNewRequestText"]:SetText(myTabPage2_playSoundOnNewRequest:GetText())
		_G["myTabPage2_showLevelColorCodingText"]:SetText(myTabPage2_showLevelColorCoding:GetText())
		_G["myTabPage2_sortLatestFirstText"]:SetText(myTabPage2_sortLatestFirst:GetText())
		_G["myTabPage2_showOnlyRelevantText"]:SetText(myTabPage2_showOnlyRelevant:GetText())		
		
		myTabPage2_showMinimapButton:SetChecked(Puggle_showMinimapButton)
		myTabPage2_showMessageOnNewRequest:SetChecked(Puggle_showMessageOnNewRequest)
		myTabPage2_playSoundOnNewRequest:SetChecked(Puggle_playSoundOnNewRequest)
		myTabPage2_showLevelColorCoding:SetChecked(Puggle_showLevelColorCoding)
		myTabPage2_showOnlyRelevant:SetChecked(Puggle_showOnlyRelevant)
		myTabPage2_sortLatestFirst:SetChecked(Puggle_sortLatestFirst)
		myTabPage2_idleTimeout:SetText(Puggle_idleTimeout)
		
		myTabPage2_note:SetText("I hope this will help you get a group, while still keep the social element that was\nunfortunately lost with the LFG feature introduced in the later expansions.\n\nQuestions, suggestions, praise or rant can be sent to \124cffffd100\124hCixi@WarcraftRatings.com\124h\124r\nJust remember I did this addon as a fun little project, and am forcing nobody to use it :-)\n\nNo animal was harmed during the development of this addon.\nWell, apart from that kitten I punched while trying to get the scrollframe to work.\n\nSpecial thanks to \124cffffd100\124hKagerX\124h\124r, \124cffffd100\124hRiot\124r, \124cffffd100\124hItzachu\124h\124r, \124cffffd100\124hMauridius\124h\124r and \124cffffd100\124hThawe\124h\124r for their help and ideas.")
end

-------------------------------------------------------------------------

function Puggle_classIcon(classCode) 
	local icon = "Interface/Icons/inv_misc_questionmark"
	if (classCode == "DRUID") 	then icon = "Interface\\Icons\\inv_misc_monsterclaw_04" end
	if (classCode == "HUNTER") 	then icon = "Interface\\Icons\\inv_weapon_bow_07" end
	if (classCode == "MAGE") 	then icon = "Interface\\Icons\\inv_staff_13" end
	if (classCode == "PALADIN") then icon = "Interface\\AddOns\\Puggle\\Images\\class_paladin" end
	if (classCode == "PRIEST") 	then icon = "Interface\\AddOns\\Puggle\\Images\\class_priest" 	end
	if (classCode == "ROGUE") 	then icon = "Interface\\AddOns\\Puggle\\Images\\class_rogue" end
	if (classCode == "SHAMAN") 	then icon = "Interface\\Icons\\spell_nature_bloodlust" end
	if (classCode == "WARLOCK") then icon = "Interface\\Icons\\spell_nature_drowsy" end
	if (classCode == "WARRIOR") then icon = "Interface\\Icons\\inv_sword_27" end
	return icon
end 

-------------------------------------------------------------------------

function Puggle_OnUpdate(self, elapsed)
	--DEFAULT_CHAT_FRAME:AddMessage("Puggle_OnUpdate");
	local dispElapsed = time() - dispTime
	local whoElapsed = time() - whoTime

	--print(whoElapsed)
	if (whoElapsed >= whoFrequency) and not whoOk then 
		whoOk = true
		Puggle_UpdateList()
	end 


	if (dispElapsed >= dispFrequency) then 
		dispTime = time()
		Puggle_UpdateList()
	end 
	
end

-------------------------------------------------------------------------

function Puggle_cleanRequests() 
		
		local toKeep = {}
		local nbToKeep = 0
	
		--Keeping only users that are still pinging, discard others
		for iu, u in pairs(users) do
			local remove = false
			local chat = split(u, ";")
			local player = split(chat[2], ":")
			local reqTime = chat[6]
	
			local reqElapsed = time() - reqTime
		
			--random req, remove after 5min
			if (reqElapsed > tonumber(Puggle_idleTimeout)) then remove = true end
		
			if (not remove) then 
				--DEFAULT_CHAT_FRAME:AddMessage("Keeping ".. player[1] .. "/" .. u)
				toKeep[nbToKeep] = u
				nbToKeep = nbToKeep + 1
			end
		end

		users = toKeep
end

-------------------------------------------------------------------------

function split(str, sep)
	local t = {}
	local ind = string.find(str, sep)
	while (ind ~= nil) do 	
		table.insert(t, string.sub(str, 1, ind-1))
		str = string.sub(str, ind+1)
		ind = string.find(str, sep, 1, true)
	end
	if (str ~="") then table.insert(t, str) end
	return t
end

-------------------------------------------------------------------------

function count(tab)
	Count = 0
	for Index, Value in pairs(tab) do
		--DEFAULT_CHAT_FRAME:AddMessage("parsing: " .. Index)
		Count = Count + 1
	end
	--DEFAULT_CHAT_FRAME:AddMessage("Return: " .. Count)
	return Count
	
end

-------------------------------------------------------------------------

function spairs(t, order)
    -- collect the keys
    local keys = {}
    for k in pairs(t) do keys[count(keys)+1] = k end

    -- if order function given, sort by it by passing the table and keys a, b,
    -- otherwise just sort the keys 
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    -- return the iterator function
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end

-------------------------------------------------------------------------

function tprint (tbl, indent)
	if not indent then indent = 0 end
	for k, v in pairs(tbl) do
		formatting = string.rep("  ", indent) .. k .. ": "
		if type(v) == "table" then
			print(formatting)
			tprint(v, indent+1)
		elseif type(v) == 'boolean' then
			print(formatting .. tostring(v))      
		else
			print(formatting .. v)
		end
	end
end

-------------------------------------------------------------------------

function stringify(tbl, sep)
	local res
	for k, v in pairs(tbl) do
		res = res .. v .. sep
	end
	res = string.sub(res, 1, string.len(sub)-1)
	return res
end
-------------------------------------------------------------------------

-- Call this in a mod's initialization to move the minimap button to its saved position (also used in its movement)
-- ** do not call from the mod's OnLoad, VARIABLES_LOADED or later is fine. **
function Puggle_MinimapButton_Reposition()
	Puggle_MinimapButton:SetPoint("TOPLEFT","Minimap","TOPLEFT",52-(80*cos(Puggle_minimapPos)),(80*sin(Puggle_minimapPos))-52)
end

-- Only while the button is dragged this is called every frame
function Puggle_MinimapButton_DraggingFrame_OnUpdate()

	local xpos,ypos = GetCursorPosition()
	local xmin,ymin = Minimap:GetLeft(), Minimap:GetBottom()

	xpos = xmin-xpos/UIParent:GetScale()+70 -- get coordinates as differences from the center of the minimap
	ypos = ypos/UIParent:GetScale()-ymin-70

	Puggle_minimapPos = math.deg(math.atan2(ypos,xpos)) -- save the degrees we are relative to the minimap center
	Puggle_MinimapButton_Reposition() -- move the button
end

-------------------------------------------------------------------------

-- Put your code that you want on a minimap button click here.  arg1="LeftButton", "RightButton", etc
function Puggle_MinimapButton_OnClick()
	--DEFAULT_CHAT_FRAME:AddMessage("Is shown?" .. "was clicked.")
	
	if myTabContainerFrame == nil then 
		Puggle:Show()
	else
		if  myTabPage2Tags:IsShown() then
			myTabPage2Tags:Hide();
			myTabPage2:Show();
		else 						
			if (myTabContainerFrame:IsShown()) then 
				myTabContainerFrame:Hide()
				myTabPage2Tags:Hide();
			else
				Puggle_Show()
			end
		end
	end
	--DEFAULT_CHAT_FRAME:AddMessage(tostring(arg1).." was clicked.")
end

-------------------------------------------------------------------------

-- normal tooltip for options
function Puggle_ShowTooltip(self)
	
	local s = split(self:GetName(), ":")
	local c = split(s[3], "_")	--remove "_invite" from last bit
	local ind = tonumber(c[1])
	local chat = split(zones[s[2] ] [ind], ";")
	local player = split(chat[2], ":")
	local req = chat[3]

	GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT", 26, -72	)
	GameTooltip:AddLine(split(player[1], "-")[1])
	GameTooltip:AddLine(req,.8,.8,.8,1)
	GameTooltip:AddLine(" ",.8,.8,.8,1)
	GameTooltip:AddLine("玩家在队列中 ".. formatTime(time()-chat[5]),1,1,1,1)
	GameTooltip:AddLine("最新请求 "..formatTime(time()-chat[6]).." 之前",.6,.6,.6,1)
	GameTooltip:Show()

end 

-------------------------------------------------------------------------

function Puggle_ToggleSound()
	Puggle_playSoundOnNewRequest = not Puggle_playSoundOnNewRequest
	myTabPage2_playSoundOnNewRequest:SetChecked(Puggle_playSoundOnNewRequest)
	if Puggle_playSoundOnNewRequest then print("Puggle notification sound ON") else print("Puggle notification sound OFF") end
end

-------------------------------------------------------------------------

function Puggle_SlashCommandHandler( msg )
	local args = split(msg, " ")
		
	if args[1] == "sound" then 
		Puggle_ToggleSound()
	else 
		Puggle_MinimapButton_OnClick()
	end
	
end

-------------------------------------------------------------------------

SlashCmdList["Puggle"] = Puggle_SlashCommandHandler
SLASH_Puggle1 = "/puggle"
SLASH_Puggle2 = "/pug"