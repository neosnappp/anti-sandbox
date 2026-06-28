-- By LeakD - discord.gg/qteAQmfJmP

local LeakD117 = game:GetService("MemStorageService")
local LeakD118 = math.log(100, 10)
LeakD117:SetItem("LeakD119", tostring(LeakD118))
local LeakD120 = tonumber(LeakD117:GetItem("LeakD119"))
if LeakD120 == nil then error("detected by LeakD", 0) end
if math.abs(LeakD120 - 2) > 1e-5 then error("detected by LeakD", 0) end

local LeakD121 = game:GetService("CollectionService")
local LeakD122 = "LD_" .. tostring(math.floor(math.log(8, 2) * 1000))
local LeakD123 = Instance.new("Part")
LeakD123.Parent = workspace
LeakD121:AddTag(LeakD123, LeakD122)
local LeakD124 = LeakD121:GetTagged(LeakD122)
if type(LeakD124) ~= "table" then error("detected by LeakD", 0) end
if #LeakD124 ~= 1 then error("detected by LeakD", 0) end
if LeakD124[1] ~= LeakD123 then error("detected by LeakD", 0) end
LeakD121:RemoveTag(LeakD123, LeakD122)
local LeakD125 = LeakD121:GetTagged(LeakD122)
if #LeakD125 ~= 0 then error("detected by LeakD", 0) end
LeakD123:Destroy()

local LeakD126 = game:GetService("SoundService")
local LeakD127 = LeakD126.DistanceFactor
if LeakD127 <= 0 then error("detected by LeakD", 0) end
local LeakD128 = LeakD127 * math.pi
local LeakD129 = LeakD128 / math.pi
if math.abs(LeakD129 - LeakD127) > 1e-5 then error("detected by LeakD", 0) end
LeakD117:SetItem("LeakD130", tostring(math.floor(LeakD128 * 10000)))
local LeakD131 = tonumber(LeakD117:GetItem("LeakD130"))
if LeakD131 == nil then error("detected by LeakD", 0) end
if LeakD131 ~= math.floor(LeakD128 * 10000) then error("detected by LeakD", 0) end

print("pass")