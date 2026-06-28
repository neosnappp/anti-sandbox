local part = Instance.new("Part")
local firedProp = nil

part:GetPropertyChangedSignal("Name"):Connect(function()
    firedProp = part.Name
end)

part.Name = "DetectProbe"
task.wait(0.05)

if firedProp == "DetectProbe" then
    print("pass")
else
    print("failed") 
end

part:Destroy()