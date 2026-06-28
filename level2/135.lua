local function empty() end
local arity, isvararg = debug.info(empty, "a")
local ok = arity == 0 and isvararg == false and debug.info(empty, "s") ~= "[C]"
print(ok and "ok" or "dtc")