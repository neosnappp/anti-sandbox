local plr=game.Players.LocalPlayer
local ms=game:GetService("MarketplaceService")
local ls=game:GetService("LocalizationService")
local hs=game:GetService("HttpService")
local ok1,res1 = pcall(ms.GetProductInfo, ms, -1e30, Enum.InfoType.Asset)
if ok1 then error("fail 131") end
local ok2,res2 = pcall(ms.GetProductInfo, ms, {}, Enum.InfoType.Asset)
if ok2 then error("fail 132") end
local ok3,res3 = pcall(ls.GetCountryRegionForPlayerAsync, ls, coroutine.create(function()end))
if ok3 then error("fail 133") end
local g1 = hs:GenerateGUID(false)
local g2 = hs:GenerateGUID(false)
if g1 == g2 then error("fail 134")  end
local ok4,res4 = pcall(function() hs:JSONDecode('{"x":"\\"}') end)
if ok4 then error("fail 135") end
local ok5,res5 = pcall(ms.GetProductInfo, ms, 123, Enum.InfoType.Asset, true)
if ok5 then error("fail 136") end
local ok6,res6 = pcall(ls.GetCountryRegionForPlayerAsync, ls, newproxy(true))
if ok6 then error("fail 137") end
local ok7,res7 = pcall(function() hs:UrlEncode("a\xFFb") end)
if not ok7 then error("fail 138") end
if not f then print("ok") end