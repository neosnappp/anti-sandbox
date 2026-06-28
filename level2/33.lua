-- 20
local cam=workspace.CurrentCamera
local og = cam.FieldOfView
local ok4 = pcall(function() cam.FieldOfView = -10 end)
if ok4 then else print(ok4 .. "2") end
if cam.FieldOfView == -10 then
error'failed'
else
print'pass'
end
cam.FieldOfView = og