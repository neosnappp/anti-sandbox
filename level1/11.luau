
-- spawn must exist and be callable

if type(spawn) ~= "function" then
    -- attempt to call a nil value
    spawn()
end


-- game must NOT be iterable

if pcall(function()
    for _ in game do end
end) then
    -- attempt to call an Instance value
    game()
end


-- game must be an Instance

if typeof(game) ~= "Instance" then
    game:GetChildren()
end

print"pass"
