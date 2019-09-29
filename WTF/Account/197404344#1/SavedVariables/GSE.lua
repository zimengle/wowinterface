
GSEOptions = {
	["HideLoginMessage"] = false,
	["use1"] = false,
	["KEYWORD"] = "|cff88bbdd",
	["Updated801"] = true,
	["use2"] = false,
	["STANDARDFUNCS"] = "|cff55ddcc",
	["showGSEUsers"] = false,
	["UnfoundSpellIDs"] = {
	},
	["saveAllMacrosLocal"] = true,
	["COMMENT"] = "|cff55cc55",
	["use14"] = false,
	["NUMBER"] = "|cffffaa00",
	["use11"] = false,
	["EQUALS"] = "|cffccddee",
	["CreateGlobalButtons"] = false,
	["sendDebugOutputToChatWindow"] = false,
	["Update2305"] = true,
	["use12"] = false,
	["debug"] = false,
	["CONCAT"] = "|cffcc7777",
	["use6"] = false,
	["CommandColour"] = "|cFF00FF00",
	["UNKNOWN"] = "|cffff6666",
	["DisabledSequences"] = {
	},
	["AddInPacks"] = {
		["Samples"] = {
			["Version"] = "2.4.19",
			["Name"] = "Samples",
			["SequenceNames"] = {
				"Assorted Sample Macros", -- [1]
			},
		},
	},
	["AuthorColour"] = "|cFF00D1FF",
	["autoCreateMacroStubsGlobal"] = false,
	["useTranslator"] = false,
	["clearUIErrors"] = false,
	["sendDebugOutputToDebugOutput"] = false,
	["hideSoundErrors"] = false,
	["Update2410"] = true,
	["PromptSample"] = true,
	["STRING"] = "|cff888888",
	["requireTarget"] = false,
	["resetOOC"] = true,
	["Update2411"] = true,
	["TitleColour"] = "|cFFFF0000",
	["hideUIErrors"] = false,
	["initialised"] = true,
	["INDENT"] = "|cffccaa88",
	["DebugModules"] = {
		["Translator"] = false,
		["GUI"] = false,
		["Storage"] = false,
		["Editor"] = false,
		["API"] = false,
		["Versions"] = false,
		["Viewer"] = false,
		["Transmission"] = false,
	},
	["Update2415"] = true,
	["MacroResetModifiers"] = {
		["Alt"] = false,
		["LeftControl"] = false,
		["LeftButton"] = false,
		["LeftAlt"] = false,
		["RightButton"] = false,
		["RightAlt"] = false,
		["Button4"] = false,
		["Button5"] = false,
		["MiddleButton"] = false,
		["RightControl"] = false,
		["Control"] = false,
		["Shift"] = false,
		["LeftShift"] = false,
		["AnyMod"] = false,
		["RightShift"] = false,
	},
	["filterList"] = {
		["Class"] = true,
		["All"] = false,
		["Global"] = true,
		["Spec"] = true,
	},
	["EmphasisColour"] = "|cFFFFFF00",
	["UseVerboseExportFormat"] = false,
	["WOWSHORTCUTS"] = "|cffddaaff",
	["RealtimeParse"] = false,
	["deleteOrphansOnLogout"] = false,
	["ErroneousSpellID"] = {
	},
	["UnfoundSpells"] = {
	},
	["overflowPersonalMacros"] = false,
	["DebugPrintModConditionsOnKeyPress"] = false,
	["showMiniMap"] = {
		["hide"] = true,
	},
	["ActiveSequenceVersions"] = {
	},
	["DefaultDisabledMacroIcon"] = "Interface\\Icons\\INV_MISC_BOOK_08",
	["use13"] = false,
	["NormalColour"] = "|cFFFFFFFF",
	["autoCreateMacroStubsClass"] = true,
	["UseWLMExportFormat"] = true,
	["setDefaultIconQuestionMark"] = true,
	["showGSEoocqueue"] = true,
	["DefaultImportAction"] = "MERGE",
}
GSELibrary = {
	{
		["TAUNT"] = {
			["Talents"] = "CLASSIC",
			["Default"] = 1,
			["Help"] = "Uses Mocking Blow (Battle Stance) or Taunt (Defensive Stance) depending on stance.  If you are in Beserking Stance it changes to Defensive Stance.",
			["Author"] = "TimothyLuke",
			["SpecID"] = 1,
			["MacroVersions"] = {
				{
					"/cast [stance:1] 694; [stance:2] 355; [stance:3] 71", -- [1]
					["PostMacro"] = {
					},
					["KeyPress"] = {
					},
					["StepFunction"] = "Sequential",
					["PreMacro"] = {
					},
					["KeyRelease"] = {
					},
				}, -- [1]
			},
			["ManualIntervention"] = false,
		},
		["SAM_LOWLEVELWARR"] = {
			["Talents"] = "CLASSIC",
			["Default"] = 1,
			["Help"] = "A simple Warrior Starter macro.",
			["SpecID"] = 1,
			["Author"] = "TimothyLuke",
			["MacroVersions"] = {
				{
					"/cast [combat] 6547", -- [1]
					"/cast [combat] 8198", -- [2]
					"/cast [combat] 6192", -- [3]
					"/cast [combat] 1715", -- [4]
					"/cast [combat] 1608", -- [5]
					["PostMacro"] = {
					},
					["KeyPress"] = {
						"/startattack", -- [1]
						"/targetenemy [noharm, dead]", -- [2]
						"/cast [nocombat] 100", -- [3]
					},
					["KeyRelease"] = {
					},
					["PreMacro"] = {
					},
					["StepFunction"] = "Sequential",
				}, -- [1]
			},
			["ManualIntervention"] = false,
		},
	}, -- [1]
	[0] = {
	},
}
