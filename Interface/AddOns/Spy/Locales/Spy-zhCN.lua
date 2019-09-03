local L = LibStub("AceLocale-3.0"):NewLocale("Spy", "zhCN")
if not L then return end
-- TOC Note: "侦测并警告你附近有敌方玩家出没。"

-- Addon information
L["Spy"] = "侦测敌方玩家 Spy"
L["Version"] = "版本"
L["LoadDescription"] = "|cff9933ff侦测敌方玩家插件已载入，输入 |cffffffff/spy|cff9933ff 查看更多指令选项。"
L["SpyEnabled"] = "|cff9933ff侦测敌方玩家插件已启用。"
L["SpyDisabled"] = "|cff9933ff侦测敌方玩家插件已停用，输入 |cffffffff/spy enable|cff9933ff 来启用。"
L["UpgradeAvailable"] = "|cff9933ff侦测敌方玩家插件已有新版本，可以到这里下载：\n|cffffffffhttps://www.curseforge.com/wow/addons/spy-classic"

-- Configuration frame name
L["Spy Option"] = "PVP 侦测敌方玩家"

-- Configuration strings
L["Profiles"] = "设定档"

L["GeneralSettings"] = "一般设定"
L["SpyDescription1"] = [[
Spy 是一个可以警告你附近有敌方玩家出没的插件。
]]
L["SpyDescription2"] = [[

|cffffd000附近清单|cffffffff
附近清单会显示已经被侦测到在附近的任何敌方玩家。点一下清单中的名字可以将玩家选取为目标，但是只能在非战斗中使用。一段时间后没有侦测到的玩家会从清单中自动移除。

标题列的清空按钮可以立即清空清单，按住 CTRL 键来清空可以快速启用/停用 Spy。

|cffffd000最近清单|cffffffff
最近清单会显示最近一小时内侦测到的所有敌方玩家。

|cffffd000忽略清单|cffffffff
Spy 不会显示被加入到忽略清单中的玩家。透过鼠标右键选单，或是按住 CTRL 键点击名字将玩家加入清单和移除。

|cffffd000即杀清单|cffffffff
侦测到在即杀清单清单中的玩家时会发出警告。透过鼠标右键选单，或是按住 SHIFT 键点击名字将玩家加入清单和移除。

鼠标右键选单也可以设定将某人加入到即杀清单的原因。如果你想要输入不在清单中的原因，请在其他清单中使用 "自行输入原因..."。


|cffffd000Author: Slipjack |cffffffff

]]
L["EnableSpy"] = "启用"
L["EnableSpyDescription"] = "现在和登入时都要启用 Spy。"
L["EnabledInBattlegrounds"] = "战场中启用"
L["EnabledInBattlegroundsDescription"] = "身处在战场中时启用或停用 Spy。"
L["EnabledInArenas"] = "竞技场中启用"
L["EnabledInArenasDescription"] = "身处在竞技场中时启用或停用 Spy。"
L["EnabledInWintergrasp"] = "世界战斗区域中启用"
L["EnabledInWintergraspDescription"] = "身处在世界战斗区中时启用或停用 Spy，例如北裂境的冬握湖。"
L["DisableWhenPVPUnflagged"] = "非 PVP 状态时停用"
L["DisableWhenPVPUnflaggedDescription"] = "依据自身的 PVP 状态启用或停用 Spy。"

