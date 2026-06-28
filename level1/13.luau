-- Made by Project Diamond (Unix Anti-Env Logger) https://discord.gg/X8Y2JmxJCZ
local finished = false

task.delay(5, function()
    if not finished then
        while true do end
    end
end)

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
while not Player do
    Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
    Player = Players.LocalPlayer
end

local PlayerGui = Player:WaitForChild("PlayerGui")

local fired = false
local nonce = tostring({})
local legitThread = coroutine.running()

local function diamond(key, caller)
    if key ~= nonce or caller ~= legitThread then
        warn("dtc1")
        return
    end
    fired = true
end

local b = Instance.new("TextButton")
b.Parent = PlayerGui
b.Size = UDim2.new(0,100,0,50)
b.Text = "project diamond anti env logger <3 by unix https://discord.gg/X8Y2JmxJCZ "

b.MouseButton1Click:Connect(function()
    diamond(nonce, coroutine.running())
end)

task.defer(function()
    diamond(nonce, legitThread)
end)

task.spawn(function()
    while true do
        if fired then
            fired = false
        end
        task.wait()
    end
end)


finished = true

--[[ SCRIPT GOES HERE GUYS omg ]]--
print("this passed env logger check")