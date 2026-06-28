local function getStack()
    local _, err = pcall(function() return game.NonExistentProperty end)
    return err
end

local errMessage = getStack()
if not errMessage:find("is not a valid member of") or errMessage:find("Exploit") then
    print("detected")
else
    print("pass")
end