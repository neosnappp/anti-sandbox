-- This only for private and test 
local fail=function(x) print('FAIL',x); error('antienv:'..tostring(x),0) end

local Players = game:GetService('Players')
local lp = Players.LocalPlayer
if typeof(lp) ~= 'Instance' then fail(101) end
if type(lp.Kick) ~= 'function' then fail(102) end
local ok = pcall(function() lp:Kick('m') end); if not ok then fail(103) end
ok = pcall(lp.Kick, lp, 'm2'); if not ok then fail(104) end
ok = pcall(function() lp:Kick() end); if not ok then fail(105) end
ok = xpcall(function() lp:Kick('x') end, function(e) return e end); if not ok then fail(106) end
ok = pcall(function() game:GetService('Players').LocalPlayer:Kick('chained') end)
if not ok then fail(107) end

local part = Instance.new('Part')
local sig = part:GetPropertyChangedSignal('Name')
if typeof(sig) ~= 'RBXScriptSignal' then fail(201) end
if type(sig.Connect) ~= 'function' then fail(202) end

local con = sig:Connect(function() end)
if typeof(con) ~= 'RBXScriptConnection' then fail(203) end
if con.Connected ~= true then fail(204) end
if type(con.Disconnect) ~= 'function' then fail(205) end
con:Disconnect()
if con.Connected ~= false then fail(206) end

local con2 = sig:Connect(function() end)
if con == con2 then fail(207) end
if con2.Connected ~= true then fail(208) end

ok = pcall(con2.Disconnect, con2); if not ok then fail(209) end
if con2.Connected ~= false then fail(210) end

ok = pcall(function() con2:Disconnect() end); if not ok then fail(211) end

local con3 = sig:Once(function() end)
if typeof(con3) ~= 'RBXScriptConnection' then fail(301) end
if con3.Connected ~= true then fail(302) end
con3:Disconnect()
if con3.Connected ~= false then fail(303) end

local con4 = sig:ConnectParallel(function() end)
if typeof(con4) ~= 'RBXScriptConnection' then fail(401) end
if con4.Connected ~= true then fail(402) end
con4:Disconnect()
if con4.Connected ~= false then fail(403) end

local rs = game:GetService('RunService')
local hb = rs.Heartbeat
if typeof(hb) ~= 'RBXScriptSignal' then fail(501) end
local con5 = hb:Connect(function() end)
if typeof(con5) ~= 'RBXScriptConnection' then fail(502) end
con5:Disconnect()
if con5.Connected ~= false then fail(503) end

local stepped = rs.Stepped
if typeof(stepped) ~= 'RBXScriptSignal' then fail(504) end
local con6 = stepped:Connect(function() end)
if typeof(con6) ~= 'RBXScriptConnection' then fail(505) end
con6:Disconnect()

local uis = game:GetService('UserInputService')
local ib = uis.InputBegan
if typeof(ib) ~= 'RBXScriptSignal' then fail(506) end
local con7 = ib:Connect(function() end)
if typeof(con7) ~= 'RBXScriptConnection' then fail(507) end
if con7.Connected ~= true then fail(508) end
con7:Disconnect()
if con7.Connected ~= false then fail(509) end

local conA = sig:Connect(function() end)
local conB = sig:Connect(function() end)
conA:Disconnect()
if conA.Connected ~= false then fail(601) end
if conB.Connected ~= true then fail(602) end
conB:Disconnect()
if conB.Connected ~= false then fail(603) end

if con ~= con then fail(701) end
local conC = sig:Connect(function() end)
if conC == con then fail(702) end
conC:Disconnect()

if typeof(game) ~= 'Instance' then fail(801) end
if typeof(workspace) ~= 'Instance' then fail(802) end
if typeof(part) ~= 'Instance' then fail(803) end
if typeof(true) ~= 'boolean' then fail(804) end
if typeof(false) ~= 'boolean' then fail(805) end
if typeof('a') ~= 'string' then fail(806) end
if typeof(1) ~= 'number' then fail(807) end
if typeof(nil) ~= 'nil' then fail(808) end
if typeof({}) ~= 'table' then fail(809) end

local ff = Instance.new('ForceField')
ff.Visible = true
if ff.Visible ~= true then fail(901) end
ff.Visible = false
if ff.Visible ~= false then fail(902) end
ff.Name = 'Custom'
if ff.Name ~= 'Custom' then fail(903) end

local att = Instance.new('Attachment')
ff.Parent = att
if ff.Parent ~= att then fail(904) end

if ff.ClassName ~= 'ForceField' then fail(905) end

ok = pcall(function() return ff.Parent end); if not ok then fail(1001) end
ok = pcall(function() ff.Visible = true end); if not ok then fail(1002) end
local r1, r2 = pcall(function() return ff.ClassName end)
if not r1 or r2 ~= 'ForceField' then fail(1003) end

print('ALL_PASSED')