-- Made by Project Diamond (Unix Anti-Env Logger) https://discord.gg/X8Y2JmxJCZ
local players = game:GetService("Players")
local lp = players.LocalPlayer

if debug.getinfo(print).what ~= "C" then
    error("dtc 1 | [project diamond] @ discord.gg//qkFtAxfj3M by unix aka xlum20 <3")
end

if lp then
    local p = lp:FindFirstChild("PlayerScripts")
    if not p
    or not p:FindFirstChild("PlayerModule")
    or not p:FindFirstChild("RbxCharacterSounds") then
        error("dtc 2 | [project diamond] @ discord.gg//qkFtAxfj3M by unix aka xlum20 <3")
    end
else
    error("dtc 2| [project diamond] @ discord.gg//qkFtAxfj3M by unix aka xlum20 <3")
end

local ok, n = pcall(function()
    return game:GetService("NetworkClient")
end)

if not ok or not n or not n:FindFirstChild("ClientReplicator") then
    error("dtc 3 | [project diamond] @ discord.gg//qkFtAxfj3M by unix aka xlum20 <3")
end

local ok2, c = pcall(function()
    return game:GetService("Chat")
end)

if not ok2 or not c or not c.Parent or c.Parent.Name ~= "Ugc" then
    error("dtc 4 | [project diamond] @ discord.gg//qkFtAxfj3M by unix aka xlum20 <3")
end
-- [[ SCRIPT GOES HERE OMG ]]
print("pass")