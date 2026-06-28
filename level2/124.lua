local function isMine()
    return type(dumperState) == "table"
        and type(rawget(dumperState, "property_store")) == "table"
        and type(_at) == "table"
        and rawget(_G, "_byp_require") == true
end

local d = getscriptbytecode or dumpstring
    or (debug and rawget(debug, "getproto"))
    or (debug and rawget(debug, "getprotos"))

if d and not isMine() then
    print("detect by FlameCoder https://discord.gg/ypVcca6cvp")
else
    print("pass")
end