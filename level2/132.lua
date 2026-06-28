local function check_userdata_ghosting()
    local v = Vector3.new(1, 1, 1)
    local mt = getmetatable(v)
    local ok = (mt == nil or type(mt) == "string")
    print(ok and "ok" or "dtc")
end
check_userdata_ghosting()