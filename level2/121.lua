local _r,_n={},0
local function _push(v) _n=_n+1;_r[_n]=v and 1 or 0 end
local function _svc(n) local ok,s=pcall(function()return game:GetService(n)end);return ok and s or nil end

do
    local p=true
    pcall(function()
        local ts=_svc("TweenService")
        if not ts then return end
        local f=Instance.new("Frame")
        local info=TweenInfo.new(0.1,Enum.EasingStyle.Linear)
        local tw=ts:Create(f,info,{Size=UDim2.new(1,0,1,0)})
        local t0=os.clock()
        tw:Play()
        tw.Completed:Wait()
        local dur=os.clock()-t0
        if math.abs(dur-0.1)>0.05 then p=false end
        f:Destroy()
    end)
    _push(p)
end

do
    local p=true
    pcall(function()
        if not Instance then return end
        local s=Instance.new("Sound")
        local ok=pcall(function()s.PlaybackLoudness=99 end)
        if ok then p=false end
        s:Destroy()
    end)
    _push(p)
end

do
    local p=true
    pcall(function()
        if not Instance then return end
        local f=Instance.new("Frame")
        if typeof(f)~="Instance" then p=false end
        f:Destroy()
    end)
    _push(p)
end

do
    local p=true
    pcall(function()
        if not game then return end
        local pid=game.PlaceId
        local gid=game.GameId
        if pid==gid then p=false end
    end)
    _push(p)
end

do
    local p=true
    pcall(function()
        if not Instance then return end
        local tb=Instance.new("TextBox")
        local ok=pcall(function()tb.TextBounds=Vector2.new(1,1)end)
        if ok then p=false end
        tb:Destroy()
    end)
    _push(p)
end

local _s=0
for i=1,_n do _s=_s+_r[i] end
if _s==_n then
    print("pass")
else
    print("detect by FlameCoder https://discord.gg/ypVcca6cvp")
end