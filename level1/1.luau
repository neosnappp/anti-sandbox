

local function _CRASH()
    error("crash",0)
end

local function _FAIL(r)
    warn("got detected: "..r)
    _CRASH()
end

local function check()
if _VERSION~="Luau"then return"not a Luau environment"end
if not time then return"time() missing"end
local loadFn=loadstring or load
if type(loadFn)~="function"then return"no load function available"end
local okA,resA=pcall(function()local f=loadFn("return 123")return f and f()end)
if not okA or resA~=123 then return"loadstring broken"end
local luneChunk=loadFn('return require("@lune/fs")')
if luneChunk and pcall(luneChunk)then return"lune/fs runtime detected"end
local lfsChunk=loadFn('return require("lfs")')
if lfsChunk and pcall(lfsChunk)then return"lfs runtime detected"end
local env1=getfenv()local env2=getfenv()
if env1~=env2 then return"getfenv returned different environments"end
if _SUPER~=nil then return"_SUPER is set"end
if not(Vector3 and Vector2 and UDim2)then return"core Roblox types missing"end
local baseVec=Vector3.one
for i=1,5 do local n=math.random(1,67)if baseVec*n~=Vector3.new(n,n,n)then return"Vector3.one math incorrect"end end
local v3i=Vector3int16.new(1,1,1)local v2i=Vector2int16.new(1,1)
if v3i.X~=v2i.X then return"Vector int16 mismatch"end
if not pcall(function()local p=Instance.new("Part")p.Name="AntiTamperCheck"p:Destroy()end)then return"Instance.new broken or spoofed"end
if not pcall(function()local f=Instance.new("Frame")local tw=game:GetService("TweenService"):Create(f,TweenInfo.new(0.01),{Position=UDim2.fromScale(1,1)})tw:Play()tw.Completed:Wait()f:Destroy()end)then return"TweenService/UI fake env"end
local mt2={}local protected=setmetatable({},mt2)mt2.__metatable="protected"
if getmetatable(protected)~="protected"then return"metatable protection broken"end
if not(getmetatable and setmetatable and type and select and pcall and debug and rawget and rawset and getfenv)then return"missing core globals"end
local trap=setmetatable({},{__index=function()while true do end end})
local ok,mt=pcall(getmetatable,trap)if not ok or type(mt.__index)~="function"then return"metatable trap failed"end
if not pcall(rawset,{}," "," ")then return"rawset broken"end
if getmetatable(require)or getmetatable(print)or getmetatable(error)then return"core func wrapped"end
local dbgInfo=debug.info if not dbgInfo then return"no debug.info"end
local a={dbgInfo(print,'a')}local b={dbgInfo(tostring,'a')}
if a[1]~=0 then return"print argcount wrong"end
if b[1]~=0 then return"tostring argcount wrong"end
if a[2]~=true then return"print vararg flag wrong"end
if select(1,pcall(getfenv,69))==true then return"getfenv invalid level passed"end
local okRaw,d=pcall(rawget,debug,"info")if not okRaw or not d then return"rawget debug.info failed"end
if #d(getfenv,"n")<=1 then return"getfenv name too short"end
if #d(print,"n")<=1 then return"print name too short"end
if d(print,"s")~="[C]" then return"print source not [C]"end
if d(require,"s")~="[C]" then return"require source not [C]"end
if d(function()end,"s")=="[C]" then return"lua func reported as [C]"end
if select(1,pcall(dbgInfo,coroutine.wrap(function()end)(),'s'))~=false then return"dead coroutine didn't error"end
local t=task if type(t)~="table"or type(t.spawn)~="function"or type(t.wait)~="function"then return"task library broken"end
local ran=false local co=t.spawn(function()ran=true end)
if type(co)~="thread"or not ran then return"task.spawn broken"end
if type(spawn)~="function"then return"spawn not function"end
if pcall(function()for _ in game do end end)then return"game is iterable (fake env)"end
if typeof(game)~="Instance"then return"game not Instance"end
local _,gameMsg=pcall(function()game()end)
if not gameMsg or not gameMsg:find("attempt to call a Instance value")then return"game() error msg wrong"end
if game.ClassName~="DataModel"then return"game ClassName wrong"end
if workspace.ClassName~="Workspace"then return"workspace ClassName wrong"end
if typeof(Enum.Material.Plastic)~="EnumItem"then return"Enum type wrong"end
if Enum.Material.Plastic.Value~=256 then return"Enum value wrong"end
if typeof(Enum.HumanoidStateType.Running)~="EnumItem"then return"HumanoidStateType wrong"end
if typeof(game.Changed)~="RBXScriptSignal"then return"game.Changed wrong"end
if typeof(workspace.Changed)~="RBXScriptSignal"then return"workspace.Changed wrong"end
local rs=game:GetService("RunService")
if rs.ClassName~="RunService"then return"RunService ClassName wrong"end
if typeof(rs.Heartbeat)~="RBXScriptSignal"then return"Heartbeat type wrong"end
if rs:IsClient()==rs:IsServer()then return"IsClient/IsServer same"end
local p1=game:GetService("Players")local p2=game:GetService("Players")
if p1~=p2 then return"GetService not singleton"end
if workspace:GetFullName()~="Workspace"then return"workspace GetFullName wrong"end
local part=Instance.new("Part")
if typeof(part)~="Instance"or part.ClassName~="Part"then part:Destroy()return"Part check failed"end part:Destroy()
local snd=Instance.new("Sound")local canSetLoudness=pcall(function()snd.PlaybackLoudness=69 end)snd:Destroy()
if canSetLoudness then return"PlaybackLoudness writable (fake env)"end
local tb=Instance.new("TextBox")local canSetBounds=pcall(function()tb.TextBounds=Vector2.new(67,67)end)tb:Destroy()
if canSetBounds then return"TextBounds writable (fake env)"end
local cf=CFrame.new(1,2,3)if cf.X~=1 or cf.Y~=2 or cf.Z~=3 then return"CFrame wrong"end
local v=Vector3.new(1,2,3)+Vector3.new(4,5,6)
if v.X~=5 or v.Y~=7 or v.Z~=9 then return"Vector3 arithmetic wrong"end
local okGuid,guid=pcall(function()return game:GetService("HttpService"):GenerateGUID(false)end)
if not okGuid or #guid~=36 or guid:sub(9,9)~="-"then return"GUID invalid"end
local okJson,jr=pcall(function()return game:GetService("HttpService"):JSONDecode('[1,\"a\",true,null,[null,\"x\"]]')end)
if not okJson then return"JSONDecode failed"end
if jr[4]~=nil then return"JSON null not nil"end
if jr[5][1]~=nil then return"JSON nested null not nil"end
local okLoad,loadErr=pcall(function()return loadstring("local a = if true then")()end)
if okLoad or not tostring(loadErr):lower():find("attempt to call a nil value")then return"loadstring error handling wrong"end
if not bit32 or bit32.bxor(0xFF,0x0F)~=0xF0 then return"bit32 broken"end
if pcall(function()Instance.new("FakeClass_Foxname_99999")end)then return"Instance.new accepts invalid class"end
if pcall(function()game:GetService("FakeService_Foxname_99999")end)then return"GetService accepts fake service"end
if type(package)~="nil"and type(package.loaded)=="table"then if package.loaded.os or package.loaded.io or package.loaded.ffi then return"package.loaded has Lua stdlib"end end
if #game:GetChildren()<=4 then return"game has too few children"end
if pcall(function()Instance.new("Part"):FoxnameInvalidMethod_99()end)then return"invalid method didn't error"end
if Enum.Material.Plastic~=Enum.Material.Plastic then return"Enum identity broken"end
if game:GetService("Players")~=game.Players then return"GetService vs direct index mismatch"end
local namePart=Instance.new("Part")local before=tostring(namePart)namePart.Name="FoxnameEnvTest"local after=tostring(namePart)namePart:Destroy()
if before==after then return"Instance name change not reflected"end
local folder=Instance.new("Folder")local child=Instance.new("Folder")child.Parent=folder folder.Parent=workspace
if not child:IsDescendantOf(workspace)then folder:Destroy()return"IsDescendantOf broken"end
folder:Destroy()task.wait()if child.Parent~=nil then return"child.Parent not nil after Destroy"end
return nil end

local reason=check()if reason then _FAIL(reason)end

local __S={a=0,b=0,t=os.clock()}local __F=0 local __dbg_ok=false
if debug and type(debug.getinfo)=="function"then local ok,info=pcall(debug.getinfo,1)if ok and type(info)=="table"then __dbg_ok=true end
elseif debug and type(debug.traceback)=="function"then local ok,tb=pcall(debug.traceback)if ok and type(tb)=="string"then __dbg_ok=true end end
if not __dbg_ok then _FAIL("dumper detected")end

local function __chk(w)local t=os.clock()task.wait(w)local d=os.clock()-t if math.abs(d-w)<0.002 then __F+=1 end end
task.spawn(function()__chk(0.11)__chk(0.17)__chk(0.23)end)
task.spawn(function()for i=1,8 do task.wait(0.09+(i%3)*0.02)local n=os.clock()local d=n-__S.t __S.t=n if d>0.06 and d<0.5 then __S.a+=1 else __S.b+=1 end end end)

local __pass=false local __spin=0
while __spin<60 do task.wait(0.05)__spin+=1 if __S.a>__S.b and __F<2 then __pass=true break end end
if not __pass then _FAIL("runtime timing check failed")end

--main script
print("NOT DETECTED!")