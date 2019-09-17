local L = LibStub("AceLocale-3.0"):NewLocale("Spy", "zhCN")
if not L then return end
-- TOC Note: "侦测并警告你附近有敌方玩家出没。"

-- Addon information
L["Spy"] = "侦测敌方玩家 Spy"
L["Version"] = "版本"
--L["LoadDescription"] = "|cff9933ff侦测敌方玩家插件已载入，输入 |cffffffff/spy|cff9933ff 查看更多指令选项。"
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
L["NearbyCountDescription"] = "|cffffffff附近球员的数量。"
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
L["ROGUE"] = "盗贼"
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
-- player based on the abilities observed in the combat log.
-----------------------------------------------------------
--++ Racial Traits ++	
	["影遁"]={ race = "Night Elf", level = 1, },
	["血性狂暴"]={ race = "Orc", level = 1, },
	["被遗忘者的意志"]={ race = "Undead", level = 1, },
	["石像形态"]={ race = "Dwarf", level = 1, },
	["狂暴"]={ race = "Troll", level = 1, },
	["坚韧"]={ race = "Orc", level = 1, },
	["剑类武器专精"]={ race = "Human", level = 1, },
	["逃命专家"]={ race = "Gnome", level = 1, },
	["人类精魂"]={ race = "Human", level = 1, },
	["再生"]={ race = "Troll", level = 1, },
	["感知"]={ race = "Human", level = 1, },
	["耐久"]={ race = "Tauren", level = 1, },
	["弓专精"]={ race = "Troll", level = 1, },
	["栽培"]={ race = "Tauren", level = 1, },
	["工程学专精"]={ race = "Gnome", level = 1, },
	["战争践踏"]={ race = "Tauren", level = 1, },
	["野兽杀手"]={ race = "Troll", level = 1, },
	["寻找财宝"]={ race = "Dwarf", level = 1, },
	["斧专精"]={ race = "Orc", level = 1, },
	["食尸"]={ race = "Undead", level = 1, },
	["外交"]={ race = "Human", level = 1, },
	["迅捷"]={ race = "Night Elf", level = 1, },
	["投掷专精"]={ race = "Troll", level = 1, },
	["锤类武器专精"]={ race = "Human", level = 1, },
	["枪械专精"]={ race = "Dwarf", level = 1, },
	["水下呼吸"]={ race = "Undead", level = 1, },
	["命令"]={ race = "Orc", level = 1, },
	["自然抗性"]={ race = "Night Elf", level = 1, },
	["冰霜抗性"]={ race = "Dwarf", level = 1, },
	["暗影抗性"]={ race = "Undead", level = 1, },
	["奥术抗性"]={ race = "Gnome", level = 1, },
	["精灵之魂"]={ race = "Night Elf", level = 1, },
	
--++ Druid Abilities ++	
	["治疗之触"]={ class = "DRUID", level = 1, },
	["野性印记"]={ class = "DRUID", level = 1, },
	["愤怒"]={ class = "DRUID", level = 1, },
	["月火术"]={ class = "DRUID", level = 4, },
	["回春术"]={ class = "DRUID", level = 4, },
	["荆棘术"]={ class = "DRUID", level = 6, },
	["纠缠根须"]={ class = "DRUID", level = 8, },
	["熊形态"]={ class = "DRUID", level = 10, },
	["挫志咆哮"]={ class = "DRUID", level = 10, },
	["低吼"]={ class = "DRUID", level = 10, },
	["槌击"]={ class = "DRUID", level = 10, },
	["传送：月光林地"]={ class = "DRUID", level = 10, },
	["狂怒"]={ class = "DRUID", level = 12, },
	["愈合"]={ class = "DRUID", level = 12, },
	["重击"]={ class = "DRUID", level = 14, },
	["水栖形态"]={ class = "DRUID", level = 16, },
	["挥击"]={ class = "DRUID", level = 16, },
	["精灵之火"]={ class = "DRUID", level = 18, },
	["休眠"]={ class = "DRUID", level = 18, },
	["猎豹形态"]={ class = "DRUID", level = 20, },
	["爪击"]={ class = "DRUID", level = 20, },
	["潜行"]={ class = "DRUID", level = 20, },
	["复生"]={ class = "DRUID", level = 20, },
	["撕扯"]={ class = "DRUID", level = 20, },
	["星火术"]={ class = "DRUID", level = 20, },
	["撕碎"]={ class = "DRUID", level = 22, },
	["安抚动物"]={ class = "DRUID", level = 22, },
	["扫击"]={ class = "DRUID", level = 24, },
	["解除诅咒"]={ class = "DRUID", level = 24, },
	["猛虎之怒"]={ class = "DRUID", level = 24, },
	["驱毒术"]={ class = "DRUID", level = 26, },
	["急奔"]={ class = "DRUID", level = 26, },
	["挑战咆哮"]={ class = "DRUID", level = 28, },
	["畏缩"]={ class = "DRUID", level = 28, },
	["宁静"]={ class = "DRUID", level = 30, },
	["旅行形态"]={ class = "DRUID", level = 30, },
	["凶猛撕咬"]={ class = "DRUID", level = 32, },
	["毁灭"]={ class = "DRUID", level = 32, },
	["狂暴回复"]={ class = "DRUID", level = 36, },
	["突袭"]={ class = "DRUID", level = 36, },
	["巨熊形态"]={ class = "DRUID", level = 40, },
	["激活"]={ class = "DRUID", level = 40, },
	["树皮术"]={ class = "DRUID", level = 44, },
	["Barkskin Effect (DND)"]={ class = "DRUID", level = 44, },
	["野性赐福"]={ class = "DRUID", level = 50, },
