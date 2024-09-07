--- @meta
--- @class pointer
--- Class representing a 64-bit memory address.
pointer = ...

--- Creates a new pointer instance with the given address.
--- @param address integer The memory address.
--- @return pointer The new pointer instance.
function pointer:new(address) end

--- Adds an offset to the current memory address and returns a new pointer object.
--- This operation does not modify the original pointer but creates a new pointer object with the updated address.
--- @param offset integer The offset to add to the current address.
--- @return pointer A new pointer object with the updated address.
function pointer:add(offset) end

--- Subtracts an offset from the current memory address and returns a new pointer object.
--- This operation does not modify the original pointer but creates a new pointer object with the updated address.
--- @param offset integer The offset to subtract from the current address.
--- @return pointer A new pointer object with the updated address.
function pointer:sub(offset) end

--- Rips the current memory address and returns a new pointer object.
--- This function performs a memory rip operation, modifying the address based on the provided offset.
--- @param offset integer The offset to apply during the rip operation.
--- @return pointer A new pointer object with the modified address.
function pointer:rip(offset) end

--- Rips (with cmp instruction) the current memory address and returns a new pointer object.
--- This function performs a rip operation with a comparison (cmp instruction) at the given offset.
--- @param offset integer The offset to apply during the rip operation with cmp instruction.
--- @return pointer A new pointer object with the modified address.
function pointer:rip_cmp(offset) end

--- Retrieves the byte value stored at the memory address.
--- This function reads a single byte from the memory address.
--- @return number The byte value stored at the memory address.
function pointer:get_byte() end

--- Retrieves the word (2 bytes) value stored at the memory address.
--- This function reads a 2-byte word from the memory address.
--- @return number The word value stored at the memory address.
function pointer:get_word() end

--- Retrieves the dword (4 bytes) value stored at the memory address.
--- This function reads a 4-byte dword from the memory address.
--- @return number The dword value stored at the memory address.
function pointer:get_dword() end

--- Retrieves the float value stored at the memory address.
--- This function reads a floating-point value from the memory address.
--- @return number The float value stored at the memory address.
function pointer:get_float() end

--- Retrieves the qword (8 bytes) value stored at the memory address.
--- This function reads an 8-byte qword from the memory address.
--- @return number The qword value stored at the memory address.
function pointer:get_qword() end

--- Sets a byte value at the current memory address.
--- This function writes a single byte value to the memory address.
--- @param value number The byte value to set.
function pointer:set_byte(value) end

--- Sets a word (2 bytes) value at the current memory address.
--- This function writes a 2-byte word value to the memory address.
--- @param value number The word value to set.
function pointer:set_word(value) end

--- Sets a dword (4 bytes) value at the current memory address.
--- This function writes a 4-byte dword value to the memory address.
--- @param value number The dword value to set.
function pointer:set_dword(value) end

--- Sets a float value at the current memory address.
--- This function writes a floating-point value to the memory address.
--- @param value number The float value to set.
function pointer:set_float(value) end

--- Sets a qword (8 bytes) value at the current memory address.
--- This function writes an 8-byte qword value to the memory address.
--- @param value number The qword value to set.
function pointer:set_qword(value) end

--- Retrieves the string value stored at the memory address.
--- This function reads a string from the memory address.
--- @return string The string value stored at the memory address.
function pointer:get_string() end

--- Sets a string value at the current memory address.
--- This function writes a string value to the memory address.
--- @param value string The string value to set.
function pointer:set_string(value) end

--- Creates a memory patch for modifying the byte value at the memory address.
--- The patch is applied when `apply` is called on the returned `lua_patch` object, and the original value is restored with `restore`.
--- @param value number The new byte value to patch.
--- @return lua_patch A memory patch instance for modifying the byte value.
function pointer:patch_byte(value) end

--- Creates a memory patch for modifying the word value at the memory address.
--- The patch is applied when `apply` is called on the returned `lua_patch` object, and the original value is restored with `restore`.
--- @param value number The new word value to patch.
--- @return lua_patch A memory patch instance for modifying the word value.
function pointer:patch_word(value) end

--- Creates a memory patch for modifying the dword value at the memory address.
--- The patch is applied when `apply` is called on the returned `lua_patch` object, and the original value is restored with `restore`.
--- @param value number The new dword value to patch.
--- @return lua_patch A memory patch instance for modifying the dword value.
function pointer:patch_dword(value) end

--- Creates a memory patch for modifying the qword value at the memory address.
--- The patch is applied when `apply` is called on the returned `lua_patch` object, and the original value is restored with `restore`.
--- @param value number The new qword value to patch.
--- @return lua_patch A memory patch instance for modifying the qword value.
function pointer:patch_qword(value) end

--- Checks if the memory address is null.
--- @return boolean `true` if the address is null, otherwise `false`.
function pointer:is_null() end

--- Checks if the memory address is valid (not null).
--- @return boolean `true` if the address is valid, otherwise `false`.
function pointer:is_valid() end

--- Dereferences the memory address and returns a new pointer object pointing to the value at that address.
--- This function follows the pointer to the address it points to.
--- @return pointer A new pointer object pointing to the value at the dereferenced address.
function pointer:deref() end

--- Retrieves the memory address stored in the pointer object.
--- @return number The memory address stored in the pointer object.
function pointer:get_address() end
