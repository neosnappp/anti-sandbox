local function _check_debug()
    local ok1,_ = pcall(function() return debug.getinfo(1) end)
    local ok2,_ = pcall(function() return debug.traceback() end)
    local ok3,_ = pcall(function() return debug.getupvalue(function() end,1) end)
    local tamper = (type(debug) == "table") or (ok1 and ok2 and ok3)
    if tamper then 
        print(string.char(97,110,116,105,32,116,97,109,112,101,114))
    end 
end

local function _check_math()
    local x = 0
    for i = 1,10 do x = x + i end
    if x ~= 55 then print("failed") end
end

local function _check_env()
    local s = tostring({})
    if not s:find("table") then print("failed") end
end

_check_debug()
_check_math()
_check_env()

-- uncomment this below to check if passed.
print("HEY")