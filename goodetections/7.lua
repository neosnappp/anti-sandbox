local Part = Instance.new("Part")
Part.Name = "abc"
Part.Anchored = false
Part.CanCollide = false
Part.Parent = workspace
while Part.Position.Y > workspace.FallenPartsDestroyHeight do
    task.wait()
end