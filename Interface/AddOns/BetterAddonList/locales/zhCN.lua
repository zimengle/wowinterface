
if GetLocale() ~= "zhCN" then return end

local _, ns = ...
local L = ns.L

L["... and %d more"] = "... 并且多了%d"
L["Addon List"] = "插件列表"
L["Create new set"] = "建立新设置"
L["Delete"] = "删除"
L["Delete set %s?"] = "删除设置 %s？"
L["Disable addons from this set"] = "从此设置停用插件"
L["Disable all addons then enable addons in this set."] = "在此设置停用所有插件然后启用插件。"
L["Disabled addons in set %q."] = "在设置 %q 停用插件。"
L["Disabled all addons."] = "停用全部插件。"
L["Enable addons from this set"] = "从此设置启用插件"
L["Enabled addons in set %q."] = "在设置 %q 启用插件。"
L["Enabled only addons in set %q."] = "在设置 %q 只启用插件。"
L["Enter the name for the new set"] = "输入新设置的名称"
L["Enter the new name for %s"] = "输入 %s 的新名称"
L["FILTER_DISABLED"] = "停用"
L["FILTER_ENABLED"] = "启用"
L["FILTER_LOD"] = "依照需求载入"
L["FILTER_PROTECTED"] = "已保护"
L["Include with another set"] = "包含在其他设置"
L["Load"] = "载入"
L["Load out of date"] = "载入过期"
L["Memory: %.02f MB"] = "存储器：%.02f MB"
L["Memory: %.0f KB"] = "存储器：%.0f KB"
L["No set named %q."] = "无设置名为 %q。"
L["Out of date addons are being disabled! They will not be able to load until their interface version is updated or \"Load out of date AddOns\" is checked."] = "过期插件将被停用！它们不会载入直到界面版本号有更新，或\"载入过期插件\"是勾选的。"
L["Problem with protected addon %q (%s)"] = "已保护插件 %q(%s)发生问题"
L["Reload UI to load these addons."] = "重载UI来载入这些插件。"
L["Remove an included set"] = "移除一个包含的设置"
L["Rename"] = "重命名"
L["Reset"] = "重设"
L["Reset addons to what was enabled at login."] = "重设登入时启用的插件。"
L["Save"] = "储存"
L["Save the currently selected addons to %s?"] = "储存当前选择的插件到 %s？"
L["Sets"] = "设置"
L[ [=[There is already a set named "%s".
Please choose another name.]=] ] = [=[已经有设置名为"%s"。
请选择其他名称。]=]
L["View (%d)"] = "查看 (%d)"