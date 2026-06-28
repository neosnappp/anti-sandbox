if game.Close ~= game.Close then error("fail 1")  end
if game.ClassName ~= "DataModel" then error("fail 3")  end
if workspace.ClassName ~= "Workspace" then error("fail 4")  end
if typeof(game) ~= "Instance" then error("fail 5")  end
if typeof(workspace) ~= "Instance" then error("fail 6")  end
if game:GetService("RunService").ClassName ~= "RunService" then error("fail 7")  end
if game:GetService("Lighting").ClassName ~= "Lighting" then error("fail 8")  end
if pcall(game.Clone, game) then error("fail 9")  end
if typeof(game.Changed) ~= "RBXScriptSignal" then error("fail 10")  end
if typeof(workspace.Changed) ~= "RBXScriptSignal" then error("fail 11")  end
if rawget(_G, "hookfunction") then error("fail 12")  end
if rawget(_G, "newcclosure") then error("fail 13")  end
if rawget(_G, "readfile") then error("fail 14")  end
if rawget(_G, "writefile") then error("fail 15")  end
if rawget(getgenv(), "getrenv") then else error("fail 16")  end
local TweenService = game:GetService("TweenService")
local part = Instance.new("Part")
local bad = {Position = "ENV_LOGGER_DETECTED_BITCH", CFrame = true}
if pcall(function() TweenService:Create(part, TweenInfo.new(1), bad) end) then 
    error("fail 18") 
    part:Destroy()
end
part:Destroy()
local GuiService = game:GetService("GuiService")
local old = GuiService.SelectedObject
GuiService.SelectedObject = nil
task.wait()
if GuiService.SelectedObject ~= nil then error("fail 19")  end
GuiService.SelectedObject = old
local StarterGui = game:GetService("StarterGui")
local orig = StarterGui.ResetPlayerGuiOnSpawn
StarterGui.ResetPlayerGuiOnSpawn = not orig
task.wait(0.05)
if StarterGui.ResetPlayerGuiOnSpawn == orig then error("fail 20")  end
StarterGui.ResetPlayerGuiOnSpawn = orig
local buf = buffer.create(16)
buffer.writeu8(buf, 0, 0xde)
buffer.writeu8(buf, 15, 0xad)
if pcall(function() buffer.writeu32(buf, 999999, 0xcafebabe) end) then error("fail 21")  end
local Http = game:GetService("HttpService")
local jOk, jRes = pcall(Http.JSONDecode, Http, '[68, "sigma", true, 123, false, [321, null, "daddy"], null, ["a"]]')
if not jOk or typeof(jRes) ~= "table" then error("fail 22")  end
local mt = getmetatable(game)
if mt == nil or mt.__namecall == nil or mt.__index == nil then else error("fail 24")  end
local count = 0
pcall(function()
    for i = 1, 40 do
        debug.getinfo(1)
        count = count + 1
    end
end)
if count > 30 then else error("fail 25")  end
local co = coroutine.running()
if typeof(co) ~= "thread" then error("fail 26")  end
if typeof(workspace.CurrentCamera) ~= "Instance" then error("fail 27")  end
if workspace.CurrentCamera.ClassName ~= "Camera" then error("fail 28")  end

print("pass")