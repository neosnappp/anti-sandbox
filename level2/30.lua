local p = Instance.new("Part")
p.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
local readback = p.CurrentPhysicalProperties.Elasticity
local check = p.CustomPhysicalProperties.Elasticity
if math.abs(readback - check) > 1e-5 or math.abs(readback - 0.5) > 1e-5 then
    print("detected")
else
    print("pass")
end
p:Destroy()