local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

if not Players or not RunService then
    error("environment mismatch")
    while true do task.wait() end
end

local count = #Players:GetPlayers()

if count <= 0 then
    error("env logger")
    while true do task.wait() end
end

print("pass")