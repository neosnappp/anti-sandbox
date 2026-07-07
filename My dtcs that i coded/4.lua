local fenv = getfenv()
local _g = _G or fenv
local _pcall = pcall
local _error = error
local _type = type
local _rawget = rawget
local string_find = string.find
local string_sub = string.sub
local os_clock = os.clock

local function catmio_check()
    local t1 = os_clock()
    for i = 1, 50 do
        _pcall(function() 
            local x = 1 + i
            return x
        end)
    end
    local t2 = os_clock()
    if (t2 - t1) > 0.05 then 
        return true 
    end

    local arg_trigger = false
    _pcall(function(...)
        local args = {...}
        if #args > 0 then
            arg_trigger = true
        end
    end)
    if arg_trigger then 
        return true 
    end

    local s_h, http = _pcall(function() return game:GetService("HttpService") end)
    if not s_h or _type(http) ~= "userdata" then return true end
    
    local test_data = {t = true}
    local s_e, json = _pcall(function() return http:JSONEncode(test_data) end)
    if not s_e or _type(json) ~= "string" then return true end
    if not string_find(json, "t") or not string_find(json, "true") then return true end
    
    local s_d, decoded = _pcall(function() return http:JSONDecode(json) end)
    if not s_d or _type(decoded) ~= "table" or decoded.t ~= true then return true end
    
    local d_inf = debug[string_sub("dummy_info", 7, 10)]
    if d_inf and _type(d_inf) == "function" then
        local s, r = _pcall(function() return d_inf(_pcall, "s") end)
        if s and _type(r) == "string" then
            if string_find(r, "script") or string_find(r, "w") then 
                return true 
            end
        end
    end

    local success, inst = _pcall(Instance.new, "Part")
    if not success or _type(inst) ~= "userdata" then return true end

    local name_s = _pcall(function() inst.Name = "neosnapp_test" end)
    if not name_s or inst.Name ~= "neosnapp_test" then return true end

    local fake_s = _pcall(function() return inst.neosnapp_nonexistent_prop end)
    if fake_s then return true end

    return false
end

if catmio_check() then
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