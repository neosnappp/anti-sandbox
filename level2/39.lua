if pcall(function()
    game:GetService("Workspace"):WaitForChild("doesnotexist", -1)
end) then
    error("fail", 0)
end
print("pass")