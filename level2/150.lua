local function cat()
    local ok = true
    xpcall(function() error() end, function()
        local success = pcall(function() task.wait() end)
        if success then ok = false end
    end)
    print(ok and "ok" or "dtc")
end
cat()