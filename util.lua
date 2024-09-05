--- @param t table
--- @see github https://gist.github.com/justnom/9816256#file-table_to_string-lua
function table_to_string(t, indent)
    indent = indent or 0
    local formatting = string.rep(" ", indent)
    for k, v in pairs(t) do
        if type(v) == "table" then
            print(formatting .. "[" .. tostring(k) .. "] = {")
            table_to_string(v, indent + 2)
            print(formatting .. "}")
        else
            print(formatting .. "[" .. tostring(k) .. "] = " .. tostring(v))
        end
    end
end
