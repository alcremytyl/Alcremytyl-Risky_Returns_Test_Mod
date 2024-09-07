--- @meta
--- @class mods
--- Table containing information about loaded mods and related functions.
--- Each mod once loaded will have a key in this table, the key will be their GUID string and the value their `_ENV`.
mods = ...

--- Registers a callback that will be called once all mods are loaded.
--- The callback will be called instantly if mods are already loaded and you are just hot-reloading your mod.
--- @param callback fun() The callback function that will be invoked once all mods are loaded. The function should have no parameters.
mods.on_all_mods_loaded = function(callback) end
