--idk whats that , but js found

-- ===== Key System =====
local function __y2k_keygate()
-- ============================================================================
--  Y2k key provider  (drop-in replacement for the Junkie SDK)
--  Talks to YOUR Cloudflare Worker + KV key server (server-side hashing, HWID
--  auto-bind, expiry). CONFIGURE the two URLs below. Server: server-example/.
-- ============================================================================
local Junkie = {}
do
	local KEY_API  = "https://y2kscript.xyz"  -- your deployed Worker (LIVE)
	local KEY_LINK = "https://work.ink/2Dgt/ks-int12887-kq76mlra7lo" -- work.ink key link

	local HttpService = game:GetService("HttpService")
	local function enc(s) local ok, r = pcall(function() return HttpService:UrlEncode(s) end) return ok and r or s end
	local function httpGet(u)
		for _, f in ipairs({
			function() return game:HttpGetAsync(u) end,
			function() return game:HttpGet(u) end,
			function() return request and request({ Url = u, Method = "GET" }).Body end,
		}) do
			local ok, b = pcall(f); if ok and type(b) == "string" then return b end
		end
		return nil
	end
	local function hwid()
		local id
		pcall(function() id = (gethwid and gethwid()) or (get_hwid and get_hwid()) end)
		if not id then pcall(function() id = game:GetService("RbxAnalyticsService"):GetClientId() end) end
		return tostring(id or "unknown")
	end

	function Junkie.get_key_link() return KEY_LINK end
	function Junkie.check_key(key)
		if not key or key == "" then return { valid = false, message = "No key entered" } end
		local hw = hwid()
		local url = KEY_API .. "/check?key=" .. enc(key) .. "&hwid=" .. enc(hw) .. "&t=" .. tostring(os.time())
		local body = httpGet(url)
		if not body then return { valid = false, message = "Key server unreachable" } end
		local b = string.lower(body)
		if string.find(b, "ok", 1, true) then
			getgenv().HWID = hw
			return { valid = true, message = "KEY_VALID", hwid = hw }
		elseif string.find(b, "expired", 1, true) then
			return { valid = false, message = "Key expired" }
		elseif string.find(b, "hwid", 1, true) then
			return { valid = false, message = "Key locked to another device" }
		else
			return { valid = false, message = "Invalid key" }
		end
	end
end


-- Y2k key background. Paste your uploaded Roblox image id (e.g. "rbxassetid://123456")
-- to show it behind the key box. Leave "" for the blue-chrome gradient. For the
-- blurred look, upload a pre-blurred version of the image to Roblox and use its id.
local KEY_BG_IMAGE = ""

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")

local Icons = {
	Shield = "rbxassetid://105619007041452",
	Loading = "rbxassetid://116535712789945",
	Lock = "rbxassetid://114355063515473",
	Key = "rbxassetid://93569468678423",
	Check = "rbxassetid://119783053916823",
	CheckCircle = "rbxassetid://10709790644",
	XCircle = "rbxassetid://10747384394",
	Warning = "rbxassetid://130226573962640",
	Globe = "rbxassetid://10734950309",
	Info = "rbxassetid://94529541997278",
	ExternalLink = "rbxassetid://71038734318580",
	Copy = "rbxassetid://107485544510830",
	Spinner = "rbxassetid://10709767827",
	Database = "rbxassetid://114209748010261",
	Sparkles = "rbxassetid://10709767827",
	ErrorFolder = "rbxassetid://113312905787220",
	Candy = "rbxassetid://10709767827",
	JunkieNewIcon = "rbxassetid://75038032192167"
}

local function hasFileSystemSupport()
    local hasWritefile = pcall(function() return type(writefile) == "function" end)
    local hasReadfile = pcall(function() return type(readfile) == "function" end)
    local hasIsfile = pcall(function() return type(isfile) == "function" end)
    return hasWritefile and hasReadfile and hasIsfile
end

local fileSystemSupported = hasFileSystemSupport()

local function saveVerifiedKey(key)
    if not fileSystemSupported then return false end
    local ok = pcall(function() writefile("verified_key.txt", key) end)
    return ok
