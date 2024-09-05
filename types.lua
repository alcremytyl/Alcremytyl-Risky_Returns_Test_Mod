-- ========== Enums ==========

---@enum EVariableType
--- Table containing all possible kind / type of variable within the GM engine.
EVariableType = {
  SELF = -1,
  OTHER = -2,
  ALL = -3,
  NOONE = -4,
  GLOBAL = -5,
  BUILTIN = -6,
  LOCAL = -7,
  STACKTOP = -9,
  ARGUMENT = -15,
}


--- @enum RValue
-- Table containing all possible types of an RValue.
RValueType = {
  REAL = 0,
  STRING = 1,
  ARRAY = 2,
  PTR = 3,
  VEC3 = 4,
  UNDEFINED = 5 ,
  OBJECT = 6,
  INT32 = 7,
  VEC4 = 8,
  MATRIX = 9,
  INT64 = 10,
  ACCESSOR = 11,
  JSNULL = 12,
  BOOL = 13,
  ITERATOR = 14,
  REF = 15,
  UNSET = 16777215,
}


--- @enum YYObjectBaseType
--- Table containing all possible types of an YYObjectBaseType
YYObjectBaseType = {
  YYOBJECTBASE = 0,
  CINSTANCE = 1,
  ACCESSOR = 2,
  SCRIPTREF = 3,
  PROPERTY = 4,
  ARRAY = 5,
  WEAKREF = 6,
  CONTAINER = 7,
  SEQUENCE = 8,
  SEQUENCEINSTANCE = 9,
  SEQUENCETRACK = 10,
  SEQUENCECURVE = 11,
  SEQUENCECURVECHANNEL = 12,
  SEQUENCEKEYFRAMESTORE = 14,
  SEQUENCEKEYFRAME = 15,
  SEQUENCEEVALTREE = 17,
  SEQUENCEEVALNODE = 18,
  SEQUENCEEVENT = 19,
  NINESLICE = 20
}


-- ======== Helpers ==========


--- @class paths
--- Table containing helpers for retrieving project related IO file/folder paths.
paths = {
  --- Retrieves the config folder path.
  --- Used for data that must persist between sessions and that can be manipulated by the user.
  --- @return string config_path The config folder path.
  config = function() end,

  --- Retrieves the plugins_data folder path.
  --- Used for data that must persist between sessions but not be manipulated by the user.
  --- @return string plugins_data_path The plugins_data folder path.
   plugins_data = function() end,

  --- Retrieves the plugins folder path.
  --- Location of .lua, README, manifest.json files.
  --- @return string plugins_path The plugins folder path.
  plugins = function() end
}


--- @class gm
--- Table containing helpers for interacting with the game maker engine.
gm = {
  --- Constants table containing gml/game constants name to their asset index.
  --- @type table<string, number>
  constants = {},

  --- Constant types table containing gml/game constants name to their type name.
  --- @type table<string, string>
  constant_types = {},

  --- Constants type sorted table.
  --- @type table<string, table<number, string>>
  constants_type_sorted = {},

  --- Registers a callback that will be called right before any object function is called.
  --- @param callback function Callback function with signature (self: CInstance, other: CInstance, code: CCode, result: RValue, flags: number): boolean
  pre_code_execute = function(callback) end,

  --- Registers a callback that will be called right after any object function is called.
  --- @param callback function Callback function with signature (self: CInstance, other: CInstance, code: CCode, result: RValue, flags: number): void
  post_code_execute = function(callback) end,

  --- Registers a callback that will be called right before any game script function is called.
  --- @param function_index number Index of the game script/builtin game maker function to hook, e.g., `gm.constants.callback_execute`.
  --- @param callback function Callback function with signature (self: CInstance, other: CInstance, result: RValue, args: RValue[]): boolean
  pre_script_hook = function(function_index, callback) end,

  --- Registers a callback that will be called right after any game script function is called.
  --- @param function_index number Index of the game script/builtin game maker function to hook, e.g., `gm.constants.callback_execute`.
  --- @param callback function Callback function with signature (self: CInstance, other: CInstance, result: RValue, args: RValue[]): void
  post_script_hook = function(function_index, callback) end,

  --- Retrieves the value of a global variable.
  --- @param name string Name of the variable.
  --- @return any value The actual value behind the RValue, or RValue if the type is not handled yet.
  variable_global_get = function(name) end,

  --- Sets the value of a global variable.
  --- @param name string Name of the variable.
  --- @param new_value any New value to set.
  variable_global_set = function(name, new_value) end,

  --- Calls a function by name with optional parameters.
  --- @param name string Name of the function to call.
  --- @param self CInstance Optional. The instance to use as `self`.
  --- @param other CInstance Optional. The instance to use as `other`.
  --- @param args any Optional. Arguments to pass to the function.
  --- @return any value The actual value behind the RValue, or RValue if the type is not handled yet.
  call = function(name, self, other, args) end,

  --- Creates and returns a new empty struct.
  --- @return YYObjectBase* The freshly made empty struct.
  struct_create = function() end
}


--- @class gui
--- Table containing helpers for managing and interacting with the GUI.
gui = {
  --- Registers a function to be called under a dedicated space in the ImGui main menu bar.
  --- @param imgui_rendering function Function that will be called in the menu bar space.
  add_to_menu_bar = function(imgui_rendering) end,

  --- Registers a function to be called every rendering frame, regardless of whether the GUI is open.
  --- You can call ImGui functions in it. Refer to the ImGui.md documentation for details.
  --- @param imgui_rendering function Function that will be called every rendering frame.
  add_always_draw_imgui = function(imgui_rendering) end,

  --- Registers a function to be called every rendering frame, but only if the GUI is in its open state.
  --- You can call ImGui functions in it. Refer to the ImGui.md documentation for details.
  --- @param imgui_rendering function Function that will be called each frame when the GUI is open.
  add_imgui = function(imgui_rendering) end,

  --- Checks if the GUI is currently open.
  --- @return boolean Returns true if the GUI is open.
  is_open = function() end,

  --- Toggles the GUI between open and closed states.
  toggle = function() end
}


--- @class log
--- Table containing functions for printing to the console or log file.
log = {
  --- Logs an informational message.
  --- @param args any Message or data to log.
  info = function(args) end,

  --- Logs a warning message.
  --- @param args any Message or data to log.
  warning = function(args) end,

  --- Logs a debug message.
  --- @param args any Message or data to log.
  debug = function(args) end,

  --- Logs an error message. This mirrors the classic Lua `error` function.
  --- @param arg any Message or data to log.
  --- @param level integer Error level.
  error = function(arg, level) end,

  --- Refreshes the log filters (Console and File) from the config file.
  refresh_filters = function() end
}

--- @class memory
--- Table containing helper functions related to process memory.
memory = {
  --- Scans the specified memory pattern within the target main module and returns a pointer to the found address.
  --- @param pattern string Byte pattern in IDA format.
  --- @return pointer Pointer to the found address.
  scan_pattern = function(pattern) end,

  --- Allocates a specified number of bytes on the heap.
  --- @param size integer Number of bytes to allocate.
  --- @return pointer Pointer to the newly allocated memory.
  allocate = function(size) end,

  --- Frees the allocated memory at the specified pointer.
  --- @param ptr pointer Pointer to the memory to be freed.
  free = function(ptr) end
}




--- @class YYObjectBase*
--- @class CInstance
--- @class pointer


--- @class path
--- Table containing helpers for manipulating file or directory paths.
path = {
  --- Combine strings into a path.
  --- @param ... string Any number of strings to combine into a path.
  --- @return string new_path The combined path.
  combine = function(...) end,

  --- Retrieve the parent directory of the specified path.
  --- @param path string The path for which to retrieve the parent directory.
  --- @return string parent_dir The parent path.
  get_parent = function(path) end,

  --- Retrieve the names of subdirectories under the given root path.
  --- @param root_path string The path to the directory to search.
  --- @return string[] subdirs A table containing the names of subdirectories.
  get_directories = function(root_path) end,

  --- Retrieve the names of all files under the given root path.
  --- @param root_path string The path to the directory to search.
  --- @return string[] files A table containing the names of files.
  get_files = function(root_path) end,

  --- Retrieve the filename from the given path.
  --- @param path string The path from which to extract the filename.
  --- @return string filename The filename.
  filename = function(path) end,

  --- Retrieve the stem of the filename from the given path (filename without the final extension).
  --- @param path string The path from which to extract the stem.
  --- @return string stem The stem of the filename.
  stem = function(path) end,

  --- Create a new directory at the specified path.
  --- @param path string The path to the new directory to create.
  --- @return boolean succeeded True if the directory was newly created, false otherwise.
  create_directory = function(path) end,
}


--- @class mods
--- Table containing information about loaded mods and related functions.
--- Each mod once loaded will have a key in this table, the key will be their GUID string and the value their `_ENV`.
mods = {
  --- Registers a callback that will be called once all mods are loaded. 
  --- The callback will be called instantly if mods are already loaded and you are just hot-reloading your mod.
  --- @param callback fun() The callback function that will be invoked once all mods are loaded. The function should have no parameters.
  on_all_mods_loaded = function(callback) end,
}


