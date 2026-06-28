local function cat()
    local part = Instance.new("Part")
    local success = pcall(function()
        part.ReceiveAge = 1 
    end)
    return success == false
end
print(cat() and "ok" or "dtc")