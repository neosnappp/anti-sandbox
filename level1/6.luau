

local function rilevaEnvloggerClient()
    if not rawequal(game, workspace.Parent) then
        warn'detected1'
        return true
    end

    local successoEnum, speculazioneEnum = pcall(function()
        return rawequal(Enum.Material.Plastic.Parent, Enum.Material)
    end)

    if successoEnum and speculazioneEnum == false then
        warn'detected2'
        return true
    end

    return false
end

if rilevaEnvloggerClient() then
    warn'detected'
end