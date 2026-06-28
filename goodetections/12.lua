local detected = false

-- 1. 핵심 서비스 체크
local requiredServices = {
    "Players",
    "Workspace",
    "ReplicatedStorage",
    "RunService",
    "UserInputService"
}

for _, svc in ipairs(requiredServices) do
    local ok, result = pcall(function()
        return game:GetService(svc)
    end)

    if not ok or typeof(result) ~= "Instance" then
        detected = true
        warn("[DETECTED] Missing service:", svc)
    end
end

-- 2. LocalPlayer 체크
local Players = game:GetService("Players")
if not Players.LocalPlayer then
    detected = true
    warn("[DETECTED] No LocalPlayer")
end

-- 3. Character 존재 여부
local char = Players.LocalPlayer and Players.LocalPlayer.Character
if not char then
    detected = true
    warn("[DETECTED] No Character")
end

-- 4. 메타테이블 체크 (hook 감지용)
local part = Instance.new("Part")
local mt = getrawmetatable(part)

if not mt or type(mt.__index) ~= "function" then
    detected = true
    warn("[DETECTED] Metatable abnormal")
end

part:Destroy()

-- 5. HttpService GUID 테스트
local HttpService = game:GetService("HttpService")
local guid1 = HttpService:GenerateGUID(false)
local guid2 = HttpService:GenerateGUID(false)

if guid1 == guid2 then
    detected = true
    warn("[DETECTED] GUID not random")
end

-- 결과 출력
if detected then
    print("detected ")
else
    print("pass ")
end