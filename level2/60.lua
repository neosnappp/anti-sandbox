local function fail(reason)
    warn("[ANTI TAMPER] " .. reason)
    return false
end

local function antiTamper()
    local Players = game:GetService("Players")

    -- 1. Instance check
    if typeof(Players) ~= "Instance" then
        return fail("Players is not Instance")
    end

    -- 2. LocalPlayer
    if not Players.LocalPlayer then
        return fail("LocalPlayer missing")
    end

    -- 3. Signal check
    local sig = Players.PlayerAdded
    if typeof(sig) ~= "RBXScriptSignal" then
        return fail("PlayerAdded is not RBXScriptSignal")
    end

    local c = sig:Connect(function() end)
    if typeof(c) ~= "RBXScriptConnection" then
        return fail("Connection is not RBXScriptConnection")
    end
    c:Disconnect()

    -- 4. getgenv stability
    local g = getgenv()
    if g ~= getgenv() then
        return fail("getgenv not stable (fake env)")
    end

    -- 5. metatable check
    local mt = getrawmetatable(game)
    if not mt then
        return fail("metatable missing")
    end

    if type(mt.__namecall) ~= "function" then
        return fail("__namecall missing")
    end

    -- 6. debug library check
    if not debug or not debug.getinfo then
        return fail("debug library missing")
    end

    -- 7. coroutine
    local co = coroutine.create(function() return 123 end)
    local ok, res = coroutine.resume(co)
    if not ok or res ~= 123 then
        return fail("coroutine broken")
    end

    return true
end

local ok = antiTamper()

if not ok then
    error("Tamper detected (see warnings above)")
else
    print("Environment OK")
end