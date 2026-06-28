local depth = 0
local function stack()
    local trace = debug.traceback()
    for _ in trace:gmatch("\n") do depth = depth + 1 end
end
pcall(stack)
local ok = depth >= 2 and depth <= 5
print(ok and "ok" or "dtc")