--++ Druid Talents ++	
	["自然之握"]={ class = "DRUID", level = 10, },
	["野性冲锋"]={ class = "DRUID", level = 20, },
	["虫群"]={ class = "DRUID", level = 20, },
	["清晰预兆"]={ class = "DRUID", level = 20, },
	["精灵之火（野性）"]={ class = "DRUID", level = 30, },
	["枭兽形态"]={ class = "DRUID", level = 40, },
	["迅捷治愈"]={ class = "DRUID", level = 40, },
--++ Hunter Abilities ++	
	["准备就绪"]={ class = "HUNTER", level = 1, },
	["自动射击"]={ class = "HUNTER", level = 1, },
	["猛禽一击"]={ class = "HUNTER", level = 1, },
	["追踪野兽"]={ class = "HUNTER", level = 1, },
	["灵猴守护"]={ class = "HUNTER", level = 4, },
	["毒蛇钉刺"]={ class = "HUNTER", level = 4, },
	["奥术射击"]={ class = "HUNTER", level = 6, },
	["猎人印记"]={ class = "HUNTER", level = 6, },
	["震荡射击"]={ class = "HUNTER", level = 8, },
	["雄鹰守护"]={ class = "HUNTER", level = 10, },
	["召唤宠物"]={ class = "HUNTER", level = 10, },
	["解散野兽"]={ class = "HUNTER", level = 10, },
	["喂养宠物"]={ class = "HUNTER", level = 10, },
	["复活宠物"]={ class = "HUNTER", level = 10, },
	["驯服野兽"]={ class = "HUNTER", level = 10, },
	["扰乱射击"]={ class = "HUNTER", level = 12, },
	["治疗宠物"]={ class = "HUNTER", level = 12, },
	["摔绊"]={ class = "HUNTER", level = 12, },
	["鹰眼术"]={ class = "HUNTER", level = 14, },
	["野兽之眼"]={ class = "HUNTER", level = 14, },
	["恐吓野兽"]={ class = "HUNTER", level = 14, },
	["献祭陷阱"]={ class = "HUNTER", level = 16, },
	["猫鼬撕咬"]={ class = "HUNTER", level = 16, },
	["多重射击"]={ class = "HUNTER", level = 18, },
	["追踪亡灵"]={ class = "HUNTER", level = 18, },
	["猎豹守护"]={ class = "HUNTER", level = 20, },
	["逃脱"]={ class = "HUNTER", level = 20, },
	["冰冻陷阱"]={ class = "HUNTER", level = 20, },
	["毒蝎钉刺"]={ class = "HUNTER", level = 22, },
	["野兽知识"]={ class = "HUNTER", level = 24, },
	["追踪隐藏生物"]={ class = "HUNTER", level = 24, },
	["急速射击"]={ class = "HUNTER", level = 26, },
	["追踪元素生物"]={ class = "HUNTER", level = 26, },
	["冰霜陷阱"]={ class = "HUNTER", level = 28, },
	["野兽守护"]={ class = "HUNTER", level = 30, },
	["假死"]={ class = "HUNTER", level = 30, },
	["照明弹"]={ class = "HUNTER", level = 32, },
	["追踪恶魔"]={ class = "HUNTER", level = 32, },
	["爆炸陷阱"]={ class = "HUNTER", level = 34, },
	["蝰蛇钉刺"]={ class = "HUNTER", level = 36, },
	["豹群守护"]={ class = "HUNTER", level = 40, },
	["追踪巨人"]={ class = "HUNTER", level = 40, },
	["乱射"]={ class = "HUNTER", level = 40, },
	["野性守护"]={ class = "HUNTER", level = 46, },
	["追踪龙类"]={ class = "HUNTER", level = 50, },
	["宁神射击"]={ class = "HUNTER", level = 60, },
