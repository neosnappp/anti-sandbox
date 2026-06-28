local function cat()
    local t = {}
    local res = table.insert(t, 1)
    local ok = (res == nil)
    print(ok and "ok" or "dtc")
end
cat()