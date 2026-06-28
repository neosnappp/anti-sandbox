-- By LeakD  - discord.gg/qteAQmfJmP

local LeakD128 = game:GetService("MemStorageService")
local LeakD129 = "a/b/c::special"
LeakD128:SetItem(LeakD129, "valeur")
local LeakD130 = LeakD128:GetItem(LeakD129)
if LeakD130 ~= "valeur" then error("failed", 0) end

local LeakD131 = game:GetService("HttpService")
local LeakD132 = LeakD131:JSONEncode({x=1, y=2, nested={z=3}})
LeakD128:SetItem("LeakD133", LeakD132)
local LeakD134 = LeakD128:GetItem("LeakD133")
local LeakD135 = LeakD131:JSONDecode(LeakD134)
if LeakD135.x ~= 1 or LeakD135.y ~= 2 then error("failed", 0) end
if LeakD135.nested.z ~= 3 then error("failed", 0) end

LeakD128:SetItem("LeakD136", "abc")
LeakD128:SetItem("LeakD136", "xyz")
local LeakD137 = LeakD128:GetItem("LeakD136")
if LeakD137 ~= "xyz" then error("failed", 0) end
if type(LeakD137) ~= "string" then error("failed", 0) end

local LeakD140 = game:GetService("AdService")
if typeof(LeakD140) ~= "Instance" then error("failed", 0) end
if not LeakD140:IsA("AdService") then error("failed", 0) end
if LeakD140.ClassName ~= "AdService" then error("failed", 0) end

local LeakD141 = game:GetService("CollectionService")
local LeakD142 = LeakD141:GetTagged("__inexistant_tag_leakd__")
if type(LeakD142) ~= "table" then error("failed", 0) end
if #LeakD142 ~= 0 then error("failed", 0) end
local LeakD143 = LeakD141:GetInstanceAddedSignal("__tag_leakd__")
local LeakD144 = LeakD141:GetInstanceAddedSignal("__tag_leakd__")
if LeakD143 ~= LeakD144 then error("failed", 0) end

local LeakD145 = pcall(function()
    local LeakD146 = game:GetService("DebuggerManager")
    if typeof(LeakD146) ~= "Instance" then error("failed", 0) end
end)
if LeakD145 then error("failed", 0) end

-- your script here
print("if you see this in env lgoger, then its gud.")