--some executors it not working like velocity idk tbh anyways its good

local DETECTED = function() error("VELOIX protected | Get lost son", 0) end

local _svc = setmetatable({}, {
    __index = function(t, k)
        local ok, s = pcall(game.GetService, game, k)
        if not ok or not s then DETECTED() end
        rawset(t, k, s)
        return s
    end
})

local function VELOIXAnimClip()
    local stats = game:GetService("AnimationClipProvider"):GetMemStats()
    local str, num = 0, 0
    for k, v in pairs(stats) do
        if type(k) == "string" then str = str + 1 end
        if type(v) == "number" then num = num + 1 end
    end
    return str > 0 and num > 0 and str == num
end

spawn(function()
    while true do
        task.wait(0.1)
    end
end)

spawn(function()
    while true do
        task.wait(0.5)
    end
end)

do
    local mem = _svc.MemStorageService
    local seed = math.log(100, 10)
    mem:SetItem("VELOIX!??", tostring(seed))
    local back = tonumber(mem:GetItem("VELOIX!??"))
    if back == nil or math.abs(back - 2) > 1e-9 then DETECTED() end
end

do
    spawn(function()
        while wait(2) do
            local cs = _svc.CollectionService
            local tag = "__dt_" .. tostring(math.floor(os.clock() * 1e6) % 999983)
        end
    end)
end

for i = 1, 60 do
    spawn(function()
        while true do
            task.wait(math.random(50, 500) / 1000)
        end
    end)
end

do
    spawn(function()
        while true do
            local ss = _svc.SoundService
            task.wait(3)
        end
    end)
end

do
    spawn(function()
        while true do
            local cam = workspace.CurrentCamera
            task.wait(4)
        end
    end)
end

spawn(function()
    while true do
        if math.abs(math.sin(0)) > 1e-9 then DETECTED() end
        task.wait(1)
    end
end)

spawn(function()
    while true do
        if string.len("VELOIX") ~= 6 then DETECTED() end
        task.wait(2)
    end
end)

local VELOIX117 = _svc.MemStorageService
local VELOIX118 = math.log(100, 10)
VELOIX117:SetItem("VELOIX119", tostring(VELOIX118))

local VELOIX120 = tonumber(VELOIX117:GetItem("VELOIX119"))
if VELOIX120 == nil then DETECTED() end
if math.abs(VELOIX120 - 2) > 1e-5 then DETECTED() end

local VELOIX121 = _svc.CollectionService
local VELOIX122 = "VH_" .. tostring(math.floor(math.log(8, 2) * 1000))

local VELOIX123 = Instance.new("Part")
VELOIX123.Parent = workspace
VELOIX121:AddTag(VELOIX123, VELOIX122)

local VELOIX124 = VELOIX121:GetTagged(VELOIX122)
if type(VELOIX124) ~= "table" then DETECTED() end
if #VELOIX124 ~= 1 then DETECTED() end
if VELOIX124[1] ~= VELOIX123 then DETECTED() end

VELOIX121:RemoveTag(VELOIX123, VELOIX122)

local VELOIX125 = VELOIX121:GetTagged(VELOIX122)
if #VELOIX125 ~= 0 then DETECTED() end

VELOIX123:Destroy()

local VELOIX126 = _svc.SoundService
local VELOIX127 = VELOIX126.DistanceFactor
if VELOIX127 <= 0 then DETECTED() end

local VELOIX128 = VELOIX127 * math.pi
local VELOIX129 = VELOIX128 / math.pi
if math.abs(VELOIX129 - VELOIX127) > 1e-5 then DETECTED() end

VELOIX117:SetItem("VELOIX130", tostring(math.floor(VELOIX128 * 10000)))

local VELOIX131 = tonumber(VELOIX117:GetItem("VELOIX130"))
if VELOIX131 == nil then DETECTED() end
if VELOIX131 ~= math.floor(VELOIX128 * 10000) then DETECTED() end

local VELOIX132 = _svc.Players.LocalPlayer
local VELOIX133 = VELOIX132.MembershipType
if typeof(VELOIX133) ~= "EnumItem" then DETECTED() end
if VELOIX133.EnumType ~= Enum.MembershipType then DETECTED() end
local VELOIX134 = VELOIX133 == Enum.MembershipType.None or VELOIX133 == Enum.MembershipType.Premium
if not VELOIX134 then DETECTED() end
local VELOIX135 = VELOIX133.Value
if type(VELOIX135) ~= "number" then DETECTED() end
if VELOIX135 ~= 0 and VELOIX135 ~= 4 then DETECTED() end
local VELOIX136 = VELOIX133.Name
if VELOIX136 ~= "None" and VELOIX136 ~= "Premium" then DETECTED() end

local VELOIX137 = _svc.MarketplaceService
local VELOIX138 = typeof(VELOIX137.PromptPremiumPurchase)
if VELOIX138 ~= "function" then DETECTED() end

local VELOIX_triggered = false

