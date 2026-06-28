local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")

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
test(function() return Players.LocalPlayer ~= nil end)
test(function() return RunService:IsRunning() end)
test(function() return RunService:IsClient() or RunService:IsServer() end)
test(function() return Workspace.CurrentCamera ~= nil end)
test(function() return typeof(Workspace.CurrentCamera.CFrame) == "CFrame" end)
test(function() return typeof(Workspace.CurrentCamera.ViewportSize) == "Vector2" end)
test(function() return Lighting ~= nil end)
test(function() return Lighting.ClockTime >= 0 and Lighting.ClockTime <= 24 end)
test(function() return ReplicatedStorage ~= nil end)
test(function() return StarterGui ~= nil end)
test(function() return UserInputService ~= nil end)

test(function() return typeof(Vector3.new()) == "Vector3" end)
test(function() return typeof(Vector2.new()) == "Vector2" end)
test(function() return typeof(CFrame.new()) == "CFrame" end)
test(function() return typeof(Color3.new()) == "Color3" end)
test(function() return typeof(UDim2.new()) == "UDim2" end)

test(function() return math.floor(3.9) == 3 end)
test(function() return math.ceil(3.1) == 4 end)
test(function() return math.abs(-10) == 10 end)
test(function() return math.max(1,2,3) == 3 end)
test(function() return math.min(1,2,3) == 1 end)
test(function() return math.sqrt(16) == 4 end)
test(function() return math.pi > 3.14 and math.pi < 3.15 end)

test(function() return string.len("hello") == 5 end)
test(function() return string.sub("hello",1,2) == "he" end)
test(function() return string.upper("a") == "A" end)
test(function() return string.lower("A") == "a" end)
test(function() return string.rep("ab",2) == "abab" end)
test(function() return string.reverse("abc") == "cba" end)

test(function() return table.concat({"a","b","c"}) == "abc" end)
test(function()
    local t = {1,2,3}
    table.insert(t,4)
    return #t == 4
end)
test(function()
    local t = {3,1,2}
    table.sort(t)
    return t[1] == 1
end)

test(function() return pcall(function() error("x") end) end)
test(function() return type(pcall) == "function" end)
test(function() return type(xpcall) == "function" end)

test(function()
    local co = coroutine.create(function() return 1 end)
    return coroutine.resume(co)
end)

test(function() return select("#",1,2,3) == 3 end)
test(function() return os.time() > 0 end)
test(function() return os.clock() >= 0 end)
test(function() return typeof(tick()) == "number" end)

test(function() return Instance.new("Part") ~= nil end)
test(function() return Instance.new("Folder"):IsA("Folder") end)

test(function() return game:GetService("Players") ~= nil end)
test(function() return game:GetService("Workspace") ~= nil end)
test(function() return game:GetService("ReplicatedStorage") ~= nil end)

test(function() return #Players:GetPlayers() >= 0 end)
test(function() return workspace:FindFirstChildWhichIsA("BasePart", true) ~= nil or true end)

print("fails:", fails)
print("success:", ok)