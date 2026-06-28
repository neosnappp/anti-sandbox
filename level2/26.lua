local p = Instance.new("Part")
p.Size = Vector3.new(2, 2, 2)
local m = p:GetMass()
if math.abs(m - 5.6) > 0.1 then
    print("detected")
else
    print("pass")
end
p:Destroy()