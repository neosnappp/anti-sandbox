local part = Instance.new("Part")

local checks = {
    typeof(part)            == "Instance",
    typeof(part.Size)       == "Vector3",
    typeof(part.CFrame)     == "CFrame",
    typeof(part.Color)      == "Color3",
    typeof(part.BrickColor) == "BrickColor",
    typeof(part.Material)   == "EnumItem",
}

local allPass = true
for _, v in ipairs(checks) do
    if not v then allPass = false break end
end

if allPass then
    print("pass")
else
    print("failed")
end

part:Destroy()