local VELOIX_ok, VELOIX_err = pcall(function()
    local VELOIX_c1 = game.ClassName == "DataModel"
    local VELOIX_c2 = workspace.ClassName == "Workspace"
    local VELOIX_c3 = typeof(Enum.Material.Plastic) == "EnumItem"
    local VELOIX_c4 = Enum.Material.Plastic.Value == 256
    local VELOIX_c5 = typeof(game.Changed) == "RBXScriptSignal"
    local VELOIX_c6 = typeof(workspace.Changed) == "RBXScriptSignal"
    local VELOIX_rs = _svc.RunService
    local VELOIX_c7 = VELOIX_rs.ClassName == "RunService"
    local VELOIX_c8 = typeof(VELOIX_rs.Heartbeat) == "RBXScriptSignal"
    local VELOIX_c9 = VELOIX_rs:IsClient() ~= VELOIX_rs:IsServer()
    local VELOIX_part = Instance.new("Part")
    local VELOIX_c10 = typeof(VELOIX_part) == "Instance" and VELOIX_part.ClassName == "Part"
    VELOIX_part:Destroy()
    local VELOIX_c11 = workspace:GetFullName() == "Workspace"
    local VELOIX_cf = CFrame.new(1, 2, 3)
    local VELOIX_c12 = VELOIX_cf.X == 1 and VELOIX_cf.Y == 2 and VELOIX_cf.Z == 3
    local VELOIX_t1 = workspace.DistributedGameTime
    task.wait(0.1)
    local VELOIX_t2 = workspace.DistributedGameTime
    local VELOIX_c13 = (VELOIX_t2 - VELOIX_t1) > 0
    local VELOIX_guid_ok, VELOIX_guid = pcall(function()
        return _svc.HttpService:GenerateGUID(false)
    end)
    local VELOIX_c14 = VELOIX_guid_ok and #VELOIX_guid == 36 and VELOIX_guid:sub(9,9) == "-"
    local VELOIX_checks = {
        VELOIX_c1, VELOIX_c2, VELOIX_c3, VELOIX_c4,
        VELOIX_c5, VELOIX_c6, VELOIX_c7, VELOIX_c8,
        VELOIX_c9, VELOIX_c10, VELOIX_c11, VELOIX_c12,
        VELOIX_c13, VELOIX_c14
    }
    local VELOIX_passed = 0
    for _, VELOIX_v in ipairs(VELOIX_checks) do
        if VELOIX_v then VELOIX_passed += 1 end
    end
    if VELOIX_passed < #VELOIX_checks then
        VELOIX_triggered = true
    end
end)

if not VELOIX_ok then
    VELOIX_triggered = true
end

if VELOIX_triggered then
    task.delay(math.random(6, 7), function()
    end)
    return
end

local VELOIX139 = pcall(function()
    local VELOIX140 = _svc.AnimationClipProvider
    if VELOIX140 == nil then error("detected by VELOIX!??", 2) end
    if not VELOIXAnimClip() then error("detected by VELOIX!??", 2) end

    local VELOIX146 = _svc.Players
    local VELOIX147 = VELOIX146:GetCharacterAppearanceInfoAsync(1)
    if type(VELOIX147) ~= "table" then error("detected by VELOIX!??", 2) end
    if type(VELOIX147.assets) ~= "table" then error("detected by VELOIX!??", 2) end
    if type(VELOIX147.bodyColors) ~= "table" then error("detected by VELOIX!??", 2) end
    if type(VELOIX147.scales) ~= "table" then error("detected by VELOIX!??", 2) end
    local VELOIX148 = {"bodyType","head","height","proportion","depth","width"}
    for _, VELOIX149 in pairs(VELOIX148) do
        if type(VELOIX147.scales[VELOIX149]) ~= "number" then error("detected by VELOIX!??", 2) end
    end
    local VELOIX150 = {"leftArmColorId","torsoColorId","rightArmColorId","headColorId","leftLegColorId","rightLegColorId"}
    for _, VELOIX151 in pairs(VELOIX150) do
        if type(VELOIX147.bodyColors[VELOIX151]) ~= "number" then error("detected by VELOIX!??", 2) end
    end
    if #VELOIX147.assets == 0 then error("detected by VELOIX!??", 2) end
    for _, VELOIX152 in pairs(VELOIX147.assets) do
        if type(VELOIX152.id) ~= "number" then error("detected by VELOIX!??", 2) end
        if type(VELOIX152.name) ~= "string" then error("detected by VELOIX!??", 2) end
        if type(VELOIX152.assetType) ~= "table" then error("detected by VELOIX!??", 2) end
        if type(VELOIX152.assetType.name) ~= "string" then error("detected by VELOIX!??", 2) end
    end
end)

if not VELOIX139 then
    error("detected by VELOIX!??", 2)
end

do
    local s,e=pcall(function()
        if not VELOIXAnimClip() then error("VELOIX",2) end
        
        local p=game:GetService("Players"):GetCharacterAppearanceInfoAsync(1)
        if type(p)~="table"or type(p.assets)~="table"or#p.assets==0 then error("VELOIX",2)end
    end)
    if not s then error("detected by VELOIX",2)end
end