--- @class ImGui
--- Table containing functions for handling ImGui windows and utilities.
ImGui = {
  --- Displays a demo window with example ImGui widgets.
  ShowDemoWindow = function() end,

  --- Begins a new ImGui window.
  --- @param text string Name of the window.
  --- @param bool? open Optional. Boolean flag indicating whether the window should be open.
  --- @param ImGuiWindowFlags? flags Optional. Window flags for customization.
  --- @return boolean shouldDraw Whether the window should be drawn.
  --- @return boolean? open Optional. Updated open state of the window.
  --- @return boolean? shouldDraw Optional. Whether the window should be drawn.
  --- @overload fun(text: string): boolean
  --- @overload fun(text: string, flags: ImGuiWindowFlags): boolean
  --- @overload fun(text: string, open: boolean): boolean, boolean
  --- @overload fun(text: string, open: boolean, flags: ImGuiWindowFlags): boolean, boolean
  Begin = function(text, bool, flags) end,

  --- Ends the current ImGui window.
  End = function() end,

  --- Begins a child window.
  --- @param text string Name of the child window.
  --- @param float? size_x Optional. Width of the child window.
  --- @param float? size_y Optional. Height of the child window.
  --- @param bool? border Optional. Whether to draw a border around the child window.
  --- @param ImGuiWindowFlags? flags Optional. Window flags for customization.
  --- @return boolean shouldDraw Whether the child window should be drawn.
  --- @overload fun(text: string): boolean
  --- @overload fun(text: string, size_x: float): boolean
  --- @overload fun(text: string, size_x: float, size_y: float): boolean
  --- @overload fun(text: string, size_x: float, size_y: float, border: boolean): boolean
  --- @overload fun(text: string, size_x: float, size_y: float, border: boolean, flags: ImGuiWindowFlags): boolean
  BeginChild = function(text, size_x, size_y, border, flags) end,

  --- Ends the current child window.
  EndChild = function() end,

  --- Checks if the current window is appearing.
  --- @return boolean appearing Whether the window is appearing.
  IsWindowAppearing = function() end,

  --- Checks if the current window is collapsed.
  --- @return boolean collapsed Whether the window is collapsed.
  IsWindowCollapsed = function() end,

  --- Checks if the current window is focused.
  --- @param ImGuiFocusedFlags? flags Optional. Flags to specify focus criteria.
  --- @return boolean focused Whether the window is focused.
  --- @overload fun(): boolean
  --- @overload fun(flags: ImGuiFocusedFlags): boolean
  IsWindowFocused = function(flags) end,

  --- Checks if the current window is hovered.
  --- @param ImGuiHoveredFlags? flags Optional. Flags to specify hover criteria.
  --- @return boolean hovered Whether the window is hovered.
  --- @overload fun(): boolean
  --- @overload fun(flags: ImGuiHoveredFlags): boolean
  IsWindowHovered = function(flags) end,

  --- Gets the DPI scale of the current window.
  --- @return float dpiScale The DPI scale of the window.
  GetWindowDpiScale = function() end,

  --- Gets the position of the current window.
  --- @return float pos_x The x-coordinate of the window's position.
  --- @return float pos_y The y-coordinate of the window's position.
  GetWindowPos = function() end,

  --- Gets the size of the current window.
  --- @return float size_x The width of the window.
  --- @return float size_y The height of the window.
  GetWindowSize = function() end,

  --- Gets the width of the current window.
  --- @return float width The width of the window.
  GetWindowWidth = function() end,

  --- Gets the height of the current window.
  --- @return float height The height of the window.
  GetWindowHeight = function() end,

  --- Sets the position of the next window to be created.
  --- @param float pos_x X-coordinate for the position.
  --- @param float pos_y Y-coordinate for the position.
  --- @param ImGuiCond? cond Optional. Condition for setting the position.
  --- @param float? pivot_x Optional. X-coordinate of the pivot point.
  --- @param float? pivot_y Optional. Y-coordinate of the pivot point.
  --- @overload fun(pos_x: float, pos_y: float): void
  --- @overload fun(pos_x: float, pos_y: float, cond: ImGuiCond): void
  --- @overload fun(pos_x: float, pos_y: float, cond: ImGuiCond, pivot_x: float, pivot_y: float): void
  SetNextWindowPos = function(pos_x, pos_y, cond, pivot_x, pivot_y) end,

  --- Sets the size of the next window to be created.
  --- @param float size_x Width for the size.
  --- @param float size_y Height for the size.
  --- @param ImGuiCond? cond Optional. Condition for setting the size.
  --- @overload fun(size_x: float, size_y: float): void
  --- @overload fun(size_x: float, size_y: float, cond: ImGuiCond): void
  SetNextWindowSize = function(size_x, size_y, cond) end,

  --- Sets the size constraints for the next window to be created.
  --- @param float min_x Minimum width.
  --- @param float min_y Minimum height.
  --- @param float max_x Maximum width.
  --- @param float max_y Maximum height.
  SetNextWindowSizeConstraints = function(min_x, min_y, max_x, max_y) end,

  --- Sets the content size for the next window to be created.
  --- @param float size_x Width of the content size.
  --- @param float size_y Height of the content size.
  SetNextWindowContentSize = function(size_x, size_y) end,

  --- Sets the collapsed state for the next window to be created.
  --- @param bool collapsed Whether the window should be collapsed.
  --- @param ImGuiCond? cond Optional. Condition for setting the collapsed state.
  --- @overload fun(collapsed: boolean): void
  --- @overload fun(collapsed: boolean, cond: ImGuiCond): void
  SetNextWindowCollapsed = function(collapsed, cond) end,

  --- Sets the next window to be focused.
  SetNextWindowFocus = function() end,

  --- Sets the background alpha of the next window to be created.
  --- @param float alpha Alpha value for the window background.
  SetNextWindowBgAlpha = function(alpha) end,

  --- Sets the position of the current window.
  --- @param float pos_x X-coordinate for the position.
  --- @param float pos_y Y-coordinate for the position.
  --- @param ImGuiCond? cond Optional. Condition for setting the position.
  --- @overload fun(pos_x: float, pos_y: float): void
  --- @overload fun(pos_x: float, pos_y: float, cond: ImGuiCond): void
  SetWindowPos = function(pos_x, pos_y, cond) end,

  --- Sets the size of the current window.
  --- @param float size_x Width for the size.
  --- @param float size_y Height for the size.
  --- @param ImGuiCond? cond Optional. Condition for setting the size.
  --- @overload fun(size_x: float, size_y: float): void
  --- @overload fun(size_x: float, size_y: float, cond: ImGuiCond): void
  SetWindowSize = function(size_x, size_y, cond) end,

  --- Sets the collapsed state of the current window.
  --- @param bool collapsed Whether the window should be collapsed.
  --- @param ImGuiCond? cond Optional. Condition for setting the collapsed state.
  --- @overload fun(collapsed: boolean): void
  --- @overload fun(collapsed: boolean, cond: ImGuiCond): void
  SetWindowCollapsed = function(collapsed, cond) end,

  --- Sets focus to the current window.
  SetWindowFocus = function() end,

  --- Sets the font scale of the current window.
  --- @param float scale Scale factor for the font.
  SetWindowFontScale = function(scale) end,

  --- Sets the position of a named window.
  --- @param text string Name of the window.
  --- @param float pos_x X-coordinate for the position.
  --- @param float pos_y Y-coordinate for the position.
  --- @param ImGuiCond? cond Optional. Condition for setting the position.
  --- @overload fun(text: string, pos_x: float, pos_y: float): void
  --- @overload fun(text: string, pos_x: float, pos_y: float, cond: ImGuiCond): void
  SetWindowPos = function(text, pos_x, pos_y, cond) end,

  --- Sets the size of a named window.
  --- @param text

--- @class ImGui
--- Table containing functions for handling ImGui windows and utilities.
ImGui = {
  --- Sets the size of a named window.
  --- @param text string Name of the window.
  --- @param size_x float Width for the size.
  --- @param size_y float Height for the size.
  --- @param ImGuiCond? cond Optional. Condition for setting the size.
  --- @overload fun(text: string, size_x: float, size_y: float): void
  --- @overload fun(text: string, size_x: float, size_y: float, cond: ImGuiCond): void
  SetWindowSize = function(text, size_x, size_y, cond) end,

  --- Sets the collapsed state of a named window.
  --- @param text string Name of the window.
  --- @param collapsed bool Whether the window should be collapsed.
  --- @param ImGuiCond? cond Optional. Condition for setting the collapsed state.
  --- @overload fun(text: string, collapsed: boolean): void
  --- @overload fun(text: string, collapsed: boolean, cond: ImGuiCond): void
  SetWindowCollapsed = function(text, collapsed, cond) end,

  --- Sets focus to a named window.
  --- @param text string Name of the window.
  SetWindowFocus = function(text) end,
}

--- @class ImGui
--- Table containing functions for handling content regions and scrolling within ImGui windows.
ImGui = {
  --- Gets the maximum content region size.
  --- @return float x The maximum x-coordinate of the content region.
  --- @return float y The maximum y-coordinate of the content region.
  GetContentRegionMax = function() end,

  --- Gets the available content region size.
  --- @return float x The available x-coordinate of the content region.
  --- @return float y The available y-coordinate of the content region.
  GetContentRegionAvail = function() end,

  --- Gets the minimum content region coordinates within the current window.
  --- @return float x The minimum x-coordinate of the content region.
  --- @return float y The minimum y-coordinate of the content region.
  GetWindowContentRegionMin = function() end,

  --- Gets the maximum content region coordinates within the current window.
  --- @return float x The maximum x-coordinate of the content region.
  --- @return float y The maximum y-coordinate of the content region.
  GetWindowContentRegionMax = function() end,

  --- Gets the width of the content region within the current window.
  --- @return float width The width of the content region.
  GetWindowContentRegionWidth = function() end,

  --- Gets the current horizontal scroll position.
  --- @return float x The current horizontal scroll position.
  GetScrollX = function() end,

  --- Gets the current vertical scroll position.
  --- @return float y The current vertical scroll position.
  GetScrollY = function() end,

  --- Gets the maximum horizontal scroll position.
  --- @return float x The maximum horizontal scroll position.
  GetScrollMaxX = function() end,

  --- Gets the maximum vertical scroll position.
  --- @return float y The maximum vertical scroll position.
  GetScrollMaxY = function() end,

  --- Sets the horizontal scroll position.
  --- @param scroll_x float The new horizontal scroll position.
  SetScrollX = function(scroll_x) end,

  --- Sets the vertical scroll position.
  --- @param scroll_y float The new vertical scroll position.
  SetScrollY = function(scroll_y) end,

  --- Sets the horizontal scroll position relative to the content width.
  --- @param center_x_ratio? float Optional. Ratio of the center of the scroll area (0.0 to 1.0).
  --- @overload fun(): void
  --- @overload fun(center_x_ratio: float): void
  SetScrollHereX = function(center_x_ratio) end,

  --- Sets the vertical scroll position relative to the content height.
  --- @param center_y_ratio? float Optional. Ratio of the center of the scroll area (0.0 to 1.0).
  --- @overload fun(): void
  --- @overload fun(center_y_ratio: float): void
  SetScrollHereY = function(center_y_ratio) end,

  --- Sets the horizontal scroll position based on a local position.
  --- @param local_x float The local x-coordinate within the scrollable area.
  --- @param center_x_ratio? float Optional. Ratio of the center of the scroll area (0.0 to 1.0).
  --- @overload fun(local_x: float): void
  --- @overload fun(local_x: float, center_x_ratio: float): void
  SetScrollFromPosX = function(local_x, center_x_ratio) end,

  --- Sets the vertical scroll position based on a local position.
  --- @param local_y float The local y-coordinate within the scrollable area.
  --- @param center_y_ratio? float Optional. Ratio of the center of the scroll area (0.0 to 1.0).
  --- @overload fun(local_y: float): void
  --- @overload fun(local_y: float, center_y_ratio: float): void
  SetScrollFromPosY = function(local_y, center_y_ratio) end,
}


--- @class ImGui
--- Table containing functions for managing style parameters, item widths, text wrap positions, and keyboard focus.
ImGui = {
  --- Pushes a new style color onto the stack.
  --- @param idx ImGuiCol The style color index.
  --- @param color_u32 int The color as a 32-bit unsigned integer.
  --- @overload fun(idx: ImGuiCol, color_r: float, color_g: float, color_b: float, color_a: float): void
  PushStyleColor = function(idx, color_u32) end,

  --- Pops the last style color off the stack.
  --- @param count? int Optional. Number of colors to pop.
  --- @overload fun(): void
  PopStyleColor = function(count) end,

  --- Pushes a new style variable onto the stack.
  --- @param idx ImGuiStyleVar The style variable index.
  --- @param value float The style variable value.
  --- @overload fun(idx: ImGuiStyleVar, value_x: float, value_y: float): void
  PushStyleVar = function(idx, value) end,

  --- Pops the last style variable off the stack.
  --- @param count? int Optional. Number of style variables to pop.
  --- @overload fun(): void
  PopStyleVar = function(count) end,

  --- Gets the color vector for a style color.
  --- @param idx ImGuiCol The style color index.
  --- @return float color_r The red component of the color.
  --- @return float color_g The green component of the color.
  --- @return float color_b The blue component of the color.
  --- @return float color_a The alpha component of the color.
  GetStyleColorVec4 = function(idx) end,

  --- Gets the current font size.
  --- @return float fontSize The current font size.
  GetFontSize = function() end,

  --- Gets the UV coordinates of the white pixel in the font texture.
  --- @return float x The x-coordinate of the UV coordinates.
  --- @return float y The y-coordinate of the UV coordinates.
  GetFontTexUvWhitePixel = function() end,

  --- Gets the color as a 32-bit unsigned integer.
  --- @param idx? ImGuiCol Optional. The style color index.
  --- @param alphaMultiplier? float Optional. The alpha multiplier.
  --- @overload fun(color_r: float, color_g: float, color_b: float, color_a: float): int
  --- @return int color_u32 The color as a 32-bit unsigned integer.
  GetColorU32 = function(idx, alphaMultiplier) end,

  --- Pushes a new item width onto the stack.
  --- @param width float The item width.
  PushItemWidth = function(width) end,

  --- Pops the last item width off the stack.
  PopItemWidth = function() end,

  --- Sets the width for the next item.
  --- @param width float The item width.
  SetNextItemWidth = function(width) end,

  --- Calculates the width of the current item.
  --- @return float width The width of the current item.
  CalcItemWidth = function() end,

  --- Pushes a new text wrap position onto the stack.
  --- @param wrap_local_pos_x? float Optional. The wrap position in local x-coordinate.
  --- @overload fun(): void
  PushTextWrapPos = function(wrap_local_pos_x) end,

  --- Pops the last text wrap position off the stack.
  PopTextWrapPos = function() end,

  --- Pushes a new keyboard focus setting onto the stack.
  --- @param allow_keyboard_focus bool Whether keyboard focus is allowed.
  PushAllowKeyboardFocus = function(allow_keyboard_focus) end,

  --- Pops the last keyboard focus setting off the stack.
  PopAllowKeyboardFocus = function() end,

  --- Pushes a new button repeat setting onto the stack.
  --- @param repeat bool Whether button repeat is allowed.
  PushButtonRepeat = function(repeat) end,

  --- Pops the last button repeat setting off the stack.
  PopButtonRepeat = function() end,
}

--- @class ImGui
--- Table containing functions for cursor positioning, layout management, ID stack manipulation, and text widgets.
ImGui = {
  --- Adds a horizontal separator line.
  Separator = function() end,

  --- Positions the cursor on the same line as the previous item.
  --- @param offset_from_start_x? float Optional. Offset from the start of the line.
  --- @param spacing? float Optional. Spacing to add after the item.
  --- @overload fun(): void
  --- @overload fun(offset_from_start_x: float): void
  --- @overload fun(offset_from_start_x: float, spacing: float): void
  SameLine = function(offset_from_start_x, spacing) end,

  --- Adds a new line in the layout.
  NewLine = function() end,

  --- Adds spacing to the layout.
  Spacing = function() end,

  --- Adds a dummy item to the layout.
  --- @param size_x float The width of the dummy item.
  --- @param size_y float The height of the dummy item.
  Dummy = function(size_x, size_y) end,

  --- Increases the indentation of the layout.
  --- @param indent_w? float Optional. The amount to indent.
  --- @overload fun(): void
  --- @overload fun(indent_w: float): void
  Indent = function(indent_w) end,

  --- Decreases the indentation of the layout.
  --- @param indent_w? float Optional. The amount to un-indent.
  --- @overload fun(): void
  --- @overload fun(indent_w: float): void
  Unindent = function(indent_w) end,

  --- Begins a new group for layout management.
  BeginGroup = function() end,

  --- Ends the current group for layout management.
  EndGroup = function() end,

  --- Gets the current cursor position.
  --- @return float x The x-coordinate of the cursor position.
  --- @return float y The y-coordinate of the cursor position.
  GetCursorPos = function() end,

  --- Gets the current x-coordinate of the cursor position.
  --- @return float x The x-coordinate of the cursor position.
  GetCursorPosX = function() end,

  --- Gets the current y-coordinate of the cursor position.
  --- @return float y The y-coordinate of the cursor position.
  GetCursorPosY = function() end,

  --- Sets the cursor position.
  --- @param x float The new x-coordinate of the cursor position.
  --- @param y float The new y-coordinate of the cursor position.
  SetCursorPos = function(x, y) end,

  --- Sets the x-coordinate of the cursor position.
  --- @param x float The new x-coordinate of the cursor position.
  SetCursorPosX = function(x) end,

  --- Sets the y-coordinate of the cursor position.
  --- @param y float The new y-coordinate of the cursor position.
  SetCursorPosY = function(y) end,

  --- Gets the starting position of the cursor.
  --- @return float x The x-coordinate of the cursor start position.
  --- @return float y The y-coordinate of the cursor start position.
  GetCursorStartPos = function() end,

  --- Gets the screen position of the cursor.
  --- @return float x The x-coordinate of the cursor screen position.
  --- @return float y The y-coordinate of the cursor screen position.
  GetCursorScreenPos = function() end,

  --- Sets the screen position of the cursor.
  --- @param x float The new x-coordinate of the cursor screen position.
  --- @param y float The new y-coordinate of the cursor screen position.
  SetCursorScreenPos = function(x, y) end,

  --- Aligns text to the frame padding.
  AlignTextToFramePadding = function() end,

  --- Gets the height of a text line.
  --- @return float height The height of the text line.
  GetTextLineHeight = function() end,

  --- Gets the height of a text line including spacing.
  --- @return float height The height of the text line with spacing.
  GetTextLineHeightWithSpacing = function() end,

  --- Gets the height of a frame.
  --- @return float height The height of the frame.
  GetFrameHeight = function() end,

  --- Gets the height of a frame including spacing.
  --- @return float height The height of the frame with spacing.
  GetFrameHeightWithSpacing = function() end,

  --- Pushes a new ID onto the stack.
  --- @param str_id? string Optional. The ID as a string.
  --- @param int_id? int Optional. The ID as an integer.
  --- @overload fun(str_id: string): void
  --- @overload fun(int_id: int): void
  PushID = function(str_id, int_id) end,

  --- Pops the last ID off the stack.
  PopID = function() end,

  --- Gets an ID from the ID stack.
  --- @param str_id? string Optional. The ID as a string.
  --- @return int id The ID.
  --- @overload fun(str_id: string): int
  GetID = function(str_id) end,

  --- Displays unformatted text.
  --- @param text string The text to display.
  --- @overload fun(text: string): void
  TextUnformatted = function(text) end,

  --- Displays formatted text.
  --- @param text string The text to display.
  Text = function(text) end,

  --- Displays colored text.
  --- @param color_r float The red component of the color.
  --- @param color_g float The green component of the color.
  --- @param color_b float The blue component of the color.
  --- @param color_a float The alpha component of the color.
  --- @param text string The text to display.
  TextColored = function(color_r, color_g, color_b, color_a, text) end,

  --- Displays disabled text.
  --- @param text string The text to display.
  TextDisabled = function(text) end,

  --- Displays wrapped text.
  --- @param text string The text to display.
  TextWrapped = function(text) end,

  --- Displays a label with text.
  --- @param label string The label text.
  --- @param text string The text to display.
  LabelText = function(label, text) end,

  --- Displays text with a bullet point.
  --- @param text string The text to display.
  BulletText = function(text) end,
}
--- @class ImGui
--- Table containing functions for various widgets, including buttons, checkboxes, progress bars, combo boxes, and more.
ImGui = {
  --- Creates a button widget.
  --- @param label string The text to display on the button.
  --- @param size_x? float Optional. The width of the button.
  --- @param size_y? float Optional. The height of the button.
  --- @return bool clicked Returns true if the button was clicked.
  --- @overload fun(label: string): bool
  --- @overload fun(label: string, size_x: float, size_y: float): bool
  Button = function(label, size_x, size_y) end,

  --- Creates a small button widget.
  --- @param label string The text to display on the button.
  --- @return bool clicked Returns true if the button was clicked.
  SmallButton = function(label) end,

  --- Creates an invisible button widget.
  --- @param label string The text to display on the button.
  --- @param size_x float The width of the button.
  --- @param size_y float The height of the button.
  --- @return bool clicked Returns true if the button was clicked.
  InvisibleButton = function(label, size_x, size_y) end,

  --- Creates an arrow button widget.
  --- @param str_id string The identifier for the button.
  --- @param dir ImGuiDir The direction of the arrow.
  --- @return bool clicked Returns true if the button was clicked.
  ArrowButton = function(str_id, dir) end,

  --- Creates a checkbox widget.
  --- @param label string The text to display next to the checkbox.
  --- @param value bool The current state of the checkbox.
  --- @return bool value The updated state of the checkbox.
  --- @return bool pressed Returns true if the checkbox was clicked.
  Checkbox = function(label, value) end,

  --- Creates a radio button widget.
  --- @param label string The text to display next to the radio button.
  --- @param active bool The current state of the radio button.
  --- @return bool pressed Returns true if the radio button was clicked.
  --- @overload fun(label: string, value: int, v_button: int): int, bool
  RadioButton = function(label, active) end,

  --- Creates a progress bar widget.
  --- @param fraction float The current progress fraction (0.0 to 1.0).
  --- @param size_x? float Optional. The width of the progress bar.
  --- @param size_y? float Optional. The height of the progress bar.
  --- @param overlay? string Optional. Text to display over the progress bar.
  ProgressBar = function(fraction, size_x, size_y, overlay) end,

  --- Displays a bullet point.
  Bullet = function() end,

  --- Begins a combo box widget.
  --- @param label string The text to display as the label for the combo box.
  --- @param previewValue string The text to display as the preview value.
  --- @param flags? ImGuiComboFlags Optional. Flags to configure the combo box.
  --- @return bool shouldDraw Returns true if the combo box should be drawn.
  --- @overload fun(label: string, previewValue: string): bool
  --- @overload fun(label: string, previewValue: string, flags: ImGuiComboFlags): bool
  BeginCombo = function(label, previewValue, flags) end,

  --- Ends a combo box widget.
  EndCombo = function() end,

  --- Creates a combo box widget.
  --- @param label string The text to display as the label for the combo box.
  --- @param current_item int The index of the currently selected item.
  --- @param items table A table of items to display in the combo box.
  --- @param items_count int The number of items in the combo box.
  --- @param popup_max_height_in_items? int Optional. The maximum number of items to display in the popup.
  --- @return int current_item The updated index of the currently selected item.
  --- @return bool clicked Returns true if an item was selected.
  --- @overload fun(label: string, current_item: int, items: table, items_count: int): int, bool
  --- @overload fun(label: string, current_item: int, items_separated_by_zeros: string): int, bool
  --- @overload fun(label: string, current_item: int, items_separated_by_zeros: string, popup_max_height_in_items: int): int, bool
  Combo = function(label, current_item, items, items_count, popup_max_height_in_items) end,
}

--- @class ImGui
--- Table containing functions for draggable widgets that allow users to adjust values via dragging.
ImGui = {
  --- Creates a draggable float widget.
  --- @param label string The text to display next to the drag control.
  --- @param value float The current value.
  --- @param value_speed? float Optional. Speed of value change.
  --- @param value_min? float Optional. Minimum value.
  --- @param value_max? float Optional. Maximum value.
  --- @param format? string Optional. Formatting string.
  --- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
  --- @return float value The updated value.
  --- @return bool used Returns true if the value was changed.
  --- @overload fun(label: string, value: float): float, bool
  --- @overload fun(label: string, value: float, value_speed: float): float, bool
  --- @overload fun(label: string, value: float, value_speed: float, value_min: float): float, bool
  --- @overload fun(label: string, value: float, value_speed: float, value_min: float, value_max: float): float, bool
  --- @overload fun(label: string, value: float, value_speed: float, value_min: float, value_max: float, format: string): float, bool
  --- @overload fun(label: string, value: float, value_speed: float, value_min: float, value_max: float, format: string, flags: ImGuiSliderFlags): float, bool
  DragFloat = function(label, value, value_speed, value_min, value_max, format, flags) end,

  --- Creates a draggable float2 widget.
  --- @param label string The text to display next to the drag control.
  --- @param values table A table with two float values.
  --- @param value_speed? float Optional. Speed of value change.
  --- @param value_min? float Optional. Minimum value.
  --- @param value_max? float Optional. Maximum value.
  --- @param format? string Optional. Formatting string.
  --- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
  --- @return table values The updated values.
  --- @return bool used Returns true if the values were changed.
  --- @overload fun(label: string, values: table): table, bool
  --- @overload fun(label: string, values: table, value_speed: float): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: float): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: float, value_max: float): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: float, value_max: float, format: string): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: float, value_max: float, format: string, flags: ImGuiSliderFlags): table, bool
  DragFloat2 = function(label, values, value_speed, value_min, value_max, format, flags) end,

  --- Creates a draggable float3 widget.
  --- @param label string The text to display next to the drag control.
  --- @param values table A table with three float values.
  --- @param value_speed? float Optional. Speed of value change.
  --- @param value_min? float Optional. Minimum value.
  --- @param value_max? float Optional. Maximum value.
  --- @param format? string Optional. Formatting string.
  --- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
  --- @return table values The updated values.
  --- @return bool used Returns true if the values were changed.
  --- @overload fun(label: string, values: table): table, bool
  --- @overload fun(label: string, values: table, value_speed: float): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: float): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: float, value_max: float): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: float, value_max: float, format: string): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: float, value_max: float, format: string, flags: ImGuiSliderFlags): table, bool
  DragFloat3 = function(label, values, value_speed, value_min, value_max, format, flags) end,

  --- Creates a draggable float4 widget.
  --- @param label string The text to display next to the drag control.
  --- @param values table A table with four float values.
  --- @param value_speed? float Optional. Speed of value change.
  --- @param value_min? float Optional. Minimum value.
  --- @param value_max? float Optional. Maximum value.
  --- @param format? string Optional. Formatting string.
  --- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
  --- @return table values The updated values.
  --- @return bool used Returns true if the values were changed.
  --- @overload fun(label: string, values: table): table, bool
  --- @overload fun(label: string, values: table, value_speed: float): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: float): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: float, value_max: float): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: float, value_max: float, format: string): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: float, value_max: float, format: string, flags: ImGuiSliderFlags): table, bool
  DragFloat4 = function(label, values, value_speed, value_min, value_max, format, flags) end,

  --- Creates a draggable integer widget.
  --- @param label string The text to display next to the drag control.
  --- @param value int The current value.
  --- @param value_speed? float Optional. Speed of value change.
  --- @param value_min? int Optional. Minimum value.
  --- @param value_max? int Optional. Maximum value.
  --- @param format? string Optional. Formatting string.
  --- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
  --- @return int value The updated value.
  --- @return bool used Returns true if the value was changed.
  --- @overload fun(label: string, value: int): int, bool
  --- @overload fun(label: string, value: int, value_speed: float): int, bool
  --- @overload fun(label: string, value: int, value_speed: float, value_min: int): int, bool
  --- @overload fun(label: string, value: int, value_speed: float, value_min: int, value_max: int): int, bool
  --- @overload fun(label: string, value: int, value_speed: float, value_min: int, value_max: int, format: string): int, bool
  --- @overload fun(label: string, value: int, value_speed: float, value_min: int, value_max: int, format: string, flags: ImGuiSliderFlags): int, bool
  DragInt = function(label, value, value_speed, value_min, value_max, format, flags) end,

