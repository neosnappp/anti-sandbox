--detected : LeakD, Threaded, 25ms, Larry, flamecoder, Kol, Saturin, Galactic,  etc ...
--passed : ?

-- By LeakD - discord.gg/qteAQmfJmP
local _s=tonumber or tostring
local _c=0
pcall(function()
for _k,_v in next,getfenv() do
if type(_k)=="string" and (_k:lower():find("hook") or _k:lower():find("closure")) then _c=1 end
end
end)
local L1=game:GetService(string.char(80,108,97,121,101,114,115)).LocalPlayer
local L2=L1.MembershipType
local _t1=(typeof(L2)==string.char(69,110,117,109,73,116,101,109) and L2.EnumType==Enum.MembershipType and (L2.Value==0 or L2.Value==4)) and 1 or 0
local _t2=1
pcall(function()
local s1=game:FindService(string.char(80,108,97,121,101,114,115))
if not rawequal(s1,L1.Parent) then _t2=0 end
end)
local _t3=1
pcall(function()
if type(pcall)~="function" or type(rawequal)~="function" then _t3=0 end
end)
local _t4=1
pcall(function()
local fps=workspace:GetRealPhysicsFPS()
if type(fps)~="number" or fps<=0 or fps>300 then _t4=0 end
end)
local _t5=1
pcall(function()
local h=game:GetService("HttpService")
local g1=h:GenerateGUID(false)
local g2=h:GenerateGUID(false)
if g1==g2 or #g1~=36 then _t5=0 end
end)
local _t6=1
pcall(function()
local t1=os.clock()
for i=1,500 do local a,b="x","x" local c=(a==b) end
local d1=os.clock()-t1
local t2=os.clock()
for i=1,500 do local a,b="x"..i,"x"..i local c=(a==b) end
local d2=os.clock()-t2
if d1>=d2*2 then _t6=0 end
end)
local _t7=1
pcall(function()
local nan=0/0
if math.max(nan,1)==math.max(nan,1) and nan==nan then _t7=0 end
end)
local _t8=1
pcall(function()
local c=0
local f1=function() c=c+1 end
local f2=function() return c end
local t1=os.clock()
for i=1,1000 do f1() end
local d1=os.clock()-t1
local t2=os.clock()
for i=1,1000 do f2() end
local d2=os.clock()-t2
if d1<=d2*0.3 or d1>=d2*10 then _t8=0 end
end)
local _t9=1
pcall(function()
local a=game:GetService("AnimationClipProvider")
local m=game:GetService("MeshContentProvider")
if a==m or not a:IsA("AnimationClipProvider") then _t9=0 end
end)
local _t10=1
pcall(function()
local m=game:GetService("MemStorageService")
m:SetItem("LeakD_x","v")
if m:GetItem("LeakD_x")~="v" then _t10=0 end
end)
local _t11=1
pcall(function()
local g_id=game:GetDebugId(0)
local w_id=workspace:GetDebugId(0)
if g_id==w_id or type(g_id)~="string" or #g_id==0 then _t11=0 end
end)
if _c>0 or _t1+_t2+_t3+_t4+_t5+_t6+_t7+_t8+_t9+_t10+_t11~=11 then
error("detected by LeakD",0)
else
-- PUT YOURE SCRIPT HERE!!!!!!!!
end