local ok, part = pcall(function() return Instance.new("Part") end)
if not ok or not part then
    return "dtc 1 | [project diamond] @ discord.gg//qkFtAxfj3M by unix aka xlum20 <3"
end

part.Archivable = true
local c = part:Clone()
if not c then
    return "dtc 2 | [project diamond] @ discord.gg//qkFtAxfj3M by unix aka xlum20 <3"
end

part.Archivable = false
local okClone, c2 = pcall(function() return part:Clone() end)
if okClone and c2 then
    return "dtc 3 | [project diamond] @ discord.gg//qkFtAxfj3M by unix aka xlum20 <3"
end

local okDes, err = pcall(function() part:Destroy() end)
if not okDes then
    return "dtc 4 | [project diamond] @ discord.gg//qkFtAxfj3M by unix aka xlum20 <3"
end

local t = Instance.new("Part")
t:SetAttribute("pd2", 123)
if t:GetAttribute("pd2") ~= 123 then
    return "dtc 5 | [project diamond] @ discord.gg//qkFtAxfj3M by unix aka xlum20 <3"
end

local cs = game:GetService("CollectionService")
t:AddTag("pd3")
if not t:HasTag("pd3") then
    return "dtc 6 | [project diamond] @ discord.gg//qkFtAxfj3M by unix aka xlum20 <3"
end
t:RemoveTag("pd3")
if t:HasTag("pd3") then
    return "dtc 7 | [project diamond] @ discord.gg//qkFtAxfj3M by unix aka xlum20 <3"
end

local model = Instance.new("Model")
t.Parent = model
if not t:IsDescendantOf(model) or not model:IsAncestorOf(t) then
    return "dtc 8 | [project diamond] @ discord.gg//qkFtAxfj3M by unix aka xlum20 <3"
end

local child = Instance.new("Folder", model)
if #model:GetChildren() == 0 or #model:GetDescendants() == 0 then
    return "dtc 9 | [project diamond] @ discord.gg//qkFtAxfj3M by unix aka xlum20 <3"
end
model:ClearAllChildren()
if #model:GetChildren() ~= 0 then
    return "dtc 10 | [project diamond] @ discord.gg//qkFtAxfj3M by unix aka xlum20 <3"
end

local part2 = Instance.new("Part", model)
if model:FindFirstChild(part2.Name) ~= part2 then
    return "dtc 11 | [project diamond] @ discord.gg//qkFtAxfj3M by unix aka xlum20 <3"
end
if model:FindFirstChildOfClass("Part") ~= part2 then
    return "dtc 12 | [project diamond] @ discord.gg//qkFtAxfj3M by unix aka xlum20 <3"
end
if model:FindFirstChildWhichIsA("BasePart") ~= part2 then
    return "dtc 13 | [project diamond] @ discord.gg//qkFtAxfj3M by unix aka xlum20 <3"
end

local folder = Instance.new("Folder")
task.spawn(function() task.wait(0.1) folder.Parent = model end)
if not model:WaitForChild(folder.Name, 1) then
    return "dtc 14 | [project diamond] @ discord.gg//qkFtAxfj3M by unix aka xlum20 <3"
end

folder:SetAttribute("pd4", true)

if type(part.Sandboxed) ~= "boolean" then
    return "dtc 15 | [project diamond] @ discord.gg//qkFtAxfj3M by unix aka xlum20 <3"
end
if not part.UniqueId then
    return "dtc 16 | [project diamond] @ discord.gg//qkFtAxfj3M by unix aka xlum20 <3"
end

print("pass")