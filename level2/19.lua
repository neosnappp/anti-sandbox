local function detect(reason)
    error("[Cypher Protect] Detected: " .. tostring(reason), 0)
end

if _VERSION ~= "Luau" then
    detect("not a Luau environment")
end

if not task then
    detect("task library missing")
end

if not time then
    detect("time() missing")
end

if not pcall then
    detect("pcall is missing")
end

local loadFn = loadstring or load
assert(loadFn, "[AntiTamper] No load function available")

local loadTest = loadFn("return 123")
assert(loadTest and loadTest() == 123, "[AntiTamper] loadstring is broken")

local luneChunk = loadFn('return require("@lune/fs")')
local luneOk = luneChunk and pcall(luneChunk)
if luneOk then
    detect("lune/fs runtime detected")
end

local lfsChunk = loadFn('return require("lfs")')
local lfsOk = lfsChunk and pcall(lfsChunk)
if lfsOk then
    detect("lfs runtime detected")
end

if getfenv ~= getfenv then
    detect("getfenv identity check failed")
end

local env1 = getfenv()
local env2 = getfenv()
if env1 ~= env2 then
    detect("getfenv returned different environments")
end

if _SUPER then
    detect("_SUPER is set")
end

if not Vector3 or not Vector2 or not UDim2 then
    detect("core Roblox types missing")
end

local baseVec = Vector3.one
for i = 1, 10 do
    local n = math.random(1, 67)
    local expected = Vector3.new(n, n, n)
    if baseVec * n ~= expected then
        detect("Vector3 math is incorrect")
    end
end

local v3i = Vector3int16.new(1, 1, 1)
local v2i = Vector2int16.new(1, 1)
if v3i.X ~= v2i.X then
    detect("Vector int16 mismatch")
end

local instanceOk, _ = pcall(function()
    local p = Instance.new("Part", game)
    p.Name = "AntitamperCheck"
    p:Destroy()
end)
if not instanceOk then
    detect("Instance.new is broken or spoofed")
end

local tweenOk = pcall(function()
    local frame = Instance.new("Frame")
    frame.Position = UDim2.new(0, 0, 0, 0)

    local tweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(0.01)
    local goal = { Position = UDim2.fromScale(1, 1) }

    local tween = tweenService:Create(frame, tweenInfo, goal)
    tween:Play()
    tween.Completed:Wait()
    frame:Destroy()
end)
if not tweenOk then
    detect("TweenService/UI environment is not real Roblox")
end

local mt = {}
local protected = setmetatable({}, mt)
mt.__metatable = "protected"
if getmetatable(protected) ~= "protected" then
    detect("metatable protection broken")
end