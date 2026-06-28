local ok, n = pcall(function()
    return game:GetService("NetworkClient")
end)

if not ok or not n or not n:FindFirstChild("ClientReplicator") then
    error("dtc 3 | [project by BELGUGA]  <3") 
end

local ok2, c = pcall(function()
    return game:GetService("Chat")
end)

if not ok2 or not c or not c.Parent or c.Parent.Name ~= "ugc" then
    error("dtc 4 | [project by BELGUGA]  <3") 
end

-- [[ SCRIPT GOES HERE OMG ]]
print("safe kawaiii uwu!!")