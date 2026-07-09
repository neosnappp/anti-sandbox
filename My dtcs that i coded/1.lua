--better also executing on velocity 

local runService = game:GetService("RunService")
local encodingService = game:GetService("EncodingService")

local function throwDtc()
    error("dtc by neosnapp nga", 0)
end

local checks = {}


table.insert(checks, function()
    if runService:IsStudio() then throwDtc() end
end)


table.insert(checks, function()
    local s, res = pcall(function()
        local b = buffer.create(4)
        buffer.writestring(b, 0, "test")
        return encodingService:CompressBuffer(b, Enum.CompressionAlgorithm.Zstd, 10)
    end)
    if not s or typeof(res) ~= "buffer" then throwDtc() end
end)


table.insert(checks, function()
    local dInfo = debug.info
    if type(dInfo) ~= "function" then throwDtc() end
    local s, arity, is_vararg = pcall(dInfo, print, "a")
    if not s or arity ~= 0 or is_vararg ~= true then throwDtc() end
end)


table.insert(checks, function()
    local s = pcall(function() Instance.new("NeosnappFakeClass123") end)
    if s then throwDtc() end
end)


table.insert(checks, function()
    local s = pcall(function() game() end)
    if s then throwDtc() end
end)


table.insert(checks, function()
    local s = pcall(getfenv, 69)
    if s then throwDtc() end
end)


table.insert(checks, function()
    if typeof(Enum.Material.Plastic) ~= "EnumItem" then throwDtc() end
end)


table.insert(checks, function()
    local s, r = pcall(function()
        local co = coroutine.create(function() coroutine.yield("neo") end)
        local s1, res = coroutine.resume(co)
        return s1 and res == "neo" and coroutine.status(co) == "suspended"
    end)
    if not s or r ~= true then throwDtc() end
end)


local function randomize(t)
    for i = #t, 2, -1 do
        local j = math.random(i)
        t[i], t[j] = t[j], t[i]
    end
end

randomize(checks)


for _, check in ipairs(checks) do
    local ok = pcall(check)
    if not ok then throwDtc() end
end

print("pass")