L["DisplayOptions"] = "显示"
L["DisplayOptionsDescription"] = [[
自动显示或隐藏 Spy。
]]
L["ShowOnDetection"] = "侦测到敌方玩家时显示"
L["ShowOnDetectionDescription"] = "侦测到敌方玩家时会自动将隐藏的 Spy 视窗和附近清单显示出来。"
L["HideSpy"] = "没有侦测到敌方玩家时隐藏"
L["HideSpyDescription"] = "附近清单内容是空的时候会自动隐藏。手动清空清单时不会隐藏 Spy。"
L["ShowOnlyPvPFlagged"] = "只显示状态为 PvP 的敌方玩家"
L["ShowOnlyPvPFlaggedDescription"] = "在附近清单中只显示切换为 PvP 状态的敌方玩家。"
L["ShowKoSButton"] = "在敌方目标框架上显示杀戮按钮"
L["ShowKoSButtonDescription"] = "设置此项以在敌方玩家的目标框架上显示终止按钮."
L["LockSpy"] = "锁定视窗"
L["LockSpyDescription"] = "锁定 Spy 视窗让它不能被移动。"
L["InvertSpy"] = "翻转视窗"
L["InvertSpyDescription"] = "上下翻转 Spy 视窗。"
L["Reload"] = "重新加载UI"
L["ReloadDescription"] = "需要更改 SPY 窗口."
L["ResizeSpy"] = "自动调整视窗大小"
L["ResizeSpyDescription"] = "新增和移除敌方玩家时自动调整 Spy 视窗的大小。"
L["ResizeSpyLimit"] = "列表限制"
L["ResizeSpyLimitDescription"] = "限制SPY窗口中显示的敌方玩家数量。"
L["TooltipDisplayWinLoss"] = "鼠标提示中显示胜/败统计"
L["TooltipDisplayWinLossDescription"] = "在玩家的鼠标提示中显示该玩家的胜/败统计信息。"
L["TooltipDisplayKOSReason"] = "鼠标提示中显示即杀原因"
L["TooltipDisplayKOSReasonDescription"] = "在玩家的鼠标提示中显示该玩家被加入到即杀清单中的原因。"
L["TooltipDisplayLastSeen"] = "鼠标提示中显示上次遇到的详情"
L["TooltipDisplayLastSeenDescription"] = "在玩家的鼠标提示中显示最近一次遇到该玩家的时间和地点。"
L["SelectFont"] = "选择字体"
L["SelectFontDescription"] = "选择 Spy 视窗使用的字体。"
L["RowHeight"] = "选择列高"
L["RowHeightDescription"] = "选择 Spy 视窗横列的高度。"

L["AlertOptions"] = "警告"
L["AlertOptionsDescription"] = [[
遇到时可以将详情通报到聊天频道，并且控制侦测到敌方玩家时 Spy 该如何发出警告。
]]
L["Announce"] = "通报到:"
L["None"] = "无"
L["NoneDescription"] = "侦测到敌方玩家时不要通报。"
L["Self"] = "自己"
L["SelfDescription"] = "侦测到敌方玩家时通知自己。"
L["Party"] = "队伍"
L["PartyDescription"] = "侦测到敌方玩家时通报到你的队伍。"
L["Guild"] = "公会"
L["GuildDescription"] = "侦测到敌方玩家时通报到你的公会。"
L["Raid"] = "团队"
L["RaidDescription"] = "侦测到敌方玩家时通报到你的团队。"
L["LocalDefense"] = "本地防务"
L["LocalDefenseDescription"] = "侦测到敌方玩家时通报到本地防务频道。"
L["OnlyAnnounceKoS"] = "只通报即杀的敌方玩家"
L["OnlyAnnounceKoSDescription"] = "设定为只通报在即杀清单中的敌方玩家。"
L["WarnOnStealth"] = "隐形侦测警告"
L["WarnOnStealthDescription"] = "敌方玩家获得隐形时显示警告和音效。"
L["WarnOnKOS"] = "即杀侦测警告"
L["WarnOnKOSDescription"] = "侦测到在即杀清单中的敌方玩家时显示警告和音效。"
L["WarnOnKOSGuild"] = "公会即杀侦测警告"
L["WarnOnKOSGuildDescription"] = "侦测到和即杀清单中有相同公会的敌方玩家时显示警告和音效。"
L["WarnOnRace"] = "种族侦测警告"
L["WarnOnRaceDescription"] = "侦测到指定的种族时发出音效警告。"
L["SelectWarnRace"] = "选择要侦测的种族"
L["SelectWarnRaceDescription"] = "选择要发出警告音效的种族。"
L["WarnRaceNote"] = "注意: 至少需要将敌人选取为目标一次 (点 Spy 视窗中的玩家名字) 他的种族才会加入到数据库中，下次侦测到时便可以发出警告音效。和侦测附近敌人一样，战斗中无法点选。"
L["DisplayWarningsInErrorsFrame"] = "在错误讯息框架显示警告"
L["DisplayWarningsInErrorsFrameDescription"] = "使用错误讯息框架来显示警告，而不是使用图形界面的弹出视窗。"
L["EnableSound"] = "启用警告音效"
L["EnableSoundDescription"] = "侦测到敌方玩家时启用警告音效，隐形和即杀清单中的敌方玩家会发出不同的警告音效。"
L["OnlySoundKoS"] = "只有即杀清单使用警告音效"
L["OnlySoundKoSDescription"] = "只有侦测到即杀清单中的敌方玩家时才播放警告音效。"

