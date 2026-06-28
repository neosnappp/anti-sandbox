local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")
local LogService = game:GetService("LogService")
local Stats = game:GetService("Stats")

local fails = 0
local ok = 0

local function test(fn)
    local s, r = pcall(fn)
    if s and r ~= false and r ~= nil then
        ok += 1
    else
        fails += 1
    end
end

test(function() return getgenv == nil end)
test(function() return getreg == nil end)
test(function() return getrenv == nil end)
test(function() return getfenv(0) == getfenv(1) end)
test(function() return debug.getregistry == nil or type(debug.getregistry) ~= "function" end)
test(function() return setupvalue == nil end)
test(function() return getupvalue == nil end)
test(function() return hookfunction == nil end)
test(function() return hookmetamethod == nil end)
test(function() return newcclosure == nil end)
test(function() return checkclosure == nil end)
test(function() return islclosure == nil end)
test(function() return getgc == nil end)
test(function() return getinstances == nil end)
test(function() return getnilinstances == nil end)
test(function() return getscripts == nil end)
test(function() return getloadedmodules == nil end)
test(function() return getconnections == nil end)
test(function() return fireclickdetector == nil end)
test(function() return firetouchinterest == nil end)
test(function() return setrawmetatable == nil end)
test(function() return getrawmetatable == nil end)
test(function() return setreadonly == nil end)
test(function() return isreadonly == nil end)
test(function() return iswindowactive == nil end)
test(function() return keypress == nil end)
test(function() return keyrelease == nil end)
test(function() return mouse1click == nil end)
test(function() return mouse2click == nil end)

test(function() return tostring(next):find("function: builtin") or tostring(next):find("function: 0x") end)
test(function() return tostring(print):find("function: builtin") or tostring(print):find("function: 0x") end)
test(function() return tostring(math.abs):find("function: builtin") or tostring(math.abs):find("function: 0x") end)

test(function()
    local t = {}
    table.freeze(t)
    return table.isfrozen(t) == true
end)

test(function()
    local t = {1, 2, 3}
    table.freeze(t)
    return pcall(function() t[1] = 4 end) == false
end)

test(function()
    local b = buffer.create(1024)
    buffer.writeu8(b, 0, 255)
    return buffer.readu8(b, 0) == 255
end)

for i = 1, 100 do
    test(function()
        local v = Vector3.new(i, i, i)
        return v.X == i and v.Magnitude > 0
    end)
end

for i = 1, 100 do
    test(function()
        local c = Color3.fromRGB(i, i, i)
        return math.floor(c.R * 255 + 0.5) == i
    end)
end

test(function()
    local _, err = pcall(function() return game.NotAProperty end)
    return err:find("is not a valid member of") ~= nil
end)

test(function()
    local _, err = pcall(function() return Workspace:GetSomething() end)
    return err:find("is not a valid member of Workspace") ~= nil
end)

test(function()
    local _, err = pcall(function() return string.len(nil) end)
    return err:find("invalid argument #1") ~= nil
end)

test(function()
    local _, err = pcall(function() return table.concat(true) end)
    return err:find("invalid argument #1") ~= nil
end)

test(function()
    local p = Instance.new("Part")
    local mt = getmetatable(p)
    return mt == "The metatable is locked"
end)

test(function()
    local s = "hello"
    local mt = getmetatable(s)
    return type(mt) == "table" and mt.__index == string
end)

test(function()
    local n = nil
    local mt = getmetatable(n)
    return mt == nil
end)

test(function()
    local b = true
    local mt = getmetatable(b)
    return mt == nil
end)

test(function()
    local f = function() end
    local mt = getmetatable(f)
    return mt == nil
end)

test(function()
    local co = coroutine.create(function() end)
    return coroutine.status(co) == "suspended"
end)

test(function()
    local co = coroutine.create(function() coroutine.yield(100) end)
    local _, res = coroutine.resume(co)
    return res == 100
end)

test(function()
    local start = os.clock()
    local count = 0
    while os.clock() - start < 0.01 do
        count += 1
    end
    return count > 0
end)

test(function()
    local t = {1, 2, 3}
    return #t == 3 and rawlen(t) == 3
end)

test(function()
    local t = {a = 1}
    return rawget(t, "a") == 1 and t.a == 1
end)

test(function()
    local t = {}
    rawset(t, "x", 10)
    return t.x == 10
end)

for i = 1, 50 do
    test(function()
        local cf = CFrame.new(i, i, i) * CFrame.Angles(math.rad(i), 0, 0)
        return typeof(cf) == "CFrame"
    end)
end

test(function() return bit32.extract(0xFF, 0, 4) == 0xF end)
test(function() return bit32.replace(0x0, 0xF, 0, 4) == 0xF end)
test(function() return bit32.countlz(0x00FFFFFF) == 8 end)
test(function() return bit32.countrz(0xFFFFFF00) == 8 end)

test(function() return math.ldexp(0.5, 1) == 1 end)
test(function() return math.frexp(1) == 0.5 end)
test(function() return math.modf(1.5) == 1 end)
test(function() return math.fmod(10, 3) == 1 end)

test(function() return string.pack("b", 100) == string.char(100) end)
test(function() return string.unpack("b", string.char(100)) == 100 end)

test(function() return utf8.nfcnormalize("a") == "a" end)
test(function() return utf8.nfdnormalize("a") == "a" end)

test(function()
    local success = pcall(function()
        local p = Instance.new("Part")
        p.Parent = game:GetService("CoreGui")
    end)
    return success == false
end)

test(function()
    local success = pcall(function()
        return game:GetService("HttpService").PostAsync
    end)
    return success == false
end)

test(function()
    local s = "test"
    return s:upper() == "TEST" and string.upper(s) == "TEST"
end)

test(function()
    local t = {1}
    return t[1] == 1 and table.find(t, 1) == 1
end)

test(function()
    local x = 0
    local function f() x += 1 end
    f()
    return x == 1
end)

test(function()
    return _G ~= nil and type(_G) == "table"
end)

test(function()
    return shared ~= nil and type(shared) == "table"
end)

test(function()
    return _VERSION == "Luau"
end)

test(function()
    local co = coroutine.running()
    return coroutine.isyieldable() == true
end)

for i = 1, 20 do
    test(function()
        local p = Instance.new("Part")
        p.Name = "Test" .. i
        local n = p.Name
        p:Destroy()
        return n == "Test" .. i
    end)
end

test(function()
    local t = os.date("*t")
    return type(t.year) == "number" and t.year >= 2026
end)

print("fails:", fails)
print("success:", ok)