--- @class ImGui
--- Table containing functions for draggable integer widgets that allow users to adjust integer values via dragging.
ImGui = {
  --- Creates a draggable integer2 widget.
  --- @param label string The text to display next to the drag control.
  --- @param values table A table with two integer values.
  --- @param value_speed? float Optional. Speed of value change.
  --- @param value_min? int Optional. Minimum value.
  --- @param value_max? int Optional. Maximum value.
  --- @param format? string Optional. Formatting string.
  --- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
  --- @return table values The updated values.
  --- @return bool used Returns true if the values were changed.
  --- @overload fun(label: string, values: table): table, bool
  --- @overload fun(label: string, values: table, value_speed: float): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: int): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: int, value_max: int): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: int, value_max: int, format: string): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: int, value_max: int, format: string, flags: ImGuiSliderFlags): table, bool
  DragInt2 = function(label, values, value_speed, value_min, value_max, format, flags) end,

  --- Creates a draggable integer3 widget.
  --- @param label string The text to display next to the drag control.
  --- @param values table A table with three integer values.
  --- @param value_speed? float Optional. Speed of value change.
  --- @param value_min? int Optional. Minimum value.
  --- @param value_max? int Optional. Maximum value.
  --- @param format? string Optional. Formatting string.
  --- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
  --- @return table values The updated values.
  --- @return bool used Returns true if the values were changed.
  --- @overload fun(label: string, values: table): table, bool
  --- @overload fun(label: string, values: table, value_speed: float): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: int): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: int, value_max: int): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: int, value_max: int, format: string): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: int, value_max: int, format: string, flags: ImGuiSliderFlags): table, bool
  DragInt3 = function(label, values, value_speed, value_min, value_max, format, flags) end,

  --- Creates a draggable integer4 widget.
  --- @param label string The text to display next to the drag control.
  --- @param values table A table with four integer values.
  --- @param value_speed? float Optional. Speed of value change.
  --- @param value_min? int Optional. Minimum value.
  --- @param value_max? int Optional. Maximum value.
  --- @param format? string Optional. Formatting string.
  --- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
  --- @return table values The updated values.
  --- @return bool used Returns true if the values were changed.
  --- @overload fun(label: string, values: table): table, bool
  --- @overload fun(label: string, values: table, value_speed: float): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: int): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: int, value_max: int): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: int, value_max: int, format: string): table, bool
  --- @overload fun(label: string, values: table, value_speed: float, value_min: int, value_max: int, format: string, flags: ImGuiSliderFlags): table, bool
  DragInt4 = function(label, values, value_speed, value_min, value_max, format, flags) end,
}
--- @class ImGui
--- Table containing functions for slider widgets that allow users to adjust float and angle values.