--++ Hunter Talents ++	
	["瞄准射击"]={ class = "HUNTER", level = 20, },
	["威慑"]={ class = "HUNTER", level = 20, },
	["反击"]={ class = "HUNTER", level = 30, },
	["胁迫"]={ class = "HUNTER", level = 30, },
	["驱散射击"]={ class = "HUNTER", level = 30, },
	["狂野怒火"]={ class = "HUNTER", level = 40, },
	["强击光环"]={ class = "HUNTER", level = 40, },
	["翼龙钉刺"]={ class = "HUNTER", level = 40, },
--++ Mage Abilities ++	
	["奥术智慧"]={ class = "MAGE", level = 1, },
	["火球术"]={ class = "MAGE", level = 1, },
	["霜甲术"]={ class = "MAGE", level = 1, },
	["寒冰箭"]={ class = "MAGE", level = 4, },
	["造水术"]={ class = "MAGE", level = 4, },
	["火焰冲击"]={ class = "MAGE", level = 6, },
	["造食术"]={ class = "MAGE", level = 6, },
	["奥术飞弹"]={ class = "MAGE", level = 8, },
	["变形术"]={ class = "MAGE", level = 8, },
	["冰霜新星"]={ class = "MAGE", level = 10, },
	["魔法抑制"]={ class = "MAGE", level = 12, },
	["缓落术"]={ class = "MAGE", level = 12, },
	["魔爆术"]={ class = "MAGE", level = 14, },
	["侦测魔法"]={ class = "MAGE", level = 16, },
	["烈焰风暴"]={ class = "MAGE", level = 16, },
	["魔法增效"]={ class = "MAGE", level = 18, },
	["解除次级诅咒"]={ class = "MAGE", level = 18, },
	["闪现术"]={ class = "MAGE", level = 20, },
	["暴风雪"]={ class = "MAGE", level = 20, },
	["唤醒"]={ class = "MAGE", level = 20, },
	["防护火焰结界"]={ class = "MAGE", level = 20, },
	["法力护盾"]={ class = "MAGE", level = 20, },
	["传送：铁炉堡"]={ class = "MAGE", level = 20, },
	["传送：奥格瑞玛"]={ class = "MAGE", level = 20, },
	["传送：暴风城"]={ class = "MAGE", level = 20, },
	["传送：幽暗城"]={ class = "MAGE", level = 20, },
	["防护冰霜结界"]={ class = "MAGE", level = 22, },
	["灼烧"]={ class = "MAGE", level = 22, },
	["法术反制"]={ class = "MAGE", level = 24, },
	["冰锥术"]={ class = "MAGE", level = 26, },
	["制造魔法玛瑙"]={ class = "MAGE", level = 28, },
	["冰甲术"]={ class = "MAGE", level = 30, },
	["传送：达纳苏斯"]={ class = "MAGE", level = 30, },
	["传送：雷霆崖"]={ class = "MAGE", level = 30, },
	["魔甲术"]={ class = "MAGE", level = 34, },
	["制造魔法翡翠"]={ class = "MAGE", level = 38, },
	["传送门：铁炉堡"]={ class = "MAGE", level = 40, },
	["传送门：奥格瑞玛"]={ class = "MAGE", level = 40, },
	["传送门：暴风城"]={ class = "MAGE", level = 40, },
	["传送门：幽暗城"]={ class = "MAGE", level = 40, },
	["制造魔法黄水晶"]={ class = "MAGE", level = 48, },
	["传送门：达纳苏斯"]={ class = "MAGE", level = 50, },
	["传送门：雷霆崖"]={ class = "MAGE", level = 50, },
	["奥术光辉"]={ class = "MAGE", level = 56, },
	["制造魔法红宝石"]={ class = "MAGE", level = 58, },
	["变形术：奶牛"]={ class = "MAGE", level = 60, },
	["变形术"]={ class = "MAGE", level = 60, },
	["变形术"]={ class = "MAGE", level = 60, },
