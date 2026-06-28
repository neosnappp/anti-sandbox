local function cat()
    local _, err = pcall(function() return math.random(10, 1) end)
    local ok = err:find("interval is empty") ~= nil
    print(ok and "ok" or "dtc")
end
cat()