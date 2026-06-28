local src = [[
local ProjectDiamond = if false then true else false
print("you passed da anti lua check!!")
]]

local f, err = loadstring(src)

if not f then
    error("detected by ProjectDiamond <3 | " .. err)
else
    f()
end