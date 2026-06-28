-- Made by getgold.cc, get a free (beta) obfuscator @ wYnFuscate.com (obfuscator made by THE wYn)

-- no object method checks (change name of InvalidMethod to avoid predefine)
-- confirmed detected: crypta 1, 25ms
-- confirmed undetected: unveilr v2 (threaded), unix
local Success = pcall(function()
	Instance.new("Part"):InvalidMethod("a")
end)

while Success do
	task.spawn() -- invalid argument #1 to 'spawn' (function or thread expected)
end

-- function exploration (change method from GetChildren to avoid predefine)
-- confirmed detected: 25ms, unveilr v2 (threaded)
-- confirmed undetected: unix, crypta l1
game:GetChildren(function()
	while true do
		({})[nil] = true -- table index is nil
	end
end)

-- wrong amount of services as children
-- confirmed detected: crypta 1, unveilr v2 (threaded)
-- confirmed undetected: 25ms, unix
while #game:GetChildren() <= 4 do
	buffer.writei8(buffer.fromstring("a"), 1, 2) -- buffer access out of bounds
end

-- jsondecode doesn't decode (change values in json table to avoid predefine)
-- confirmed detected: unix? (may patch), crypta l1, 25ms
-- confirmed undetected: unveilr v2 (threaded)
local Success, Result = pcall(function()
	return game:GetService("HttpService"):JSONDecode('[68, "getgold.cc", true, 123, false, [321, null, "goldtm"], null, ["a"]]')
end)

while not Success do
	task() -- attempt to call a table value
end

while Result[6][2] ~= nil do
	(true)() -- attempt to call a boolean value
end

-- services don't exist as indexable children in the game (change service name to avoid predefine)
-- confirmed detected: unix? (may patch)
local Success = pcall(function()
	return game.HttpService
end)

while not Success do
	local _ = (nil).Parent -- attempt to index nil with 'Parent'
end

-- modifying _G also modifies the function environment (change _G var name and value to avoid predefine)
-- confirmed detected: unix? (may patch), 25ms
_G.getgoldcc = "goldtm"

while getfenv().getgoldcc ~= nil do
	game() -- attempt to call a Instance value
end

_G.getgoldcc = nil

-- game object is a table/non-existent, instead of an Instance
-- confirmed detected: unix? (may patch)
local _, Message = pcall(function()
	game()
end)

while not Message:find("attempt to call a Instance value") do
	table.create(9e9) -- invalid argument #1 to 'create' (size out of range)
end

--[[ Right before obfuscating, paste this code above/before your source code, and your script will not be able to be env logged ]]
print("SUP")