end

local function loadVerifiedKey()
    if not fileSystemSupported then return nil end
    local content
    local ok = pcall(function()
        if isfile("verified_key.txt") then
            content = readfile("verified_key.txt")
        end
    end)
    return (ok and content) or nil
end

local function clearSavedKey()
    if not fileSystemSupported then return false end
    local ok = pcall(function() delfile("verified_key.txt") end)
    return ok
end

local Configuration = {
	ScreenGuiName = "JunkieKeySystem",
	Window = {Size = UDim2.new(0, 333, 0, 500)},
	Colors = {
		Bg = Color3.fromRGB(12, 12, 12),
		Primary = Color3.fromRGB(59, 130, 246),
		PrimaryDark = Color3.fromRGB(37, 99, 235),
		StatusIdle = Color3.fromRGB(249, 115, 22),
		StatusSuccess = Color3.fromRGB(16, 185, 129),
		StatusError = Color3.fromRGB(239, 68, 68),
		StatusVerifying = Color3.fromRGB(59, 130, 246),
		StatusWarning = Color3.fromRGB(254, 188, 46),
		TextMain = Color3.fromRGB(255, 255, 255),
		TextSec = Color3.fromRGB(161, 161, 170),
		TextMuted = Color3.fromRGB(113, 113, 122),
		Border = Color3.fromRGB(255, 255, 255),
		TrafficRed = Color3.fromRGB(255, 95, 87),
		TrafficYellow = Color3.fromRGB(254, 188, 46),
		TrafficGreen = Color3.fromRGB(40, 200, 64),
		Success = Color3.fromRGB(50, 205, 110),
		Error = Color3.fromRGB(245, 70, 90),
		Warning = Color3.fromRGB(255, 200, 50)
	},
	BorderTransparency = 0.15,
	Animations = {
		VeryFast = 0.1,
		Fast = 0.2,
		Medium = 0.4,
		Slow = 0.5,
		VerySlow = 0.6,
		Bounce = 0.6
	},
	Fonts = {
		Title = 24,
		Subtitle = 12,
		Button = 14,
		Input = 16,
		Body = 13,
		Small = 11,
		Tiny = 12
	}
}

local Utils = {}

Utils.Tween = function(obj, props, time, style, dir)
	local t =
		TweenService:Create(
		obj,
		TweenInfo.new(time or 0.3, style or Enum.EasingStyle.Quint, dir or Enum.EasingDirection.Out),
		props
	)
	t:Play()
	return t
end

Utils.CreateCorner = function(parent, radius)
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, radius or Configuration.CornerRadius)
	corner.Parent = parent
	return corner
end

Utils.Round = function(obj, radius)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, radius or 12)
	c.Parent = obj
	return c
end

