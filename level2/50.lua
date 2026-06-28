-- 1
local Players = game:GetService("Players")

local ok, player = pcall(function()
    return Players:GetPlayerFromCharacter(workspace)
end)

if ok and player == nil then
else
   print'1' -- inf loop here
end

-- code below runs fine in a exec.
print'pass'