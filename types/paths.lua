--- @meta
--- @class paths
--- Table containing helpers for retrieving project related IO file/folder paths.
paths = ...

--- Retrieves the config folder path.
--- Used for data that must persist between sessions and that can be manipulated by the user.
--- @return string config_path The config folder path.
paths.config = function() end

--- Retrieves the plugins_data folder path.
--- Used for data that must persist between sessions but not be manipulated by the user.
--- @return string plugins_data_path The plugins_data folder path.
paths.plugins_data = function() end

--- Retrieves the plugins folder path.
--- Location of .lua, README, manifest.json files.
--- @return string plugins_path The plugins folder path.
paths.plugins = function() end
