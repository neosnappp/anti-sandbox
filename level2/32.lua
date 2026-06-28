local p = Instance.new("Part")
p.Size = Vector3.new(10, 10, 10)
p.Shape = Enum.PartType.Ball
p.Parent = workspace
local params = RaycastParams.new()
params.FilterDescendantsInstances = {p}
params.FilterType = Enum.RaycastFilterType.Include
local result = workspace:Raycast(p.Position + Vector3.new(0, 10, 0), Vector3.new(0, -20, 0), params)
if not result or math.abs(result.Position.Y - (p.Position.Y + 5)) > 0.1 then
    print("detected")
else
    print("pass")
end
p:Destroy()