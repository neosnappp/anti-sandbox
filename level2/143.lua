local function cat()
    local co = coroutine.create(function()
        return pcall(function()
            coroutine.yield(123)
            return 456
        end)
    end)
    local _, r1 = coroutine.resume(co)
    local _, r2, r3 = coroutine.resume(co)
    local ok = (r1 == 123 and r2 == true and r3 == 456)
    print(ok and "ok" or "dtc")
end
cat()