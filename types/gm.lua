--- @meta
--- @class gm
--- Table containing helpers for interacting with the game maker engine.
gm = ...

--- Constants table containing gml/game constants name to their asset index.
--- @type table<string, number>
gm.constants = ...

--- Constant types table containing gml/game constants name to their type name.
--- @type table<string, string>
gm.constant_types = ...

--- Constants type sorted table.
--- @type table<string, table<number, string>>
gm.constants_type_sorted = ...

--- Registers a callback that will be called right before any object function is called.
--- @param callback function Callback function with signature (self: CInstance, other: CInstance, code: CCode, result: RValue, flags: number): boolean
gm.pre_code_execute = function(callback) end

--- Registers a callback that will be called right after any object function is called.
--- @param callback function Callback function with signature (self: CInstance, other: CInstance, code: CCode, result: RValue, flags: number): void
gm.post_code_execute = function(callback) end

--- Registers a callback that will be called right before any game script function is called.
--- @param function_index number Index of the game script/builtin game maker function to hook, e.g., `gm.constants.callback_execute`.
--- @param callback function Callback function with signature (self: CInstance, other: CInstance, result: RValue, args: RValue[]): boolean
gm.pre_script_hook = function(function_index, callback) end

--- Registers a callback that will be called right after any game script function is called.
--- @param function_index number Index of the game script/builtin game maker function to hook, e.g., `gm.constants.callback_execute`.
--- @param callback function Callback function with signature (self: CInstance, other: CInstance, result: RValue, args: RValue[]): void
gm.post_script_hook = function(function_index, callback) end

--- Retrieves the value of a global variable.
--- @param name string Name of the variable.
--- @return any value The actual value behind the RValue, or RValue if the type is not handled yet.
gm.variable_global_get = function(name) end

--- Sets the value of a global variable.
--- @param name string Name of the variable.
--- @param new_value any New value to set.
gm.variable_global_set = function(name, new_value) end

--- Calls a function by name with optional parameters.
--- @param name string Name of the function to call.
--- @param self CInstance Optional. The instance to use as `self`.
--- @param other CInstance Optional. The instance to use as `other`.
--- @param args any Optional. Arguments to pass to the function.
--- @return any value The actual value behind the RValue, or RValue if the type is not handled yet.
gm.call = function(name, self, other, args) end

--- Creates and returns a new empty struct.
--- @return YYObjectBase* The freshly made empty struct.
gm.struct_create = function() end
