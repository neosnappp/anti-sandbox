-- By LeakD - discord.gg/qteAQmfJmP

local LeakD1 = pcall(function()
    local a = game:GetService("AchievementService")
    if a == nil then error("LeakD Is Best", 2) end
    if a.ClassName ~= "AchievementService" then error("LeakD Is Best", 2) end
    if type(a.IsAvailable) ~= "function" then error("LeakD Is Best", 2) end
    if type(a.HasAchieved) ~= "function" then error("LeakD Is Best", 2) end
    if type(a.GrantAchievement) ~= "function" then error("LeakD Is Best", 2) end
    local b = a:IsAvailable()
    if type(b) ~= "boolean" then error("LeakD Is Best", 2) end

    local c = game:GetService("PlayerViewService")
    if c == nil then error("LeakD Is Best", 2) end
    if c.ClassName ~= "PlayerViewService" then error("LeakD Is Best", 2) end
    if type(c.GetDeviceCameraCFrame) ~= "function" then error("LeakD Is Best", 2) end
    if type(c.GetDeviceCameraCFrameForSelfView) ~= "function" then error("LeakD Is Best", 2) end
    if type(c.UpdateDeviceCFrame) ~= "function" then error("LeakD Is Best", 2) end
    local d = c:GetDeviceCameraCFrameForSelfView()
    if typeof(d) ~= "CFrame" then error("LeakD Is Best", 2) end

    local e = game:GetService("AppLifecycleObserverService")
    if e == nil then error("LeakD Is Best", 2) end
    if e.ClassName ~= "AppLifecycleObserverService" then error("LeakD Is Best", 2) end
end)

if not LeakD1 then
    error("LeakD Is Best", 2)
end

print'pass'