Utils.TweenBack = function(instance, properties, duration)
	return Utils.Tween(instance, properties, duration, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
end

Utils.CreateStroke = function(parent, color, thickness, transparency)
	local stroke = Instance.new("UIStroke")
	stroke.Color = color or Configuration.Colors.Border
	stroke.Thickness = thickness or 1
	stroke.Transparency = transparency or 0.77
	stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	stroke.Parent = parent
	return stroke
end

Utils.Stroke = function(obj, color, thick, trans)
	local s = Instance.new("UIStroke")
	s.Color = color or Color3.new(1, 1, 1)
	s.Thickness = thick or 1
	s.Transparency = trans or 0.9
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	s.Parent = obj
	return s
end

Utils.CreateGradient = function(parent, color1, color2, rotation)
	local gradient = Instance.new("UIGradient")
	gradient.Color =
		ColorSequence.new(
		{
			ColorSequenceKeypoint.new(0, color1),
			ColorSequenceKeypoint.new(1, color2)
		}
	)
	gradient.Rotation = rotation or 300
	gradient.Parent = parent
	return gradient
end

local function SetBlur(enabled)
	local blur = Lighting:FindFirstChild("JunkieBlur")
	if enabled then
		if not blur then
			blur = Instance.new("BlurEffect")
			blur.Name = "JunkieBlur"
			blur.Size = 0
			blur.Parent = Lighting
		end
		Utils.Tween(blur, {Size = 24}, Configuration.Animations.Bounce)
	elseif blur then
		Utils.Tween(blur, {Size = 0}, Configuration.Animations.Medium)
		task.delay(
			0.4,
			function()
				blur:Destroy()
			end
		)
	end
end

local ToastSystem = {ActiveToasts = {}, MaxToasts = 3, ToastSpacing = 10}

ToastSystem.Create = function(parent, message, toastType, duration, statusCode)
	local colors = {
		success = Configuration.Colors.Success,
		error = Configuration.Colors.Error,
		warning = Configuration.Colors.Warning,
		info = Configuration.Colors.Primary
	}
	local icons = {
		success = Icons.CheckCircle,
		error = Icons.ErrorFolder,
		warning = Icons.Warning,
		info = Icons.Info
	}
	local toastColor = colors[toastType] or colors.Bg
	local toastIcon = icons[toastType] or nil
	if #ToastSystem.ActiveToasts >= ToastSystem.MaxToasts then
		local oldest = table.remove(ToastSystem.ActiveToasts, 1)
		if oldest and oldest.Parent then
			oldest:Destroy()
		end
	end
	local toastHeight = 56
	local toast = Instance.new("Frame")
	toast.Name = tick()
	toast.Size = UDim2.new(0, 0, 0, toastHeight)
	toast.Position = UDim2.new(0.5, 0, 0, 20)
	toast.AnchorPoint = Vector2.new(0.5, 0)
	toast.BackgroundColor3 = Configuration.Colors.Bg
	toast.BackgroundTransparency = 0.5
	toast.BorderSizePixel = 0
	toast.ZIndex = 300
	toast.ClipsDescendants = true
	toast.Parent = parent
	Utils.Round(toast, 14)
	Utils.CreateStroke(toast, toastColor, 1, 0.1)
	Utils.CreateGradient(toast, Configuration.Colors.Bg, Configuration.Colors.Bg, 1)
	local iconBg = Instance.new("Frame")
	iconBg.Name = "IconBg"
	iconBg.Size = UDim2.new(0, 36, 0, 36)
	iconBg.Position = UDim2.new(0, 12, 0.5, 0)
	iconBg.AnchorPoint = Vector2.new(0, 0.5)
	iconBg.BackgroundColor3 = toastColor
	iconBg.BackgroundTransparency = 0.85
	iconBg.BorderSizePixel = 0
	iconBg.ZIndex = 301
	iconBg.Parent = toast
	Utils.Round(iconBg, 18)
	local icon = Instance.new("ImageLabel")
	icon.Name = "Icon"
	icon.Size = UDim2.new(0, 20, 0, 20)
	icon.Position = UDim2.new(0.5, 0, 0.5, 0)
	icon.AnchorPoint = Vector2.new(0.5, 0.5)
	icon.BackgroundTransparency = 1
	icon.Image = toastIcon
	icon.ImageColor3 = toastColor
	icon.ZIndex = 302
	icon.Parent = iconBg
	local textContainer = Instance.new("Frame")
	textContainer.Name = "TextContainer"
	textContainer.Size = UDim2.new(1, statusCode and -110 or -60, 1, 0)
	textContainer.Position = UDim2.new(0, 56, 0, 0)
	textContainer.BackgroundTransparency = 1
	textContainer.ZIndex = 301
	textContainer.Parent = toast
	local text = Instance.new("TextLabel")
	text.Name = "Message"
	text.Size = UDim2.new(1, 0, 1, 0)
	text.BackgroundTransparency = 1
	text.Text = message or ""
	text.TextColor3 = Configuration.Colors.TextMain
	text.TextSize = Configuration.Fonts.Body
	text.Font = Enum.Font.GothamMedium
	text.TextXAlignment = Enum.TextXAlignment.Left
	text.TextYAlignment = Enum.TextYAlignment.Center
	text.TextWrapped = true
	text.ZIndex = 301
	text.Parent = textContainer
	if statusCode then
		local statusBadge = Instance.new("Frame")
		statusBadge.Name = "StatusBadge"
		statusBadge.Size = UDim2.new(0, 44, 0, 28)
		statusBadge.Position = UDim2.new(1, -12, 0.5, 0)
		statusBadge.AnchorPoint = Vector2.new(1, 0.5)
		statusBadge.BackgroundColor3 = toastColor
		statusBadge.BackgroundTransparency = 0.8
		statusBadge.BorderSizePixel = 0
		statusBadge.ZIndex = 301
		statusBadge.Parent = toast
		Utils.Round(statusBadge, 8)
		Utils.CreateStroke(statusBadge, toastColor, 1, Configuration.BorderTransparency)
		local statusCodeLabel = Instance.new("TextLabel")
		statusCodeLabel.Name = "StatusCode"
		statusCodeLabel.Size = UDim2.new(1, 0, 1, 0)
		statusCodeLabel.BackgroundTransparency = 1
		statusCodeLabel.Text = tostring(statusCode)
		statusCodeLabel.TextColor3 = toastColor
		statusCodeLabel.TextSize = Configuration.Fonts.Small
		statusCodeLabel.Font = Enum.Font.GothamBold
		statusCodeLabel.ZIndex = 302
		statusCodeLabel.Parent = statusBadge
	end
	table.insert(ToastSystem.ActiveToasts, toast)
	ToastSystem.RepositionToasts()
	local targetWidth = 320
	Utils.TweenBack(toast, {Size = UDim2.new(0, targetWidth, 0, toastHeight)}, Configuration.Animations.Medium)
	task.delay(
		duration or 3.5,
		function()
			if toast.Parent then
				Utils.Tween(
					toast,
					{
						Position = UDim2.new(0.5, 0, 0, -80),
						BackgroundTransparency = 1
					},
					Configuration.Animations.Medium
				)
				for i, t in ipairs(ToastSystem.ActiveToasts) do
					if t == toast then
						table.remove(ToastSystem.ActiveToasts, i)
						break
					end
				end
				task.wait(Configuration.Animations.Medium)
				toast:Destroy()
				ToastSystem.RepositionToasts()
			end
		end
	)
	return toast
end

ToastSystem.RepositionToasts = function()
	for i, toast in ipairs(ToastSystem.ActiveToasts) do
		local targetY = 20 + ((i - 1) * (60 + ToastSystem.ToastSpacing))
		Utils.Tween(toast, {Position = UDim2.new(0.5, 0, 0, targetY)}, Configuration.Animations.Medium)
	end
end

-- Open the Discord invite directly in the user's Discord app (RPC), + copy the link.
local function openDiscord()
	local code = "EFFKrfFkPQ"
	pcall(function() (setclipboard or toclipboard or function() end)("https://discord.gg/" .. code) end)
	local req = (syn and syn.request) or (http and http.request) or http_request or request or (fluxus and fluxus.request)
	if req then
		pcall(function()
			req({
				Url = "http://127.0.0.1:6463/rpc?v=1",
				Method = "POST",
				Headers = { ["Content-Type"] = "application/json", Origin = "https://discord.com" },
				Body = game:GetService("HttpService"):JSONEncode({
					cmd = "INVITE_BROWSER",
					nonce = game:GetService("HttpService"):GenerateGUID(false),
					args = { code = code },
				}),
			})
		end)
	end
end

local function Build()
	local screen = Instance.new("ScreenGui")
	screen.Name = "Y2kKeySystem"
	screen.ResetOnSpawn = false
	screen.IgnoreGuiInset = true
	screen.DisplayOrder = 99999
	-- robust parenting (matches the main UI; works across executors)
	local LP = game:GetService("Players").LocalPlayer
	local parent
	pcall(function()
		if game:GetService("RunService"):IsStudio() and LP and LP:FindFirstChild("PlayerGui") then parent = LP.PlayerGui
		elseif typeof(gethui) == "function" then parent = gethui()
		elseif syn and typeof(syn.protect_gui) == "function" then syn.protect_gui(screen); parent = game:GetService("CoreGui")
		elseif typeof(protectgui) == "function" then protectgui(screen); parent = game:GetService("CoreGui")
		elseif cloneref then parent = cloneref(game:GetService("CoreGui"))
		else parent = game:GetService("CoreGui") end
	end)
	if not parent then parent = (LP and LP:FindFirstChild("PlayerGui")) or game:GetService("CoreGui") end
	local old = parent:FindFirstChild("Y2kKeySystem"); if old then old:Destroy() end
	-- NOTE: screen is parented at the END of Build (after the whole tree is built) to avoid
	-- "lacking capability Plugin" errors when adding children into a gethui-protected tree.

	SetBlur(true)

	-- lock player movement + camera until a key is redeemed
	local LP = game:GetService("Players").LocalPlayer
	local _camType, _controls
	pcall(function()
		local cam = workspace.CurrentCamera
		if cam then _camType = cam.CameraType; cam.CameraType = Enum.CameraType.Scriptable end
	end)
	pcall(function()
		_controls = require(LP:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
		_controls:Disable()
	end)
	local function _restore()
		pcall(function() if _camType then workspace.CurrentCamera.CameraType = _camType end end)
		pcall(function() if _controls then _controls:Enable() end end)
	end

	local C = {
		Bg = Color3.fromRGB(11, 11, 13), Field = Color3.fromRGB(26, 26, 30),
		Accent = Color3.fromRGB(91, 124, 255), Text = Color3.fromRGB(243, 243, 246),
		Sub = Color3.fromRGB(124, 124, 134), Green = Color3.fromRGB(52, 199, 89),
		Red = Color3.fromRGB(255, 80, 95), Hair = Color3.fromRGB(255, 255, 255),
	}
	local function corner(p, r) local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0, r) c.Parent = p end
	local function hair(p, t) local s = Instance.new("UIStroke") s.Color = C.Hair s.Transparency = t or 0.9 s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border s.Parent = p end

	-- Y2k logo (PNG on the worker; Roblox can't render webp)
	local logoImage = "https://y2kscript.xyz/asset?name=logo"
	if writefile and getcustomasset and isfile then
		pcall(function()
			if not isfile("y2k_logo.png") then writefile("y2k_logo.png", game:HttpGet(logoImage)) end
			logoImage = getcustomasset("y2k_logo.png")
		end)
	end

	local card = Instance.new("Frame")
	card.Name = "Card"
	card.Size = UDim2.fromOffset(360, 446)
	card.Position = UDim2.fromScale(0.5, 0.5)
	card.AnchorPoint = Vector2.new(0.5, 0.5)
	card.BackgroundColor3 = C.Bg
	card.BorderSizePixel = 0
	card.Parent = screen
	corner(card, 18); hair(card, 0.9)
	local shadow = Instance.new("ImageLabel")
	shadow.Image = "rbxassetid://6014261993"; shadow.ImageColor3 = Color3.new(0, 0, 0); shadow.ImageTransparency = 0.45
	shadow.ScaleType = Enum.ScaleType.Slice; shadow.SliceCenter = Rect.new(49, 49, 450, 450)
	shadow.Size = UDim2.new(1, 70, 1, 70); shadow.Position = UDim2.fromScale(0.5, 0.5); shadow.AnchorPoint = Vector2.new(0.5, 0.5)
	shadow.BackgroundTransparency = 1; shadow.ZIndex = 0; shadow.Parent = card

	local content = Instance.new("Frame")
	content.Size = UDim2.fromScale(1, 1); content.BackgroundTransparency = 1; content.Parent = card
	local pad = Instance.new("UIPadding")
	pad.PaddingTop = UDim.new(0, 30); pad.PaddingBottom = UDim.new(0, 24)
	pad.PaddingLeft = UDim.new(0, 26); pad.PaddingRight = UDim.new(0, 26); pad.Parent = content
	local list = Instance.new("UIListLayout")
	list.Padding = UDim.new(0, 14); list.HorizontalAlignment = Enum.HorizontalAlignment.Center
	list.SortOrder = Enum.SortOrder.LayoutOrder; list.Parent = content

	local logo = Instance.new("ImageLabel")
	logo.Size = UDim2.fromOffset(66, 66); logo.BackgroundTransparency = 1; logo.Image = logoImage; logo.LayoutOrder = 0; logo.Parent = content
	corner(logo, 16)

	local title = Instance.new("TextLabel")
	title.Size = UDim2.new(1, 0, 0, 24); title.BackgroundTransparency = 1; title.Text = "Y2k Script"
	title.TextColor3 = C.Text; title.Font = Enum.Font.GothamBold; title.TextSize = 21; title.LayoutOrder = 1; title.Parent = content

	local sub = Instance.new("TextButton")
	sub.Size = UDim2.new(1, 0, 0, 16); sub.BackgroundTransparency = 1; sub.Text = "discord.gg/EFFKrfFkPQ"
	sub.TextColor3 = C.Accent; sub.Font = Enum.Font.GothamMedium; sub.TextSize = 12; sub.LayoutOrder = 2
	sub.AutoButtonColor = false; sub.Parent = content
	sub.MouseButton1Click:Connect(function() openDiscord(); ToastSystem.Create(screen, "Opening Discord (link copied)", "success") end)
	sub.MouseEnter:Connect(function() Utils.Tween(sub, { TextColor3 = C.Accent:Lerp(Color3.new(1, 1, 1), 0.35) }, 0.15) end)
	sub.MouseLeave:Connect(function() Utils.Tween(sub, { TextColor3 = C.Accent }, 0.15) end)

	local status = Instance.new("TextLabel")
	status.Size = UDim2.new(1, 0, 0, 14); status.BackgroundTransparency = 1; status.Text = "ENTER YOUR KEY"
	status.TextColor3 = C.Sub; status.Font = Enum.Font.GothamBold; status.TextSize = 11; status.LayoutOrder = 3; status.Parent = content

	local inputFrame = Instance.new("Frame")
	inputFrame.Size = UDim2.new(1, 0, 0, 44); inputFrame.BackgroundColor3 = C.Field; inputFrame.BorderSizePixel = 0; inputFrame.LayoutOrder = 4; inputFrame.Parent = content
	corner(inputFrame, 11); hair(inputFrame, 0.88)
	local box = Instance.new("TextBox")
	box.Size = UDim2.new(1, -26, 1, 0); box.Position = UDim2.fromOffset(13, 0); box.BackgroundTransparency = 1
	box.PlaceholderText = "Paste your key..."; box.Text = ""; box.TextColor3 = C.Text; box.PlaceholderColor3 = C.Sub
	box.Font = Enum.Font.Gotham; box.TextSize = 14; box.TextXAlignment = Enum.TextXAlignment.Left; box.ClearTextOnFocus = false; box.Parent = inputFrame

	local redeem = Instance.new("TextButton")
	redeem.Size = UDim2.new(1, 0, 0, 44); redeem.BackgroundColor3 = C.Accent; redeem.Text = "Redeem"
	redeem.TextColor3 = Color3.new(1, 1, 1); redeem.Font = Enum.Font.GothamBold; redeem.TextSize = 14
	redeem.AutoButtonColor = false; redeem.LayoutOrder = 5; redeem.Parent = content
	corner(redeem, 11)
	do  -- premium accent button: vertical sheen gradient + glow border
		local g = Instance.new("UIGradient") g.Rotation = 90
		g.Color = ColorSequence.new(C.Accent:Lerp(Color3.new(1, 1, 1), 0.16), C.Accent:Lerp(Color3.new(0, 0, 0), 0.14))
		g.Parent = redeem
		local st = Instance.new("UIStroke") st.Color = C.Accent:Lerp(Color3.new(1, 1, 1), 0.4) st.Transparency = 0.35 st.Thickness = 1 st.Parent = redeem
		local sg = Instance.new("UIGradient") sg.Rotation = 90
		sg.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(1, 0.8) }) sg.Parent = st
	end

	local getKey = Instance.new("TextButton")
	getKey.Size = UDim2.new(1, 0, 0, 42); getKey.BackgroundColor3 = C.Field; getKey.Text = "Get Key"
	getKey.TextColor3 = C.Text; getKey.Font = Enum.Font.GothamBold; getKey.TextSize = 13
	getKey.AutoButtonColor = false; getKey.LayoutOrder = 6; getKey.Parent = content
	corner(getKey, 11); hair(getKey, 0.88)
	do  -- premium dark button: subtle depth gradient + accent-tinted hairline
		local g = Instance.new("UIGradient") g.Rotation = 90
		g.Color = ColorSequence.new(Color3.fromRGB(36, 36, 42), Color3.fromRGB(24, 24, 28))
		g.Parent = getKey
		local st = Instance.new("UIStroke") st.Color = C.Accent st.Transparency = 0.7 st.Thickness = 1 st.Parent = getKey
	end

	-- (no close button: the key system can't be closed until a key is redeemed)

	local function SetStatus(s)
		if s == "verifying" then status.Text = "VERIFYING..."; status.TextColor3 = C.Accent
		elseif s == "success" then status.Text = "ACCESS GRANTED"; status.TextColor3 = C.Green
		elseif s == "error" then status.Text = "INVALID KEY"; status.TextColor3 = C.Red
		else status.Text = "ENTER YOUR KEY"; status.TextColor3 = C.Sub end
	end

	redeem.MouseButton1Click:Connect(function()
		local key = (box.Text:gsub("%s+", ""))
		if key == "" then SetStatus("error"); return end
		SetStatus("verifying"); redeem.Text = "..."; redeem.Active = false
		local result = Junkie.check_key(key)
		redeem.Active = true; redeem.Text = "Redeem"
		if result and result.valid then
			saveVerifiedKey(key)
			getgenv().SCRIPT_KEY = key
			_restore()
			SetStatus("success")
			ToastSystem.Create(screen, "Access granted", "success")
			task.wait(0.55)
			SetBlur(false)
			Utils.Tween(card, { BackgroundTransparency = 1, Position = UDim2.new(0.5, 0, 0.5, 60) }, 0.4)
			task.delay(0.45, function() screen:Destroy() end)
		else
			SetStatus("error")
			ToastSystem.Create(screen, (result and result.message) or "Invalid key", "error")
		end
	end)
	getKey.MouseButton1Click:Connect(function()
		pcall(function() setclipboard(Junkie.get_key_link()) end)
		ToastSystem.Create(screen, "Key link copied to clipboard", "success")
	end)
	redeem.MouseEnter:Connect(function() Utils.Tween(redeem, { BackgroundColor3 = C.Accent:Lerp(Color3.new(1, 1, 1), 0.12) }, 0.15) end)
	redeem.MouseLeave:Connect(function() Utils.Tween(redeem, { BackgroundColor3 = C.Accent }, 0.15) end)
	getKey.MouseEnter:Connect(function() Utils.Tween(getKey, { BackgroundColor3 = Color3.fromRGB(38, 38, 44) }, 0.15) end)
	getKey.MouseLeave:Connect(function() Utils.Tween(getKey, { BackgroundColor3 = C.Field }, 0.15) end)

	local dragging, ds, sp
	card.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = true; ds = i.Position; sp = card.Position end end)
	UserInputService.InputChanged:Connect(function(i) if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then local d = i.Position - ds; card.Position = UDim2.new(sp.X.Scale, sp.X.Offset + d.X, sp.Y.Scale, sp.Y.Offset + d.Y) end end)
	UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = false end end)

	card.BackgroundTransparency = 0; card.Position = UDim2.fromScale(0.5, 0.5)  -- visible immediately (no reliance on intro tween)
	card.BackgroundTransparency = 1; card.Position = UDim2.new(0.5, 0, 0.5, 60)
	Utils.Tween(card, { BackgroundTransparency = 0, Position = UDim2.fromScale(0.5, 0.5) }, 0.45, Enum.EasingStyle.Quint)
	task.delay(0.6, function() if card and card.Parent then card.BackgroundTransparency = 0; card.Position = UDim2.fromScale(0.5, 0.5) end end)  -- failsafe

	-- parent the fully-built tree last (avoids the capability error)
	if not pcall(function() screen.Parent = parent end) then
		pcall(function() screen.Parent = (LP and LP:WaitForChild("PlayerGui", 5)) end)
	end
	return screen
