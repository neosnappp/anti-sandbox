local parts = {}
local targets = {}
for i = 1, 5 do
    local p = Instance.new("Part")
    p.Anchored = true
    p.Parent = workspace
    table.insert(parts, p)
    table.insert(targets, CFrame.new(i * 10, 50, 0))
end
workspace:BulkMoveTo(parts, targets, Enum.BulkMoveMode.FireCFrameChanged)
local allMatch = true
for i, p in ipairs(parts) do
    if (p.CFrame.Position - targets[i].Position).Magnitude > 1e-3 then
        allMatch = false
    end
    p:Destroy()
end
if allMatch then
    print("pass")
else
    print("detected")
end