local part = Instance.new("Part")
local success, result = pcall(function()
    return part["\0Property"] 
end)

if result and tostring(result):find("valid member") then
    print("pass")
else
    print("detected")
end
part:Destroy()