local t = setmetatable({}, {__eq = function() task.wait() return true end})
local ok = not pcall(function() return t == t end)
print(ok and "ok" or "dtc")