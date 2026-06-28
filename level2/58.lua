-- 25ms, larry, unix, lightning, & threaded detection.
--[[
      If this errors out on envlogs, then it's threaded with 'roblox' on.
--]]

local a,b,d;
f = function(a,...)
    if (game.Players.LocalPlayer.Name == a) then
        return(true)
    else
        return(false)
    end
end
if f("TestPlayer") then
    warn'Lightning detected.'
    return
elseif f("Dump" or "Dumper" or "EnvLog") then
    error'Get a better name.'
end
if game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SetBlockedUserIdsRequest.ClassName=="RemoteEvent" or game:GetService("Players").LocalPlayer.PlayerScripts.RbxCharacterSounds.AtomicBinding.Archivable == true then -- or so it works in odd roblox envs.
    print'safe, real env.'
    return
end
c=nil;
if a then
    error'What is this bootleg constant ext?'
else
    d=f("unixv1daddy")
end
b=1%67
a=1%20%(b)
if a~=0 then
    error'Bad var handling/no % handling.'
end
if getgenv().c or c or getfenv().c then
    error'Threaded (without spyexeonly) detected.'
end
if _ then
    error'25ms detection :('
end
if d then
    error'Unix detection !!'
end
b = task.spawn(function()
    if game:GetService("Players").LocalPlayer.PlayerGui.Parent==game:GetService('Players').LocalPlayer.PlayerGui.Parent then
        error'Threaded (with spyexeonly) detected.'
        return
    end
end)
if not b() then -- will error out after doing b() on actual envs.
    error'No/Unworking task.spawn() handling.'
end
if game.PlaceId == game.GameId then -- almost no forks patch this.
    error'Larry [maybe a fork.?] detected.'
end