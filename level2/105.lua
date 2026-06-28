local detected = false

task.defer(function() end)

local ok, info = pcall(function()
    local closure = function() end
    return debug.getinfo(closure, "s")
end)
if not ok or (info and info.what ~= "Lua") then else
    warn("dtc 1")
    detected = true
end

local ok = pcall(function()
    local buf = buffer.create(8)
    buffer.writeu32(buf, 0, 0xDEADBEEF)
    if buffer.readu32(buf, 0) ~= 0xDEADBEEF then error("bad") end
end)
if not ok then
    warn("dtc 4")
    detected = true
end

local ok = pcall(function()
    local t = {1, 2, 3}
    table.freeze(t)
    if not table.isfrozen(t) then error("bad") end
    local success = pcall(function() t[1] = 99 end)
    if success then error("bad") end
end)
if not ok then
    warn("dtc 6")
    detected = true
end

local ok = pcall(function()
    local part = Instance.new("Part")
    local sleep = gethiddenproperty(part, "NetworkIsSleeping")
    if type(sleep) ~= "boolean" then error("bad") end
    sethiddenproperty(part, "__lunr_test_prop", "secret")
    local read = gethiddenproperty(part, "__lunr_test_prop")
    if read ~= "secret" then error("bad") end
    part:Destroy()
end)
if not ok then else
    warn("dtc 9")
    detected = true
end


if not detected then
    print("All checks passed - clean environment")
else
    print("Some detections triggered - possible logger/sandbox")
end