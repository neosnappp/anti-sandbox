-- By LeakD  - discord.gg/qteAQmfJmP

local LeakD101 = game:GetService("LocalizationService")
local LeakD102 = pcall(function()
    local LeakD103 = LeakD101:GetTranslatorForLocaleAsync("tv-tv")
    if typeof(LeakD103) ~= "Instance" then error("t detect pd", 0) end
    if not LeakD103:IsA("Translator") then error("t detect pd", 0) end
    local LeakD104 = LeakD103.LocaleId
    if type(LeakD104) ~= "string" or #LeakD104 == 0 then error("t detect pd", 0) end
end)
if not LeakD102 then error("t detect pd", 0) end

local LeakD105 = game:GetService("CaptureService")
local LeakD106 = typeof(LeakD105.CaptureBegan)
if LeakD106 ~= "RBXScriptSignal" then error("t detect pd", 0) end
local LeakD107 = LeakD105.CaptureBegan:Connect(function() end)
if typeof(LeakD107) ~= "RBXScriptConnection" then error("t detect pd", 0) end
LeakD107:Disconnect()
if LeakD107.Connected ~= false then error("t detect pd", 0) end

local LeakD108 = game:GetService("ContextActionService")
local LeakD109 = LeakD108:GetAllBoundActionInfo()
if type(LeakD109) ~= "table" then error("t detect pd", 0) end
LeakD108:BindAction("LeakD110", function() end, false, Enum.KeyCode.F)
local LeakD111 = LeakD108:GetAllBoundActionInfo()
if LeakD111["LeakD110"] == nil then error("t detect pd", 0) end
if type(LeakD111["LeakD110"].inputTypes) ~= "table" then error("t detect pd", 0) end
if LeakD111["LeakD110"].inputTypes[1] ~= Enum.KeyCode.F then error("t detect pd", 0) end
LeakD108:UnbindAction("LeakD110")

local LeakD112 = OverlapParams.new()
if typeof(LeakD112) ~= "OverlapParams" then error("t detect pd", 0) end
local LeakD113 = LeakD112.MaxParts
if LeakD113 ~= 0 then error("t detect pd", 0) end
local LeakD114 = LeakD112.FilterType
if LeakD114 ~= Enum.RaycastFilterType.Exclude then error("t detect pd", 0) end
LeakD112.MaxParts = 10
if LeakD112.MaxParts ~= 10 then error("t detect pd", 0) end
local LeakD115 = LeakD112.FilterDescendantsInstances
if type(LeakD115) ~= "table" then error("t detect pd", 0) end
if #LeakD115 ~= 0 then error("t detect pd", 0) end

print("pass")