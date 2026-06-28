local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

if typeof(rootPart.CFrame) == "CFrame" then
    print("pass")
else
    print("failed")
end