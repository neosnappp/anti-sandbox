local part = Instance.new("Part")
part.CFrame = CFrame.new(0, 400, 0)
part.Anchored = false
part.Parent = workspace
local spinAxis = Vector3.new(0, 1, 0)
part:ApplyAngularImpulse(spinAxis * 500)
task.wait(0.1)
local angVel = part.AssemblyAngularVelocity
part:Destroy()
local dot = math.abs(angVel.Unit:Dot(spinAxis))
if angVel.Magnitude > 0 and dot > 0.9 then
    print("pass")
else
    print("detected")
end