ImGui = {
  --- Creates a float slider widget.
  --- @param label string The text to display next to the slider.
  --- @param value float The value to be adjusted by the slider.
  --- @param value_min float The minimum value of the slider.
  --- @param value_max float The maximum value of the slider.
  --- @param format? string Optional. Formatting string for the value display.
  --- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
  --- @return float value The updated value.
  --- @return bool used Returns true if the value was changed.
  --- @overload fun(label: string, value: float, value_min: float, value_max: float): float, bool
  --- @overload fun(label: string, value: float, value_min: float, value_max: float, format: string): float, bool
  --- @overload fun(label: string, value: float, value_min: float, value_max: float, format: string, flags: ImGuiSliderFlags): float, bool
  SliderFloat = function(label, value, value_min, value_max, format, flags) end,

  --- Creates a float2 slider widget.
  --- @param label string The text to display next to the sliders.
  --- @param values table A table with two float values.
  --- @param value_min float The minimum value for each slider.
  --- @param value_max float The maximum value for each slider.
  --- @param format? string Optional. Formatting string for the values display.
  --- @param flags? ImGuiSliderFlags Optional. Flags to modify the sliders' behavior.
  --- @return table values The updated values.
  --- @return bool used Returns true if the values were changed.
  --- @overload fun(label: string, values: table, value_min: float, value_max: float): table, bool
  --- @overload fun(label: string, values: table, value_min: float, value_max: float, format: string): table, bool
  --- @overload fun(label: string, values: table, value_min: float, value_max: float, format: string, flags: ImGuiSliderFlags): table, bool
  SliderFloat2 = function(label, values, value_min, value_max, format, flags) end,

  --- Creates a float3 slider widget.
  --- @param label string The text to display next to the sliders.
  --- @param values table A table with three float values.
  --- @param value_min float The minimum value for each slider.
  --- @param value_max float The maximum value for each slider.
  --- @param format? string Optional. Formatting string for the values display.
  --- @param flags? ImGuiSliderFlags Optional. Flags to modify the sliders' behavior.
  --- @return table values The updated values.
  --- @return bool used Returns true if the values were changed.
  --- @overload fun(label: string, values: table, value_min: float, value_max: float): table, bool
  --- @overload fun(label: string, values: table, value_min: float, value_max: float, format: string): table, bool
  --- @overload fun(label: string, values: table, value_min: float, value_max: float, format: string, flags: ImGuiSliderFlags): table, bool
  SliderFloat3 = function(label, values, value_min, value_max, format, flags) end,

  --- Creates a float4 slider widget.
  --- @param label string The text to display next to the sliders.
  --- @param values table A table with four float values.
  --- @param value_min float The minimum value for each slider.
  --- @param value_max float The maximum value for each slider.
  --- @param format? string Optional. Formatting string for the values display.
  --- @param flags? ImGuiSliderFlags Optional. Flags to modify the sliders' behavior.
  --- @return table values The updated values.
  --- @return bool used Returns true if the values were changed.
  --- @overload fun(label: string, values: table, value_min: float, value_max: float): table, bool
  --- @overload fun(label: string, values: table, value_min: float, value_max: float, format: string): table, bool
  --- @overload fun(label: string, values: table, value_min: float, value_max: float, format: string, flags: ImGuiSliderFlags): table, bool
  SliderFloat4 = function(label, values, value_min, value_max, format, flags) end,

  --- Creates an angle slider widget.
  --- @param label string The text to display next to the slider.
  --- @param v_rad float The value in radians to be adjusted by the slider.
  --- @param v_degrees_min? float Optional. Minimum angle in degrees.
  --- @param v_degrees_max? float Optional. Maximum angle in degrees.
  --- @param format? string Optional. Formatting string for the value display.
  --- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
  --- @return float v_rad The updated value in radians.
  --- @return bool used Returns true if the value was changed.
  --- @overload fun(label: string, v_rad: float): float, bool
  --- @overload fun(label: string, v_rad: float, v_degrees_min: float): float, bool
  --- @overload fun(label: string, v_rad: float, v_degrees_min: float, v_degrees_max: float): float, bool
  --- @overload fun(label: string, v_rad: float, v_degrees_min: float, v_degrees_max: float, format: string): float, bool
  --- @overload fun(label: string, v_rad: float, v_degrees_min: float, v_degrees_max: float, format: string, flags: ImGuiSliderFlags): float, bool
  SliderAngle = function(label, v_rad, v_degrees_min, v_degrees_max, format, flags) end,
}
--- @class ImGui
--- Table containing functions for slider widgets that allow users to adjust integer and float values, both horizontally and vertically.

