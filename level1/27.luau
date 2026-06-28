-- By LeakD  - discord.gg/qteAQmfJmP

local LeakD1 = function()
	local LeakD2 = os.clock()
	for LeakD3 = 1, 500 do
		local LeakD4 = "ax"
		local LeakD5 = "ax"
		local LeakD6 = LeakD4 == LeakD5
	end
	local LeakD7 = os.clock() - LeakD2
	local LeakD8 = os.clock()
	for LeakD3 = 1, 500 do
		local LeakD4 = "ax" .. LeakD3
		local LeakD5 = "ax" .. LeakD3
		local LeakD6 = LeakD4 == LeakD5
	end
	local LeakD9 = os.clock() - LeakD8
	return LeakD7 < LeakD9 * 2
end

local LeakD10 = function()
	local LeakD11 = 0/0
	if math.max(LeakD11, 1) ~= math.max(LeakD11, 1) then
		if math.min(LeakD11, 1) ~= math.min(LeakD11, 1) then
			if not (LeakD11 == LeakD11) then
				return true
			end
		end
	end
	return false
end

local LeakD12 = function()
	local LeakD13 = 0
	local LeakD14 = function() LeakD13 = LeakD13 + 1 end
	local LeakD15 = function() return LeakD13 end
	local LeakD16 = os.clock()
	for LeakD17 = 1, 1000 do LeakD14() end
	local LeakD18 = os.clock() - LeakD16
	local LeakD19 = os.clock()
	for LeakD17 = 1, 1000 do LeakD15() end
	local LeakD20 = os.clock() - LeakD19
	return LeakD18 > LeakD20 * 0.3 and LeakD18 < LeakD20 * 10
end

local LeakD21 = function()
	local LeakD22 = setmetatable({}, {__mode = "v"})
	for LeakD23 = 1, 100 do
		LeakD22[LeakD23] = {LeakD24 = LeakD23}
	end
	local LeakD25 = 0
	for LeakD26 in pairs(LeakD22) do LeakD25 = LeakD25 + 1 end
	local LeakD27 = os.clock()
	for LeakD23 = 1, 50 do
		local LeakD28 = {}
		for LeakD29 = 1, 100 do LeakD28[LeakD29] = {} end
	end
	local LeakD30 = os.clock() - LeakD27
	local LeakD31 = 0
	for LeakD26 in pairs(LeakD22) do LeakD31 = LeakD31 + 1 end
	return LeakD30 > 1e-8 and LeakD30 < 0.5 and LeakD31 <= LeakD25
end

if not LeakD1() then error("detected", 0) end
if not LeakD10() then error("detected", 0) end
if not LeakD12() then error("detected", 0) end
if not LeakD21() then error("detected", 0) end

print("pass")