--++ Mage Talents ++	
	["急速冷却"]={ class = "MAGE", level = 20, },
	["炎爆术"]={ class = "MAGE", level = 20, },
	["冲击波"]={ class = "MAGE", level = 30, },
	["寒冰屏障"]={ class = "MAGE", level = 30, },
	["气定神闲"]={ class = "MAGE", level = 30, },
	["奥术强化"]={ class = "MAGE", level = 40, },
	["燃烧"]={ class = "MAGE", level = 40, },
	["寒冰护体"]={ class = "MAGE", level = 40, },
--++ Paladin Abilities ++	
	["虔诚光环"]={ class = "PALADIN", level = 1, },
	["圣光术"]={ class = "PALADIN", level = 1, },
	["正义圣印"]={ class = "PALADIN", level = 1, },
	["力量祝福"]={ class = "PALADIN", level = 4, },
	["审判"]={ class = "PALADIN", level = 4, },
	["圣佑术"]={ class = "PALADIN", level = 6, },
	["十字军圣印"]={ class = "PALADIN", level = 6, },
	["制裁之锤"]={ class = "PALADIN", level = 8, },
	["纯净术"]={ class = "PALADIN", level = 8, },
	["保护祝福"]={ class = "PALADIN", level = 10, },
	["圣疗术"]={ class = "PALADIN", level = 10, },
	["救赎"]={ class = "PALADIN", level = 12, },
	["智慧祝福"]={ class = "PALADIN", level = 14, },
	["惩罚光环"]={ class = "PALADIN", level = 16, },
	["正义之怒"]={ class = "PALADIN", level = 16, },
	["自由祝福"]={ class = "PALADIN", level = 18, },
	["驱邪术"]={ class = "PALADIN", level = 20, },
	["圣光闪现"]={ class = "PALADIN", level = 20, },
	["感知亡灵"]={ class = "PALADIN", level = 20, },
	["专注光环"]={ class = "PALADIN", level = 22, },
	["公正圣印"]={ class = "PALADIN", level = 22, },
	["超度亡灵"]={ class = "PALADIN", level = 24, },
	["拯救祝福"]={ class = "PALADIN", level = 26, },
	["暗影抗性光环"]={ class = "PALADIN", level = 28, },
	["神圣干涉"]={ class = "PALADIN", level = 30, },
	["光明圣印"]={ class = "PALADIN", level = 30, },
	["冰霜抗性光环"]={ class = "PALADIN", level = 32, },
	["圣盾术"]={ class = "PALADIN", level = 34, },
	["火焰抗性光环"]={ class = "PALADIN", level = 36, },
	["智慧圣印"]={ class = "PALADIN", level = 38, },
	["光明祝福"]={ class = "PALADIN", level = 40, },
	["召唤军马"]={ class = "PALADIN", level = 40, },
	["清洁术"]={ class = "PALADIN", level = 42, },
	["愤怒之锤"]={ class = "PALADIN", level = 44, },
	["牺牲祝福"]={ class = "PALADIN", level = 46, },
	["神圣愤怒"]={ class = "PALADIN", level = 50, },
	["强效力量祝福"]={ class = "PALADIN", level = 52, },
	["强效智慧祝福"]={ class = "PALADIN", level = 54, },
	["强效王者祝福"]={ class = "PALADIN", level = 60, },
	["强效光明祝福"]={ class = "PALADIN", level = 60, },
	["强效拯救祝福"]={ class = "PALADIN", level = 60, },
	["强效庇护祝福"]={ class = "PALADIN", level = 60, },
	["召唤战马"]={ class = "PALADIN", level = 60, },
--++ Paladin Talents ++	
	["王者祝福"]={ class = "PALADIN", level = 20, },
	["奉献"]={ class = "PALADIN", level = 20, },
	["命令圣印"]={ class = "PALADIN", level = 20, },
	["庇护祝福"]={ class = "PALADIN", level = 30, },
	["神恩术"]={ class = "PALADIN", level = 30, },
	["圣洁光环"]={ class = "PALADIN", level = 30, },
	["神圣之盾"]={ class = "PALADIN", level = 40, },
	["神圣震击"]={ class = "PALADIN", level = 40, },
	["忏悔"]={ class = "PALADIN", level = 40, },