ImGui = {
  --- Creates an integer slider widget.
  --- @param label string The text to display next to the slider.
  --- @param value int The value to be adjusted by the slider.
  --- @param value_min int The minimum value of the slider.
  --- @param value_max int The maximum value of the slider.
  --- @param format? string Optional. Formatting string for the value display.
  --- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
  --- @return int value The updated value.
  --- @return bool used Returns true if the value was changed.
  --- @overload fun(label: string, value: int, value_min: int, value_max: int): int, bool
  --- @overload fun(label: string, value: int, value_min: int, value_max: int, format: string): int, bool
  --- @overload fun(label: string, value: int, value_min: int, value_max: int, format: string, flags: ImGuiSliderFlags): int, bool
  SliderInt = function(label, value, value_min, value_max, format, flags) end,

  --- Creates an integer2 slider widget.
  --- @param label string The text to display next to the sliders.
  --- @param values table A table with two integer values.
  --- @param value_min int The minimum value for each slider.
  --- @param value_max int The maximum value for each slider.
  --- @param format? string Optional. Formatting string for the values display.
  --- @param flags? ImGuiSliderFlags Optional. Flags to modify the sliders' behavior.
  --- @return table values The updated values.
  --- @return bool used Returns true if the values were changed.
  --- @overload fun(label: string, values: table, value_min: int, value_max: int): table, bool
  --- @overload fun(label: string, values: table, value_min: int, value_max: int, format: string): table, bool
  --- @overload fun(label: string, values: table, value_min: int, value_max: int, format: string, flags: ImGuiSliderFlags): table, bool
  SliderInt2 = function(label, values, value_min, value_max, format, flags) end,

  --- Creates an integer3 slider widget.
  --- @param label string The text to display next to the sliders.
  --- @param values table A table with three integer values.
  --- @param value_min int The minimum value for each slider.
  --- @param value_max int The maximum value for each slider.
  --- @param format? string Optional. Formatting string for the values display.
  --- @param flags? ImGuiSliderFlags Optional. Flags to modify the sliders' behavior.
  --- @return table values The updated values.
  --- @return bool used Returns true if the values were changed.
  --- @overload fun(label: string, values: table, value_min: int, value_max: int): table, bool
  --- @overload fun(label: string, values: table, value_min: int, value_max: int, format: string): table, bool
  --- @overload fun(label: string, values: table, value_min: int, value_max: int, format: string, flags: ImGuiSliderFlags): table, bool
  SliderInt3 = function(label, values, value_min, value_max, format, flags) end,

  --- Creates an integer4 slider widget.
  --- @param label string The text to display next to the sliders.
  --- @param values table A table with four integer values.
  --- @param value_min int The minimum value for each slider.
  --- @param value_max int The maximum value for each slider.
  --- @param format? string Optional. Formatting string for the values display.
  --- @param flags? ImGuiSliderFlags Optional. Flags to modify the sliders' behavior.
  --- @return table values The updated values.
  --- @return bool used Returns true if the values were changed.
  --- @overload fun(label: string, values: table, value_min: int, value_max: int): table, bool
  --- @overload fun(label: string, values: table, value_min: int, value_max: int, format: string): table, bool
  --- @overload fun(label: string, values: table, value_min: int, value_max: int, format: string, flags: ImGuiSliderFlags): table, bool
  SliderInt4 = function(label, values, value_min, value_max, format, flags) end,

  --- Creates a vertical float slider widget.
  --- @param label string The text to display next to the slider.
  --- @param size_x float The width of the slider.
  --- @param size_y float The height of the slider.
  --- @param value float The value to be adjusted by the slider.
  --- @param value_min float The minimum value of the slider.
  --- @param value_max float The maximum value of the slider.
  --- @param format? string Optional. Formatting string for the value display.
  --- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
  --- @return float value The updated value.
  --- @return bool used Returns true if the value was changed.
  --- @overload fun(label: string, size_x: float, size_y: float, value: float, value_min: float, value_max: float): float, bool
  --- @overload fun(label: string, size_x: float, size_y: float, value: float, value_min: float, value_max: float, format: string): float, bool
  --- @overload fun(label: string, size_x: float, size_y: float, value: float, value_min: float, value_max: float, format: string, flags: ImGuiSliderFlags): float, bool
  VSliderFloat = function(label, size_x, size_y, value, value_min, value_max, format, flags) end,

  --- Creates a vertical integer slider widget.
  --- @param label string The text to display next to the slider.
  --- @param size_x float The width of the slider.
  --- @param size_y float The height of the slider.
  --- @param value int The value to be adjusted by the slider.
  --- @param value_min int The minimum value of the slider.
  --- @param value_max int The maximum value of the slider.
  --- @param format? string Optional. Formatting string for the value display.
  --- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
  --- @return int value The updated value.
  --- @return bool used Returns true if the value was changed.
  --- @overload fun(label: string, size_x: float, size_y: float, value: int, value_min: int, value_max: int): int, bool
  --- @overload fun(label: string, size_x: float, size_y: float, value: int, value_min: int, value_max: int, format: string): int, bool
  --- @overload fun(label: string, size_x: float, size_y: float, value: int, value_min: int, value_max: int, format: string, flags: ImGuiSliderFlags): int, bool
  VSliderInt = function(label, size_x, size_y, value, value_min, value_max, format, flags) end,
}

--- @class ImGui
--- Table containing functions for input widgets that allow users to enter text and float values.
ImGui = {
  --- Creates an input text widget.
  --- @param label string The text to display next to the input.
  --- @param text string The text to be edited.
  --- @param buf_size int The size of the buffer for the input text.
  --- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
  --- @return string text The updated text.
  --- @return bool selected Returns true if the input text was selected.
  --- @overload fun(label: string, text: string, buf_size: int): string, bool
  --- @overload fun(label: string, text: string, buf_size: int, flags: ImGuiInputTextFlags): string, bool
  InputText = function(label, text, buf_size, flags) end,

  --- Creates a multiline input text widget.
  --- @param label string The text to display next to the input.
  --- @param text string The text to be edited.
  --- @param buf_size int The size of the buffer for the input text.
  --- @param size_x float The width of the input area.
  --- @param size_y float The height of the input area.
  --- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
  --- @return string text The updated text.
  --- @return bool selected Returns true if the input text was selected.
  --- @overload fun(label: string, text: string, buf_size: int): string, bool
  --- @overload fun(label: string, text: string, buf_size: int, size_x: float, size_y: float): string, bool
  --- @overload fun(label: string, text: string, buf_size: int, size_x: float, size_y: float, flags: ImGuiInputTextFlags): string, bool
  InputTextMultiline = function(label, text, buf_size, size_x, size_y, flags) end,

  --- Creates an input text widget with a hint.
  --- @param label string The text to display next to the input.
  --- @param hint string The hint text displayed when the input is empty.
  --- @param text string The text to be edited.
  --- @param buf_size int The size of the buffer for the input text.
  --- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
  --- @return string text The updated text.
  --- @return bool selected Returns true if the input text was selected.
  --- @overload fun(label: string, hint: string, text: string, buf_size: int): string, bool
  --- @overload fun(label: string, hint: string, text: string, buf_size: int, flags: ImGuiInputTextFlags): string, bool
  InputTextWithHint = function(label, hint, text, buf_size, flags) end,

  --- Creates an input float widget.
  --- @param label string The text to display next to the input.
  --- @param value float The value to be edited.
  --- @param step? float Optional. Step size for incremental changes.
  --- @param step_fast? float Optional. Larger step size for rapid changes.
  --- @param format? string Optional. Formatting string for the value display.
  --- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
  --- @return float value The updated value.
  --- @return bool used Returns true if the value was changed.
  --- @overload fun(label: string, value: float): float, bool
  --- @overload fun(label: string, value: float, step: float): float, bool
  --- @overload fun(label: string, value: float, step: float, step_fast: float): float, bool
  --- @overload fun(label: string, value: float, step: float, step_fast: float, format: string): float, bool
  --- @overload fun(label: string, value: float, step: float, step_fast: float, format: string, flags: ImGuiInputTextFlags): float, bool
  InputFloat = function(label, value, step, step_fast, format, flags) end,
}

--- @class ImGui
ImGui = {
  --- Creates an input float widget for 2 values.
  --- @param label string The text to display next to the input.
  --- @param values table A table with two float values to be edited.
  --- @param format? string Optional. Formatting string for the values display.
  --- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
  --- @return table values The updated values.
  --- @return bool used Returns true if the values were changed.
  --- @overload fun(label: string, values: table): table, bool
  --- @overload fun(label: string, values: table, format: string): table, bool
  --- @overload fun(label: string, values: table, format: string, flags: ImGuiInputTextFlags): table, bool
  InputFloat2 = function(label, values, format, flags) end,

  --- Creates an input float widget for 3 values.
  --- @param label string The text to display next to the input.
  --- @param values table A table with three float values to be edited.
  --- @param format? string Optional. Formatting string for the values display.
  --- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
  --- @return table values The updated values.
  --- @return bool used Returns true if the values were changed.
  --- @overload fun(label: string, values: table): table, bool
  --- @overload fun(label: string, values: table, format: string): table, bool
  --- @overload fun(label: string, values: table, format: string, flags: ImGuiInputTextFlags): table, bool
  InputFloat3 = function(label, values, format, flags) end,

  --- Creates an input float widget for 4 values.
  --- @param label string The text to display next to the input.
  --- @param values table A table with four float values to be edited.
  --- @param format? string Optional. Formatting string for the values display.
  --- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
  --- @return table values The updated values.
  --- @return bool used Returns true if the values were changed.
  --- @overload fun(label: string, values: table): table, bool
  --- @overload fun(label: string, values: table, format: string): table, bool
  --- @overload fun(label: string, values: table, format: string, flags: ImGuiInputTextFlags): table, bool
  InputFloat4 = function(label, values, format, flags) end,

  --- Creates an input integer widget.
  --- @param label string The text to display next to the input.
  --- @param value int The value to be edited.
  --- @param step? int Optional. Step size for incremental changes.
  --- @param step_fast? int Optional. Larger step size for rapid changes.
  --- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
  --- @return int value The updated value.
  --- @return bool used Returns true if the value was changed.
  --- @overload fun(label: string, value: int): int, bool
  --- @overload fun(label: string, value: int, step: int): int, bool
  --- @overload fun(label: string, value: int, step: int, step_fast: int): int, bool
  --- @overload fun(label: string, value: int, step: int, step_fast: int, flags: ImGuiInputTextFlags): int, bool
  InputInt = function(label, value, step, step_fast, flags) end,
}


--- Creates an input integer widget for 2 values.
--- @param label string The text to display next to the input.
--- @param values table A table with two integer values to be edited.
--- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
--- @return table values The updated values.
--- @return bool used Returns true if the values were changed.
--- @overload fun(label: string, values: table): table, bool
--- @overload fun(label: string, values: table, flags: ImGuiInputTextFlags): table, bool
InputInt2 = function(label, values, flags) end,

--- Creates an input integer widget for 3 values.
--- @param label string The text to display next to the input.
--- @param values table A table with three integer values to be edited.
--- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
--- @return table values The updated values.
--- @return bool used Returns true if the values were changed.
--- @overload fun(label: string, values: table): table, bool
--- @overload fun(label: string, values: table, flags: ImGuiInputTextFlags): table, bool
InputInt3 = function(label, values, flags) end,

