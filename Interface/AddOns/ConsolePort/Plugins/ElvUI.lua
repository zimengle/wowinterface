
-- local _, db = ...

-- db.PLUGINS["ElvUI"] = function(self)
-- 	if not ConsolePortBar then
-- 		local pager = self:GetPager()
-- 		pager:SetFrameRef("main", MainMenuBarArtFrame)
-- 		pager:WrapScript(MainMenuBarArtFrame, "OnAttributeChanged", [[
-- 			if name == "actionpage" then
-- 				for header in pairs(headers) do
-- 					header:SetAttribute("actionpage", value)
-- 					if header:GetAttribute("pageupdate") then
-- 						header:RunAttribute("pageupdate", value)
-- 					end
-- 				end
-- 			end
-- 		]])
-- 		pager:SetAttribute("_onstate-actionpage", [[
-- 			newstate = self:GetFrameRef("main"):GetAttribute("actionpage")
-- 			for header in pairs(headers) do
-- 				header:SetAttribute("actionpage", newstate)
-- 				if header:GetAttribute("pageupdate") then
-- 					header:RunAttribute("pageupdate", newstate)
-- 				end
-- 			end
-- 		]])
-- 	end
-- end