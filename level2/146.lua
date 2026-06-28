local function cat()
    local p = newproxy(false)
    local ok = getmetatable(p) == nil
    print(ok and "ok" or "dtc")
end
cat()