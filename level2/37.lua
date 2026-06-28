-- By LeakD  - discord.gg/qteAQmfJmP

local LeakD1 = pcall(function()
	local a = game:GetService("LocalizationService")
	local b = a:GetCorescriptLocalizations()
	local d = a.RobloxLocaleId
	local e = a.SystemLocaleId

	if type(b) ~= "table" then error("LeakD Is Best", 2) end
	if #b == 0 then error("LeakD Is Best", 2) end
	if type(d) ~= "string" then error("LeakD Is Best", 2) end
	if type(e) ~= "string" then error("LeakD Is Best", 2) end
	if d == "" then error("LeakD Is Best", 2) end
	if e == "" then error("LeakD Is Best", 2) end

	local f = false
	for _, g in pairs(b) do
		if typeof(g) == "Instance" then
			f = true
			break
		end
	end
	if not f then error("LeakD Is Best", 2) end
end)
if not LeakD1 then error("LeakD Is Best", 2) end

-- your script here

print("pass")