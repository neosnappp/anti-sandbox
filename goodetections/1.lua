local function antiTamper()
    -- Check if metatable of a string is locked (common simple tamper check)
    if getmetatable("") ~= nil then
        error("[Anti-Tamper] Script tampering detected!", 0)
    end

    -- Check if basic math is modified
    local success = pcall(function()
        local test = ("a" + 1)
    end)

    if success then
        error("[Anti-Tamper] Math tampering detected!", 0)
    end
end

-- Run the anti-tamper
antiTamper()