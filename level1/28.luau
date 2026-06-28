-- By LeakD  - discord.gg/qteAQmfJmP

local LeakD1 = false

local function LeakD2(LeakD3)
    if not LeakD1 then
        LeakD1 = true
        error("LeakD", 0)
    end
end

local function LeakD4()
    local LeakD5, LeakD6 = pcall(function()
        local LeakD7 = game:GetDebugId(0)
        if type(LeakD7) ~= "string" then return false end
        if #LeakD7 == 0 then return false end

        local LeakD8 = workspace:GetDebugId(0)
        local LeakD9 = game.Players:GetDebugId(0)

        if LeakD7 == LeakD8 or LeakD7 == LeakD9 or LeakD8 == LeakD9 then
            return false
        end

        return true
    end)

    if not LeakD5 or not LeakD6 then
        LeakD2("LeakD")
    end
end

LeakD4()

if LeakD1 then
    error("LeakD", 0)
end

print("pass")