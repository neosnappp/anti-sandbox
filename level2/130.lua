local g = gethwid
if type(g) == "function" then
local v = g()
if type(v) == "string" and #v > 0 then
print("pass")
else
print("fail")
end
else
print("fail")
end