end

local savedKey = loadVerifiedKey()
local keyToCheck = savedKey
if not keyToCheck then
    keyToCheck = getgenv().SCRIPT_KEY
end

local result = Junkie.check_key(keyToCheck)
if result and result.valid then
    if result.message == "KEYLESS" then
        getgenv().SCRIPT_KEY = "KEYLESS"
    elseif result.message == "KEY_VALID" then
        if not savedKey and keyToCheck then
            saveVerifiedKey(keyToCheck)
        end
        getgenv().SCRIPT_KEY = keyToCheck
    else
        Build()
    end
else
    Build()
end

while not getgenv().SCRIPT_KEY do
    task.wait(0.1)
end
end
__y2k_keygate()
do
  local MAP = {
    [5569032992] = 'Dandy World/Dandy-World',
    [6701277882] = 'FIsch It/Pechez-le',
    [9584852943] = 'Keyboard escape/keyboard escape',
    [10004244222] = 'Kick a Lucky Block/Kick a Lucky Block',
    [7395930870] = 'Sell a Lemon/Sell a Lemon',
    [10148749921] = 'Animal Anomaly/Animal Anomaly',
    [94987506187454] = 'Redliner/Redliner',
    [2834132652] = 'Redliner/Redliner',
    [7265339759] = 'Redliner/Redliner',
    [6170143659] = 'Demonology/Demonology',
    [18794863104] = 'Demonology/Demonology',
    [9977954973] = 'Paint-And-SEEK/Paint-And-SEEK',
    [78724049937437] = 'Paint-And-SEEK/Paint-And-SEEK',
    [10226701629] = 'Library clean/Library clean',
    [78079451644610] = 'Library clean/Library clean',
    [210851291] = 'Build a Boat for Treasure/Build a Boat for Treasure',
    [537413528] = 'Build a Boat for Treasure/Build a Boat for Treasure',
    [703124385] = 'Tower of Hell/Tower of Hell',
    [1962086868] = 'Tower of Hell/Tower of Hell',
    [10200395747] = 'Grow a garden 2/Grow a Garden 2',
    [3808081382] = 'Strongest Battleground/TSB',
    [6931042565] = 'VolleyBall Legend/VolleyBall-Legends',
    [1578560485] = 'Site 43/Site 43 script',
  }
  local name = MAP[game.GameId] or MAP[game.PlaceId]
  if not name then return warn('[Y2k] this game is not supported yet (GameId ' .. tostring(game.GameId) .. ')') end
  local KEY = (getgenv and (getgenv().SCRIPT_KEY or getgenv().Key)) or _G.Key
  local HWID = getgenv and getgenv().HWID
  if not HWID or HWID == '' then
    pcall(function() HWID = (gethwid and gethwid()) or (get_hwid and get_hwid()) end)
    if not HWID then pcall(function() HWID = game:GetService('RbxAnalyticsService'):GetClientId() end) end
  end
  HWID = tostring(HWID or 'unknown')
  local HS = game:GetService('HttpService')
  local function enc(s) local ok,r = pcall(function() return HS:UrlEncode(s) end) return ok and r or s end
  local function httpGet(u)
    for _,f in ipairs({
      function() return game:HttpGetAsync(u) end,
      function() return game:HttpGet(u) end,
      function() return request and request({Url=u,Method='GET'}).Body end,
    }) do local ok,b = pcall(f) if ok and type(b)=='string' then return b end end
  end
  local url = 'https://y2kscript.xyz' .. '/deliver?name=' .. enc(name) .. '&key=' .. enc(tostring(KEY)) .. '&hwid=' .. enc(HWID)
  local body = httpGet(url)
  if not body then return warn('[Y2k] server unreachable') end
  if string.sub(body,1,3) ~= 'ok\n' then return warn('[Y2k] ' .. tostring(body)) end
  local fn = (loadstring or load)(string.sub(body,4), '=Y2k')
  if fn then fn() else warn('[Y2k] load failed') end
end