--++ Priest Abilities ++	
	["次级治疗术"]={ class = "PRIEST", level = 1, },
	["真言术：韧"]={ class = "PRIEST", level = 1, },
	["惩击"]={ class = "PRIEST", level = 1, },
	["暗言术：痛"]={ class = "PRIEST", level = 4, },
	["真言术：盾"]={ class = "PRIEST", level = 6, },
	["渐隐术"]={ class = "PRIEST", level = 8, },
	["恢复"]={ class = "PRIEST", level = 8, },
	["绝望祷言"]={ class = "PRIEST", level = 10, },
	["虚弱妖术"]={ class = "PRIEST", level = 10, },
	["心灵震爆"]={ class = "PRIEST", level = 10, },
	["复活术"]={ class = "PRIEST", level = 10, },
	["星辰碎片"]={ class = "PRIEST", level = 10, },
	["虚弱之触"]={ class = "PRIEST", level = 10, },
	["心灵之火"]={ class = "PRIEST", level = 12, },
	["心灵尖啸"]={ class = "PRIEST", level = 14, },
	["治疗术"]={ class = "PRIEST", level = 16, },
	["驱散魔法"]={ class = "PRIEST", level = 18, },
	["噬灵瘟疫"]={ class = "PRIEST", level = 20, },
	["艾露恩的赐福"]={ class = "PRIEST", level = 20, },
	["防护恐惧结界"]={ class = "PRIEST", level = 20, },
	["回馈"]={ class = "PRIEST", level = 20, },
	["快速治疗"]={ class = "PRIEST", level = 20, },
	["神圣之火"]={ class = "PRIEST", level = 20, },
	["安抚心灵"]={ class = "PRIEST", level = 20, },
	["束缚亡灵"]={ class = "PRIEST", level = 20, },
	["暗影守卫"]={ class = "PRIEST", level = 20, },
	["心灵视界"]={ class = "PRIEST", level = 22, },
	["法力燃烧"]={ class = "PRIEST", level = 24, },
	["精神控制"]={ class = "PRIEST", level = 30, },
	["治疗祷言"]={ class = "PRIEST", level = 30, },
	["防护暗影"]={ class = "PRIEST", level = 30, },
	["驱除疾病"]={ class = "PRIEST", level = 32, },
	["漂浮术"]={ class = "PRIEST", level = 34, },
	["强效治疗术"]={ class = "PRIEST", level = 40, },
	["坚韧祷言"]={ class = "PRIEST", level = 48, },
	["暗影防护祷言"]={ class = "PRIEST", level = 56, },
	["精神祷言"]={ class = "PRIEST", level = 60, },
--++ Priest Talents ++	
	["神圣新星"]={ class = "PRIEST", level = 20, },
	["心灵专注"]={ class = "PRIEST", level = 20, },
	["精神鞭笞"]={ class = "PRIEST", level = 20, },
	["神圣之灵"]={ class = "PRIEST", level = 30, },
	["沉默"]={ class = "PRIEST", level = 30, },
	["吸血鬼的拥抱"]={ class = "PRIEST", level = 30, },
	["光明之泉"]={ class = "PRIEST", level = 40, },
	["能量灌注"]={ class = "PRIEST", level = 40, },
	["暗影形态"]={ class = "PRIEST", level = 40, },
--++ Rogue Abilities ++	
	["刺骨"]={ class = "ROGUE", level = 1, },
	["开锁"]={ class = "ROGUE", level = 1, },
	["邪恶攻击"]={ class = "ROGUE", level = 1, },
	["潜行"]={ class = "ROGUE", level = 1, },
	["背刺"]={ class = "ROGUE", level = 4, },
	["搜索"]={ class = "ROGUE", level = 4, },
	["凿击"]={ class = "ROGUE", level = 6, },
	["闪避"]={ class = "ROGUE", level = 8, },
	["闷棍"]={ class = "ROGUE", level = 10, },
	["切割"]={ class = "ROGUE", level = 10, },
	["疾跑"]={ class = "ROGUE", level = 10, },
	["脚踢"]={ class = "ROGUE", level = 12, },
	["破甲"]={ class = "ROGUE", level = 14, },
	["绞喉"]={ class = "ROGUE", level = 14, },
	["佯攻"]={ class = "ROGUE", level = 16, },
	["伏击"]={ class = "ROGUE", level = 18, },
	["毒药"]={ class = "ROGUE", level = 20, },
	["割裂"]={ class = "ROGUE", level = 20, },
	["致残毒药"]={ class = "ROGUE", level = 20, },
	["速效毒药"]={ class = "ROGUE", level = 20, },
	["扰乱"]={ class = "ROGUE", level = 22, },
	["消失"]={ class = "ROGUE", level = 22, },
	["侦测陷阱"]={ class = "ROGUE", level = 24, },
	["麻痹毒药"]={ class = "ROGUE", level = 24, },
	["偷袭"]={ class = "ROGUE", level = 26, },
	["解除陷阱"]={ class = "ROGUE", level = 30, },
	["肾击"]={ class = "ROGUE", level = 30, },
	["致命毒药"]={ class = "ROGUE", level = 30, },
	["致伤毒药"]={ class = "ROGUE", level = 32, },
	["致盲"]={ class = "ROGUE", level = 34, },
	["致盲粉"]={ class = "ROGUE", level = 34, },
	["安全降落"]={ class = "ROGUE", level = 40, },
