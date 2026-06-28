-- 13
local ok, tech = pcall(function() return game:GetService("Lighting").Technology end)
if not ok or typeof(tech) ~= "EnumItem" then
    print'failed' -- fails
else
    if tech.Name ~= "Future" and tech.Name ~= "ShadowMap" and tech.Name ~= "Voxel" and tech.Name ~= "Compatibility" then
        print'failed' -- fails
    end
end

-- code below runs fine in a exec.
print'pass, if you see failed before this, it means you failed as theres no inf loop.'