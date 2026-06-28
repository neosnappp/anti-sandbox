local _p=true

pcall(function()
    local ts=game:GetService("TweenService")
    local f=Instance.new("Frame")
    local tw=ts:Create(f,TweenInfo.new(0.1),{Size=UDim2.new(1,0,1,0)})
    local t=os.clock();tw:Play();tw.Completed:Wait()
    if math.abs(os.clock()-t-0.1)>0.05 then _p=false end
    f:Destroy()
end)

pcall(function()
    if not Instance then return end
    local s=Instance.new("Sound")
    if pcall(function()s.PlaybackLoudness=1 end)then _p=false end
    s:Destroy()
end)

pcall(function()
    if game and game.PlaceId==game.GameId then _p=false end
end)

if _p then
    print("pass")
else
    print("detect by FlameCoder https://discord.gg/ypVcca6cvp.")
end