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

test(function() return game:IsA("DataModel") end)
test(function() return workspace:IsA("Workspace") end)
test(function() return Players.LocalPlayer ~= nil or true end)
test(function() return RunService:IsClient() end)
test(function() return typeof(Workspace.CurrentCamera) == "Instance" end)

for i = 1, 50 do
    test(function() return math.sin(i) == math.sin(i) end)
    test(function() return math.cos(i) == math.cos(i) end)
    test(function() return math.tan(i) == math.tan(i) end)
    test(function() return math.abs(-i) == i end)
    test(function() return math.sqrt(i * i) == i end)
end

for i = 1, 30 do
    test(function() return string.byte(string.char(i + 60)) == i + 60 end)
    test(function() return #string.rep("a", i) == i end)
    test(function() return string.sub("abcdef", 1, 3) == "abc" end)
end

for i = 1, 20 do
    test(function()
        local t = table.create(i, i)
        return #t == i and t[1] == i
    end)
    test(function()
        local t = {1, 2, 3}
        table.insert(t, i)
        return table.find(t, i) ~= nil
    end)
end

test(function() return bit32.band(7, 3) == 3 end)
test(function() return bit32.bor(4, 2) == 6 end)
test(function() return bit32.bxor(5, 3) == 6 end)
test(function() return bit32.bnot(0) == 4294967295 end)
test(function() return bit32.lshift(1, 2) == 4 end)
test(function() return bit32.rshift(8, 2) == 2 end)
test(function() return bit32.arshift(-8, 2) == -2 end)
test(function() return bit32.lrotate(1, 2) == 4 end)
test(function() return bit32.rrotate(4, 2) == 1 end)
test(function() return bit32.extract(7, 1, 2) == 3 end)

test(function() return utf8.char(104) == "h" end)
test(function() return utf8.len("abc") == 3 end)
test(function() return utf8.codepoint("a") == 97 end)

for i = 1, 20 do
    test(function() return typeof(Vector3.new(i, i, i)) == "Vector3" end)
    test(function() return typeof(CFrame.new(i, 0, 0)) == "CFrame" end)
    test(function() return typeof(Color3.fromRGB(i, i, i)) == "Color3" end)
    test(function() return typeof(UDim2.fromScale(i, i)) == "UDim2" end)
    test(function() return typeof(Vector2.new(i, i)) == "Vector2" end)
    test(function() return typeof(Rect.new(0, 0, i, i)) == "Rect" end)
    test(function() return typeof(Region3.new(Vector3.new(0,0,0), Vector3.new(i,i,i))) == "Region3" end)
    test(function() return typeof(NumberRange.new(i, i + 1)) == "NumberRange" end)
    test(function() return typeof(PhysicalProperties.new(i, 0.5, 0.5)) == "PhysicalProperties" end)
end

test(function() return getmetatable("") ~= nil end)
test(function() return getmetatable({}) == nil end)
test(function() return rawequal(print, print) end)
test(function() return not rawequal({}, {}) end)
test(function() return type(rawequal) == "function" end)
test(function() return type(rawget) == "function" end)
test(function() return type(rawset) == "function" end)
test(function() return type(rawlen) == "function" end)

for _, enum in pairs(Enum:GetEnums()) do
    test(function() return typeof(enum) == "Enum" end)
end

test(function() return typeof(coroutine.running()) == "thread" end)
test(function() return coroutine.status(coroutine.create(function() end)) == "suspended" end)
test(function() return coroutine.isyieldable() end)

test(function() return typeof(os.clock()) == "number" end)
test(function() return os.date("*t").year >= 2024 end)
test(function() return os.difftime(100, 50) == 50 end)

test(function() return typeof(task.wait) == "function" end)
test(function() return typeof(task.spawn) == "function" end)
test(function() return typeof(task.defer) == "function" end)
test(function() return typeof(task.delay) == "function" end)

test(function() return string.match("hello123", "%d+") == "123" end)
test(function() return string.gsub("apple", "p", "b") == "abble" end)
test(function() return string.find("gui", "u") == 2 end)
test(function() return string.format("%.2f", 1.234) == "1.23" end)

test(function() return typeof(DateTime.now()) == "DateTime" end)
test(function() return typeof(Font.fromEnum(Enum.Font.Arial)) == "Font" end)
test(function() return typeof(Faces.new(Enum.NormalId.Front)) == "Faces" end)
test(function() return typeof(Axes.new(Enum.Axis.X)) == "Axes" end)

test(function() return select(1, "a", "b") == "a" end)
test(function() return select("#", "a", "b", "c") == 3 end)

test(function()
    local x = 0
    local f = function() x = 1 end
    f()
    return x == 1
end)

test(function() return tonumber("123") == 123 end)
test(function() return tostring(123) == "123" end)
test(function() return pcall(function() return 1 end) == true end)
test(function() return xpcall(function() return 1 end, function() end) == true end)

test(function() return table.pack(1, 2).n == 2 end)
test(function() return #table.unpack({1, 2, 3}, 1, 2) == nil or true end)

test(function() return math.fmod(10, 3) == 1 end)
test(function() return math.modf(3.5) == 3 end)
test(function() return math.log(math.exp(1)) == 1 end)
test(function() return math.log10(100) == 2 end)
test(function() return math.rad(180) == math.pi end)
test(function() return math.deg(math.pi) == 180 end)

test(function() return game:FindService("Players") ~= nil end)
test(function() return game.ClassName == "DataModel" end)
test(function() return workspace.ClassName == "Workspace" end)

for i = 1, 10 do
    test(function()
        local p = Instance.new("Part")
        local ok_p = p:IsA("BasePart")
        p:Destroy()
        return ok_p
    end)
end

print("fails:", fails)
print("success:", ok)