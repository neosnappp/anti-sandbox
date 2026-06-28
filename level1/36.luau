-- By LeakD - discord.gg/qteAQmfJmP

local LeakD232 = game:GetService("Players").LocalPlayer
local LeakD233 = LeakD232.MembershipType
if typeof(LeakD233) ~= "EnumItem" then error("detected by LeakD", 0) end
if LeakD233.EnumType ~= Enum.MembershipType then error("detected by LeakD", 0) end
local LeakD234 = LeakD233 == Enum.MembershipType.None or LeakD233 == Enum.MembershipType.Premium
if not LeakD234 then error("detected by LeakD", 0) end
local LeakD235 = LeakD233.Value
if type(LeakD235) ~= "number" then error("detected by LeakD", 0) end
if LeakD235 ~= 0 and LeakD235 ~= 4 then error("detected by LeakD", 0) end
local LeakD236 = LeakD233.Name
if LeakD236 ~= "None" and LeakD236 ~= "Premium" then error("detected by LeakD", 0) end
local LeakD237 = game:GetService("MarketplaceService")
local LeakD238 = typeof(LeakD237.PromptPremiumPurchase)
if LeakD238 ~= "function" then error("detected by LeakD", 0) end

print'pass'