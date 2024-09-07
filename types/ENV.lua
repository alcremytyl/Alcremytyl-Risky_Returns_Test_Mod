--- @meta
--- @class _ENV
--- @field _PLUGIN.guid string Path to the mod folder inside config.
--- @field _PLUGIN.plugins_data_mod_folder_path string Path to the mod folder inside plugins_data.
--- @field _PLUGIN.plugins_mod_folder_path string Path to the mod folder inside plugins.
--- @field _PLUGIN.this unknown This module.
--- Plugin-specific global table.
--- Can be accessed with `!` shortcut instead of `_PLUGIN`
_ENV = {
	--- @type string
	["!guid"] = ...,
	--- @type string
	["!plugins_data_mod_folder_path"] = ...,
	--- @type string
	["!plugins_mod_folder_path"] = ...,
	--- @type table<any, any>
	["!this"] = ...,
}

-- ^ hidden if underscored >:[
