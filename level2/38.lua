local env = getfenv()
local tostr = env.tostring
local typ = env.type
local pcall = env.pcall
local wait = env.task.wait
local spawn = env.task.spawn
local loadstring = env.loadstring
local find = env.string.find
local game = env.game or game
local clock = env.os.clock
local random = env.math.random

local function kick()
    error("failed", 0)
    while true do wait(0) end
end

local nativePat = "^function: 0x"

local function checkFns()
    if not find(tostr(wait), nativePat) then kick() end
    if not find(tostr(spawn), nativePat) then kick() end
    if not find(tostr(loadstring), nativePat) then kick() end
end

local lsSig = tostr(loadstring)

local function checkLS()
    if tostr(loadstring) ~= lsSig then kick() end
    local fn = loadstring("return 2+2")
    if typ(fn) ~= "function" then kick() end
    local ok, val = pcall(fn)
    if not ok or val ~= 4 then kick() end
end

local function checkEnv()
    if not pcall(function() return game:GetService("ScriptContext") end) then kick() end
    local ok, rs = pcall(function() return game:GetService("RunService") end)
    if ok and rs:IsClient() and rs:IsServer() then kick() end
    if (0/0) == (0/0) then kick() end
end

local function checkTime()
    local t = clock()
    local n = 0
    for i = 1, 1000 do n += 1 end
    if clock() - t > 0.05 then kick() end
end

checkFns()
checkLS()
checkEnv()
checkTime()

local heartbeat = {0}

spawn(function()
    while true do
        wait(random(20, 40) / 10)
        checkFns()
        checkLS()
        checkEnv()
        heartbeat[1] += 1
    end
end)

spawn(function()
    local last = heartbeat[1]
    wait(8)
    while true do
        if heartbeat[1] == last then kick() end
        last = heartbeat[1]
        wait(8)
    end
end)

-- your code here
print("pass")