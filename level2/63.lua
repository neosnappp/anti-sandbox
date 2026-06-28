local failures = 0

local function expect(label, condition, details)
	if condition then
		print(label .. ": pass")
		return
	end

	failures += 1
	if details ~= nil then
		warn(label .. ": failed - " .. tostring(details))
	else
		warn(label .. ": failed")
	end
end

local function expectFail(label, callback)
	local ok, err = pcall(callback)
	if ok then
		failures += 1
		warn(label .. ": larry didnt fail when supposed to")
		return
	end

	print(label .. ": pass")
end

local part = Instance.new("Part")
local camera = workspace.CurrentCamera

expectFail("Part.Name = thread", function()
	part.Name = coroutine.create(function() end)
end)

if camera ~= nil then
	local originalFov = camera.FieldOfView
	local setOk = pcall(function()
		camera.FieldOfView = -10
	end)
	expect("Camera FOV assignment does not hard-error", setOk)
	expect("Camera FOV is clamped", camera.FieldOfView ~= -10, camera.FieldOfView)
	camera.FieldOfView = originalFov
else
	expect("Workspace.CurrentCamera exists", false)
end

local sizeChanged = false
part:GetPropertyChangedSignal("Size"):Connect(function()
	sizeChanged = true
end)
part.Size = Vector3.new(3, 3, 3)
task.wait(0.05)
expect("GetPropertyChangedSignal(Size)", sizeChanged)

local function depth(n)
	if n == 0 then
		return 0
	end
	return depth(n - 1)
end

local stackOk, stackErr = pcall(depth, 1500)
expect("Deep recursion stack guard", (not stackOk) and tostring(stackErr):lower():find("stack", 1, true) ~= nil, stackErr)

local localization = game:GetService("LocalizationService")
local locales = localization:GetCorescriptLocalizations()
expect("LocalizationService.GetCorescriptLocalizations()", type(locales) == "table" and #locales > 0, locales and #locales)

part:Destroy()

if failures == 0 then
	print("repro_runtime_sanity: all pass")
else
	warn(("repro_runtime_sanity: %d failure(s)"):format(failures))
end
