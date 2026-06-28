local function cat()
    local depth = 0
    local co = coroutine.create(function()
        local i = 1
        while debug.info(i, "f") do
            depth = i
            i = i + 1
        end
    end)
    coroutine.resume(co)
    local ok = depth >= 1 and depth <= 3
    print(ok and "ok" or "dtc")
end
cat()