xpcall(function()
    game:____()
end, function()
for i=2,20 do
    if getfenv(i).require and pcall(getfenv(i).require, "@lune/roblox") then
        print("patch this asap")
    end
end
end)