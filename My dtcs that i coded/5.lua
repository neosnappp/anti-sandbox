local fenv = getfenv()
local _g = _G or fenv
local _pcall = pcall
local _error = error
local _type = type
local _rawget = rawget
local _rawequal = rawequal
local string_find = string.find
local string_sub = string.sub
local os_clock = os.clock
local collectgarbage = collectgarbage

local function ultra_check()
    local t1 = os_clock()
    for i = 1, 60 do
        _pcall(function() 
            return i + 1
        end)
    end
    if (os_clock() - t1) > 0.04 then return true end

    local injected = false
    _pcall(function(...)
        if #{...} > 0 then injected = true end
    end)
    if injected then return true end

    local err_obj = {}
    local s_err, r_err = _pcall(function()
        _error(err_obj, 0)
    end)
    if _rawequal(r_err, err_obj) == false then return true end

    local s_h, http = _pcall(function() return game:GetService("HttpService") end)
    if not s_h or _type(http) ~= "userdata" then return true end
    
    local test_data = {t = true}
    local s_e, json = _pcall(function() return http:JSONEncode(test_data) end)
    if not s_e or _type(json) ~= "string" or not string_find(json, "t") then return true end
    
    local s_d, decoded = _pcall(function() return http:JSONDecode(json) end)
    if not s_d or _type(decoded) ~= "table" or decoded.t ~= true then return true end

    local d_inf = debug[string_sub("dummy_info", 7, 10)]
    if d_inf and _type(d_inf) == "function" then
        local s, r = _pcall(function() return d_inf(_pcall, "s") end)
        if s and _type(r) == "string" then
            if string_find(r, "script") or string_find(r, "w") then return true end
        end
    end

    local success, inst = _pcall(Instance.new, "Part")
    if not success or _type(inst) ~= "userdata" then return true end

    local name_s = _pcall(function() inst.Name = "neosnapp_test" end)
    if not name_s or inst.Name ~= "neosnapp_test" then return true end

    local fake_s = _pcall(function() return inst.neosnapp_nonexistent_prop end)
    if fake_s then return true end

    local m1 = collectgarbage("count")
    local t_arr = {}
    for i = 1, 500 do t_arr[i] = {i} end
    local m2 = collectgarbage("count")
    if m2 <= m1 then return true end

    return false

end

if ultra_check() then
    print("dtc by neosnapp nga skidder")
    return
end

local part = Instance.new("Part")
part.Name = "neosnapp_part"
part.Size = Vector3.new(4, 4, 4)
part.Position = Vector3.new(0, 50, 0)
part.Anchored = true
part.BrickColor = BrickColor.new("Bright blue")
part.Parent = workspace

local enc = game:GetService("HttpService")
local data = {"active", true}
local json = enc:JSONEncode(data)

local _udim2new16 = UDim2.new
local _udimnew17 = UDim.new
local _var18 = print("pass")