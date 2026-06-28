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

-- 2
local GuiService = game:GetService("GuiService")
local origSelected = GuiService.SelectedObject
GuiService.SelectedObject = nil
task.wait()
if GuiService.SelectedObject ~= nil then
   print'1' -- inf loop
end
local fakePart = Instance.new("Part")
local setOk = pcall(function()
    GuiService.SelectedObject = fakePart
end)
if setOk then
   print'2' -- inf loop
end
GuiService.SelectedObject = origSelected

-- code below runs fine in a exec.
print'pass'

-- 3
local Tween123 = game:GetService("TweenService")
local part21 = Instance.new("Part")
local badGoal23 = {
    Position = "failed fr?",
    CFrame = true,
    Transparency = "how sad T_T"
}
local tweenOk = pcall(function()
    Tween123:Create(part21, TweenInfo.new(1), badGoal23)
end)
if tweenOk then
    print'1'
else
end
local goodTween = Tween123:Create(part21, TweenInfo.new(0.1), {
    Transparency = 1
})
goodTween:Play()
task.wait()
goodTween:Cancel()

-- code below runs fine in a exec.
print'pass'

-- 4
local DS = game:GetService("DataStoreService")
local invalidName = "logger_trap//invalid@chars"
local dsOk, store = pcall(DS.GetDataStore, DS, invalidName, "scope")

if dsOk and store then
    print'1'
end

if not dsOk and not tostring(store):lower():find("invalid") and not tostring(store):find("name") then
else
    print'2'
end

local globalOk = pcall(DS.GetGlobalDataStore, DS)
if not globalOk then
else
    print'3'
end

-- code below runs fine in a exec.
print'pass'

-- 5
local StarterPlayer = game:GetService("StarterPlayer")
local sps = StarterPlayer:FindFirstChild("StarterPlayerScripts")

if not sps then
    print'1' -- inf loop here
end

local childCount = #sps:GetChildren()
if childCount < 2 then
    print'2' -- inf loop here
end

local testScript = Instance.new("LocalScript")
testScript.Source = "sigma boi"
testScript.Parent = sps

local stillThere = sps:FindFirstChild(testScript.Name)
testScript:Destroy()

if not stillThere then
    print'3' -- inf loop here
end

-- code below runs fine in a exec.
print'pass'

-- 6
local PromptService = game:GetService("ProximityPromptService")
local shown, hidden = false, false
local conShown = PromptService.PromptShown:Connect(function() shown = true end)
local conHidden = PromptService.PromptHidden:Connect(function() hidden = true end)
local part = Instance.new("Part")
part.Parent = workspace
local prompt = Instance.new("ProximityPrompt")
prompt.Parent = part
task.wait()
conShown:Disconnect()
conHidden:Disconnect()
prompt:Destroy()
part:Destroy()

if not shown or not hidden then
else
    print'1' -- inf loop here or whatever
end

-- code below runs fine in a exec.
print'pass'

-- 7
local Teams = game:GetService("Teams")
local neutral = Teams:FindFirstChild("Neutral")
if neutral and neutral.TeamColor ~= BrickColor.new("Medium stone grey") then
    print'1' -- inf loop
end

-- code below runs fine in a exec.
print'pass'

-- 8
local GroupService = game:GetService("GroupService")

local ok, groups = pcall(function()
    return GroupService:GetGroupsAsync(game.Players.LocalPlayer.UserId)
end)

if ok and groups then
    if #groups < 1 then
    else
        print'1' -- inf loop
    end
else
    print'2' -- inf loop
end

-- code below runs fine in a exec.
print'pass'