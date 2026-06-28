if game.Close ~= game.Close then warn("fail 1")  end
if game.ClassName ~= "DataModel" then warn("fail 3")  end
if workspace.ClassName ~= "Workspace" then warn("fail 4")  end
if typeof(game) ~= "Instance" then warn("fail 5")  end
if typeof(workspace) ~= "Instance" then warn("fail 6")  end
if game:GetService("RunService").ClassName ~= "RunService" then warn("fail 7")  end
if game:GetService("Lighting").ClassName ~= "Lighting" then warn("fail 8")  end
if pcall(game.Clone, game) then warn("fail 9")  end
if typeof(game.Changed) ~= "RBXScriptSignal" then warn("fail 10")  end
if typeof(workspace.Changed) ~= "RBXScriptSignal" then warn("fail 11")  end
if rawget(_G, "hookfunction") then warn("fail 12")  end
if rawget(_G, "newcclosure") then warn("fail 13")  end
if rawget(_G, "readfile") then warn("fail 14")  end
if rawget(_G, "writefile") then warn("fail 15")  end
if rawget(getgenv(), "getrenv") then else warn("fail 16")  end
local TweenService = game:GetService("TweenService")
local part = Instance.new("Part")
local bad = {Position = "ENV_LOGGER_DETECTED_BITCH", CFrame = true}
if pcall(function() TweenService:Create(part, TweenInfo.new(1), bad) end) then 
    warn("fail 18") 
    part:Destroy()
end
part:Destroy()
local GuiService = game:GetService("GuiService")
local old = GuiService.SelectedObject
GuiService.SelectedObject = nil
task.wait()
if GuiService.SelectedObject ~= nil then warn("fail 19")  end
GuiService.SelectedObject = old
local StarterGui = game:GetService("StarterGui")
local orig = StarterGui.ResetPlayerGuiOnSpawn
StarterGui.ResetPlayerGuiOnSpawn = not orig
task.wait(0.05)
if StarterGui.ResetPlayerGuiOnSpawn == orig then warn("fail 20")  end
StarterGui.ResetPlayerGuiOnSpawn = orig
local buf = buffer.create(16)
buffer.writeu8(buf, 0, 0xde)
buffer.writeu8(buf, 15, 0xad)
if pcall(function() buffer.writeu32(buf, 999999, 0xcafebabe) end) then warn("fail 21")  end
local Http = game:GetService("HttpService")
local jOk, jRes = pcall(Http.JSONDecode, Http, '[68, "sigma", true, 123, false, [321, null, "daddy"], null, ["a"]]')
if not jOk or typeof(jRes) ~= "table" then warn("fail 22")  end
local mt = getmetatable(game)
if mt == nil or mt.__namecall == nil or mt.__index == nil then else warn("fail 24")  end
local count = 0
pcall(function()
    for i = 1, 40 do
        debug.getinfo(1)
        count = count + 1
    end
end)
if count > 30 then else warn("fail 25")  end
local co = coroutine.running()
if typeof(co) ~= "thread" then warn("fail 26")  end
if typeof(workspace.CurrentCamera) ~= "Instance" then warn("fail 27")  end
if workspace.CurrentCamera.ClassName ~= "Camera" then warn("fail 28")  end

print("pass")