--- @meta
--- @class log
--- Table containing functions for printing to the console or log file.
log = {}

--- Logs an informational message.
--- @param args any Message or data to log.
log.info = function(args) end

--- Logs a warning message.
--- @param args any Message or data to log.
log.warning = function(args) end

--- Logs a debug message.
--- @param args any Message or data to log.
log.debug = function(args) end

--- Logs an error message. This mirrors the classic Lua `error` function.
--- @param arg any Message or data to log.
--- @param level integer Error level.
log.error = function(arg, level) end

--- Refreshes the log filters (Console and File) from the config file.
log.refresh_filters = function() end

