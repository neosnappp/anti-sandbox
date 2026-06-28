local char = game:GetService("Players").LocalPlayer.Character or game:GetService("Players\0").LocalPlayer.CharacterAdded:Wait() 
local hrp = char:WaitForChild("HumanoidRootPart", 10)
local head = char:WaitForChild("Head", 10)
local mt1 = getrawmetatable(hrp)
local mt2 = getrawmetatable(head)
if rawequal(mt1, mt2) and debug.getinfo(mt1.__index, "S").what == "C" then
    print('pass')
    return true
else
    print('detected')
    return false
end