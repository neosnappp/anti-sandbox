-- 25ms, larry, unix, lightning, & threaded [settings] detection.
-- TO ADD: Crypta [I don't have prem.], FattyObf.
--[[
      If this errors out on envlogs, then it's threaded with 'roblox' on or some envlog not added.
      Code open-source on the basis of an MIT license.
	  ~ Apt Sigmarizz 0.1a ~
--]]

fpl = function(_)
	for i = 1, _ do
		tick()
	end
end
cr = function(_)
    if _ and _==_ then
        for i = 6, 67 do
            warn(_)
        end
    end
    return
end
xs = function(a,...)
    local args, serv = {...}, a
    local success, result = pcall(function()
        return ReplicatedStorage[a]:InvokeServer(unpack(args))
    end)

    if success then
        error'Bootleg hookop dtc :('
    end
end
kI = fpl(676%67)
if kl ~= (warn(true) and print()) then -- Detects threaded & 25ms.
	cr'Printing detection :0'
	error'PT'
end
if _ or fenv then
    cr'25ms detection :('
    error'2m'
end
if kI then -- This detects most bad envloggers.
	cr'anti-tick detection !!'
	error'a-t'
end
local a,b,d,kl;
--[=[ if getfenv().ReplicatedStorage or _G.ReplicatedStorage or _G['ReplicatedStorage'] then -- Unix bypasses this.
    cr[[local's detection.]]
    error'ld1'
end]=] -- This section doesn't support sirhurt and executors thereof.
if game:GetService("Players").LocalPlayer.PlayerScripts.RbxCharacterSounds.AtomicBinding.Archivable == true or game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SetBlockedUserIdsRequest.ClassName=="RemoteEvent" then -- or so it works in odd roblox envs.
    if not xs('',{}) then
        print'safe, real env.'
    end
    return
end
f = function(a)
    if (game.Players.LocalPlayer.Name == a) then
        return(true)
    else
        return{false}
    end
end
if f("TestPlayer") then
    cr'Lightning detected.'
    error'LGH'
elseif f("Dump" or "Dumper" or "EnvLog") then
    cr'Get a better name.'
    error'N'
end
c=nil;
if a then
    cr'What is this bootleg constant ext?'
    error'BCE'
end
b=1%67
a=1%20%(b)
d=f("unixv1daddy")
if a~=0 then
    cr'Bad var handling/no % handling.'
    error'BVH'
end
if d then
    cr'Unix detection !!'
    error'UN'
end
if getgenv().c or c or getfenv().c then
    cr'Threaded (without spyexeonly) detected.'
    error'TWSPE'
end
b = task.spawn(function()
    if game:GetService("Players").LocalPlayer.PlayerGui.Parent==game:GetService('Players').LocalPlayer.PlayerGui.Parent then
        cr'Threaded (with spyexeonly) detected.'
        error'THWSPE'
    end
end)
if not b() then -- will error out after doing b() on actual envs.
    cr'No/Unworking task.spawn() handling.'
end
if game.PlaceId == game.GameId then -- detects majority of larry [forks].
    cr'Larry [maybe a fork.?] detected.'
    error''
end
kl = print(warn(true))

print"pass"