local rx = CFrame.Angles(math.rad(90), 0, 0)
local ry = CFrame.Angles(0, math.rad(90), 0)
local ab = rx * ry
local ba = ry * rx
local diff = (ab.Position - ba.Position).Magnitude
local lookDiff = (ab.LookVector - ba.LookVector).Magnitude
if lookDiff > 1e-4 then
    print("pass")
else
    print("detected")
end