L["ListOptions"] = "附近清单"
L["ListOptionsDescription"] = [[
设定 Spy 该如何将敌方玩家加入附近清单和移除。
]]
L["RemoveUndetected"] = "多久后从附近清单中移除敌方玩家:"
L["1Min"] = "1 分钟"
L["1MinDescription"] = "移除超过 1 分钟未侦测到的敌方玩家。"
L["2Min"] = "2 分钟"
L["2MinDescription"] = "移除超过 2 分钟未侦测到的敌方玩家。"
L["5Min"] = "5 分钟"
L["5MinDescription"] = "移除超过 5 分钟未侦测到的敌方玩家。"
L["10Min"] = "10 分钟"
L["10MinDescription"] = "移除超过 10 分钟未侦测到的敌方玩家。"
L["15Min"] = "15 分钟"
L["15MinDescription"] = "移除超过 15 分钟未侦测到的敌方玩家。"
L["Never"] = "永不移除"
L["NeverDescription"] = "永远不要移除敌方玩家，仍然可以使用手动的方式清除附近清单。"
L["ShowNearbyList"] = "侦测到敌方玩家时自动切换到附近清单"
L["ShowNearbyListDescription"] = "侦测到敌方玩家时显示附近清单，如果原本没有显示的话。"
L["PrioritiseKoS"] = "附近清单中优先排序即杀的敌方玩家"
L["PrioritiseKoSDescription"] = "在附近清单中总是将即杀的敌方玩家显示在最前面。"

L["MinimapOptions"] = "地图"
L["MinimapOptionsDescription"] = [[
提供额外的功能给能够从小地图追踪人形生物的玩家。

能够追踪人形生物的玩家包括猎人、德鲁伊，或是透过其他方式获得这个能力，象是吃焦黑的座狼排。
]]
L["MinimapTracking"] = "启用小地图追踪"
L["MinimapTrackingDescription"] = "启用小地图追踪和侦测，在小地图侦测到的已知敌方玩家会加入到附近清单。"
L["MinimapDetails"] = "鼠标提示中显示等级/职业细节"
L["MinimapDetailsDescription"] = "更新小地图的鼠标提示，随着敌人名字一并显示等级/职业的详细信息。"
L["DisplayOnMap"] = "在地图上显示敌人位置"
L["DisplayOnMapDescription"] = "在世界地图和小地图上显示由队伍、团队或公会其他 Spy 使用者侦测到的敌人位置。"
L["SwitchToZone"] = "侦测到敌人时切换到目前区域的地图"
L["SwitchToZoneDescription"] = "打开世界地图并且侦测到敌人时，会自动切换到玩家目前所在的区域地图。"
L["MapDisplayLimit"] = "限制显示的地图图示:"
L["LimitNone"] = "任何地方"
L["LimitNoneDescription"] = "无视目前所在的地区，在地图上显示所有侦测到的敌人。"
L["LimitSameZone"] = "相同区域"
L["LimitSameZoneDescription"] = "只显示同一个区域中侦测到的敌人。"
L["LimitSameContinent"] = "相同大陆"
L["LimitSameContinentDescription"] = "只显示同一块大陆中侦测到的敌人。"

L["DataOptions"] = "资料维护"
L["DataOptionsDescription"] = [[
设定 Spy 如何收集和维护资料。
]]
L["PurgeData"] = "清除多久后未侦测到的敌方玩家:"
L["OneDay"] = "1 天"
L["OneDayDescription"] = "清除超过 1 天未侦测到的敌方玩家资料。"
L["FiveDays"] = "5 天"
L["FiveDaysDescription"] = "清除超过 5 天未侦测到的敌方玩家资料。"
L["TenDays"] = "10 天"
L["TenDaysDescription"] = "清除超过 10 天未侦测到的敌方玩家资料。"
L["ThirtyDays"] = "30 天"
L["ThirtyDaysDescription"] = "清除超过 30 天未侦测到的敌方玩家资料。"
L["SixtyDays"] = "60 天"
L["SixtyDaysDescription"] = "清除超过 60 天未侦测到的敌方玩家资料。"
L["NinetyDays"] = "90 天"
L["NinetyDaysDescription"] = "清除超过 90 天未侦测到的敌方玩家资料。"
L["PurgeKoS"] = "也要清除未侦测到的即杀玩家"
L["PurgeKoSDescription"] = "使用相同的时间，清除未侦测到的即杀玩家。"
L["PurgeWinLossData"] = "也要清除胜/败资料"
L["PurgeWinLossDataDescription"] = "使用相同的时间，清除胜/败资料。"
L["ShareData"] = "和其他 Spy 使用者分享资料"
L["ShareDataDescription"] = "和队伍、团队和公会中也有使用 Spy 插件的玩家分享你遇到敌方玩家的详情。"
L["UseData"] = "使用来自于其他 Spy 使用者的资料"
L["UseDataDescription"] = [[使用从队伍、团队和公会中也有使用 Spy 插件的玩家收集到的资料。

另一个 Spy 使用者侦测到的敌方玩家，也会加入到你的附近清单中 (如果还有空间的话)。
]]
L["ShareKOSBetweenCharacters"] = "不同角色共享即杀玩家资料"
L["ShareKOSBetweenCharactersDescription"] = "分享标记为即杀的玩家给你在同一个服务器、同阵营的其他角色。"

