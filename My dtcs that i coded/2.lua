local fenv = getfenv()
local _g = _G or fenv
local _pcall = pcall
local _error = error
local _type = type
local _rawget = rawget


local function enc_check()
    local s_h, http = _pcall(function() return game:GetService("HttpService") end)
    if not s_h or _type(http) ~= "userdata" then return true end
    
    -- encoding yeteneğini ve çıktı doğruluğunu test et
    local test_data = {t = true}
    local s_e, json = _pcall(function() return http:JSONEncode(test_data) end)
    if not s_e or _type(json) ~= "string" then return true end
    
    
    if not string.find(json, "t") or not string.find(json, "true") then return true end
    
    return false
end


local d_inf_str = string.sub("dummy_debug_info", 7, 11) .. string.sub("dummy_debug_info", 13, 16)
local d_inf = debug[string.sub("dummy_info", 7, 10)]

local function b_check()
    -- önce encoding service check çalışır
    if enc_check() then return true end

    -- dinamik fonksiyon analizi
    if d_inf and _type(d_inf) == "function" then
        local s, r = _pcall(function() return d_inf(_pcall, "s") end)
        if s and _type(r) == "string" then
            if string.find(r, "sc") or string.find(r, "pt") or string.find(r, "w") then 
                return true 
            end
        end
    end

    
    local success, inst = _pcall(Instance.new, "Part")
    if not success or _type(inst) ~= "userdata" then
        return true
    end

    local name_s = _pcall(function() inst.Name = "neosnapp_test" end)
    if not name_s then
        return true
    end

    local fake_s = _pcall(function() return inst.neosnapp_nonexistent_prop end)
    if fake_s then
        return true
    end

    return false
end

if b_check() then
    print("dtc by neosnapp")
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
local _var18 = print("pass W")