--- @meta
--- @class memory
--- Table containing helper functions related to process memory.
memory = {}

--- Scans the specified memory pattern within the target main module and returns a pointer to the found address.
--- @param pattern string Byte pattern in IDA format.
--- @return pointer Pointer to the found address.
memory.scan_pattern = function(pattern) end

--- Allocates a specified number of bytes on the heap.
--- @param size integer Number of bytes to allocate.
--- @return pointer Pointer to the newly allocated memory.
memory.allocate = function(size) end

--- Frees the allocated memory at the specified pointer.
--- @param ptr pointer Pointer to the memory to be freed.
memory.free = function(ptr) end

