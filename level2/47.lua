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