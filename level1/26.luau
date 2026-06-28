local function LeakD1()
    local ok, err = pcall(function()
        local LeakD2 = workspace:GetRealPhysicsFPS()
        if type(LeakD2) ~= "number" or LeakD2 <= 0 or LeakD2 > 300 then
            error("detected", 0)
        end
        local LeakD3, LeakD4 = pcall(function() return game:GetService("ChangeHistoryService") end)
        if LeakD3 and LeakD4 then
            if typeof(LeakD4) ~= "Instance" or LeakD4.ClassName ~= "ChangeHistoryService" then
                error("detected", 0)
            end
        end
        local LeakD5 = game:GetService("HttpService")
        local LeakD6 = LeakD5:GenerateGUID(false)
        local LeakD7 = LeakD5:GenerateGUID(false)
        local LeakD8 = "^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$"
        if LeakD6 == LeakD7
            or not string.match(LeakD6, LeakD8)
            or not string.match(LeakD7, LeakD8)
            or #LeakD6 ~= 36
        then
            error("detected", 0)
        end
        local LeakD9 = settings().Rendering.QualityLevel
        if typeof(LeakD9) ~= "EnumItem" then
            error("detected", 0)
        end
        local LeakD10 = false
        for _, LeakD11 in ipairs(Enum.QualityLevel:GetEnumItems()) do
            if LeakD11 == LeakD9 then
                LeakD10 = true
                break
            end
        end
        if not LeakD10 then
            error("detected", 0)
        end
    end)
    if not ok then
        error("detected", 0)
    end
    return true
end

if not LeakD1() then return end

print("pass")