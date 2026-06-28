local detected = false

-- 1. newproxy ve metatable kontrolü
local proxy = newproxy(true)
local mt = getmetatable(proxy)

-- Sandbox'lar genellikle proxy'lerin metatable'ını gizlemek veya 
-- erişimi engellemek için hook'lar kullanır.
if typeof(proxy) ~= "userdata" then
    detected = true
    warn("[DETECTED] newproxy type mismatch")
end

-- 2. Metatable erişim testi (Hook koruması)
local success, err = pcall(function()
    mt.__metatable = "Locked"
    return getmetatable(proxy)
end)

if not success or getmetatable(proxy) ~= "Locked" then
    detected = true
    warn("[DETECTED] Metatable hook detected")
end

-- 3. Environment/Global fonksiyon izolasyon kontrolü
-- Eğer bir sandbox environment'ı "temizlediyse", bazı global fonksiyonlar 
-- silinmiş veya değiştirilmiş olabilir.
local function checkEnvironment()
    local protectedFunctions = {"print", "warn", "error", "pcall", "type"}
    for _, funcName in ipairs(protectedFunctions) do
        if typeof(_G[funcName]) ~= "function" then
            return true
        end
    end
    return false
end

if checkEnvironment() then
    detected = true
    warn("[DETECTED] Global environment modified")
end

-- 4. __tostring manipülasyon kontrolü
local checkString = tostring(proxy)
if checkString == nil or checkString == "" then
    detected = true
    warn("[DETECTED] __tostring manipulation")
end

-- Sonuç
if detected then
    print("Security alert: Sandbox detected.")
else
    print("Environment check passed.")
end