--++ Rogue Talents ++	
	["鬼魅攻击"]={ class = "ROGUE", level = 20, },
	["还击"]={ class = "ROGUE", level = 20, },
	["剑刃乱舞"]={ class = "ROGUE", level = 30, },
	["冷血"]={ class = "ROGUE", level = 30, },
	["出血"]={ class = "ROGUE", level = 30, },
	["伺机待发"]={ class = "ROGUE", level = 30, },
	["冲动"]={ class = "ROGUE", level = 40, },
	["预谋"]={ class = "ROGUE", level = 40, },
--++ Shaman Abilities ++	
	["治疗波"]={ class = "SHAMAN", level = 1, },
	["闪电箭"]={ class = "SHAMAN", level = 1, },
	["石化武器"]={ class = "SHAMAN", level = 1, },
	["地震术"]={ class = "SHAMAN", level = 4, },
	["石肤图腾"]={ class = "SHAMAN", level = 4, },
	["地缚图腾"]={ class = "SHAMAN", level = 6, },
	["闪电之盾"]={ class = "SHAMAN", level = 8, },
	["石爪图腾"]={ class = "SHAMAN", level = 8, },
	["烈焰震击"]={ class = "SHAMAN", level = 10, },
	["火舌武器"]={ class = "SHAMAN", level = 10, },
	["灼热图腾"]={ class = "SHAMAN", level = 10, },
	["大地之力图腾"]={ class = "SHAMAN", level = 10, },
	["先祖之魂"]={ class = "SHAMAN", level = 12, },
	["火焰新星图腾"]={ class = "SHAMAN", level = 12, },
	["净化术"]={ class = "SHAMAN", level = 12, },
	["战栗图腾"]={ class = "SHAMAN", level = 18, },
	["冰霜震击"]={ class = "SHAMAN", level = 20, },
	["冰封武器"]={ class = "SHAMAN", level = 20, },
	["幽魂之狼"]={ class = "SHAMAN", level = 20, },
	["治疗之泉图腾"]={ class = "SHAMAN", level = 20, },
	["次级治疗波"]={ class = "SHAMAN", level = 20, },
	["清毒图腾"]={ class = "SHAMAN", level = 22, },
	["水下呼吸"]={ class = "SHAMAN", level = 22, },
	["抗寒图腾"]={ class = "SHAMAN", level = 24, },
	["视界术"]={ class = "SHAMAN", level = 26, },
	["熔岩图腾"]={ class = "SHAMAN", level = 26, },
	["法力之泉图腾"]={ class = "SHAMAN", level = 26, },
	["抗火图腾"]={ class = "SHAMAN", level = 28, },
	["火舌图腾"]={ class = "SHAMAN", level = 28, },
	["水上行走"]={ class = "SHAMAN", level = 28, },
	["星界传送"]={ class = "SHAMAN", level = 30, },
	["根基图腾"]={ class = "SHAMAN", level = 30, },
	["自然抗性图腾"]={ class = "SHAMAN", level = 30, },
	["复生"]={ class = "SHAMAN", level = 30, },
	["风怒武器"]={ class = "SHAMAN", level = 30, },
	["闪电链"]={ class = "SHAMAN", level = 32, },
	["风怒图腾"]={ class = "SHAMAN", level = 32, },
	["岗哨图腾"]={ class = "SHAMAN", level = 34, },
	["风墙图腾"]={ class = "SHAMAN", level = 36, },
	["祛病图腾"]={ class = "SHAMAN", level = 38, },
	["治疗链"]={ class = "SHAMAN", level = 40, },
	["风之优雅图腾"]={ class = "SHAMAN", level = 42, },
	["宁静之风图腾"]={ class = "SHAMAN", level = 50, },