--- Creates an input integer widget for 4 values.
--- @param label string The text to display next to the input.
--- @param values table A table with four integer values to be edited.
--- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
--- @return table values The updated values.
--- @return bool used Returns true if the values were changed.
--- @overload fun(label: string, values: table): table, bool
--- @overload fun(label: string, values: table, flags: ImGuiInputTextFlags): table, bool
InputInt4 = function(label, values, flags) end,

--- Creates an input double widget.
--- @param label string The text to display next to the input.
--- @param value double The value to be edited.
--- @param step? double Optional. Step size for incremental changes.
--- @param step_fast? double Optional. Larger step size for rapid changes.
--- @param format? string Optional. Formatting string for the value display.
--- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
--- @return double value The updated value.
--- @return bool used Returns true if the value was changed.
--- @overload fun(label: string, value: double): double, bool
--- @overload fun(label: string, value: double, step: double): double, bool
--- @overload fun(label: string, value: double, step: double, step_fast: double): double, bool
--- @overload fun(label: string, value: double, step: double, step_fast: double, format: string): double, bool
--- @overload fun(label: string, value: double, step: double, step_fast: double, format: string, flags: ImGuiInputTextFlags): double, bool
InputDouble = function(label, value, step, step_fast, format, flags) end,



--- Creates a color editor widget for 3 values.
--- @param label string The text to display next to the color editor.
--- @param col table A table with three float values representing the color (RGB) to be edited.
--- @param flags? ImGuiColorEditFlags Optional. Flags to modify the color editor behavior.
--- @return table col The updated color values.
--- @return bool used Returns true if the color was changed.
--- @overload fun(label: string, col: table): table, bool
--- @overload fun(label: string, col: table, flags: ImGuiColorEditFlags): table, bool
ColorEdit3 = function(label, col, flags) end,

--- Creates a color editor widget for 4 values.
--- @param label string The text to display next to the color editor.
--- @param col table A table with four float values representing the color (RGBA) to be edited.
--- @param flags? ImGuiColorEditFlags Optional. Flags to modify the color editor behavior.
--- @return table col The updated color values.
--- @return bool used Returns true if the color was changed.
--- @overload fun(label: string, col: table): table, bool
--- @overload fun(label: string, col: table, flags: ImGuiColorEditFlags): table, bool
ColorEdit4 = function(label, col, flags) end,

--- Creates a color picker widget for 3 values.
--- @param label string The text to display next to the color picker.
--- @param col table A table with three float values representing the color (RGB) to be picked.
--- @param flags? ImGuiColorEditFlags Optional. Flags to modify the color picker behavior.
--- @return table col The updated color values.
--- @return bool used Returns true if the color was changed.
--- @overload fun(label: string, col: table): table, bool
--- @overload fun(label: string, col: table, flags: ImGuiColorEditFlags): table, bool
ColorPicker3 = function(label, col, flags) end,

--- Creates a color picker widget for 4 values.
--- @param label string The text to display next to the color picker.
--- @param col table A table with four float values representing the color (RGBA) to be picked.
--- @param flags? ImGuiColorEditFlags Optional. Flags to modify the color picker behavior.
--- @return table col The updated color values.
--- @return bool used Returns true if the color was changed.
--- @overload fun(label: string, col: table): table, bool
--- @overload fun(label: string, col: table, flags: ImGuiColorEditFlags): table, bool
ColorPicker4 = function(label, col, flags) end,

--- Creates a color button widget.
--- @param desc_id string Identifier for the button.
--- @param col table A table with four float values representing the color (RGBA) of the button.
--- @param flags? ImGuiColorEditFlags Optional. Flags to modify the color button behavior.
--- @param size_x? float Optional. Width of the button.
--- @param size_y? float Optional. Height of the button.
--- @return bool pressed Returns true if the button was pressed.
--- @overload fun(desc_id: string, col: table): bool
--- @overload fun(desc_id: string, col: table, flags: ImGuiColorEditFlags): bool
--- @overload fun(desc_id: string, col: table, flags: ImGuiColorEditFlags, size_x: float, size_y: float): bool
ColorButton = function(desc_id, col, flags, size_x, size_y) end,

--- Sets the global color edit options.
--- @param flags ImGuiColorEditFlags Flags to set for color editing options.
SetColorEditOptions = function(flags) end,


--- Creates a tree node widget.
--- @param label string The text to display for the tree node.
--- @param fmt? string Optional. Formatting string for the label.
--- @return bool open Returns true if the node is open.
--- @overload fun(label: string): bool
--- @overload fun(label: string, fmt: string): bool
TreeNode = function(label, fmt) end,

--- Creates a tree node widget with additional flags.
--- @param label string The text to display for the tree node.
--- @param flags? ImGuiTreeNodeFlags Optional. Flags to modify the tree node behavior.
--- @param fmt? string Optional. Formatting string for the label.
--- @return bool open Returns true if the node is open.
--- @overload fun(label: string): bool
--- @overload fun(label: string, flags: ImGuiTreeNodeFlags): bool
--- @overload fun(label: string, flags: ImGuiTreeNodeFlags, fmt: string): bool
TreeNodeEx = function(label, flags, fmt) end,

--- Pushes a new tree node identifier onto the stack.
--- @param str_id string The identifier for the tree node.
TreePush = function(str_id) end,

--- Pops the most recent tree node identifier off the stack.
TreePop = function() end,

--- Gets the spacing between the tree node and its label.
--- @return float spacing The spacing value.
GetTreeNodeToLabelSpacing = function() end,

--- Creates a collapsing header widget.
--- @param label string The text to display for the header.
--- @param flags? ImGuiTreeNodeFlags Optional. Flags to modify the header behavior.
--- @return bool notCollapsed Returns true if the header is not collapsed.
--- @overload fun(label: string): bool
--- @overload fun(label: string, flags: ImGuiTreeNodeFlags): bool
--- @overload fun(label: string, open: bool): bool, bool
--- @overload fun(label: string, open: bool, flags: ImGuiTreeNodeFlags): bool, bool
CollapsingHeader = function(label, open, flags) end,

--- Sets the open state for the next item.
--- @param open bool The state to set for the item (open or closed).
--- @param cond? ImGuiCond Optional. Condition to determine when to set the state.
--- @overload fun(open: bool): void
--- @overload fun(open: bool, cond: ImGuiCond): void
SetNextItemOpen = function(open, cond) end,


--- Creates a selectable widget.
--- @param label string The text to display for the selectable item.
--- @param selected? bool Optional. Indicates whether the item is selected.
--- @param flags? ImGuiSelectableFlags Optional. Flags to modify the selectable behavior.
--- @param size_x? float Optional. Width of the selectable item.
--- @param size_y? float Optional. Height of the selectable item.
--- @return bool selected Returns true if the item is selected.
--- @overload fun(label: string): bool
--- @overload fun(label: string, selected: bool): bool
--- @overload fun(label: string, selected: bool, flags: ImGuiSelectableFlags): bool
--- @overload fun(label: string, selected: bool, flags: ImGuiSelectableFlags, size_x: float, size_y: float): bool
Selectable = function(label, selected, flags, size_x, size_y) end,

--- Creates a list box widget.
--- @param label string The text to display for the list box.
--- @param current_item int The index of the currently selected item.
--- @param items table A table of strings representing the items in the list box.
--- @param items_count int The number of items in the list.
--- @param height_in_items? int Optional. The height of the list box in items.
--- @return int current_item The updated index of the currently selected item.
--- @return bool clicked Returns true if an item was clicked.
--- @overload fun(label: string, current_item: int, items: table, items_count: int): int, bool
--- @overload fun(label: string, current_item: int, items: table, items_count: int, height_in_items: int): int, bool
ListBox = function(label, current_item, items, items_count, height_in_items) end,

--- Begins a list box widget.
--- @param label string The text to display for the list box.
--- @param size_x? float Optional. The width of the list box.
--- @param size_y? float Optional. The height of the list box.
--- @return bool open Returns true if the list box is open.
--- @overload fun(label: string): bool
--- @overload fun(label: string, size_x: float, size_y: float): bool
BeginListBox = function(label, size_x, size_y) end,

--- Ends the current list box widget.
EndListBox = function() end,


--- Begins a menu bar.
--- @return bool shouldDraw Returns true if the menu bar should be drawn.
BeginMenuBar = function() end,

--- Ends the current menu bar.
EndMenuBar = function() end,

--- Begins a main menu bar.
--- @return bool shouldDraw Returns true if the main menu bar should be drawn.
BeginMainMenuBar = function() end,

--- Ends the current main menu bar.
EndMainMenuBar = function() end,

--- Begins a menu within a menu bar or main menu bar.
--- @param label string The text to display for the menu.
--- @param enabled? bool Optional. Indicates whether the menu is enabled.
--- @return bool shouldDraw Returns true if the menu should be drawn.
--- @overload fun(label: string): bool
--- @overload fun(label: string, enabled: bool): bool
BeginMenu = function(label, enabled) end,

--- Ends the current menu.
EndMenu = function() end,

--- Creates a menu item.
--- @param label string The text to display for the menu item.
--- @param shortcut? string Optional. The shortcut key for the menu item.
--- @param selected? bool Optional. Indicates whether the item is selected.
--- @param enabled? bool Optional. Indicates whether the item is enabled.
--- @return bool selected If selected is provided, returns the updated selection state.
--- @return bool activated Returns true if the menu item was activated.
--- @overload fun(label: string): bool
--- @overload fun(label: string, shortcut: string): bool
--- @overload fun(label: string, shortcut: string, selected: bool): bool, bool
--- @overload fun(label: string, shortcut: string, selected: bool, enabled: bool): bool, bool
MenuItem = function(label, shortcut, selected, enabled) end,

--- Begins a tooltip.
BeginTooltip = function() end,

--- Ends the current tooltip.
EndTooltip = function() end,

--- Sets the text for the tooltip.
--- @param fmt string The text to display in the tooltip.
SetTooltip = function(fmt) end,



--- Begins a popup.
--- @param str_id string The identifier for the popup.
--- @param flags? ImGuiWindowFlags Optional. Flags to modify the popup behavior.
--- @return bool open Returns true if the popup is open.
--- @overload fun(str_id: string): bool
--- @overload fun(str_id: string, flags: ImGuiWindowFlags): bool
BeginPopup = function(str_id, flags) end,

--- Begins a modal popup.
--- @param name string The name of the modal popup.
--- @param open? bool Optional. The initial state of the modal popup.
--- @param flags? ImGuiWindowFlags Optional. Flags to modify the modal popup behavior.
--- @return bool open Returns true if the modal popup is open.
--- @overload fun(name: string): bool
--- @overload fun(name: string, flags: ImGuiWindowFlags): bool
--- @overload fun(name: string, open: bool): bool
--- @overload fun(name: string, open: bool, flags: ImGuiWindowFlags): bool
BeginPopupModal = function(name, open, flags) end,

--- Ends the current popup.
EndPopup = function() end,

--- Opens a popup by its identifier.
--- @param str_id string The identifier for the popup.
--- @param popup_flags? ImGuiPopupFlags Optional. Flags to modify the popup behavior.
--- @overload fun(str_id: string): void
--- @overload fun(str_id: string, popup_flags: ImGuiPopupFlags): void
OpenPopup = function(str_id, popup_flags) end,