L["SlashCommand"] = "聊天视窗指令"
L["SpySlashDescription"] = "这些按钮会执行在聊天视窗输入 /spy 时相同的指令选项动作。"
L["Enable"] = "启用"
L["EnableDescription"] = "启用 Spy 并显示主视窗。"
L["Show"] = "显示"
L["ShowDescription"] = "显示主视窗."
L["Reset"] = "重置"
L["ResetDescription"] = "重设主视窗的位置和外观。"
L["ClearSlash"] = "清空"
L["ClearSlashDescription"] = "清空已经侦测到的玩家清单。"
L["Config"] = "设定"
L["ConfigDescription"] = "开启界面 > 插件中的 Spy 设定选项。"
L["KOS"] = "即杀"
L["KOSDescription"] = "从即杀清单加入/移除玩家。"
L["InvalidInput"] = "输入无效"
L["Ignore"] = "忽略"
L["IgnoreDescription"] = "从忽略清单加入/移除玩家。"

-- Lists
L["Nearby"] = "附近"
L["LastHour"] = "最近"
L["Ignore"] = "忽略"
L["KillOnSight"] = "即杀"

--Stats
L["Time"] = "时间"	
L["List"] = "清单"
L["Filter"] = "过滤"	
L["Show Only"] = "只显示"
L["KOS"] = "即杀"
L["Won/Lost"] = "胜/败"
L["Reason"] = "原因"	  
L["HonorKills"] = "荣誉击杀"
L["PvPDeaths"] = "PvP 死亡"

-- Output messages
L["AlertStealthTitle"] = "侦测到隐形玩家!"
L["AlertKOSTitle"] = "侦测到即杀玩家!"
L["AlertKOSGuildTitle"] = "侦测到公会即杀玩家!"
L["AlertTitle_kosaway"] = "发现即杀玩家的位置，由 "
L["AlertTitle_kosguildaway"] = "发现公会即杀玩家的位置，由 "
L["StealthWarning"] = "|cff9933ff侦测到隐形玩家：|cffffffff"
L["KOSWarning"] = "|cffff0000侦测到即杀玩家：|cffffffff"
L["KOSGuildWarning"] = "|cffff0000侦测到公会即杀玩家：|cffffffff"
L["SpySignatureColored"] = "|cff9933ff[Spy] "
L["PlayerDetectedColored"] = "侦测到玩家：|cffffffff"
L["PlayersDetectedColored"] = "侦测到玩家：|cffffffff"
L["KillOnSightDetectedColored"] = "侦测到即杀玩家：|cffffffff"
L["PlayerAddedToIgnoreColored"] = "玩家加入到忽略清单：|cffffffff"
L["PlayerRemovedFromIgnoreColored"] = "从忽略清单移除玩家：|cffffffff"
L["PlayerAddedToKOSColored"] = "玩家加入到即杀清单：|cffffffff"
L["PlayerRemovedFromKOSColored"] = "从即杀清单移除玩家：|cffffffff"
L["PlayerDetected"] = "[Spy] 侦测到玩家："
L["KillOnSightDetected"] = "[Spy] 侦测到即杀玩家："
L["Level"] = "等级"
L["LastSeen"] = "上次遇到"
L["LessThanOneMinuteAgo"] = "小于 1 分钟前"
L["MinutesAgo"] = "分钟前"
L["HoursAgo"] = "小时前"
L["DaysAgo"] = "天前"
L["Close"] = "关闭"
L["CloseDescription"] = "|cffffffff隐藏 Spy 主视窗。预设下次侦测到敌方玩家时会再次显示。."
L["Left/Right"] = "左 / 右"
L["Left/RightDescription"] = "|cffffffff切换显示附近、最近、忽略和即杀清单。"
L["Clear"] = "清空"
L["ClearDescription"] = "|cffffffff清空已经侦测到的玩家清单。显示时 CTRL+左键点击会启用/停用 Spy。"
L["NearbyCount"] = "附近数量"
L["NearbyCountDescription"] = "|cffffffff附近玩家的数量。"
L["Statistics"] = "统计资料" 
L["StatsDescription"] = "|cffffffff显示遇过的敌方玩家、胜/败记录和上次在哪遇到的清单。"
L["AddToIgnoreList"] = "加入忽略清单"
L["AddToKOSList"] = "加入即杀清单"
L["RemoveFromIgnoreList"] = "从忽略清单移除"
L["RemoveFromKOSList"] = "从即杀清单移除"
L["RemoveFromStatsList"] = "从统计列表中删除"   --++
L["AnnounceDropDownMenu"] = "通报"
L["KOSReasonDropDownMenu"] = "设定即杀原因"
L["PartyDropDownMenu"] = "队伍"
L["RaidDropDownMenu"] = "团队"
L["GuildDropDownMenu"] = "公会"
L["LocalDefenseDropDownMenu"] = "本地防务"
L["Player"] = " (玩家)"
L["KOSReason"] = "即杀"
L["KOSReasonIndent"] = "    "
L["KOSReasonOther"] = "自行输入原因..."
L["KOSReasonClear"] = "清空"
L["StatsWins"] = "|cff40ff00胜："
L["StatsSeparator"] = "  "
L["StatsLoses"] = "|cff0070dd败："
L["Located"] = "位置:"
L["Yards"] = "码"

