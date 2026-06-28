local result = (function()
    local s = pcall(function() table._SEB_TEST_KEY = 1 end)
    if s then
        rawset(table, "_SEB_TEST_KEY", nil)
        return false
    end
    return true
end)()

if result == true then
    print("passed")
else
    print("detected")
end