--- Opens a popup context menu for the current item.
--- @param str_id? string Optional. The identifier for the popup.
--- @param popup_flags? ImGuiPopupFlags Optional. Flags to modify the popup behavior.
--- @return bool open Returns true if the popup is open.
--- @overload fun(): bool
--- @overload fun(str_id: string): bool
--- @overload fun(str_id: string, popup_flags: ImGuiPopupFlags): bool
OpenPopupContextItem = function(str_id, popup_flags) end,

--- Closes the currently open popup.
CloseCurrentPopup = function() end,

--- Begins a popup context menu for the current item.
--- @param str_id? string Optional. The identifier for the popup.
--- @param popup_flags? ImGuiPopupFlags Optional. Flags to modify the popup behavior.
--- @return bool open Returns true if the popup is open.
--- @overload fun(): bool
--- @overload fun(str_id: string): bool
--- @overload fun(str_id: string, popup_flags: ImGuiPopupFlags): bool
BeginPopupContextItem = function(str_id, popup_flags) end,

--- Begins a popup context menu for the current window.
--- @param str_id? string Optional. The identifier for the popup.
--- @param popup_flags? ImGuiPopupFlags Optional. Flags to modify the popup behavior.
--- @return bool open Returns true if the popup is open.
--- @overload fun(): bool
--- @overload fun(str_id: string): bool
--- @overload fun(str_id: string, popup_flags: ImGuiPopupFlags): bool
BeginPopupContextWindow = function(str_id, popup_flags) end,

--- Begins a popup context menu for the whole screen (void).
--- @param str_id? string Optional. The identifier for the popup.
--- @param popup_flags? ImGuiPopupFlags Optional. Flags to modify the popup behavior.
--- @return bool open Returns true if the popup is open.
--- @overload fun(): bool
--- @overload fun(str_id: string): bool
--- @overload fun(str_id: string, popup_flags: ImGuiPopupFlags): bool
BeginPopupContextVoid = function(str_id, popup_flags) end,

--- Checks if a popup is currently open.
--- @param str_id string The identifier for the popup.
--- @param popup_flags? ImGuiPopupFlags Optional. Flags to modify the popup behavior.
--- @return bool Returns true if the popup is open.
--- @overload fun(str_id: string): bool
--- @overload fun(str_id: string, popup_flags: ImGuiPopupFlags): bool
IsPopupOpen = function(str_id, popup_flags) end,

--- Begins a table.
--- @param str_id string The identifier for the table.
--- @param column int The number of columns in the table.
--- @param flags? ImGuiTableFlags Optional. Flags to modify the table behavior.
--- @param outer_size_x? float Optional. The width of the table.
--- @param outer_size_y? float Optional. The height of the table.
--- @param inner_width? float Optional. The width of each column.
--- @return bool Returns true if the table was successfully created.
--- @overload fun(str_id: string, column: int): bool
--- @overload fun(str_id: string, column: int, flags: ImGuiTableFlags): bool
--- @overload fun(str_id: string, column: int, flags: ImGuiTableFlags, outer_size_x: float, outer_size_y: float): bool
--- @overload fun(str_id: string, column: int, flags: ImGuiTableFlags, outer_size_x: float, outer_size_y: float, inner_width: float): bool
BeginTable = function(str_id, column, flags, outer_size_x, outer_size_y, inner_width) end,

--- Ends the current table.
EndTable = function() end,

--- Moves to the next row in the table.
--- @param flags? ImGuiTableRowFlags Optional. Flags to modify the row behavior.
--- @param min_row_height? float Optional. The minimum height of the row.
--- @overload fun(): void
--- @overload fun(flags: ImGuiTableRowFlags): void
--- @overload fun(flags: ImGuiTableRowFlags, min_row_height: float): void
TableNextRow = function(flags, min_row_height) end,

--- Moves to the next column in the table.
--- @return bool visible Returns true if the column is visible.
TableNextColumn = function() end,

--- Moves to the specified column in the table.
--- @param column_n int The index of the column to move to.
--- @return bool visible Returns true if the column is visible.
TableSetColumnIndex = function(column_n) end,

--- Sets up a column in the table.
--- @param label string The label for the column.
--- @param flags? ImGuiTableColumnFlags Optional. Flags to modify the column behavior.
--- @param init_width_or_weight? float Optional. The initial width or weight of the column.
--- @param user_id? ImU32 Optional. A user-defined identifier for the column.
--- @overload fun(label: string): void
--- @overload fun(label: string, flags: ImGuiTableColumnFlags): void
--- @overload fun(label: string, flags: ImGuiTableColumnFlags, init_width_or_weight: float): void
--- @overload fun(label: string, flags: ImGuiTableColumnFlags, init_width_or_weight: float, user_id: ImU32): void
TableSetupColumn = function(label, flags, init_width_or_weight, user_id) end,


--- Sets up scroll freeze for the table, locking columns and rows to remain visible when scrolling.
--- @param cols int The number of columns to lock.
--- @param rows int The number of rows to lock.
TableSetupScrollFreeze = function(cols, rows) end,

--- Submits all header cells based on the data provided to TableSetupColumn().
TableHeadersRow = function() end,

--- Submits one header cell manually. This is rarely used.
--- @param label string The label for the header cell.
TableHeader = function(label) end,

--- Gets the latest sort specifications for the table.
--- @return ImGuiTableSortSpecs* The sort specifications, or NULL if not sorting.
TableGetSortSpecs = function() end,

--- Returns the number of columns in the table.
--- @return int The number of columns.
TableGetColumnCount = function() end,

--- Returns the current column index.
--- @return int The current column index.
TableGetColumnIndex = function() end,

--- Returns the current row index.
--- @return int The current row index.
TableGetRowIndex = function() end,

--- Returns the name of a column, or an empty string if the column does not have a name declared by TableSetupColumn(). 
--- Pass -1 to use the current column.
--- @param column_n? int Optional. The index of the column to query.
--- @return string The name of the column.
--- @overload fun(): string
--- @overload fun(column_n: int): string
TableGetColumnName = function(column_n) end,

--- Returns the flags of a column, allowing you to query its Enabled/Visible/Sorted/Hovered status. 
--- Pass -1 to use the current column.
--- @param column_n? int Optional. The index of the column to query.
--- @return ImGuiTableColumnFlags The flags of the column.
--- @overload fun(): ImGuiTableColumnFlags
--- @overload fun(column_n: int): ImGuiTableColumnFlags
TableGetColumnFlags = function(column_n) end,

--- Sets the background color for a cell, row, or column. 
--- See ImGuiTableBgTarget_ flags for details on the target.
--- @param target ImGuiTableBgTarget The target to change the background color for.
--- @param color ImU32 The color to set in hexadecimal.
--- @param column_n? int Optional. The index of the column to set the color for.
--- @overload fun(target: ImGuiTableBgTarget, color: ImU32): void
--- @overload fun(target: ImGuiTableBgTarget, color: float, color: float, color: float, color: float): void
--- @overload fun(target: ImGuiTableBgTarget, color: float, color: float, color: float, color: float, column_n: int): void
TableSetBgColor = function(target, color, column_n) end,


--- NOTE  say tables preferred
--- Begins a new column layout with the specified number of columns and options.
--- @param count? int Optional. The number of columns to create.
--- @param id? string Optional. The unique identifier for the column layout.
--- @param border? bool Optional. Whether to show borders between columns.
--- @overload fun(): void
--- @overload fun(count: int): void
--- @overload fun(count: int, id: string): void
--- @overload fun(count: int, id: string, border: bool): void
Columns = function(count, id, border) end,

--- Moves the cursor to the next column in the layout.
NextColumn = function() end,

--- Gets the index of the current column.
--- @return int The index of the current column.
GetColumnIndex = function() end,

--- Gets the width of a specific column, or the current column if no index is provided.
--- @param column_index? int Optional. The index of the column to query.
--- @return float The width of the column.
--- @overload fun(): float
--- @overload fun(column_index: int): float
GetColumnWidth = function(column_index) end,

--- Sets the width of a specific column.
--- @param column_index int The index of the column to modify.
--- @param width float The new width of the column.
SetColumnWidth = function(column_index, width) end,

--- Gets the offset of a specific column, or the current column if no index is provided.
--- @param column_index? int Optional. The index of the column to query.
--- @return float The offset of the column.
--- @overload fun(): float
--- @overload fun(column_index: int): float
GetColumnOffset = function(column_index) end,

--- Sets the offset of a specific column.
--- @param column_index int The index of the column to modify.
--- @param offset float The new offset of the column.
SetColumnOffset = function(column_index, offset) end,

--- Gets the number of columns in the current layout.
--- @return int The number of columns.
GetColumnsCount = function() end,



--- Begins a new tab bar.
--- @param str_id string The unique identifier for the tab bar.
--- @param flags? ImGuiTabBarFlags Optional. Flags to modify the tab bar behavior.
--- @return bool open Returns true if the tab bar is open.
--- @overload fun(str_id: string): bool
--- @overload fun(str_id: string, flags: ImGuiTabBarFlags): bool
BeginTabBar = function(str_id, flags) end,

--- Ends the current tab bar.
EndTabBar = function() end,

--- Begins a new tab item.
--- @param label string The label of the tab item.
--- @param flags? ImGuiTabItemFlags Optional. Flags to modify the tab item behavior.
--- @return bool selected Returns true if the tab item is selected.
--- @overload fun(label: string): bool
--- @overload fun(label: string, flags: ImGuiTabItemFlags): bool
--- @overload fun(label: string, open: bool): bool, bool
--- @overload fun(label: string, open: bool, flags: ImGuiTabItemFlags): bool, bool
BeginTabItem = function(label, open, flags) end,

--- Ends the current tab item.
EndTabItem = function() end,

--- Closes a tab item or docked window.
--- @param tab_or_docked_window_label string The label of the tab or docked window to close.
SetTabItemClosed = function(tab_or_docked_window_label) end,


--- Begins a disabled block of UI elements.
--- @param disabled? bool Optional. If true, the UI elements within will be disabled.
BeginDisabled = function(disabled) end,

--- Ends the disabled block of UI elements.
EndDisabled = function() end,


--- Sets a clipping rectangle for drawing operations.
--- @param min_x float The minimum X coordinate of the clipping rectangle.
--- @param min_y float The minimum Y coordinate of the clipping rectangle.
--- @param max_x float The maximum X coordinate of the clipping rectangle.
--- @param max_y float The maximum Y coordinate of the clipping rectangle.
--- @param intersect_current? bool Optional. If true, intersects the clipping rectangle with the current clipping rectangle.
PushClipRect = function(min_x, min_y, max_x, max_y, intersect_current) end,

--- Restores the previous clipping rectangle.
PopClipRect = function() end,


--- Sets the default focus to the current item.
SetItemDefaultFocus = function() end,

--- Sets keyboard focus to the item with an optional offset from the current item.
--- @param offset? int Optional. The offset from the current item to set focus on.
SetKeyboardFocusHere = function(offset) end,


--- Checks if the last item is being hovered.
--- @param flags? ImGuiHoveredFlags Optional. Flags to modify the hover checking behavior.
--- @return bool hovered Returns true if the item is being hovered.
IsItemHovered = function(flags) end,

--- Checks if the last item is active.
--- @return bool active Returns true if the item is active.
IsItemActive = function() end,

