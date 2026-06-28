local function expectError(label, fn)
	local ok = pcall(fn)
	if ok then
		print("white didnt fail when supposed to:", label)
	else
		print("ok:", label)
	end
end

local ms = game:GetService("MarketplaceService")
local ls = game:GetService("LocalizationService")
local hs = game:GetService("HttpService")

expectError("MarketplaceService:GetProductInfo negative id", function()
	ms:GetProductInfo(-1e30, Enum.InfoType.Asset)
end)

expectError("MarketplaceService:GetProductInfo non-number id", function()
	ms:GetProductInfo({}, Enum.InfoType.Asset)
end)

expectError("LocalizationService:GetCountryRegionForPlayerAsync wrong type", function()
	ls:GetCountryRegionForPlayerAsync(coroutine.create(function() end))
end)

expectError("HttpService:JSONDecode invalid JSON", function()
	hs:JSONDecode("{\"x\":\"\\\"}")
end)

expectError("buffer.writeu32 out of bounds", function()
	local b = buffer.create(16)
	buffer.writeu32(b, 999999, 0xCAFEBABE)
end)

print("repro done")
