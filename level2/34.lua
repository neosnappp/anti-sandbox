local PathfindingService = game:GetService("PathfindingService")
local path = PathfindingService:CreatePath({
    AgentRadius = 2,
    AgentHeight = 5,
    AgentCanJump = false,
})
local ok = pcall(function()
    path:ComputeAsync(Vector3.new(0, 0, 0), Vector3.new(0, 0, 10))
end)
if typeof(path) == "Instance" and path:IsA("Path") then
    print("pass")
else
    print("detected")
end

local TweenService = game:GetService("TweenService")
local part = Instance.new("Part")
part.Parent = workspace
part.Position = Vector3.new(0, 0, 0)
local info = TweenInfo.new(0.1, Enum.EasingStyle.Linear)
local tween = TweenService:Create(part, info, { Position = Vector3.new(10, 0, 0) })
local states = {}
table.insert(states, tween.PlaybackState)
tween:Play()
table.insert(states, tween.PlaybackState)
task.wait(0.15)
table.insert(states, tween.PlaybackState)
part:Destroy()
if states[1] == Enum.PlaybackState.Begin and states[2] == Enum.PlaybackState.Playing and states[3] == Enum.PlaybackState.Completed then
    print("pass")
else
    print("detected")
end

local st = SharedTable.new()
st.counter = 0
SharedTable.increment(st, "counter", 7)
SharedTable.increment(st, "counter", 3)
if st.counter == 10 and typeof(st) == "SharedTable" then
    print("pass")
else
    print("detected")
end

local world = CFrame.new(5, 10, 15) * CFrame.Angles(math.rad(30), math.rad(60), math.rad(90))
local local_ = CFrame.new(1, 2, 3)
local converted = world:ToWorldSpace(local_)
local reverted = world:ToObjectSpace(converted)
local posDiff = (reverted.Position - local_.Position).Magnitude
if posDiff < 1e-4 then
    print("pass")
else
    print("detected")
end

local part = Instance.new("Part")
part.Size = Vector3.new(4, 4, 4)
part.CFrame = CFrame.new(0, 50, 0)
part.Anchored = true
part.Parent = workspace
task.wait()
local queryBox = OverlapParams.new()
queryBox.FilterType = Enum.RaycastFilterType.Include
queryBox.FilterDescendantsInstances = { part }
local results = workspace:GetPartBoundsInBox(CFrame.new(0, 50, 0), Vector3.new(10, 10, 10), queryBox)
part:Destroy()
if #results == 1 and results[1] == part then
    print("pass")
else
    print("detected")
end

local a = Vector3.new(1, 0, 0)
local b = Vector3.new(0, 1, 0)
local steps = 10
local allUnit = true
for i = 1, steps - 1 do
    local t = i / steps
    local slerped = a:Lerp(b, t).Unit
    if math.abs(slerped.Magnitude - 1) > 1e-5 then
        allUnit = false
        break
    end
end
if allUnit then
    print("pass")
else
    print("detected")
end

local be = Instance.new("BindableEvent")
local log = {}
be.Event:Connect(function(v) table.insert(log, v * 2) end)
be.Event:Connect(function(v) table.insert(log, v * 3) end)
be:Fire(5)
task.wait()
be:Destroy()
local has10 = table.find(log, 10) ~= nil
local has15 = table.find(log, 15) ~= nil
if has10 and has15 and #log == 2 then
    print("pass")
else
    print("detected")
end

local t1 = DateTime.now().UnixTimestampMillis
task.wait(0.05)
local t2 = DateTime.now().UnixTimestampMillis
local delta = t2 - t1
if delta > 0 and delta < 5000 and typeof(t1) == "number" then
    print("pass")
else
    print("detected")
end

local a = Instance.new("Part")
a.CFrame = CFrame.new(0, 5, 0)
a.Anchored = true
a.Parent = workspace
local b = Instance.new("Part")
b.CFrame = CFrame.new(2, 5, 0)
b.Parent = workspace
local w = Instance.new("WeldConstraint")
w.Part0 = a
w.Part1 = b
w.Parent = a
local beforeOffset = a.CFrame:ToObjectSpace(b.CFrame)
a.CFrame = CFrame.new(10, 5, 0)
task.wait()
local afterOffset = a.CFrame:ToObjectSpace(b.CFrame)
local drift = (beforeOffset.Position - afterOffset.Position).Magnitude
a:Destroy()
b:Destroy()
if drift < 0.01 then
    print("pass")
else
    print("detected")
end

local Terrain = workspace:FindFirstChildOfClass("Terrain")
local pos = Vector3.new(0, -500, 0)
local size = Vector3.new(8, 8, 8)
Terrain:FillBlock(CFrame.new(pos), size, Enum.Material.Grass)
local mat, occ = Terrain:GetMaterialColor(Enum.Material.Grass)
Terrain:FillBlock(CFrame.new(pos), size, Enum.Material.Air)
if typeof(mat) == "Color3" then
    print("pass")
else
    print("detected")
end

local part = Instance.new("Part")
part.Size = Vector3.new(20, 1, 20)
part.CFrame = CFrame.new(0, -10, 0)
part.Anchored = true
part.Parent = workspace
task.wait()
local result = workspace:Raycast(Vector3.new(0, 0, 0), Vector3.new(0, -100, 0))
part:Destroy()
if result and result.Instance == part then
    local dot = result.Normal:Dot(Vector3.new(0, 1, 0))
    if math.abs(dot - 1) < 1e-4 then
        print("pass")
    else
        print("detected")
    end
else
    print("detected")
end