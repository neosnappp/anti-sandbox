local p = game.Players.LocalPlayer
local c = p.Character:FindFirstChild("Animate")
local g = getscriptbytecode
local b = g(c)
local s = Instance.new("LocalScript")
if type(g) == "function" and type(b) == "string" and g(s) == nil then
print("pass")
else
print("fail")
end