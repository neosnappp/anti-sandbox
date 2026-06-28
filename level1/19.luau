if Enum.Material.Plastic ~= Enum.Material.Plastic then
    error("dtc1 | project diamond discord.gg/fQ2j42dfTf ")
end

local v = Vector3.new(1,2,3) + Vector3.new(4,5,6)

if v.X ~= 5 or v.Y ~= 7 or v.Z ~= 9 then
    error("dtc2 | project diamond discord.gg/fQ2j42dfTf ")
end

local a = game:GetService("Players")
local b = game:GetService("Players")

if a ~= b then
    error("dtc3 | project diamond discord.gg/fQ2j42dfTf")
    return nil
end

local ok, err = pcall(function()
    return loadstring("local a = if true then")()
end)

if ok or not tostring(err):lower():find("attempt to call a nil value") then
    error("dtc4 | project diamond discord.gg/fQ2j42dfTf")
    return nil
end

if game:GetService("Players") ~= game.Players then
    error("dtc5 | project diamond discord.gg/fQ2j42dfTf")
    return nil
end

local p = Instance.new("Part")
local before = tostring(p)
p.Name = "hey env logger! hopefully you pass this check "
local after = tostring(p)
p:Destroy()

if before == after then
    error("dtc6 | project diamond discord.gg/fQ2j42dfTf")
end

local f = Instance.new("Folder")
local c = Instance.new("Folder")
c.Parent = f
f.Parent = workspace

if not c:IsDescendantOf(workspace) then
    error("dtc6 | project diamond discord.gg/fQ2j42dfTf")
end

f:Destroy()
task.wait()

if c.Parent ~= nil then
    error("dtc7 | project diamond discord.gg/fQ2j42dfTf")
end

print("pass")