Spy_KOSReasonListLength = 6
Spy_KOSReasonList = {
	[1] = {
		["title"] = "主动攻击";
		["content"] = {
			"毫无理由攻击我",
			"接任务时攻击我", 
			"在鸟点攻击我",
			"在副本入口攻击我",
			"我 AFK 暂离时攻击我",
			"我在赶路/飞行时攻击我",
			"我的血量/法力很低时攻击我",
		};
	},
	[2] = {
		["title"] = "战斗风格";
		["content"] = {
			"偷袭我",
			"总是让我看到他再杀我",
			"使用高等级角色杀我",
			"和一群敌人一起辗压我",
			"没有人支援时不会攻击",
			"老是向外求援",
			"使用超多控场技",
		};
	},
	[3] = {
		["title"] = "守尸守点";
		["content"] = {
			"守我尸体",
			"守我分身",
			"守低等级的必取",
			"会隐形来守点",
			"和公会成员一起守点",
			"守游戏的 NPC/任务点",
			"守城市/村庄",
		};
	},
	[4] = {
		["title"] = "妨碍任务";
		["content"] = {
			"正在解任务时攻击我",
			"帮忙解任务后攻击我",
			"扰乱任务目标",
			"抢我的任务",
			"杀死我方阵营的 NPC",
			"杀死任务 NPC",
		};
	},
	[5] = {
		["title"] = "偷抢资源";
		["content"] = {
			"抢我的草",
			"抢我的矿",
			"抢我的资源",
			"杀死我然后抢走我的目标/稀有怪",
			"杀死我要杀的怪",
			"抢走我要杀的怪",
			"抢我的鱼点",
		};
	},
	[6] = {
		["title"] = "其他";
		["content"] = {
			"就爱杀人",
			"把我推下悬崖",
			"使用工程学道具",
			"总是落跑",
			"使用物品或技能落跑",
			"滥用游戏机制",
			"自行输入原因...",
		};
	},
}

StaticPopupDialogs["Spy_SetKOSReasonOther"] = {
	preferredIndex=STATICPOPUPS_NUMDIALOGS,  -- http://forums.wowace.com/showthread.php?p=320956
	text = "输入 %s 的即杀原因:",
	button1 = "设定",
	button2 = "取消",
	timeout = 20,
	hasEditBox = 1,
	editBoxWidth = 260,		
	whileDead = 1,
	hideOnEscape = 1,
	OnShow = function(self)
		self.editBox:SetText("");
	end,
    	OnAccept = function(self)
		local reason = self.editBox:GetText()
		Spy:SetKOSReason(self.playerName, "自行输入原因...", reason)
	end,
};

