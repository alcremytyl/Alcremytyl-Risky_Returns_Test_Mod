--- @meta
--- @class path
--- Table containing helpers for manipulating file or directory paths.
path = ...

--- Combine strings into a path.
--- @param ... string Any number of strings to combine into a path.
--- @return string new_path The combined path.
path.combine = function(...) end

--- Retrieve the parent directory of the specified path.
--- @param path string The path for which to retrieve the parent directory.
--- @return string parent_dir The parent path.
path.get_parent = function(path) end

--- Retrieve the names of subdirectories under the given root path.
--- @param root_path string The path to the directory to search.
--- @return string[] subdirs A table containing the names of subdirectories.
path.get_directories = function(root_path) end

--- Retrieve the names of all files under the given root path.
--- @param root_path string The path to the directory to search.
--- @return string[] files A table containing the names of files.
path.get_files = function(root_path) end

--- Retrieve the filename from the given path.
--- @param path string The path from which to extract the filename.
--- @return string filename The filename.
path.filename = function(path) end

--- Retrieve the stem of the filename from the given path (filename without the final extension).
--- @param path string The path from which to extract the stem.
--- @return string stem The stem of the filename.
path.stem = function(path) end

--- Create a new directory at the specified path.
--- @param path string The path to the new directory to create.
--- @return boolean succeeded True if the directory was newly created, false otherwise.
path.create_directory = function(path) end
