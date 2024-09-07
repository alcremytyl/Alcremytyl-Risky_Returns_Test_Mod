--- @return string string
function dump(o)
  if type(o) == "table" then
    local s = "{"
    for k, v in pairs(o) do
      if type(k) ~= "number" then
        k = '"' .. k .. '"'
      end
      s = s .. "[" .. k .. "] = " .. dump(v) .. ","
    end
    return "\n\n" .. s .. "}" .. "\n\n"
  else
    return "\n\n" .. tostring(o) .. "\n\n"
  end
end