--- Checks if the last item is focused.
--- @return bool focused Returns true if the item is focused.
IsItemFocused = function() end,

--- Checks if the last item was clicked.
--- @param mouse_button? ImGuiMouseButton Optional. The mouse button to check for clicks.
--- @return bool clicked Returns true if the item was clicked.
IsItemClicked = function(mouse_button) end,

--- Checks if the last item is visible.
--- @return bool visible Returns true if the item is visible.
IsItemVisible = function() end,

--- Checks if the last item was edited.
--- @return bool edited Returns true if the item was edited.
IsItemEdited = function() end,

--- Checks if the last item was activated.
--- @return bool activated Returns true if the item was activated.
IsItemActivated = function() end,

--- Checks if the last item was deactivated.
--- @return bool deactivated Returns true if the item was deactivated.
IsItemDeactivated = function() end,



--- Checks if the last item was deactivated after an edit.
--- @return bool deactivated_after_edit Returns true if the item was deactivated after editing.
IsItemDeactivatedAfterEdit = function() end,

--- Checks if the last item was toggled open (e.g., a tree node or a collapsing header).
--- @return bool toggled_open Returns true if the item was toggled open.
IsItemToggledOpen = function() end,

--- Checks if any item is being hovered.
--- @return bool any_item_hovered Returns true if any item is being hovered.
IsAnyItemHovered = function() end,

--- Checks if any item is active.
--- @return bool any_item_active Returns true if any item is active.
IsAnyItemActive = function() end,

--- Checks if any item is focused.
--- @return bool any_item_focused Returns true if any item is focused.
IsAnyItemFocused = function() end,

--- Gets the minimum corner of the last item’s bounding rectangle.
--- @return float x, float y The x and y coordinates of the minimum corner.
GetItemRectMin = function() end,

--- Gets the maximum corner of the last item’s bounding rectangle.
--- @return float x, float y The x and y coordinates of the maximum corner.
GetItemRectMax = function() end,

--- Gets the size of the last item’s bounding rectangle.
--- @return float x, float y The width and height of the rectangle.
GetItemRectSize = function() end,

--- Allows the last item to overlap with other items.
SetItemAllowOverlap = function() end,


--- Checks if a rectangle is visible within the current clipping rectangle.
--- @param size_x float Width of the rectangle.
--- @param size_y float Height of the rectangle.
--- @return bool visible Returns true if the rectangle is visible.
IsRectVisible = function(size_x, size_y) end,

--- Checks if a rectangle defined by min and max coordinates is visible within the current clipping rectangle.
--- @param min_x float Minimum x coordinate.
--- @param min_y float Minimum y coordinate.
--- @param max_x float Maximum x coordinate.
--- @param max_y float Maximum y coordinate.
--- @return bool visible Returns true if the rectangle is visible.
IsRectVisible = function(min_x, min_y, max_x, max_y) end,

--- Gets the time since the ImGui context was created.
--- @return double time Returns the current time in seconds.
GetTime = function() end,

--- Gets the number of frames rendered since the ImGui context was created.
--- @return int frame_count Returns the frame count.
GetFrameCount = function() end,

--- Gets the name of a style color.
--- @param idx ImGuiCol Index of the style color.
--- @return string style_color_name Returns the name of the style color.
GetStyleColorName = function(idx) end,

--- Begins a child frame with its own background and clipping rectangle.
--- @param id unsigned int Unique ID of the child frame.
--- @param size_x float Width of the child frame.
--- @param size_y float Height of the child frame.
--- @param flags ImGuiWindowFlags Optional window flags.
--- @return bool open Returns true if the child frame is open.
BeginChildFrame = function(id, size_x, size_y, flags) end,

--- Ends the child frame started with BeginChildFrame().
EndChildFrame = function() end,


--- Calculates the size of the given text, including optional wrapping and text hiding.
--- @param text string The text to measure.
--- @param hide_text_after_double_hash bool Optional. If true, the function will ignore any text after a double hash (##) in the provided text.
--- @param wrap_width float Optional. If greater than 0, the function will wrap the text at this width.
--- @return float x Width of the text.
--- @return float y Height of the text.
CalcTextSize = function(text, hide_text_after_double_hash, wrap_width) end,

--- Converts RGB color values to HSV color values.
--- @param r float Red component (0.0 to 1.0)
--- @param g float Green component (0.0 to 1.0)
--- @param b float Blue component (0.0 to 1.0)
--- @return float h Hue component (0.0 to 1.0)
--- @return float s Saturation component (0.0 to 1.0)
--- @return float v Value (Brightness) component (0.0 to 1.0)
ColorConvertRGBtoHSV = function(r, g, b) end,

--- Converts HSV color values to RGB color values.
--- @param h float Hue component (0.0 to 1.0)
--- @param s float Saturation component (0.0 to 1.0)
--- @param v float Value (Brightness) component (0.0 to 1.0)
--- @return float r Red component (0.0 to 1.0)
--- @return float g Green component (0.0 to 1.0)
--- @return float b Blue component (0.0 to 1.0)
ColorConvertHSVtoRGB = function(h, s, v) end,

--- Converts a 32-bit color value to a normalized floating-point color value.
--- @param color_u32 int 32-bit color value (usually in ARGB format)
--- @return float[] color_f4 Array of 4 floats representing normalized color values {r, g, b, a}
ColorConvertU32ToFloat4 = function(color_u32) end,

--- Converts a normalized floating-point color value to a 32-bit color value.
--- @param color_f4 float[] Array of 4 floats representing normalized color values {r, g, b, a}
--- @return int color_u32 32-bit color value (usually in ARGB format)
ColorConvertFloat4ToU32 = function(color_f4) end,


--- Checks if a specific mouse button was clicked.
--- @param button ImGuiMouseButton Mouse button identifier
--- @param repeat bool Whether to detect repeated clicks
--- @return bool clicked True if the button was clicked
IsMouseClicked = function(button, repeat) end,

--- Checks if a specific mouse button was double-clicked.
--- @param button ImGuiMouseButton Mouse button identifier
--- @return bool clicked True if the button was double-clicked
IsMouseDoubleClicked = function(button) end,

--- Checks if the mouse is hovering over a specified rectangle.
--- @param min_x float Minimum x-coordinate of the rectangle
--- @param min_y float Minimum y-coordinate of the rectangle
--- @param max_x float Maximum x-coordinate of the rectangle
--- @param max_y float Maximum y-coordinate of the rectangle
--- @param clip bool Whether to clip the rectangle within the current clipping rectangle
--- @return bool hovered True if the mouse is hovering over the rectangle
IsMouseHoveringRect = function(min_x, min_y, max_x, max_y, clip) end,

--- Gets the current mouse position.
--- @return float x X-coordinate of the mouse position
--- @return float y Y-coordinate of the mouse position
GetMousePos = function() end,

--- Gets the mouse position when the current popup was opened.
--- @return float x X-coordinate of the mouse position
--- @return float y Y-coordinate of the mouse position
GetMousePosOnOpeningCurrentPopup = function() end,


--- Checks if the mouse is currently dragging with a specific button.
--- @param button ImGuiMouseButton Mouse button identifier
--- @param lock_threshold float Minimum distance before dragging starts
--- @return bool dragging True if the mouse is dragging
IsMouseDragging = function(button, lock_threshold) end,

--- Gets the delta of the mouse drag with a specific button.
--- @param button ImGuiMouseButton Mouse button identifier
--- @param lock_threshold float Minimum distance before dragging starts
--- @return float x Delta in the x-direction
--- @return float y Delta in the y-direction
GetMouseDragDelta = function(button, lock_threshold) end,

--- Resets the mouse drag delta for a specific button.
--- @param button ImGuiMouseButton Mouse button identifier
ResetMouseDragDelta = function(button) end,





  -- ImGuiKey
  -- ImGuiKey.None
  -- ImGuiKey.Tab
  -- ImGuiKey.LeftArrow
  -- ImGuiKey.RightArrow
  -- You get the idea, just check the source

  -- ImGuiKeyMod
  -- ImGuiKeyMod.None
  -- ImGuiKeyMod.Ctrl
  -- ImGuiKeyMod.Shift
  -- ImGuiKeyMod.Alt
  -- ImGuiKeyMod.Super
  -- ImGuiKeyMod.Shortcut
  -- ImGuiKeyMod.Mask_


--- Checks if a key or key mod is currently pressed.
--- @param key ImGuiKey or ImGuiKeyMod Key or key mod identifier
--- @return bool pressed True if the key or key mod is pressed
IsKeyDown = function(key) end,

--- Checks if a key or key mod was pressed (i.e., down for this frame).
--- @param key ImGuiKey or ImGuiKeyMod Key or key mod identifier
--- @param repeat bool Whether to consider repeated presses
--- @return bool pressed True if the key or key mod was pressed
IsKeyPressed = function(key, repeat) end,

--- Checks if a key or key mod was released (i.e., up for this frame).
--- @param key ImGuiKey or ImGuiKeyMod Key or key mod identifier
--- @return bool released True if the key or key mod was released
IsKeyReleased = function(key) end,


--- Creates a hotkey input widget.
--- @param label string The label for the hotkey input
--- @param current_hotkey integer The current hotkey value (virtual key code)
--- @param size ImVec2 Optional size of the widget
--- @return bool value_changed True if the hotkey value was changed
--- @return integer vk_key_number The new virtual key code
Hotkey = function(label, current_hotkey, size) end,

--- Gets the number of key presses within a given period.
--- @param key ImGuiKey or ImGuiKeyMod Key or key mod identifier
--- @param repeat_delay float Delay before key repeat starts
--- @param repeat_rate float Rate of key repeat
--- @return int Number of key presses
GetKeyPressedAmount = function(key, repeat_delay, repeat_rate) end,

--- Gets the name of a key or key mod.
--- @param key ImGuiKey or ImGuiKeyMod Key or key mod identifier
--- @return string Name of the key or key mod
GetKeyName = function(key) end,

--- Sets whether the next frame should capture keyboard input.
--- @param want_to_capture_keyboard bool Whether to capture keyboard input
SetNextFrameWantCaptureKeyboard = function(want_to_capture_keyboard) end,

--- Pushes a setting to allow or disallow keyboard focus.
--- @param tab_stop bool Whether to allow keyboard focus
PushAllowKeyboardFocus = function(tab_stop) end,

--- Pops the previously set keyboard focus setting.
PopAllowKeyboardFocus = function() end,

--- Sets keyboard focus to the widget at the given offset.
--- @param offset int Offset from the current widget
SetKeyboardFocusHere = function(offset) end,


--- Gets the current text from the clipboard.
--- @return string text The clipboard text
GetClipboardText = function() end,

--- Sets the given text to the clipboard.
--- @param text string The text to set to the clipboard
SetClipboardText = function(text) end,





































-- NOTE: breaks all type hints below it
-- --- @class _ENV 
-- --- @field _PLUGIN.guid string Path to the mod folder inside config.
-- --- @field _PLUGIN.plugins_data_mod_folder_path string Path to the mod folder inside plugins_data.
-- --- @field _PLUGIN.plugins_mod_folder_path string Path to the mod folder inside plugins.
-- --- @field _PLUGIN.this unknown This module.
-- --- Plugin-specific global table.
-- --- Can be accessed with `!` shortcut instead of `_PLUGIN`
-- _ENV = {}
