--- @meta
--- @class gui
--- Table containing helpers for managing and interacting with the GUI.
gui = {}

--- Registers a function to be called under a dedicated space in the ImGui main menu bar.
--- @param imgui_rendering function Function that will be called in the menu bar space.
gui.add_to_menu_bar = function(imgui_rendering) end

--- Registers a function to be called every rendering frame, regardless of whether the GUI is open.
--- You can call ImGui functions in it. Refer to the ImGui.md documentation for details.
--- @param imgui_rendering function Function that will be called every rendering frame.
gui.add_always_draw_imgui = function(imgui_rendering) end

--- Registers a function to be called every rendering frame, but only if the GUI is in its open state.
--- You can call ImGui functions in it. Refer to the ImGui.md documentation for details.
--- @param imgui_rendering function Function that will be called each frame when the GUI is open.
gui.add_imgui = function(imgui_rendering) end

--- Checks if the GUI is currently open.
--- @return boolean Returns true if the GUI is open.
gui.is_open = function() end

--- Toggles the GUI between open and closed states.
gui.toggle = function() end

