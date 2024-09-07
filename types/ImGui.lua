--- @meta

--- @module "a"

--- @class ImGui
--- Table containing functions for handling ImGui windows and utilities.
ImGui = {
	--- Displays a demo window with example ImGui widgets.
	ShowDemoWindow = function() end,

	--- Begins a new ImGui window.
	--- @param text string Name of the window.
	--- @param open? boolean Optional. Boolean flag indicating whether the window should be open.
	--- @param flags? ImGuiWindowFlags Optional. Window flags for customization.
	--- @return boolean shouldDraw Whether the window should be drawn.
	--- @return boolean? open Optional. Updated open state of the window.
	--- @return boolean? shouldDraw Optional. Whether the window should be drawn.
	--- @overload fun(text: string): boolean
	--- @overload fun(text: string, flags: ImGuiWindowFlags): boolean
	--- @overload fun(text: string, open: boolean): boolean, boolean
	--- @overload fun(text: string, open: boolean, flags: ImGuiWindowFlags): boolean, boolean
	Begin = function(text, open, flags) end,

	--- Ends the current ImGui window.
	End = function() end,

	--- Begins a child window.
	--- @param text string Name of the child window.
	--- @param size_x? number Optional. Width of the child window.
	--- @param size_y? number Optional. Height of the child window.
	--- @param border? boolean Optional. Whether to draw a border around the child window.
	--- @param flags? ImGuiWindowFlags Optional. Window flags for customization.
	--- @return boolean shouldDraw Whether the child window should be drawn.
	--- @overload fun(text: string): boolean
	--- @overload fun(text: string, size_x: number): boolean
	--- @overload fun(text: string, size_x: number, size_y: number): boolean
	--- @overload fun(text: string, size_x: number, size_y: number, border: boolean): boolean
	--- @overload fun(text: string, size_x: number, size_y: number, border: boolean, flags: ImGuiWindowFlags): boolean
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
	--- @param flags? ImGuiFocusedFlags Optional. Flags to specify focus criteria.
	--- @return boolean focused Whether the window is focused.
	--- @overload fun(): boolean
	--- @overload fun(flags: ImGuiFocusedFlags): boolean
	IsWindowFocused = function(flags) end,

	--- Checks if the current window is hovered.
	--- @param flags? ImGuiHoveredFlags Optional. Flags to specify hover criteria.
	--- @return boolean hovered Whether the window is hovered.
	--- @overload fun(): boolean
	--- @overload fun(flags: ImGuiHoveredFlags): boolean
	IsWindowHovered = function(flags) end,

	--- Gets the DPI scale of the current window.
	--- @return number dpiScale The DPI scale of the window.
	GetWindowDpiScale = function() end,

	--- Gets the position of the current window.
	--- @return number pos_x The x-coordinate of the window's position.
	--- @return number pos_y The y-coordinate of the window's position.
	GetWindowPos = function() end,

	--- Gets the size of the current window.
	--- @return number size_x The width of the window.
	--- @return number size_y The height of the window.
	GetWindowSize = function() end,

	--- Gets the width of the current window.
	--- @return number width The width of the window.
	GetWindowWidth = function() end,

	--- Gets the height of the current window.
	--- @return number height The height of the window.
	GetWindowHeight = function() end,

	--- Sets the position of the next window to be created.
	--- @param pos_x number X-coordinate for the position.
	--- @param pos_y number Y-coordinate for the position.
	--- @param cond? ImGuiCond Optional. Condition for setting the position.
	--- @param pivot_x? number Optional. X-coordinate of the pivot point.
	--- @param pivot_y? number Optional. Y-coordinate of the pivot point.
	--- @overload fun(pos_x: number, pos_y: number): nil
	--- @overload fun(pos_x: number, pos_y: number, cond: ImGuiCond): nil
	--- @overload fun(pos_x: number, pos_y: number, cond: ImGuiCond, pivot_x: number, pivot_y: number): nil
	SetNextWindowPos = function(pos_x, pos_y, cond, pivot_x, pivot_y) end,

	--- Sets the size of the next window to be created.
	--- @param size_x number Width for the size.
	--- @param size_y number Height for the size.
	--- @param cond? ImGuiCond Optional. Condition for setting the size.
	--- @overload fun(size_x: number, size_y: number): nil
	--- @overload fun(size_x: number, size_y: number, cond: ImGuiCond): nil
	SetNextWindowSize = function(size_x, size_y, cond) end,

	--- Sets the size constraints for the next window to be created.
	--- @param min_x number Minimum width.
	--- @param min_y number Minimum height.
	--- @param max_x number Maximum width.
	--- @param max_y number Maximum height.
	SetNextWindowSizeConstraints = function(min_x, min_y, max_x, max_y) end,

	--- Sets the content size for the next window to be created.
	--- @param size_x number Width of the content size.
	--- @param size_y number Height of the content size.
	SetNextWindowContentSize = function(size_x, size_y) end,

	--- Sets the collapsed state for the next window to be created.
	--- @param collapsed boolean Whether the window should be collapsed.
	--- @param cond? ImGuiCond Optional. Condition for setting the collapsed state.
	--- @overload fun(collapsed: boolean): nil
	--- @overload fun(collapsed: boolean, cond: ImGuiCond): nil
	SetNextWindowCollapsed = function(collapsed, cond) end,

	--- Sets the next window to be focused.
	SetNextWindowFocus = function() end,

	--- Sets the background alpha of the next window to be created.
	--- @param alpha number Alpha value for the window background.
	SetNextWindowBgAlpha = function(alpha) end,

	--- Sets the position of the current window.
	--- @param pos_x number X-coordinate for the position.
	--- @param pos_y number Y-coordinate for the position.
	--- @param cond? ImGuiCond Optional. Condition for setting the position.
	--- @overload fun(pos_x: number, pos_y: number): nil
	--- @overload fun(pos_x: number, pos_y: number, cond: ImGuiCond): nil
	SetWindowPos = function(pos_x, pos_y, cond) end,

	--- Sets the size of the current window.
	--- @param size_x number Width for the size.
	--- @param size_y number Height for the size.
	--- @param cond? ImGuiCond Optional. Condition for setting the size.
	--- @overload fun(size_x: number, size_y: number): nil
	--- @overload fun(size_x: number, size_y: number, cond: ImGuiCond): nil
	SetWindowSize = function(size_x, size_y, cond) end,

	--- Sets the collapsed state of the current window.
	--- @param collapsed boolean Whether the window should be collapsed.
	--- @param cond? ImGuiCond Optional. Condition for setting the collapsed state.
	--- @overload fun(collapsed: boolean): nil
	--- @overload fun(collapsed: boolean, cond: ImGuiCond): nil
	SetWindowCollapsed = function(collapsed, cond) end,

	--- Sets focus to the current window.
	SetWindowFocus = function() end,

	--- Sets the font scale of the current window.
	--- @param scale number Scale factor for the font.
	SetWindowFontScale = function(scale) end,

	--- Gets the maximum content region size.
	--- @return number x The maximum x-coordinate of the content region.
	--- @return number y The maximum y-coordinate of the content region.
	GetContentRegionMax = function() end,

	--- Gets the available content region size.
	--- @return number x The available x-coordinate of the content region.
	--- @return number y The available y-coordinate of the content region.
	GetContentRegionAvail = function() end,

	--- Gets the minimum content region coordinates within the current window.
	--- @return number x The minimum x-coordinate of the content region.
	--- @return number y The minimum y-coordinate of the content region.
	GetWindowContentRegionMin = function() end,

	--- Gets the maximum content region coordinates within the current window.
	--- @return number x The maximum x-coordinate of the content region.
	--- @return number y The maximum y-coordinate of the content region.
	GetWindowContentRegionMax = function() end,

	--- Gets the width of the content region within the current window.
	--- @return number width The width of the content region.
	GetWindowContentRegionWidth = function() end,

	--- Gets the current horizontal scroll position.
	--- @return number x The current horizontal scroll position.
	GetScrollX = function() end,

	--- Gets the current vertical scroll position.
	--- @return number y The current vertical scroll position.
	GetScrollY = function() end,

	--- Gets the maximum horizontal scroll position.
	--- @return number x The maximum horizontal scroll position.
	GetScrollMaxX = function() end,

	--- Gets the maximum vertical scroll position.
	--- @return number y The maximum vertical scroll position.
	GetScrollMaxY = function() end,

	--- Sets the horizontal scroll position.
	--- @param scroll_x number The new horizontal scroll position.
	SetScrollX = function(scroll_x) end,

	--- Sets the vertical scroll position.
	--- @param scroll_y number The new vertical scroll position.
	SetScrollY = function(scroll_y) end,

	--- Sets the horizontal scroll position relative to the content width.
	--- @param center_x_ratio? number Optional. Ratio of the center of the scroll area (0.0 to 1.0).
	--- @overload fun(): nil
	--- @overload fun(center_x_ratio: number): nil
	SetScrollHereX = function(center_x_ratio) end,

	--- Sets the vertical scroll position relative to the content height.
	--- @param center_y_ratio? number Optional. Ratio of the center of the scroll area (0.0 to 1.0).
	--- @overload fun(): nil
	--- @overload fun(center_y_ratio: number): nil
	SetScrollHereY = function(center_y_ratio) end,

	--- Sets the horizontal scroll position based on a local position.
	--- @param local_x number The local x-coordinate within the scrollable area.
	--- @param center_x_ratio? number Optional. Ratio of the center of the scroll area (0.0 to 1.0).
	--- @overload fun(local_x: number): nil
	--- @overload fun(local_x: number, center_x_ratio: number): nil
	SetScrollFromPosX = function(local_x, center_x_ratio) end,

	--- Sets the vertical scroll position based on a local position.
	--- @param local_y number The local y-coordinate within the scrollable area.
	--- @param center_y_ratio? number Optional. Ratio of the center of the scroll area (0.0 to 1.0).
	--- @overload fun(local_y: number): nil
	--- @overload fun(local_y: number, center_y_ratio: number): nil
	SetScrollFromPosY = function(local_y, center_y_ratio) end,

	--- Pushes a new style color onto the stack.
	--- @param idx ImGuiCol The style color index.
	--- @param color_u32 integer The color as a 32-bit unsigned integer.
	--- @overload fun(idx: ImGuiCol, color_r: number, color_g: number, color_b: number, color_a: number): nil
	PushStyleColor = function(idx, color_u32) end,

	--- Pops the last style color off the stack.
	--- @param count? integer Optional. Number of colors to pop.
	--- @overload fun(): nil
	PopStyleColor = function(count) end,

	--- Pushes a new style variable onto the stack.
	--- @param idx ImGuiStyleVar The style variable index.
	--- @param value number The style variable value.
	--- @overload fun(idx: ImGuiStyleVar, value_x: number, value_y: number): nil
	PushStyleVar = function(idx, value) end,

	--- Pops the last style variable off the stack.
	--- @param count? integer Optional. Number of style variables to pop.
	--- @overload fun(): nil
	PopStyleVar = function(count) end,

	--- Gets the color vector for a style color.
	--- @param idx ImGuiCol The style color index.
	--- @return number color_r The red component of the color.
	--- @return number color_g The green component of the color.
	--- @return number color_b The blue component of the color.
	--- @return number color_a The alpha component of the color.
	GetStyleColorVec4 = function(idx) end,

	--- Gets the current font size.
	--- @return number fontSize The current font size.
	GetFontSize = function() end,

	--- Gets the UV coordinates of the white pixel in the font texture.
	--- @return number x The x-coordinate of the UV coordinates.
	--- @return number y The y-coordinate of the UV coordinates.
	GetFontTexUvWhitePixel = function() end,

	--- Gets the color as a 32-bit unsigned integer.
	--- @param idx? ImGuiCol Optional. The style color index.
	--- @param alphaMultiplier? number Optional. The alpha multiplier.
	--- @overload fun(color_r: number, color_g: number, color_b: number, color_a: number): integer
	--- @return integer color_u32 The color as a 32-bit unsigned integer.
	GetColorU32 = function(idx, alphaMultiplier) end,

	--- Pushes a new item width onto the stack.
	--- @param width number The item width.
	PushItemWidth = function(width) end,

	--- Pops the last item width off the stack.
	PopItemWidth = function() end,

	--- Sets the width for the next item.
	--- @param width number The item width.
	SetNextItemWidth = function(width) end,

	--- Calculates the width of the current item.
	--- @return number width The width of the current item.
	CalcItemWidth = function() end,

	--- Pushes a new text wrap position onto the stack.
	--- @param wrap_local_pos_x? number Optional. The wrap position in local x-coordinate.
	--- @overload fun(): nil
	PushTextWrapPos = function(wrap_local_pos_x) end,

	--- Pops the last text wrap position off the stack.
	PopTextWrapPos = function() end,

	--- Pushes a new keyboard focus setting onto the stack.
	--- @param allow_keyboard_focus boolean Whether keyboard focus is allowed.
	PushAllowKeyboardFocus = function(allow_keyboard_focus) end,

	--- Pops the last keyboard focus setting off the stack.
	PopAllowKeyboardFocus = function() end,

	--- Pushes a new button repeat setting onto the stack.
	--- @param repeats boolean Whether button repeat is allowed.
	PushButtonRepeat = function(repeats) end,

	--- Pops the last button repeat setting off the stack.
	PopButtonRepeat = function() end,

	--- Adds a horizontal separator line.
	Separator = function() end,

	--- Positions the cursor on the same line as the previous item.
	--- @param offset_from_start_x? number Optional. Offset from the start of the line.
	--- @param spacing? number Optional. Spacing to add after the item.
	--- @overload fun(): nil
	--- @overload fun(offset_from_start_x: number): nil
	--- @overload fun(offset_from_start_x: number, spacing: number): nil
	SameLine = function(offset_from_start_x, spacing) end,

	--- Adds a new line in the layout.
	NewLine = function() end,

	--- Adds spacing to the layout.
	Spacing = function() end,

	--- Adds a dummy item to the layout.
	--- @param size_x number The width of the dummy item.
	--- @param size_y number The height of the dummy item.
	Dummy = function(size_x, size_y) end,

	--- Increases the indentation of the layout.
	--- @param indent_w? number Optional. The amount to indent.
	--- @overload fun(): nil
	--- @overload fun(indent_w: number): nil
	Indent = function(indent_w) end,

	--- Decreases the indentation of the layout.
	--- @param indent_w? number Optional. The amount to un-indent.
	--- @overload fun(): nil
	--- @overload fun(indent_w: number): nil
	Unindent = function(indent_w) end,

	--- Begins a new group for layout management.
	BeginGroup = function() end,

	--- Ends the current group for layout management.
	EndGroup = function() end,

	--- Gets the current cursor position.
	--- @return number x The x-coordinate of the cursor position.
	--- @return number y The y-coordinate of the cursor position.
	GetCursorPos = function() end,

	--- Gets the current x-coordinate of the cursor position.
	--- @return number x The x-coordinate of the cursor position.
	GetCursorPosX = function() end,

	--- Gets the current y-coordinate of the cursor position.
	--- @return number y The y-coordinate of the cursor position.
	GetCursorPosY = function() end,

	--- Sets the cursor position.
	--- @param x number The new x-coordinate of the cursor position.
	--- @param y number The new y-coordinate of the cursor position.
	SetCursorPos = function(x, y) end,

	--- Sets the x-coordinate of the cursor position.
	--- @param x number The new x-coordinate of the cursor position.
	SetCursorPosX = function(x) end,

	--- Sets the y-coordinate of the cursor position.
	--- @param y number The new y-coordinate of the cursor position.
	SetCursorPosY = function(y) end,

	--- Gets the starting position of the cursor.
	--- @return number x The x-coordinate of the cursor start position.
	--- @return number y The y-coordinate of the cursor start position.
	GetCursorStartPos = function() end,

	--- Gets the screen position of the cursor.
	--- @return number x The x-coordinate of the cursor screen position.
	--- @return number y The y-coordinate of the cursor screen position.
	GetCursorScreenPos = function() end,

	--- Sets the screen position of the cursor.
	--- @param x number The new x-coordinate of the cursor screen position.
	--- @param y number The new y-coordinate of the cursor screen position.
	SetCursorScreenPos = function(x, y) end,

	--- Aligns text to the frame padding.
	AlignTextToFramePadding = function() end,

	--- Gets the height of a text line.
	--- @return number height The height of the text line.
	GetTextLineHeight = function() end,

	--- Gets the height of a text line including spacing.
	--- @return number height The height of the text line with spacing.
	GetTextLineHeightWithSpacing = function() end,

	--- Gets the height of a frame.
	--- @return number height The height of the frame.
	GetFrameHeight = function() end,

	--- Gets the height of a frame including spacing.
	--- @return number height The height of the frame with spacing.
	GetFrameHeightWithSpacing = function() end,

	--- Pushes a new ID onto the stack.
	--- @param str_id? string Optional. The ID as a string.
	--- @param int_id? integer Optional. The ID as an integer.
	--- @overload fun(str_id: string): nil
	--- @overload fun(int_id: integer): nil
	PushID = function(str_id, int_id) end,

	--- Pops the last ID off the stack.
	PopID = function() end,

	--- Gets an ID from the ID stack.
	--- @param str_id? string Optional. The ID as a string.
	--- @return integer id The ID.
	--- @overload fun(str_id: string): integer
	GetID = function(str_id) end,

	--- Displays unformatted text.
	--- @param text string The text to display.
	--- @overload fun(text: string): nil
	TextUnformatted = function(text) end,

	--- Displays formatted text.
	--- @param text string The text to display.
	Text = function(text) end,

	--- Displays colored text.
	--- @param color_r number The red component of the color.
	--- @param color_g number The green component of the color.
	--- @param color_b number The blue component of the color.
	--- @param color_a number The alpha component of the color.
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

	--- Creates a button widget.
	--- @param label string The text to display on the button.
	--- @param size_x? number Optional. The width of the button.
	--- @param size_y? number Optional. The height of the button.
	--- @return boolean clicked Returns true if the button was clicked.
	--- @overload fun(label: string): boolean
	--- @overload fun(label: string, size_x: number, size_y: number): boolean
	Button = function(label, size_x, size_y) end,

	--- Creates a small button widget.
	--- @param label string The text to display on the button.
	--- @return boolean clicked Returns true if the button was clicked.
	SmallButton = function(label) end,

	--- Creates an invisible button widget.
	--- @param label string The text to display on the button.
	--- @param size_x number The width of the button.
	--- @param size_y number The height of the button.
	--- @return boolean clicked Returns true if the button was clicked.
	InvisibleButton = function(label, size_x, size_y) end,

	--- Creates an arrow button widget.
	--- @param str_id string The identifier for the button.
	--- @param dir ImGuiDir The direction of the arrow.
	--- @return boolean clicked Returns true if the button was clicked.
	ArrowButton = function(str_id, dir) end,

	--- Creates a checkbox widget.
	--- @param label string The text to display next to the checkbox.
	--- @param value boolean The current state of the checkbox.
	--- @return boolean value The updated state of the checkbox.
	--- @return boolean pressed Returns true if the checkbox was clicked.
	Checkbox = function(label, value) end,

	--- Creates a radio button widget.
	--- @param label string The text to display next to the radio button.
	--- @param active boolean The current state of the radio button.
	--- @return boolean pressed Returns true if the radio button was clicked.
	--- @overload fun(label: string, value: integer, v_button: integer): integer, boolean
	RadioButton = function(label, active) end,

	--- Creates a progress bar widget.
	--- @param fraction number The current progress fraction (0.0 to 1.0).
	--- @param size_x? number Optional. The width of the progress bar.
	--- @param size_y? number Optional. The height of the progress bar.
	--- @param overlay? string Optional. Text to display over the progress bar.
	ProgressBar = function(fraction, size_x, size_y, overlay) end,

	--- Displays a bullet point.
	Bullet = function() end,

	--- Begins a combo box widget.
	--- @param label string The text to display as the label for the combo box.
	--- @param previewValue string The text to display as the preview value.
	--- @param flags? ImGuiComboFlags Optional. Flags to configure the combo box.
	--- @return boolean shouldDraw Returns true if the combo box should be drawn.
	--- @overload fun(label: string, previewValue: string): boolean
	--- @overload fun(label: string, previewValue: string, flags: ImGuiComboFlags): boolean
	BeginCombo = function(label, previewValue, flags) end,

	--- Ends a combo box widget.
	EndCombo = function() end,

	--- Creates a combo box widget.
	--- @param label string The text to display as the label for the combo box.
	--- @param current_item integer The index of the currently selected item.
	--- @param items table A table of items to display in the combo box.
	--- @param items_count integer The number of items in the combo box.
	--- @param popup_max_height_in_items? integer Optional. The maximum number of items to display in the popup.
	--- @return integer current_item The updated index of the currently selected item.
	--- @return boolean clicked Returns true if an item was selected.
	--- @overload fun(label: string, current_item: integer, items: table, items_count: integer): integer, boolean
	--- @overload fun(label: string, current_item: integer, items_separated_by_zeros: string): integer, boolean
	--- @overload fun(label: string, current_item: integer, items_separated_by_zeros: string, popup_max_height_in_items: integer): integer, boolean
	Combo = function(label, current_item, items, items_count, popup_max_height_in_items) end,

	--- Creates a draggable number widget.
	--- @param label string The text to display next to the drag control.
	--- @param value number The current value.
	--- @param value_speed? number Optional. Speed of value change.
	--- @param value_min? number Optional. Minimum value.
	--- @param value_max? number Optional. Maximum value.
	--- @param format? string Optional. Formatting string.
	--- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
	--- @return number value The updated value.
	--- @return boolean used Returns true if the value was changed.
	--- @overload fun(label: string, value: number): number, boolean
	--- @overload fun(label: string, value: number, value_speed: number): number, boolean
	--- @overload fun(label: string, value: number, value_speed: number, value_min: number): number, boolean
	--- @overload fun(label: string, value: number, value_speed: number, value_min: number, value_max: number): number, boolean
	--- @overload fun(label: string, value: number, value_speed: number, value_min: number, value_max: number, format: string): number, boolean
	--- @overload fun(label: string, value: number, value_speed: number, value_min: number, value_max: number, format: string, flags: ImGuiSliderFlags): number, boolean
	Dragnumber = function(label, value, value_speed, value_min, value_max, format, flags) end,

	--- Creates a draggable number2 widget.
	--- @param label string The text to display next to the drag control.
	--- @param values table A table with two number values.
	--- @param value_speed? number Optional. Speed of value change.
	--- @param value_min? number Optional. Minimum value.
	--- @param value_max? number Optional. Maximum value.
	--- @param format? string Optional. Formatting string.
	--- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
	--- @return table values The updated values.
	--- @return boolean used Returns true if the values were changed.
	--- @overload fun(label: string, values: table): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: number): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: number, value_max: number): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: number, value_max: number, format: string): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: number, value_max: number, format: string, flags: ImGuiSliderFlags): table, boolean
	Dragnumber2 = function(label, values, value_speed, value_min, value_max, format, flags) end,

	--- Creates a draggable number3 widget.
	--- @param label string The text to display next to the drag control.
	--- @param values table A table with three number values.
	--- @param value_speed? number Optional. Speed of value change.
	--- @param value_min? number Optional. Minimum value.
	--- @param value_max? number Optional. Maximum value.
	--- @param format? string Optional. Formatting string.
	--- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
	--- @return table values The updated values.
	--- @return boolean used Returns true if the values were changed.
	--- @overload fun(label: string, values: table): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: number): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: number, value_max: number): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: number, value_max: number, format: string): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: number, value_max: number, format: string, flags: ImGuiSliderFlags): table, boolean
	Dragnumber3 = function(label, values, value_speed, value_min, value_max, format, flags) end,

	--- Creates a draggable number4 widget.
	--- @param label string The text to display next to the drag control.
	--- @param values table A table with four number values.
	--- @param value_speed? number Optional. Speed of value change.
	--- @param value_min? number Optional. Minimum value.
	--- @param value_max? number Optional. Maximum value.
	--- @param format? string Optional. Formatting string.
	--- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
	--- @return table values The updated values.
	--- @return boolean used Returns true if the values were changed.
	--- @overload fun(label: string, values: table): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: number): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: number, value_max: number): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: number, value_max: number, format: string): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: number, value_max: number, format: string, flags: ImGuiSliderFlags): table, boolean
	Dragnumber4 = function(label, values, value_speed, value_min, value_max, format, flags) end,

	--- Creates a draggable integer widget.
	--- @param label string The text to display next to the drag control.
	--- @param value integer The current value.
	--- @param value_speed? number Optional. Speed of value change.
	--- @param value_min? integer Optional. Minimum value.
	--- @param value_max? integer Optional. Maximum value.
	--- @param format? string Optional. Formatting string.
	--- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
	--- @return integer value The updated value.
	--- @return boolean used Returns true if the value was changed.
	--- @overload fun(label: string, value: integer): integer, boolean
	--- @overload fun(label: string, value: integer, value_speed: number): integer, boolean
	--- @overload fun(label: string, value: integer, value_speed: number, value_min: integer): integer, boolean
	--- @overload fun(label: string, value: integer, value_speed: number, value_min: integer, value_max: integer): integer, boolean
	--- @overload fun(label: string, value: integer, value_speed: number, value_min: integer, value_max: integer, format: string): integer, boolean
	--- @overload fun(label: string, value: integer, value_speed: number, value_min: integer, value_max: integer, format: string, flags: ImGuiSliderFlags): integer, boolean
	Draginteger = function(label, value, value_speed, value_min, value_max, format, flags) end,

	--- Creates a draggable integer2 widget.
	--- @param label string The text to display next to the drag control.
	--- @param values table A table with two integer values.
	--- @param value_speed? number Optional. Speed of value change.
	--- @param value_min? integer Optional. Minimum value.
	--- @param value_max? integer Optional. Maximum value.
	--- @param format? string Optional. Formatting string.
	--- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
	--- @return table values The updated values.
	--- @return boolean used Returns true if the values were changed.
	--- @overload fun(label: string, values: table): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: integer): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: integer, value_max: integer): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: integer, value_max: integer, format: string): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: integer, value_max: integer, format: string, flags: ImGuiSliderFlags): table, boolean
	DragInt2 = function(label, values, value_speed, value_min, value_max, format, flags) end,

	--- Creates a draggable integer3 widget.
	--- @param label string The text to display next to the drag control.
	--- @param values table A table with three integer values.
	--- @param value_speed? number Optional. Speed of value change.
	--- @param value_min? integer Optional. Minimum value.
	--- @param value_max? integer Optional. Maximum value.
	--- @param format? string Optional. Formatting string.
	--- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
	--- @return table values The updated values.
	--- @return boolean used Returns true if the values were changed.
	--- @overload fun(label: string, values: table): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: integer): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: integer, value_max: integer): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: integer, value_max: integer, format: string): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: integer, value_max: integer, format: string, flags: ImGuiSliderFlags): table, boolean
	DragInt3 = function(label, values, value_speed, value_min, value_max, format, flags) end,

	--- Creates a draggable integer4 widget.
	--- @param label string The text to display next to the drag control.
	--- @param values table A table with four integer values.
	--- @param value_speed? number Optional. Speed of value change.
	--- @param value_min? integer Optional. Minimum value.
	--- @param value_max? integer Optional. Maximum value.
	--- @param format? string Optional. Formatting string.
	--- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
	--- @return table values The updated values.
	--- @return boolean used Returns true if the values were changed.
	--- @overload fun(label: string, values: table): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: integer): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: integer, value_max: integer): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: integer, value_max: integer, format: string): table, boolean
	--- @overload fun(label: string, values: table, value_speed: number, value_min: integer, value_max: integer, format: string, flags: ImGuiSliderFlags): table, boolean
	DragInt4 = function(label, values, value_speed, value_min, value_max, format, flags) end,

	--- Creates a number slider widget.
	--- @param label string The text to display next to the slider.
	--- @param value number The value to be adjusted by the slider.
	--- @param value_min number The minimum value of the slider.
	--- @param value_max number The maximum value of the slider.
	--- @param format? string Optional. Formatting string for the value display.
	--- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
	--- @return number value The updated value.
	--- @return boolean used Returns true if the value was changed.
	--- @overload fun(label: string, value: number, value_min: number, value_max: number): number, boolean
	--- @overload fun(label: string, value: number, value_min: number, value_max: number, format: string): number, boolean
	--- @overload fun(label: string, value: number, value_min: number, value_max: number, format: string, flags: ImGuiSliderFlags): number, boolean
	Slidernumber = function(label, value, value_min, value_max, format, flags) end,

	--- Creates a number2 slider widget.
	--- @param label string The text to display next to the sliders.
	--- @param values table A table with two number values.
	--- @param value_min number The minimum value for each slider.
	--- @param value_max number The maximum value for each slider.
	--- @param format? string Optional. Formatting string for the values display.
	--- @param flags? ImGuiSliderFlags Optional. Flags to modify the sliders' behavior.
	--- @return table values The updated values.
	--- @return boolean used Returns true if the values were changed.
	--- @overload fun(label: string, values: table, value_min: number, value_max: number): table, boolean
	--- @overload fun(label: string, values: table, value_min: number, value_max: number, format: string): table, boolean
	--- @overload fun(label: string, values: table, value_min: number, value_max: number, format: string, flags: ImGuiSliderFlags): table, boolean
	Slidernumber2 = function(label, values, value_min, value_max, format, flags) end,

	--- Creates a number3 slider widget.
	--- @param label string The text to display next to the sliders.
	--- @param values table A table with three number values.
	--- @param value_min number The minimum value for each slider.
	--- @param value_max number The maximum value for each slider.
	--- @param format? string Optional. Formatting string for the values display.
	--- @param flags? ImGuiSliderFlags Optional. Flags to modify the sliders' behavior.
	--- @return table values The updated values.
	--- @return boolean used Returns true if the values were changed.
	--- @overload fun(label: string, values: table, value_min: number, value_max: number): table, boolean
	--- @overload fun(label: string, values: table, value_min: number, value_max: number, format: string): table, boolean
	--- @overload fun(label: string, values: table, value_min: number, value_max: number, format: string, flags: ImGuiSliderFlags): table, boolean
	Slidernumber3 = function(label, values, value_min, value_max, format, flags) end,

	--- Creates a number4 slider widget.
	--- @param label string The text to display next to the sliders.
	--- @param values table A table with four number values.
	--- @param value_min number The minimum value for each slider.
	--- @param value_max number The maximum value for each slider.
	--- @param format? string Optional. Formatting string for the values display.
	--- @param flags? ImGuiSliderFlags Optional. Flags to modify the sliders' behavior.
	--- @return table values The updated values.
	--- @return boolean used Returns true if the values were changed.
	--- @overload fun(label: string, values: table, value_min: number, value_max: number): table, boolean
	--- @overload fun(label: string, values: table, value_min: number, value_max: number, format: string): table, boolean
	--- @overload fun(label: string, values: table, value_min: number, value_max: number, format: string, flags: ImGuiSliderFlags): table, boolean
	Slidernumber4 = function(label, values, value_min, value_max, format, flags) end,

	--- Creates an angle slider widget.
	--- @param label string The text to display next to the slider.
	--- @param v_rad number The value in radians to be adjusted by the slider.
	--- @param v_degrees_min? number Optional. Minimum angle in degrees.
	--- @param v_degrees_max? number Optional. Maximum angle in degrees.
	--- @param format? string Optional. Formatting string for the value display.
	--- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
	--- @return number v_rad The updated value in radians.
	--- @return boolean used Returns true if the value was changed.
	--- @overload fun(label: string, v_rad: number): number, boolean
	--- @overload fun(label: string, v_rad: number, v_degrees_min: number): number, boolean
	--- @overload fun(label: string, v_rad: number, v_degrees_min: number, v_degrees_max: number): number, boolean
	--- @overload fun(label: string, v_rad: number, v_degrees_min: number, v_degrees_max: number, format: string): number, boolean
	--- @overload fun(label: string, v_rad: number, v_degrees_min: number, v_degrees_max: number, format: string, flags: ImGuiSliderFlags): number, boolean
	SliderAngle = function(label, v_rad, v_degrees_min, v_degrees_max, format, flags) end,

	--- Creates an integer slider widget.
	--- @param label string The text to display next to the slider.
	--- @param value integer The value to be adjusted by the slider.
	--- @param value_min integer The minimum value of the slider.
	--- @param value_max integer The maximum value of the slider.
	--- @param format? string Optional. Formatting string for the value display.
	--- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
	--- @return integer value The updated value.
	--- @return boolean used Returns true if the value was changed.
	--- @overload fun(label: string, value: integer, value_min: integer, value_max: integer): integer, boolean
	--- @overload fun(label: string, value: integer, value_min: integer, value_max: integer, format: string): integer, boolean
	--- @overload fun(label: string, value: integer, value_min: integer, value_max: integer, format: string, flags: ImGuiSliderFlags): integer, boolean
	Sliderinteger = function(label, value, value_min, value_max, format, flags) end,

	--- Creates an integer2 slider widget.
	--- @param label string The text to display next to the sliders.
	--- @param values table A table with two integer values.
	--- @param value_min integer The minimum value for each slider.
	--- @param value_max integer The maximum value for each slider.
	--- @param format? string Optional. Formatting string for the values display.
	--- @param flags? ImGuiSliderFlags Optional. Flags to modify the sliders' behavior.
	--- @return table values The updated values.
	--- @return boolean used Returns true if the values were changed.
	--- @overload fun(label: string, values: table, value_min: integer, value_max: integer): table, boolean
	--- @overload fun(label: string, values: table, value_min: integer, value_max: integer, format: string): table, boolean
	--- @overload fun(label: string, values: table, value_min: integer, value_max: integer, format: string, flags: ImGuiSliderFlags): table, boolean
	SliderInt2 = function(label, values, value_min, value_max, format, flags) end,

	--- Creates an integer3 slider widget.
	--- @param label string The text to display next to the sliders.
	--- @param values table A table with three integer values.
	--- @param value_min integer The minimum value for each slider.
	--- @param value_max integer The maximum value for each slider.
	--- @param format? string Optional. Formatting string for the values display.
	--- @param flags? ImGuiSliderFlags Optional. Flags to modify the sliders' behavior.
	--- @return table values The updated values.
	--- @return boolean used Returns true if the values were changed.
	--- @overload fun(label: string, values: table, value_min: integer, value_max: integer): table, boolean
	--- @overload fun(label: string, values: table, value_min: integer, value_max: integer, format: string): table, boolean
	--- @overload fun(label: string, values: table, value_min: integer, value_max: integer, format: string, flags: ImGuiSliderFlags): table, boolean
	SliderInt3 = function(label, values, value_min, value_max, format, flags) end,

	--- Creates an integer4 slider widget.
	--- @param label string The text to display next to the sliders.
	--- @param values table A table with four integer values.
	--- @param value_min integer The minimum value for each slider.
	--- @param value_max integer The maximum value for each slider.
	--- @param format? string Optional. Formatting string for the values display.
	--- @param flags? ImGuiSliderFlags Optional. Flags to modify the sliders' behavior.
	--- @return table values The updated values.
	--- @return boolean used Returns true if the values were changed.
	--- @overload fun(label: string, values: table, value_min: integer, value_max: integer): table, boolean
	--- @overload fun(label: string, values: table, value_min: integer, value_max: integer, format: string): table, boolean
	--- @overload fun(label: string, values: table, value_min: integer, value_max: integer, format: string, flags: ImGuiSliderFlags): table, boolean
	SliderInt4 = function(label, values, value_min, value_max, format, flags) end,

	--- Creates a vertical number slider widget.
	--- @param label string The text to display next to the slider.
	--- @param size_x number The width of the slider.
	--- @param size_y number The height of the slider.
	--- @param value number The value to be adjusted by the slider.
	--- @param value_min number The minimum value of the slider.
	--- @param value_max number The maximum value of the slider.
	--- @param format? string Optional. Formatting string for the value display.
	--- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
	--- @return number value The updated value.
	--- @return boolean used Returns true if the value was changed.
	--- @overload fun(label: string, size_x: number, size_y: number, value: number, value_min: number, value_max: number): number, boolean
	--- @overload fun(label: string, size_x: number, size_y: number, value: number, value_min: number, value_max: number, format: string): number, boolean
	--- @overload fun(label: string, size_x: number, size_y: number, value: number, value_min: number, value_max: number, format: string, flags: ImGuiSliderFlags): number, boolean
	VSlidernumber = function(label, size_x, size_y, value, value_min, value_max, format, flags) end,

	--- Creates a vertical integer slider widget.
	--- @param label string The text to display next to the slider.
	--- @param size_x number The width of the slider.
	--- @param size_y number The height of the slider.
	--- @param value integer The value to be adjusted by the slider.
	--- @param value_min integer The minimum value of the slider.
	--- @param value_max integer The maximum value of the slider.
	--- @param format? string Optional. Formatting string for the value display.
	--- @param flags? ImGuiSliderFlags Optional. Flags to modify the slider behavior.
	--- @return integer value The updated value.
	--- @return boolean used Returns true if the value was changed.
	--- @overload fun(label: string, size_x: number, size_y: number, value: integer, value_min: integer, value_max: integer): integer, boolean
	--- @overload fun(label: string, size_x: number, size_y: number, value: integer, value_min: integer, value_max: integer, format: string): integer, boolean
	--- @overload fun(label: string, size_x: number, size_y: number, value: integer, value_min: integer, value_max: integer, format: string, flags: ImGuiSliderFlags): integer, boolean
	VSliderinteger = function(label, size_x, size_y, value, value_min, value_max, format, flags) end,

	--- Creates an input text widget.
	--- @param label string The text to display next to the input.
	--- @param text string The text to be edited.
	--- @param buf_size integer The size of the buffer for the input text.
	--- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
	--- @return string text The updated text.
	--- @return boolean selected Returns true if the input text was selected.
	--- @overload fun(label: string, text: string, buf_size: integer): string, boolean
	--- @overload fun(label: string, text: string, buf_size: integer, flags: ImGuiInputTextFlags): string, boolean
	InputText = function(label, text, buf_size, flags) end,

	--- Creates a multiline input text widget.
	--- @param label string The text to display next to the input.
	--- @param text string The text to be edited.
	--- @param buf_size integer The size of the buffer for the input text.
	--- @param size_x number The width of the input area.
	--- @param size_y number The height of the input area.
	--- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
	--- @return string text The updated text.
	--- @return boolean selected Returns true if the input text was selected.
	--- @overload fun(label: string, text: string, buf_size: integer): string, boolean
	--- @overload fun(label: string, text: string, buf_size: integer, size_x: number, size_y: number): string, boolean
	--- @overload fun(label: string, text: string, buf_size: integer, size_x: number, size_y: number, flags: ImGuiInputTextFlags): string, boolean
	InputTextMultiline = function(label, text, buf_size, size_x, size_y, flags) end,

	--- Creates an input text widget with a hint.
	--- @param label string The text to display next to the input.
	--- @param hinteger string The hint text displayed when the input is empty.
	--- @param text string The text to be edited.
	--- @param buf_size integer The size of the buffer for the input text.
	--- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
	--- @return string text The updated text.
	--- @return boolean selected Returns true if the input text was selected.
	--- @overload fun(label: string, hint: string, text: string, buf_size: integer): string, boolean
	--- @overload fun(label: string, hint: string, text: string, buf_size: integer, flags: ImGuiInputTextFlags): string, boolean
	InputTextWithHinteger = function(label, hinteger, text, buf_size, flags) end,

	--- Creates an input number widget.
	--- @param label string The text to display next to the input.
	--- @param value number The value to be edited.
	--- @param step? number Optional. Step size for incremental changes.
	--- @param step_fast? number Optional. Larger step size for rapid changes.
	--- @param format? string Optional. Formatting string for the value display.
	--- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
	--- @return number value The updated value.
	--- @return boolean used Returns true if the value was changed.
	--- @overload fun(label: string, value: number): number, boolean
	--- @overload fun(label: string, value: number, step: number): number, boolean
	--- @overload fun(label: string, value: number, step: number, step_fast: number): number, boolean
	--- @overload fun(label: string, value: number, step: number, step_fast: number, format: string): number, boolean
	--- @overload fun(label: string, value: number, step: number, step_fast: number, format: string, flags: ImGuiInputTextFlags): number, boolean
	Inputnumber = function(label, value, step, step_fast, format, flags) end,

	--- Creates an input number widget for 2 values.
	--- @param label string The text to display next to the input.
	--- @param values table A table with two number values to be edited.
	--- @param format? string Optional. Formatting string for the values display.
	--- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
	--- @return table values The updated values.
	--- @return boolean used Returns true if the values were changed.
	--- @overload fun(label: string, values: table): table, boolean
	--- @overload fun(label: string, values: table, format: string): table, boolean
	--- @overload fun(label: string, values: table, format: string, flags: ImGuiInputTextFlags): table, boolean
	Inputnumber2 = function(label, values, format, flags) end,

	--- Creates an input number widget for 3 values.
	--- @param label string The text to display next to the input.
	--- @param values table A table with three number values to be edited.
	--- @param format? string Optional. Formatting string for the values display.
	--- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
	--- @return table values The updated values.
	--- @return boolean used Returns true if the values were changed.
	--- @overload fun(label: string, values: table): table, boolean
	--- @overload fun(label: string, values: table, format: string): table, boolean
	--- @overload fun(label: string, values: table, format: string, flags: ImGuiInputTextFlags): table, boolean
	Inputnumber3 = function(label, values, format, flags) end,

	--- Creates an input number widget for 4 values.
	--- @param label string The text to display next to the input.
	--- @param values table A table with four number values to be edited.
	--- @param format? string Optional. Formatting string for the values display.
	--- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
	--- @return table values The updated values.
	--- @return boolean used Returns true if the values were changed.
	--- @overload fun(label: string, values: table): table, boolean
	--- @overload fun(label: string, values: table, format: string): table, boolean
	--- @overload fun(label: string, values: table, format: string, flags: ImGuiInputTextFlags): table, boolean
	Inputnumber4 = function(label, values, format, flags) end,

	--- Creates an input integer widget.
	--- @param label string The text to display next to the input.
	--- @param value integer The value to be edited.
	--- @param step? integer Optional. Step size for incremental changes.
	--- @param step_fast? integer Optional. Larger step size for rapid changes.
	--- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
	--- @return integer value The updated value.
	--- @return boolean used Returns true if the value was changed.
	--- @overload fun(label: string, value: integer): integer, boolean
	--- @overload fun(label: string, value: integer, step: integer): integer, boolean
	--- @overload fun(label: string, value: integer, step: integer, step_fast: integer): integer, boolean
	--- @overload fun(label: string, value: integer, step: integer, step_fast: integer, flags: ImGuiInputTextFlags): integer, boolean
	Inputinteger = function(label, value, step, step_fast, flags) end,

	--- Creates an input integer widget for 2 values.
	--- @param label string The text to display next to the input.
	--- @param values table A table with two integer values to be edited.
	--- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
	--- @return table values The updated values.
	--- @return boolean used Returns true if the values were changed.
	--- @overload fun(label: string, values: table): table, boolean
	--- @overload fun(label: string, values: table, flags: ImGuiInputTextFlags): table, boolean
	InputInt2 = function(label, values, flags) end,

	--- Creates an input integer widget for 3 values.
	--- @param label string The text to display next to the input.
	--- @param values table A table with three integer values to be edited.
	--- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
	--- @return table values The updated values.
	--- @return boolean used Returns true if the values were changed.
	--- @overload fun(label: string, values: table): table, boolean
	--- @overload fun(label: string, values: table, flags: ImGuiInputTextFlags): table, boolean
	InputInt3 = function(label, values, flags) end,

	--- Creates an input integer widget for 4 values.
	--- @param label string The text to display next to the input.
	--- @param values table A table with four integer values to be edited.
	--- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
	--- @return table values The updated values.
	--- @return boolean used Returns true if the values were changed.
	--- @overload fun(label: string, values: table): table, boolean
	--- @overload fun(label: string, values: table, flags: ImGuiInputTextFlags): table, boolean
	InputInt4 = function(label, values, flags) end,

	--- Creates an input number widget.
	--- @param label string The text to display next to the input.
	--- @param value number The value to be edited.
	--- @param step? number Optional. Step size for incremental changes.
	--- @param step_fast? number Optional. Larger step size for rapid changes.
	--- @param format? string Optional. Formatting string for the value display.
	--- @param flags? ImGuiInputTextFlags Optional. Flags to modify the input behavior.
	--- @return number value The updated value.
	--- @return boolean used Returns true if the value was changed.
	--- @overload fun(label: string, value: number): number, boolean
	--- @overload fun(label: string, value: number, step: number): number, boolean
	--- @overload fun(label: string, value: number, step: number, step_fast: number): number, boolean
	--- @overload fun(label: string, value: number, step: number, step_fast: number, format: string): number, boolean
	--- @overload fun(label: string, value: number, step: number, step_fast: number, format: string, flags: ImGuiInputTextFlags): number, boolean
	InputDouble = function(label, value, step, step_fast, format, flags) end,

	--- Creates a color editor widget for 3 values.
	--- @param label string The text to display next to the color editor.
	--- @param col table A table with three number values representing the color (RGB) to be edited.
	--- @param flags? ImGuiColorEditFlags Optional. Flags to modify the color editor behavior.
	--- @return table col The updated color values.
	--- @return boolean used Returns true if the color was changed.
	--- @overload fun(label: string, col: table): table, boolean
	--- @overload fun(label: string, col: table, flags: ImGuiColorEditFlags): table, boolean
	ColorEdit3 = function(label, col, flags) end,

	--- Creates a color editor widget for 4 values.
	--- @param label string The text to display next to the color editor.
	--- @param col table A table with four number values representing the color (RGBA) to be edited.
	--- @param flags? ImGuiColorEditFlags Optional. Flags to modify the color editor behavior.
	--- @return table col The updated color values.
	--- @return boolean used Returns true if the color was changed.
	--- @overload fun(label: string, col: table): table, boolean
	--- @overload fun(label: string, col: table, flags: ImGuiColorEditFlags): table, boolean
	ColorEdit4 = function(label, col, flags) end,

	--- Creates a color picker widget for 3 values.
	--- @param label string The text to display next to the color picker.
	--- @param col table A table with three number values representing the color (RGB) to be picked.
	--- @param flags? ImGuiColorEditFlags Optional. Flags to modify the color picker behavior.
	--- @return table col The updated color values.
	--- @return boolean used Returns true if the color was changed.
	--- @overload fun(label: string, col: table): table, boolean
	--- @overload fun(label: string, col: table, flags: ImGuiColorEditFlags): table, boolean
	ColorPicker3 = function(label, col, flags) end,

	--- Creates a color picker widget for 4 values.
	--- @param label string The text to display next to the color picker.
	--- @param col table A table with four number values representing the color (RGBA) to be picked.
	--- @param flags? ImGuiColorEditFlags Optional. Flags to modify the color picker behavior.
	--- @return table col The updated color values.
	--- @return boolean used Returns true if the color was changed.
	--- @overload fun(label: string, col: table): table, boolean
	--- @overload fun(label: string, col: table, flags: ImGuiColorEditFlags): table, boolean
	ColorPicker4 = function(label, col, flags) end,

	--- Creates a color button widget.
	--- @param desc_id string Identifier for the button.
	--- @param col table A table with four number values representing the color (RGBA) of the button.
	--- @param flags? ImGuiColorEditFlags Optional. Flags to modify the color button behavior.
	--- @param size_x? number Optional. Width of the button.
	--- @param size_y? number Optional. Height of the button.
	--- @return boolean pressed Returns true if the button was pressed.
	--- @overload fun(desc_id: string, col: table): boolean
	--- @overload fun(desc_id: string, col: table, flags: ImGuiColorEditFlags): boolean
	--- @overload fun(desc_id: string, col: table, flags: ImGuiColorEditFlags, size_x: number, size_y: number): boolean
	ColorButton = function(desc_id, col, flags, size_x, size_y) end,

	--- Sets the global color edit options.
	--- @param flags ImGuiColorEditFlags Flags to set for color editing options.
	SetColorEditOptions = function(flags) end,

	--- Creates a tree node widget.
	--- @param label string The text to display for the tree node.
	--- @param fmt? string Optional. Formatting string for the label.
	--- @return boolean open Returns true if the node is open.
	--- @overload fun(label: string): boolean
	--- @overload fun(label: string, fmt: string): boolean
	TreeNode = function(label, fmt) end,

	--- Creates a tree node widget with additional flags.
	--- @param label string The text to display for the tree node.
	--- @param flags? ImGuiTreeNodeFlags Optional. Flags to modify the tree node behavior.
	--- @param fmt? string Optional. Formatting string for the label.
	--- @return boolean open Returns true if the node is open.
	--- @overload fun(label: string): boolean
	--- @overload fun(label: string, flags: ImGuiTreeNodeFlags): boolean
	--- @overload fun(label: string, flags: ImGuiTreeNodeFlags, fmt: string): boolean
	TreeNodeEx = function(label, flags, fmt) end,

	--- Pushes a new tree node identifier onto the stack.
	--- @param str_id string The identifier for the tree node.
	TreePush = function(str_id) end,

	--- Pops the most recent tree node identifier off the stack.
	TreePop = function() end,

	--- Gets the spacing between the tree node and its label.
	--- @return number spacing The spacing value.
	GetTreeNodeToLabelSpacing = function() end,

	--- Creates a collapsing header widget.
	--- @param label string The text to display for the header.
	--- @param flags? ImGuiTreeNodeFlags Optional. Flags to modify the header behavior.
	--- @return boolean notCollapsed Returns true if the header is not collapsed.
	--- @overload fun(label: string): boolean
	--- @overload fun(label: string, flags: ImGuiTreeNodeFlags): boolean
	--- @overload fun(label: string, open: boolean): boolean, boolean
	--- @overload fun(label: string, open: boolean, flags: ImGuiTreeNodeFlags): boolean, boolean
	CollapsingHeader = function(label, open, flags) end,

	--- Sets the open state for the next item.
	--- @param open boolean The state to set for the item (open or closed).
	--- @param cond? ImGuiCond Optional. Condition to determine when to set the state.
	--- @overload fun(open: boolean): nil
	--- @overload fun(open: boolean, cond: ImGuiCond): nil
	SetNextItemOpen = function(open, cond) end,

	--- Creates a selectable widget.
	--- @param label string The text to display for the selectable item.
	--- @param selected? boolean Optional. Indicates whether the item is selected.
	--- @param flags? ImGuiSelectableFlags Optional. Flags to modify the selectable behavior.
	--- @param size_x? number Optional. Width of the selectable item.
	--- @param size_y? number Optional. Height of the selectable item.
	--- @return boolean selected Returns true if the item is selected.
	--- @overload fun(label: string): boolean
	--- @overload fun(label: string, selected: boolean): boolean
	--- @overload fun(label: string, selected: boolean, flags: ImGuiSelectableFlags): boolean
	--- @overload fun(label: string, selected: boolean, flags: ImGuiSelectableFlags, size_x: number, size_y: number): boolean
	Selectable = function(label, selected, flags, size_x, size_y) end,

	--- Creates a list box widget.
	--- @param label string The text to display for the list box.
	--- @param current_item integer The index of the currently selected item.
	--- @param items table A table of strings representing the items in the list box.
	--- @param items_count integer The number of items in the list.
	--- @param height_in_items? integer Optional. The height of the list box in items.
	--- @return integer current_item The updated index of the currently selected item.
	--- @return boolean clicked Returns true if an item was clicked.
	--- @overload fun(label: string, current_item: integer, items: table, items_count: integer): integer, boolean
	--- @overload fun(label: string, current_item: integer, items: table, items_count: integer, height_in_items: integer): integer, boolean
	ListBox = function(label, current_item, items, items_count, height_in_items) end,

	--- Begins a list box widget.
	--- @param label string The text to display for the list box.
	--- @param size_x? number Optional. The width of the list box.
	--- @param size_y? number Optional. The height of the list box.
	--- @return boolean open Returns true if the list box is open.
	--- @overload fun(label: string): boolean
	--- @overload fun(label: string, size_x: number, size_y: number): boolean
	BeginListBox = function(label, size_x, size_y) end,

	--- Ends the current list box widget.
	EndListBox = function() end,

	--- Begins a menu bar.
	--- @return boolean shouldDraw Returns true if the menu bar should be drawn.
	BeginMenuBar = function() end,

	--- Ends the current menu bar.
	EndMenuBar = function() end,

	--- Begins a main menu bar.
	--- @return boolean shouldDraw Returns true if the main menu bar should be drawn.
	BeginMainMenuBar = function() end,

	--- Ends the current main menu bar.
	EndMainMenuBar = function() end,

	--- Begins a menu within a menu bar or main menu bar.
	--- @param label string The text to display for the menu.
	--- @param enabled? boolean Optional. Indicates whether the menu is enabled.
	--- @return boolean shouldDraw Returns true if the menu should be drawn.
	--- @overload fun(label: string): boolean
	--- @overload fun(label: string, enabled: boolean): boolean
	BeginMenu = function(label, enabled) end,

	--- Ends the current menu.
	EndMenu = function() end,

	--- Creates a menu item.
	--- @param label string The text to display for the menu item.
	--- @param shortcut? string Optional. The shortcut key for the menu item.
	--- @param selected? boolean Optional. Indicates whether the item is selected.
	--- @param enabled? boolean Optional. Indicates whether the item is enabled.
	--- @return boolean selected If selected is provided, returns the updated selection state.
	--- @return boolean activated Returns true if the menu item was activated.
	--- @overload fun(label: string): boolean
	--- @overload fun(label: string, shortcut: string): boolean
	--- @overload fun(label: string, shortcut: string, selected: boolean): boolean, boolean
	--- @overload fun(label: string, shortcut: string, selected: boolean, enabled: boolean): boolean, boolean
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
	--- @return boolean open Returns true if the popup is open.
	--- @overload fun(str_id: string): boolean
	--- @overload fun(str_id: string, flags: ImGuiWindowFlags): boolean
	BeginPopup = function(str_id, flags) end,

	--- Begins a modal popup.
	--- @param name string The name of the modal popup.
	--- @param open? boolean Optional. The initial state of the modal popup.
	--- @param flags? ImGuiWindowFlags Optional. Flags to modify the modal popup behavior.
	--- @return boolean open Returns true if the modal popup is open.
	--- @overload fun(name: string): boolean
	--- @overload fun(name: string, flags: ImGuiWindowFlags): boolean
	--- @overload fun(name: string, open: boolean): boolean
	--- @overload fun(name: string, open: boolean, flags: ImGuiWindowFlags): boolean
	BeginPopupModal = function(name, open, flags) end,

	--- Ends the current popup.
	EndPopup = function() end,

	--- Opens a popup by its identifier.
	--- @param str_id string The identifier for the popup.
	--- @param popup_flags? ImGuiPopupFlags Optional. Flags to modify the popup behavior.
	--- @overload fun(str_id: string): nil
	--- @overload fun(str_id: string, popup_flags: ImGuiPopupFlags): nil
	OpenPopup = function(str_id, popup_flags) end,

	--- Opens a popup context menu for the current item.
	--- @param str_id? string Optional. The identifier for the popup.
	--- @param popup_flags? ImGuiPopupFlags Optional. Flags to modify the popup behavior.
	--- @return boolean open Returns true if the popup is open.
	--- @overload fun(): boolean
	--- @overload fun(str_id: string): boolean
	--- @overload fun(str_id: string, popup_flags: ImGuiPopupFlags): boolean
	OpenPopupContextItem = function(str_id, popup_flags) end,

	--- Closes the currently open popup.
	CloseCurrentPopup = function() end,

	--- Begins a popup context menu for the current item.
	--- @param str_id? string Optional. The identifier for the popup.
	--- @param popup_flags? ImGuiPopupFlags Optional. Flags to modify the popup behavior.
	--- @return boolean open Returns true if the popup is open.
	--- @overload fun(): boolean
	--- @overload fun(str_id: string): boolean
	--- @overload fun(str_id: string, popup_flags: ImGuiPopupFlags): boolean
	BeginPopupContextItem = function(str_id, popup_flags) end,

	--- Begins a popup context menu for the current window.
	--- @param str_id? string Optional. The identifier for the popup.
	--- @param popup_flags? ImGuiPopupFlags Optional. Flags to modify the popup behavior.
	--- @return boolean open Returns true if the popup is open.
	--- @overload fun(): boolean
	--- @overload fun(str_id: string): boolean
	--- @overload fun(str_id: string, popup_flags: ImGuiPopupFlags): boolean
	BeginPopupContextWindow = function(str_id, popup_flags) end,

	--- Begins a popup context menu for the whole screen (nil).
	--- @param str_id? string Optional. The identifier for the popup.
	--- @param popup_flags? ImGuiPopupFlags Optional. Flags to modify the popup behavior.
	--- @return boolean open Returns true if the popup is open.
	--- @overload fun(): boolean
	--- @overload fun(str_id: string): boolean
	--- @overload fun(str_id: string, popup_flags: ImGuiPopupFlags): boolean
	BeginPopupContextnil = function(str_id, popup_flags) end,

	--- Checks if a popup is currently open.
	--- @param str_id string The identifier for the popup.
	--- @param popup_flags? ImGuiPopupFlags Optional. Flags to modify the popup behavior.
	--- @return boolean Returns true if the popup is open.
	--- @overload fun(str_id: string): boolean
	--- @overload fun(str_id: string, popup_flags: ImGuiPopupFlags): boolean
	IsPopupOpen = function(str_id, popup_flags) end,

	--- Begins a table.
	--- @param str_id string The identifier for the table.
	--- @param column integer The number of columns in the table.
	--- @param flags? ImGuiTableFlags Optional. Flags to modify the table behavior.
	--- @param outer_size_x? number Optional. The width of the table.
	--- @param outer_size_y? number Optional. The height of the table.
	--- @param inner_width? number Optional. The width of each column.
	--- @return boolean Returns true if the table was successfully created.
	--- @overload fun(str_id: string, column: integer): boolean
	--- @overload fun(str_id: string, column: integer, flags: ImGuiTableFlags): boolean
	--- @overload fun(str_id: string, column: integer, flags: ImGuiTableFlags, outer_size_x: number, outer_size_y: number): boolean
	--- @overload fun(str_id: string, column: integer, flags: ImGuiTableFlags, outer_size_x: number, outer_size_y: number, inner_width: number): boolean
	BeginTable = function(str_id, column, flags, outer_size_x, outer_size_y, inner_width) end,

	--- Ends the current table.
	EndTable = function() end,

	--- Moves to the next row in the table.
	--- @param flags? ImGuiTableRowFlags Optional. Flags to modify the row behavior.
	--- @param min_row_height? number Optional. The minimum height of the row.
	--- @overload fun(): nil
	--- @overload fun(flags: ImGuiTableRowFlags): nil
	--- @overload fun(flags: ImGuiTableRowFlags, min_row_height: number): nil
	TableNextRow = function(flags, min_row_height) end,

	--- Moves to the next column in the table.
	--- @return boolean visible Returns true if the column is visible.
	TableNextColumn = function() end,

	--- Moves to the specified column in the table.
	--- @param column_n integer The index of the column to move to.
	--- @return boolean visible Returns true if the column is visible.
	TableSetColumnIndex = function(column_n) end,

	--- Sets up a column in the table.
	--- @param label string The label for the column.
	--- @param flags? ImGuiTableColumnFlags Optional. Flags to modify the column behavior.
	--- @param init_width_or_weight? number Optional. The initial width or weight of the column.
	--- @param user_id? integer Optional. A user-defined identifier for the column.
	--- @overload fun(label: string): nil
	--- @overload fun(label: string, flags: ImGuiTableColumnFlags): nil
	--- @overload fun(label: string, flags: ImGuiTableColumnFlags, init_width_or_weight: number): nil
	--- @overload fun(label: string, flags: ImGuiTableColumnFlags, init_width_or_weight: number, user_id: integer): nil
	TableSetupColumn = function(label, flags, init_width_or_weight, user_id) end,

	--- Sets up scroll freeze for the table, locking columns and rows to remain visible when scrolling.
	--- @param cols integer The number of columns to lock.
	--- @param rows integer The number of rows to lock.
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
	--- @return integer The number of columns.
	TableGetColumnCount = function() end,

	--- Returns the current column index.
	--- @return integer The current column index.
	TableGetColumnIndex = function() end,

	--- Returns the current row index.
	--- @return integer The current row index.
	TableGetRowIndex = function() end,

	--- Returns the name of a column, or an empty string if the column does not have a name declared by TableSetupColumn().
	--- Pass -1 to use the current column.
	--- @param column_n? integer Optional. The index of the column to query.
	--- @return string The name of the column.
	--- @overload fun(): string
	--- @overload fun(column_n: integer): string
	TableGetColumnName = function(column_n) end,

	--- Returns the flags of a column, allowing you to query its Enabled/Visible/Sorted/Hovered status.
	--- Pass -1 to use the current column.
	--- @param column_n? integer Optional. The index of the column to query.
	--- @return ImGuiTableColumnFlags The flags of the column.
	--- @overload fun(): ImGuiTableColumnFlags
	--- @overload fun(column_n: integer): ImGuiTableColumnFlags
	TableGetColumnFlags = function(column_n) end,

	--- Sets the background color for a cell, row, or column.
	--- See ImGuiTableBgTarget_ flags for details on the target.
	--- @param target ImGuiTableBgTarget The target to change the background color for.
	--- @param color integer The color to set in hexadecimal.
	--- @param column_n? integer Optional. The index of the column to set the color for.
	--- @overload fun(target: ImGuiTableBgTarget, color: integer): nil
	--- @overload fun(target: ImGuiTableBgTarget, color: number, color: number, color: number, color: number): nil
	--- @overload fun(target: ImGuiTableBgTarget, color: number, color: number, color: number, color: number, column_n: integer): nil
	TableSetBgColor = function(target, color, column_n) end,

	--- NOTE  say tables preferred
	--- Begins a new column layout with the specified number of columns and options.
	--- @param count? integer Optional. The number of columns to create.
	--- @param id? string Optional. The unique identifier for the column layout.
	--- @param border? boolean Optional. Whether to show borders between columns.
	--- @overload fun(): nil
	--- @overload fun(count: integer): nil
	--- @overload fun(count: integer, id: string): nil
	--- @overload fun(count: integer, id: string, border: boolean): nil
	Columns = function(count, id, border) end,

	--- Moves the cursor to the next column in the layout.
	NextColumn = function() end,

	--- Gets the index of the current column.
	--- @return integer The index of the current column.
	GetColumnIndex = function() end,

	--- Gets the width of a specific column, or the current column if no index is provided.
	--- @param column_index? integer Optional. The index of the column to query.
	--- @return number The width of the column.
	--- @overload fun(): number
	--- @overload fun(column_index: integer): number
	GetColumnWidth = function(column_index) end,

	--- Sets the width of a specific column.
	--- @param column_index integer The index of the column to modify.
	--- @param width number The new width of the column.
	SetColumnWidth = function(column_index, width) end,

	--- Gets the offset of a specific column, or the current column if no index is provided.
	--- @param column_index? integer Optional. The index of the column to query.
	--- @return number The offset of the column.
	--- @overload fun(): number
	--- @overload fun(column_index: integer): number
	GetColumnOffset = function(column_index) end,

	--- Sets the offset of a specific column.
	--- @param column_index integer The index of the column to modify.
	--- @param offset number The new offset of the column.
	SetColumnOffset = function(column_index, offset) end,

	--- Gets the number of columns in the current layout.
	--- @return integer The number of columns.
	GetColumnsCount = function() end,

	--- Begins a new tab bar.
	--- @param str_id string The unique identifier for the tab bar.
	--- @param flags? ImGuiTabBarFlags Optional. Flags to modify the tab bar behavior.
	--- @return boolean open Returns true if the tab bar is open.
	--- @overload fun(str_id: string): boolean
	--- @overload fun(str_id: string, flags: ImGuiTabBarFlags): boolean
	BeginTabBar = function(str_id, flags) end,

	--- Ends the current tab bar.
	EndTabBar = function() end,

	--- Begins a new tab item.
	--- @param label string The label of the tab item.
	--- @param flags? ImGuiTabItemFlags Optional. Flags to modify the tab item behavior.
	--- @return boolean selected Returns true if the tab item is selected.
	--- @overload fun(label: string): boolean
	--- @overload fun(label: string, flags: ImGuiTabItemFlags): boolean
	--- @overload fun(label: string, open: boolean): boolean, boolean
	--- @overload fun(label: string, open: boolean, flags: ImGuiTabItemFlags): boolean, boolean
	BeginTabItem = function(label, open, flags) end,

	--- Ends the current tab item.
	EndTabItem = function() end,

	--- Closes a tab item or docked window.
	--- @param tab_or_docked_window_label string The label of the tab or docked window to close.
	SetTabItemClosed = function(tab_or_docked_window_label) end,

	--- Begins a disabled block of UI elements.
	--- @param disabled? boolean Optional. If true, the UI elements within will be disabled.
	BeginDisabled = function(disabled) end,

	--- Ends the disabled block of UI elements.
	EndDisabled = function() end,

	--- Sets a clipping rectangle for drawing operations.
	--- @param min_x number The minimum X coordinate of the clipping rectangle.
	--- @param min_y number The minimum Y coordinate of the clipping rectangle.
	--- @param max_x number The maximum X coordinate of the clipping rectangle.
	--- @param max_y number The maximum Y coordinate of the clipping rectangle.
	--- @param intersect_current? boolean Optional. If true, intersects the clipping rectangle with the current clipping rectangle.
	PushClipRect = function(min_x, min_y, max_x, max_y, intersect_current) end,

	--- Restores the previous clipping rectangle.
	PopClipRect = function() end,

	--- Sets the default focus to the current item.
	SetItemDefaultFocus = function() end,

	--- Sets keyboard focus to the item with an optional offset from the current item.
	--- @param offset? integer Optional. The offset from the current item to set focus on.
	SetKeyboardFocusHere = function(offset) end,

	--- Checks if the last item is being hovered.
	--- @param flags? ImGuiHoveredFlags Optional. Flags to modify the hover checking behavior.
	--- @return boolean hovered Returns true if the item is being hovered.
	IsItemHovered = function(flags) end,

	--- Checks if the last item is active.
	--- @return boolean active Returns true if the item is active.
	IsItemActive = function() end,

	--- Checks if the last item is focused.
	--- @return boolean focused Returns true if the item is focused.
	IsItemFocused = function() end,

	--- Checks if the last item was clicked.
	--- @param mouse_button? ImGuiMouseButton Optional. The mouse button to check for clicks.
	--- @return boolean clicked Returns true if the item was clicked.
	IsItemClicked = function(mouse_button) end,

	--- Checks if the last item is visible.
	--- @return boolean visible Returns true if the item is visible.
	IsItemVisible = function() end,

	--- Checks if the last item was edited.
	--- @return boolean edited Returns true if the item was edited.
	IsItemEdited = function() end,

	--- Checks if the last item was activated.
	--- @return boolean activated Returns true if the item was activated.
	IsItemActivated = function() end,

	--- Checks if the last item was deactivated.
	--- @return boolean deactivated Returns true if the item was deactivated.
	IsItemDeactivated = function() end,

	--- Checks if the last item was deactivated after an edit.
	--- @return boolean deactivated_after_edit Returns true if the item was deactivated after editing.
	IsItemDeactivatedAfterEdit = function() end,

	--- Checks if the last item was toggled open (e.g., a tree node or a collapsing header).
	--- @return boolean toggled_open Returns true if the item was toggled open.
	IsItemToggledOpen = function() end,

	--- Checks if any item is being hovered.
	--- @return boolean any_item_hovered Returns true if any item is being hovered.
	IsAnyItemHovered = function() end,

	--- Checks if any item is active.
	--- @return boolean any_item_active Returns true if any item is active.
	IsAnyItemActive = function() end,

	--- Checks if any item is focused.
	--- @return boolean any_item_focused Returns true if any item is focused.
	IsAnyItemFocused = function() end,

	--- Gets the minimum corner of the last item’s bounding rectangle.
	--- @return number x, number y The x and y coordinates of the minimum corner.
	GetItemRectMin = function() end,

	--- Gets the maximum corner of the last item’s bounding rectangle.
	--- @return number x, number y The x and y coordinates of the maximum corner.
	GetItemRectMax = function() end,

	--- Gets the size of the last item’s bounding rectangle.
	--- @return number x, number y The width and height of the rectangle.
	GetItemRectSize = function() end,

	--- Allows the last item to overlap with other items.
	SetItemAllowOverlap = function() end,

	--- Checks if a rectangle is visible within the current clipping rectangle.
	--- @param size_x number Width of the rectangle.
	--- @param size_y number Height of the rectangle.
	--- @return boolean visible Returns true if the rectangle is visible.
	IsRectVisible = function(size_x, size_y) end,

	--- Gets the time since the ImGui context was created.
	--- @return number time Returns the current time in seconds.
	GetTime = function() end,

	--- Gets the number of frames rendered since the ImGui context was created.
	--- @return integer frame_count Returns the frame count.
	GetFrameCount = function() end,

	--- Gets the name of a style color.
	--- @param idx ImGuiCol Index of the style color.
	--- @return string style_color_name Returns the name of the style color.
	GetStyleColorName = function(idx) end,

	--- Begins a child frame with its own background and clipping rectangle.
	--- @param id integer Unique ID of the child frame.
	--- @param size_x number Width of the child frame.
	--- @param size_y number Height of the child frame.
	--- @param flags ImGuiWindowFlags Optional window flags.
	--- @return boolean open Returns true if the child frame is open.
	BeginChildFrame = function(id, size_x, size_y, flags) end,

	--- Ends the child frame started with BeginChildFrame().
	EndChildFrame = function() end,

	--- Calculates the size of the given text, including optional wrapping and text hiding.
	--- @param text string The text to measure.
	--- @param hide_text_after_double_hash boolean Optional. If true, the function will ignore any text after a number hash (##) in the provided text.
	--- @param wrap_width number Optional. If greater than 0, the function will wrap the text at this width.
	--- @return number x Width of the text.
	--- @return number y Height of the text.
	CalcTextSize = function(text, hide_text_after_double_hash, wrap_width) end,

	--- Converts RGB color values to HSV color values.
	--- @param r number Red component (0.0 to 1.0)
	--- @param g number Green component (0.0 to 1.0)
	--- @param b number Blue component (0.0 to 1.0)
	--- @return number h Hue component (0.0 to 1.0)
	--- @return number s Saturation component (0.0 to 1.0)
	--- @return number v Value (Brightness) component (0.0 to 1.0)
	ColorConvertRGBtoHSV = function(r, g, b) end,

	--- Converts HSV color values to RGB color values.
	--- @param h number Hue component (0.0 to 1.0)
	--- @param s number Saturation component (0.0 to 1.0)
	--- @param v number Value (Brightness) component (0.0 to 1.0)
	--- @return number r Red component (0.0 to 1.0)
	--- @return number g Green component (0.0 to 1.0)
	--- @return number b Blue component (0.0 to 1.0)
	ColorConvertHSVtoRGB = function(h, s, v) end,

	--- Converts a 32-bit color value to a normalized numbering-pointeger color value.
	--- @param color_u32 integer 32-bit color value (usually in ARGB format)
	--- @return number[] color_f4 Array of 4 numbers representing normalized color values {r, g, b, a}
	ColorConvertU32Tonumber4 = function(color_u32) end,

	--- Converts a normalized numbering-pointeger color value to a 32-bit color value.
	--- @param color_f4 number[] Array of 4 numbers representing normalized color values {r, g, b, a}
	--- @return integer color_u32 32-bit color value (usually in ARGB format)
	ColorConvertnumber4ToU32 = function(color_f4) end,

	--- Checks if a specific mouse button was clicked.
	--- @param button ImGuiMouseButton Mouse button identifier
	--- @param repeats boolean Whether to detect repeated clicks
	--- @return boolean clicked True if the button was clicked
	IsMouseClicked = function(button, repeats) end,

	--- Checks if a specific mouse button was number-clicked.
	--- @param button ImGuiMouseButton Mouse button identifier
	--- @return boolean clicked True if the button was number-clicked
	IsMouseDoubleClicked = function(button) end,

	--- Checks if the mouse is hovering over a specified rectangle.
	--- @param min_x number Minimum x-coordinate of the rectangle
	--- @param min_y number Minimum y-coordinate of the rectangle
	--- @param max_x number Maximum x-coordinate of the rectangle
	--- @param max_y number Maximum y-coordinate of the rectangle
	--- @param clip boolean Whether to clip the rectangle within the current clipping rectangle
	--- @return boolean hovered True if the mouse is hovering over the rectangle
	IsMouseHoveringRect = function(min_x, min_y, max_x, max_y, clip) end,

	--- Gets the current mouse position.
	--- @return number x X-coordinate of the mouse position
	--- @return number y Y-coordinate of the mouse position
	GetMousePos = function() end,

	--- Gets the mouse position when the current popup was opened.
	--- @return number x X-coordinate of the mouse position
	--- @return number y Y-coordinate of the mouse position
	GetMousePosOnOpeningCurrentPopup = function() end,

	--- Checks if the mouse is currently dragging with a specific button.
	--- @param button ImGuiMouseButton Mouse button identifier
	--- @param lock_threshold number Minimum distance before dragging starts
	--- @return boolean dragging True if the mouse is dragging
	IsMouseDragging = function(button, lock_threshold) end,

	--- Gets the delta of the mouse drag with a specific button.
	--- @param button ImGuiMouseButton Mouse button identifier
	--- @param lock_threshold number Minimum distance before dragging starts
	--- @return number x Delta in the x-direction
	--- @return number y Delta in the y-direction
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
	--- @return boolean pressed True if the key or key mod is pressed
	IsKeyDown = function(key) end,

	--- Checks if a key or key mod was pressed (i.e., down for this frame).
	--- @param key ImGuiKey or ImGuiKeyMod Key or key mod identifier
	--- @param repeats boolean Whether to consider repeated presses
	--- @return boolean pressed True if the key or key mod was pressed
	IsKeyPressed = function(key, repeats) end,

	--- Checks if a key or key mod was released (i.e., up for this frame).
	--- @param key ImGuiKey or ImGuiKeyMod Key or key mod identifier
	--- @return boolean released True if the key or key mod was released
	IsKeyReleased = function(key) end,

	--- Creates a hotkey input widget.
	--- @param label string The label for the hotkey input
	--- @param current_hotkey integer The current hotkey value (virtual key code)
	--- @param size ImVec2 Optional size of the widget
	--- @return boolean value_changed True if the hotkey value was changed
	--- @return integer vk_key_number The new virtual key code
	Hotkey = function(label, current_hotkey, size) end,

	--- Gets the number of key presses within a given period.
	--- @param key ImGuiKey or ImGuiKeyMod Key or key mod identifier
	--- @param repeat_delay number Delay before key repeat starts
	--- @param repeat_rate number Rate of key repeat
	--- @return integer Number of key presses
	GetKeyPressedAmount = function(key, repeat_delay, repeat_rate) end,

	--- Gets the name of a key or key mod.
	--- @param key ImGuiKey or ImGuiKeyMod Key or key mod identifier
	--- @return string Name of the key or key mod
	GetKeyName = function(key) end,

	--- Sets whether the next frame should capture keyboard input.
	--- @param want_to_capture_keyboard boolean Whether to capture keyboard input
	SetNextFrameWantCaptureKeyboard = function(want_to_capture_keyboard) end,

	--- Gets the current text from the clipboard.
	--- @return string text The clipboard text
	GetClipboardText = function() end,

	--- Sets the given text to the clipboard.
	--- @param text string The text to set to the clipboard
	SetClipboardText = function(text) end,
}
