local function cati() end
local function cat()
    local arity, isvararg = debug.info(cati, "a")
    local ok = (arity == 0 and isvararg == false)
    print(ok and "ok" or "dtc")
end
cat()