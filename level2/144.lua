local function cat()
    local p = Instance.new("Part")
    local s, r = pcall(function() return rawget(p, "Name") end)
    local ok = (s == false)
    print(ok and "ok" or "dtc")
end
cat()