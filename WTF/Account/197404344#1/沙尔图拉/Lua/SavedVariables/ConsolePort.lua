
ConsolePortBindingSet = {
	{
		["CP_L_UP"] = {
			[""] = "MULTIACTIONBAR1BUTTON12",
			["CTRL-"] = "MULTIACTIONBAR2BUTTON6",
		},
		["CP_R_LEFT"] = {
			["CTRL-"] = "MULTIACTIONBAR1BUTTON1",
			["SHIFT-"] = "ACTIONBUTTON6",
			[""] = "ACTIONBUTTON1",
			["CTRL-SHIFT-"] = "MULTIACTIONBAR1BUTTON6",
		},
		["CP_X_CENTER"] = {
			["CTRL-"] = "TOGGLETALENTS",
			["SHIFT-"] = "TOGGLESPELLBOOK",
			[""] = "TOGGLECHARACTER0",
		},
		["CP_T_R3"] = {
		},
		["CP_L_RIGHT"] = {
			["CTRL-"] = "MULTIACTIONBAR2BUTTON7",
			["SHIFT-"] = "MULTIACTIONBAR2BUTTON3",
			[""] = "ACTIONBUTTON12",
			["CTRL-SHIFT-"] = "TOGGLEQUESTLOG",
		},
		["CP_T_L3"] = {
		},
		["CP_T2"] = {
			["CTRL-"] = "MULTIACTIONBAR1BUTTON5",
			["SHIFT-"] = "ACTIONBUTTON10",
			[""] = "ACTIONBUTTON5",
			["CTRL-SHIFT-"] = "STARTAUTORUN",
		},
		["CP_L_DOWN"] = {
			["CTRL-"] = "MULTIACTIONBAR2BUTTON8",
			["SHIFT-"] = "MULTIACTIONBAR2BUTTON4",
			[""] = "ACTIONBUTTON11",
			["CTRL-SHIFT-"] = "MULTIACTIONBAR2BUTTON12",
		},
		["CP_R_RIGHT"] = {
			["CTRL-"] = "MULTIACTIONBAR1BUTTON3",
			["SHIFT-"] = "ACTIONBUTTON8",
			[""] = "ACTIONBUTTON3",
			["CTRL-SHIFT-"] = "MULTIACTIONBAR1BUTTON8",
		},
		["CP_X_LEFT"] = {
			["CTRL-"] = "CP_CAMZOOMOUT",
			["SHIFT-"] = "TOGGLEWORLDMAP",
			[""] = "OPENALLBAGS",
			["CTRL-SHIFT-"] = "REPLY",
		},
		["CP_L_LEFT"] = {
			["CTRL-"] = "MULTIACTIONBAR2BUTTON5",
			["SHIFT-"] = "MULTIACTIONBAR2BUTTON1",
			[""] = "MULTIACTIONBAR1BUTTON11",
			["CTRL-SHIFT-"] = "MULTIACTIONBAR2BUTTON9",
		},
		["CP_R_UP"] = {
			["CTRL-"] = "MULTIACTIONBAR1BUTTON2",
			["SHIFT-"] = "ACTIONBUTTON7",
			[""] = "ACTIONBUTTON2",
			["CTRL-SHIFT-"] = "MULTIACTIONBAR1BUTTON7",
		},
		["CP_T1"] = {
			["CTRL-"] = "MULTIACTIONBAR1BUTTON4",
			["SHIFT-"] = "TARGETNEARESTENEMY",
			[""] = "ACTIONBUTTON4",
			["CTRL-SHIFT-"] = "MULTIACTIONBAR1BUTTON9",
		},
		["CP_X_RIGHT"] = {
			["CTRL-"] = "CLICK ConsolePortRaidCursorToggle:LeftButton",
			["SHIFT-"] = "TOGGLEAUTORUN",
			[""] = "TOGGLEGAMEMENU",
			["CTRL-SHIFT-"] = "OPENCHAT",
		},
		["CP_R_DOWN"] = {
			["CTRL-"] = "MULTIACTIONBAR3BUTTON1",
			["SHIFT-"] = "ACTIONBUTTON9",
			[""] = "JUMP",
			["CTRL-SHIFT-"] = "CLICK ConsolePortUtilityToggle:LeftButton",
		},
	}, -- [1]
}
ConsolePortMouse = {
	["Camera"] = {
		["lookAround"] = false,
		["test_cameraDynamicPitch"] = 0,
		["test_cameraTargetFocusEnemyEnable"] = 0,
		["test_cameraTargetFocusInteractEnable"] = 0,
		["calculateYaw"] = false,
		["cameraZoomSpeed"] = 20,
	},
	["Cursor"] = {
		["Scroll"] = "CP_M1",
		["Right"] = "CP_R_RIGHT",
		["Left"] = "CP_R_DOWN",
		["Special"] = "CP_R_UP",
	},
	["Events"] = {
		["QUEST_AUTOCOMPLETE"] = true,
		["QUEST_FINISHED"] = true,
		["QUEST_GREETING"] = true,
		["QUEST_DETAIL"] = true,
		["UNIT_SPELLCAST_SENT"] = true,
		["PLAYER_STARTED_MOVING"] = true,
		["GOSSIP_SHOW"] = true,
		["PLAYER_TARGET_CHANGED"] = true,
		["LOOT_CLOSED"] = true,
		["TAXIMAP_OPENED"] = true,
		["TAXIMAP_CLOSED"] = true,
		["MERCHANT_CLOSED"] = true,
		["GOSSIP_CLOSED"] = true,
		["QUEST_COMPLETE"] = true,
		["MERCHANT_SHOW"] = true,
		["QUEST_PROGRESS"] = true,
		["SHIPMENT_CRAFTER_OPENED"] = true,
		["SHIPMENT_CRAFTER_CLOSED"] = true,
		["LOOT_OPENED"] = true,
		["UNIT_SPELLCAST_FAILED"] = true,
	},
}
ConsolePortUtility = {
}