--++ Shaman Talents ++	
	["招架"]={ class = "SHAMAN", level = 30, },
	["元素掌握"]={ class = "SHAMAN", level = 40, },
	["法力之潮图腾"]={ class = "SHAMAN", level = 40, },
	["风暴打击"]={ class = "SHAMAN", level = 40, },
--++ Warlock Abilities ++	
	["恶魔皮肤"]={ class = "WARLOCK", level = 1, },
	["献祭"]={ class = "WARLOCK", level = 1, },
	["暗影箭"]={ class = "WARLOCK", level = 1, },
	["召唤小鬼"]={ class = "WARLOCK", level = 1, },
	["腐蚀术"]={ class = "WARLOCK", level = 4, },
	["虚弱诅咒"]={ class = "WARLOCK", level = 4, },
	["生命分流"]={ class = "WARLOCK", level = 6, },
	["痛苦诅咒"]={ class = "WARLOCK", level = 8, },
	["恐惧术"]={ class = "WARLOCK", level = 8, },
	["制造初级治疗石"]={ class = "WARLOCK", level = 10, },
	["吸取灵魂"]={ class = "WARLOCK", level = 10, },
	["召唤虚空行者"]={ class = "WARLOCK", level = 10, },
	["生命通道"]={ class = "WARLOCK", level = 12, },
	["鲁莽诅咒"]={ class = "WARLOCK", level = 14, },
	["吸取生命"]={ class = "WARLOCK", level = 14, },
	["魔息术"]={ class = "WARLOCK", level = 16, },
	["灼热之痛"]={ class = "WARLOCK", level = 18, },
	["制造初级灵魂石"]={ class = "WARLOCK", level = 18, },
	["魔甲术"]={ class = "WARLOCK", level = 20, },
	["火焰之雨"]={ class = "WARLOCK", level = 20, },
	["召唤仪式"]={ class = "WARLOCK", level = 20, },
	["召唤魅魔"]={ class = "WARLOCK", level = 20, },
	["制造次级治疗石"]={ class = "WARLOCK", level = 22, },
	["基尔罗格之眼"]={ class = "WARLOCK", level = 22, },
	["吸取法力"]={ class = "WARLOCK", level = 24, },
	["感知恶魔"]={ class = "WARLOCK", level = 24, },
	["语言诅咒"]={ class = "WARLOCK", level = 26, },
	["侦测次级隐形"]={ class = "WARLOCK", level = 26, },
	["放逐术"]={ class = "WARLOCK", level = 28, },
	["制造次级火焰石"]={ class = "WARLOCK", level = 28, },
	["奴役恶魔"]={ class = "WARLOCK", level = 30, },
	["地狱烈焰"]={ class = "WARLOCK", level = 30, },
	["召唤地狱猎犬"]={ class = "WARLOCK", level = 30, },
	["制造次级灵魂石"]={ class = "WARLOCK", level = 30, },
	["元素诅咒"]={ class = "WARLOCK", level = 32, },
	["防护暗影结界"]={ class = "WARLOCK", level = 32, },
	["制造治疗石"]={ class = "WARLOCK", level = 34, },
	["制造火焰石"]={ class = "WARLOCK", level = 36, },
	["制造法术石"]={ class = "WARLOCK", level = 36, },
	["侦测隐形"]={ class = "WARLOCK", level = 38, },
	["恐惧嚎叫"]={ class = "WARLOCK", level = 40, },
	["召唤地狱战马"]={ class = "WARLOCK", level = 40, },
	["制造灵魂石"]={ class = "WARLOCK", level = 40, },
	["死亡缠绕"]={ class = "WARLOCK", level = 42, },
	["暗影诅咒"]={ class = "WARLOCK", level = 44, },
	["制造强效治疗石"]={ class = "WARLOCK", level = 46, },
	["制造强效火焰石"]={ class = "WARLOCK", level = 46, },
	["灵魂之火"]={ class = "WARLOCK", level = 48, },
	["制造强效法术石"]={ class = "WARLOCK", level = 48, },
	["侦测强效隐形"]={ class = "WARLOCK", level = 50, },
	["地狱火"]={ class = "WARLOCK", level = 50, },
	["制造强效灵魂石"]={ class = "WARLOCK", level = 50, },
	["制造特效火焰石"]={ class = "WARLOCK", level = 56, },
	["制造特效治疗石"]={ class = "WARLOCK", level = 58, },
	["厄运诅咒"]={ class = "WARLOCK", level = 60, },
	["末日仪式"]={ class = "WARLOCK", level = 60, },
	["召唤恐惧战马"]={ class = "WARLOCK", level = 60, },
	["制造特效灵魂石"]={ class = "WARLOCK", level = 60, },
	["制造特效法术石"]={ class = "WARLOCK", level = 60, },
