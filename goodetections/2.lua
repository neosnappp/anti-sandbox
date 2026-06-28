local players = game:GetService("Players")
local lp = players.LocalPlayer
local ps = lp:FindFirstChild("PlayerScripts")
local workspace = game:GetService("Workspace")
local coregui = game:GetService("CoreGui")
local isxeno = coregui:FindFirstChild("DO NOT DELETE: BELONGS TO XENO", true)
local executor = "Unknown"
local appchat = coregui:FindFirstChild("AppChat")
local GI = coregui:FindFirstChild("GameInvite")
local inviscontainter = coregui:FindFirstChild("InvisibleContainer", true)
local devconsole = coregui:FindFirstChild("DevConsoleMaster"):FindFirstChild("DevConsoleWindow"):FindFirstChild("DevConsoleUI"):FindFirstChild("MainView"):FindFirstChild("UtilAndTab"):FindFirstChild("Tabs"):FindFirstChild("Log"):FindFirstChild("BlueHighlight")
local corepackages = game:GetService("CorePackages")
local rs = game:GetService("ReplicatedStorage")
local thing = corepackages:FindFirstChild("Packages"):FindFirstChild("tutils")
local matservice = game:GetService("MaterialService")
local placeid = game.PlaceId
local runservice = game:GetService("RunService")
if tostring(rs.Parent) ~= "Ugc" then
    print("Env Logger: Invalid RepStorage")
    
end
local exec = (identifyexecutor and identifyexecutor()) or ""
print(exec)

if #exec == 0 then
    print("Env Logger: No Executor")
    
end


if not lp.Character or not lp.Character:FindFirstChild("Humanoid") then
	print("Character not fully loaded")
    
end
if runservice:IsStudio() then
	print("Env logger: ran in studio")

	
end
if not coregui:FindFirstChildOfClass("ScreenGui") then
	print("Env logger: invalid coregui")

	
end

if not ps:IsA("PlayerScripts") then
	print("Env logger: invalid ps")

    
end
if game:IsLoaded() == false then
	print("Env logger: isloaded is false")

	
end
if not getfenv or not getrenv then
	print("Env logger: no getfenv or getrenv")

	
end
if type(game.GameId) ~= "number" then
	print("Env logger: invalid gameid")

	
end
if game.GameId == 0 then
	print("Env logger: invalid gameid")

	
end
if not runservice then
	print("Env logger: no runservice")

	
end
if not runservice:IsClient() then
	print("Env logger: not client script")

	
end

if type(placeid) ~= "number" then
	print("Env logger: invalid placeid")

	
end

if not placeid then
    print("Env logger: no placeid")

    
end
if tostring(corepackages.Parent) ~= "Ugc" then
    print("Env logger: invalid corepackages")

    
end
if not matservice then
    print("Env logger: no matservice")

    
end
if not corepackages then
    print("Env logger: no corepackages")
    
end
if not thing then
    print("Env logger: no tutils")
    
end
if not devconsole then
    print("Env logger: devconsole check fail")
    
end

if not inviscontainter then
    print("Env logger: no inviscontainer")
    
end
if not GI then
    print("Env logger: no gi")
    
end
if isxeno then
    executor = "Xeno"
end
if not appchat then
    print("Env logger: no appchat")
    
end
if not appchat:FindFirstChild("InExperienceAppChatProviders") then
    print("Env logger: no InExperienceAppChatProviders")
    
end
if not ps then
    print("Env logger: no ps")
    
end
if not workspace then
    print("Env logger: no workspace")
    
end
if not coregui then
    print("Env logger: no coregui")
    
end
print("good test: ", executor)