local d = 0
local t = {math, string, table, coroutine, bit32, task, os}

for i = 1, #t do
    local v = t[i]
    if type(v) == "table" then
        if not table.isfrozen(v) then
            d = 1
        end
        local s = pcall(function()
            v.x = 1
        end)
        if s then
            d = 1
        end
    end
end

local m = getmetatable("")
if type(m) == "table" then
    if not table.isfrozen(m) then
        d = 1
    end
    if type(m.__index) == "table" and not table.isfrozen(m.__index) then
        d = 1
    end
end

if d == 1 then
    error("failed", 0)
else
    print("passed")
end