--++ Warlock Talents ++	
	["诅咒增幅"]={ class = "WARLOCK", level = 20, },
	["恶魔支配"]={ class = "WARLOCK", level = 20, },
	["暗影灼烧"]={ class = "WARLOCK", level = 20, },
	["疲劳诅咒"]={ class = "WARLOCK", level = 30, },
	["恶魔牺牲"]={ class = "WARLOCK", level = 30, },
	["生命虹吸"]={ class = "WARLOCK", level = 30, },
	["燃烧"]={ class = "WARLOCK", level = 40, },
	["黑暗契约"]={ class = "WARLOCK", level = 40, },
	["灵魂链接"]={ class = "WARLOCK", level = 40, },
--++ Warrior Abilities ++	
	["战斗怒吼"]={ class = "WARRIOR", level = 1, },
	["战斗姿态"]={ class = "WARRIOR", level = 1, },
	["英勇打击"]={ class = "WARRIOR", level = 1, },
	["强化拳击"]={ class = "WARRIOR", level = 1, },
	["冲锋"]={ class = "WARRIOR", level = 4, },
	["撕裂"]={ class = "WARRIOR", level = 4, },
	["雷霆一击"]={ class = "WARRIOR", level = 6, },
	["断筋"]={ class = "WARRIOR", level = 8, },
	["血性狂暴"]={ class = "WARRIOR", level = 10, },
	["防御姿态"]={ class = "WARRIOR", level = 10, },
	["破甲攻击"]={ class = "WARRIOR", level = 10, },
	["嘲讽"]={ class = "WARRIOR", level = 10, },
	["压制"]={ class = "WARRIOR", level = 12, },
	["盾击"]={ class = "WARRIOR", level = 12, },
	["挫志怒吼"]={ class = "WARRIOR", level = 14, },
	["复仇"]={ class = "WARRIOR", level = 14, },
	["惩戒痛击"]={ class = "WARRIOR", level = 16, },
	["盾牌格挡"]={ class = "WARRIOR", level = 16, },
	["缴械"]={ class = "WARRIOR", level = 18, },
	["顺劈斩"]={ class = "WARRIOR", level = 20, },
	["反击风暴"]={ class = "WARRIOR", level = 20, },
	["破胆怒吼"]={ class = "WARRIOR", level = 22, },
	["斩杀"]={ class = "WARRIOR", level = 24, },
	["挑战怒吼"]={ class = "WARRIOR", level = 26, },
	["盾墙"]={ class = "WARRIOR", level = 28, },
	["狂暴姿态"]={ class = "WARRIOR", level = 30, },
	["拦截"]={ class = "WARRIOR", level = 30, },
	["猛击"]={ class = "WARRIOR", level = 30, },
	["狂暴之怒"]={ class = "WARRIOR", level = 32, },
	["旋风斩"]={ class = "WARRIOR", level = 36, },
	["拳击"]={ class = "WARRIOR", level = 38, },
	["鲁莽"]={ class = "WARRIOR", level = 50, },
--++ Warrior Talents ++	
	["破釜沉舟"]={ class = "WARRIOR", level = 20, },
	["刺耳怒吼"]={ class = "WARRIOR", level = 20, },
	["震荡猛击"]={ class = "WARRIOR", level = 30, },
	["死亡之愿"]={ class = "WARRIOR", level = 30, },
	["横扫攻击"]={ class = "WARRIOR", level = 30, },
	["嗜血"]={ class = "WARRIOR", level = 40, },
	["致死打击"]={ class = "WARRIOR", level = 40, },
	["盾牌猛击"]={ class = "WARRIOR", level = 40, },
};

Spy_IgnoreList = {
	["邮箱"]=true, 
	["Treasure Chest"]=true,
	["Small Treasure Chest"]=true,
};