--++ Class descriptions
--L["DEATHKNIGHT"] = "死亡骑士"
--L["DEMONHUNTER"] = "恶魔猎人"
L["DRUID"] = "德鲁伊"
L["HUNTER"] = "猎人"
L["MAGE"] = "法师"
--L["MONK"] = "武僧"
L["PALADIN"] = "圣骑士"
L["PRIEST"] = "牧师"
L["ROGUE"] = "潜行者"
L["SHAMAN"] = "萨满"
L["WARLOCK"] = "术士"
L["WARRIOR"] = "战士"
L["UNKNOWN"] = "未知"

--++ Race descriptions
L["HUMAN"] = "人类"
L["ORC"] = "兽人"
L["DWARF"] = "矮人"
L["NIGHT ELF"] = "暗夜精灵"
L["UNDEAD"] = "亡灵"
L["TAUREN"] = "牛头人"
L["GNOME"] = "侏儒"
L["TROLL"] = "巨魔"
--L["GOBLIN"] = "地精"
--L["BLOOD ELF"] = "血精灵"
--L["DRAENEI"] = "德莱尼"
--L["WORGEN"] = "狼人"
--L["PANDAREN"] = "熊猫人"
--L["NIGHTBORNE"] = "夜之子"
--L["HIGHMOUNTAIN TAUREN"] = "至高岭牛头人"
--L["VOID ELF"] = "虚空精灵"
--L["LIGHTFORGED DRAENEI"] = "光铸德莱尼"
--L["ZANDALARI TROLL"] = "赞达拉巨魔"
--L["KUL TIRAN"] = "库尔提拉斯人"
--L["DARK IRON DWARF"] = "黑铁矮人"
--L["MAG'HAR ORC"] = "玛格汉兽人"

--++ Font descriptions
L["2002"] = "2002"
L["2002 BOLD"] = "2002 Bold"
L["ARIAL NARROW"] = "Arial Narrow" -- default chat font
L["FRIZ QUADRATA TT"] = "Friz Quadrata TT" -- default main UI font
L["FRIZQUADRATACTT"] = "FrizQuadrataCTT"
L["MOK"] = "MoK"
L["MORPHEUS"] = "Morpheus" -- default in game mail font
L["NIMROD MT"] = "Nimrod MT"
L["SKURRI"] = "Skurri" -- default unit frame combat font
						
-- Stealth abilities
L["Stealth"] = "隐形"
L["Prowl"] = "潜行"

-- Channel names
L["LocalDefenseChannelName"] = "本地防务"

--++ Minimap color codes
--L["MinimapClassTextDEATHKNIGHT"] = "|cffc41e3a"
--L["MinimapClassTextDEMONHUNTER"] = "|cffa330c9"
L["MinimapClassTextDRUID"] = "|cffff7c0a"
L["MinimapClassTextHUNTER"] = "|cffaad372"
L["MinimapClassTextMAGE"] = "|cff68ccef"
--L["MinimapClassTextMONK"] = "|cff00ff96"
L["MinimapClassTextPALADIN"] = "|cfff48cba"
L["MinimapClassTextPRIEST"] = "|cffffffff"
L["MinimapClassTextROGUE"] = "|cfffff468"
L["MinimapClassTextSHAMAN"] = "|cff2359ff"
L["MinimapClassTextWARLOCK"] = "|cff9382c9"
L["MinimapClassTextWARRIOR"] = "|cffc69b6d"
L["MinimapClassTextUNKNOWN"] = "|cff191919"
L["MinimapGuildText"] = "|cffffffff"

Spy_AbilityList = {

-----------------------------------------------------------
-- Allows an estimation of the race, class and level of a
-- player to be determined from what abilities are observed
-- in the combat log.
-----------------------------------------------------------

};

Spy_IgnoreList = {
	["邮箱"]=true, ["Shred Master Mk1"]=true, ["Scrap-O-Matic 1000"]=true,
	["前往暴风城的船"]=true, ["前往伯拉勒斯港（提拉加德海峡）的船"]=true,
	["Treasure Chest"]=true, ["Small Treasure Chest"]=true,
	["阿昆达之噬"]=true, ["锚草"]=true, ["流波花苞"]=true,    
	["海潮茎杆"]=true, ["海妖花粉"]=true, ["星光苔"]=true,   
	["凛冬之吻"]=true, ["战争指挥部（PvP）"]=true,
	["联盟刺客"]=true, ["部落刺客"]=true,
	["秘法师鸟羽帽"]=true, ["表弟慢热手"]=true,		
};