local test = 0
local function out(cond)
    test += 1
    if cond then
        print("pass test "..test)
    else
        print("failed test "..test)
    end
end

-- 1
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
out(states[1] == Enum.PlaybackState.Begin and states[2] == Enum.PlaybackState.Playing and states[3] == Enum.PlaybackState.Completed)

-- 2
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
out(#results == 1 and results[1] == part)

-- 3
local rx = CFrame.Angles(math.rad(90), 0, 0)
local ry = CFrame.Angles(0, math.rad(90), 0)
local ab = rx * ry
local ba = ry * rx
local lookDiff = (ab.LookVector - ba.LookVector).Magnitude
out(lookDiff > 1e-4)

-- 4
local SoundService = game:GetService("SoundService")
local listenerType = SoundService:GetListener()
out(typeof(listenerType) == "EnumItem" and listenerType.EnumType == Enum.ListenerType)

-- 5
local Terrain = workspace:FindFirstChildOfClass("Terrain")
local region = Region3.new(Vector3.new(0, 900, 0), Vector3.new(4, 904, 4))
local materials = Terrain:ReadVoxels(region, 4)
local allAir = true
for _, layer in ipairs(materials) do
    for _, row in ipairs(layer) do
        for _, mat in ipairs(row) do
            if mat ~= Enum.Material.Air then
                allAir = false
            end
        end
    end
end
out(allAir)

-- 6
local folder = Instance.new("Folder")
folder.Parent = workspace
local result = folder:WaitForChild("NonExistentChild", 0.1)
folder:Destroy()
out(result == nil)

-- 7
local wrapped = coroutine.wrap(function()
    coroutine.yield(1)
    error("wrappedError")
end)
local first = wrapped()
local ok, err = pcall(wrapped)
out(first == 1 and not ok and string.find(err, "wrappedError", 1, true))

-- 8
local t = table.freeze({ x = 10, y = 20 })
local frozen = table.isfrozen(t)
local ok = pcall(function()
    t.x = 99
end)
out(frozen and not ok and t.x == 10)

-- 9
local Lighting = game:GetService("Lighting")
local original = Lighting.ClockTime
Lighting.ClockTime = 13.75
local readback = Lighting.ClockTime
local mins = Lighting:GetMinutesAfterMidnight()
Lighting.ClockTime = original
out(math.abs(readback - 13.75) < 1e-4 and math.abs(mins - 825) < 0.1)

-- 10
local Lighting = game:GetService("Lighting")
local original = Lighting.ClockTime
Lighting.ClockTime = 13.75
local readback = Lighting.ClockTime
local mins = Lighting:GetMinutesAfterMidnight()
Lighting.ClockTime = original
out(math.abs(readback - 13.75) < 1e-4 and math.abs(mins - 825) < 0.1)

-- 11
local bc = BrickColor.new("Bright red")
local c3 = bc.Color
local reconstructed = BrickColor.new(Color3.new(c3.R, c3.G, c3.B))
out(reconstructed.Number == bc.Number and type(bc.Number) == "number" and bc.Number > 0)