-- Risky Returns Test Mod
-- Alcremytyl

--[[

If someone could whip this up quick it could be cool, statsindicator reminded me that I wanted to post this, but an imgui tab where you could modify your own in game stats/add/remove items would be useful and kind of standard, I see stuff like that in a lot of games as a very early thing people start making as a mod
]]

--[[
current objective: 
add type hints to ReturnOfModding
]]

-- -@module 'types'
-- require("util")

log.info("\n\n\n=====================\n\n  -- N E X T --\n\n\n")



log.info(ImGui.SetClipboardText("oira"))





-- FIXME: figure out what's wrong w/toml
-- local toml_path = path.combine(_ENV['!config_mod_folder_path'], 'test.toml')
-- local toml_path = 'test.toml'
-- local succeeded, table = pcall(toml.decodeFromFile, toml_path)
-- log.info("toml path: "..toml_path)
-- log.info("did it work: "..tostring(succeeded))
-- log.info(table_to_string(table))



_ = [[
log.info("Successfully loaded ".._ENV["!guid"]..".")


gui.add_to_menu_bar(function()
   if ImGui.BeginMenu("Ayo") then
       if ImGui.Button("Label") then
         log.info("hi")
       end
       ImGui.EndMenu()
   end
end)
]]

-- Gospel
-- https://github.com/return-of-modding/ReturnOfModding/tree/master/docs/lua/
