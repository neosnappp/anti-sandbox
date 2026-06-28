local fail = false

local co = coroutine.create(function()
    coroutine.yield(10)
    coroutine.yield(20)
end)
local _, v1 = coroutine.resume(co)
local _, v2 = coroutine.resume(co)
if v1 ~= 10 or v2 ~= 20 then fail = true end

local mt = setmetatable({}, {__index = function(_, k) return k .. "ok" end})
if mt["env"] ~= "envok" then fail = true end

local coder = setmetatable({}, {__newindex = function() end})
rawset(coder, "val", 42)
if rawget(coder, "val") ~= 42 then fail = true end

pcall(function()
    local a = game:GetService("Players")
    local b = game:GetService("Players")
    if a ~= b then fail = true end
end)

pcall(function()
    local obj = Instance.new("Part")
    obj.Parent = workspace
    obj:Destroy()
    if obj.Parent ~= nil then fail = true end
end)

pcall(function()
    local s = Instance.new("Sound")
    if pcall(function() s.PlaybackLoudness = 5 end) then fail = true end
    s:Destroy()
end)

if fail then
    print("fail")
else
    print("pass")
end