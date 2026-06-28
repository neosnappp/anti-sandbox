-- By LeakD - discord.gg/qteAQmfJmP

local LeakD1 = pcall(function()

    local a = game:GetService("AnimationClipProvider")
    if a == nil then error("LeakD Is Best", 2) end
    local b = a:GetMemStats()
    if type(b) ~= "table" then error("LeakD Is Best", 2) end
    local c = 0
    local d = 0
    for e, f in pairs(b) do
        if type(e) == "string" then c = c + 1 end
        if type(f) == "number" then d = d + 1 end
    end
    if c == 0 then error("LeakD Is Best", 2) end
    if d == 0 then error("LeakD Is Best", 2) end
    if c ~= d then error("LeakD Is Best", 2) end

    local g = game:GetService("Players")
    local h = g:GetCharacterAppearanceInfoAsync(1)
    if type(h) ~= "table" then error("LeakD Is Best", 2) end
    if type(h.assets) ~= "table" then error("LeakD Is Best", 2) end
    if type(h.bodyColors) ~= "table" then error("LeakD Is Best", 2) end
    if type(h.scales) ~= "table" then error("LeakD Is Best", 2) end
    local i = {"bodyType","head","height","proportion","depth","width"}
    for _, j in pairs(i) do
        if type(h.scales[j]) ~= "number" then error("LeakD Is Best", 2) end
    end
    local k = {"leftArmColorId","torsoColorId","rightArmColorId","headColorId","leftLegColorId","rightLegColorId"}
    for _, l in pairs(k) do
        if type(h.bodyColors[l]) ~= "number" then error("LeakD Is Best", 2) end
    end
    if #h.assets == 0 then error("LeakD Is Best", 2) end
    for _, m in pairs(h.assets) do
        if type(m.id) ~= "number" then error("LeakD Is Best", 2) end
        if type(m.name) ~= "string" then error("LeakD Is Best", 2) end
        if type(m.assetType) ~= "table" then error("LeakD Is Best", 2) end
        if type(m.assetType.name) ~= "string" then error("LeakD Is Best", 2) end
    end

end)

if not LeakD1 then
    error("LeakD Is Best", 2)
end
print'pass'