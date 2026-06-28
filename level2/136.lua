local function check_identity()
    local part = Instance.new("Part")
    local success = pcall(function()
        part.ReceiveAge = 1 
    end)
    return success == false
end
print(check_identity() and "ok" or "dtc")