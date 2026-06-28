local isProtected = false
local success = pcall(function()
    math.floor = math.floor
end)

if success then
    local check = tostring(getfenv().math.floor)
    if not check:find("native") and not check:find("built-in") then
        print("detected")
    else
        print("pass")
    end
else
    print("pass")
end