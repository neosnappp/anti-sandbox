local part = Instance.new("Part")
local changeLog = {}

part:GetPropertyChangedSignal("Size"):Connect(function()
    table.insert(changeLog, part.Size)
end)

local newSize = Vector3.new(9, 9, 9)
part.Size = newSize
task.wait(0.05)

if #changeLog > 0 and changeLog[#changeLog].X == 9 then
    print("pass")
else
    print("failed")
end

part:Destroy()