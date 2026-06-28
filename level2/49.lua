-- 2
local GuiService = game:GetService("GuiService")
local origSelected = GuiService.SelectedObject
GuiService.SelectedObject = nil
task.wait()
if GuiService.SelectedObject ~= nil then
   print'1' -- inf loop
   return
end
local fakePart = Instance.new("Part")
local setOk = pcall(function()
    GuiService.SelectedObject = fakePart
end)
if setOk then
   print'2' -- inf loop
   return
end
GuiService.SelectedObject = origSelected

-- code below runs fine in a exec.
print'pass'