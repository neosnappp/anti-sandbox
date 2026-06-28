local http_service = game:GetService("HttpService")
local run_service = game:GetService("RunService")
local syn = syn or nil
local bxor = bit32.bxor
local band = bit32.band
local bor = bit32.bor
local bnot = bit32.bnot
local rshift = bit32.rshift
local lshift = bit32.lshift

local function hash_function(func)
    local s, info = pcall(debug.getinfo, func)
    if not s or not info then return 0 end
    local hash = 0
    local str = tostring(func) .. tostring(info.source or "") .. tostring(info.linedefined or 0)
    for i = 1, #str do
        hash = bxor(lshift(hash, 5) + hash, string.byte(str, i))
    end
    return hash
end

local function deep_check(closure, depth)
    depth = depth or 0
    if depth > 5 then return false end
    
    local s1, original_hash = pcall(hash_function, closure)
    if not s1 then return true end
    
    task.wait(0.001)
    
    local s2, new_hash = pcall(hash_function, closure)
    if not s2 then return true end
    
    if original_hash ~= new_hash then
        return true
    end
    
    local wrapped = coroutine.wrap(closure)
    local success, result = pcall(wrapped)
    
    if not success then
        local result_str = tostring(result)
        if string.find(result_str, "C stack") or string.find(result_str, "overflow") then
            return true
        end
    end
    
    return false
end

local function is_hooked(closure)
    if type(closure) ~= "function" then
        return true
    end
    
    local checks = {
        function() return deep_check(closure, 0) end,
        function()
            local test_closure = closure
            for _ = 1, 198 do
                test_closure = coroutine.wrap(test_closure)
            end
            local s, o = pcall(test_closure)
            return (not s) and string.find(tostring(o), "C stack overflow")
        end,
        function()
            local s, i = pcall(debug.getinfo, closure)
            if not s or not i then return true end
            return i.what ~= "C"
        end
    }
    
    local results = 0
    for _, check in ipairs(checks) do
        local s, r = pcall(check)
        if s and r then
            results = results + 1
        end
    end
    
    return results >= 2
end

local function polymorphic_wait(duration)
    local methods = {
        function(d) task.wait(d) end,
        function(d) 
            local t = os.clock()
            repeat task.wait() until os.clock() - t >= d
        end,
        function(d)
            local c = 0
            local t = os.clock()
            repeat
                c = c + 1
                if c % 1000 == 0 then task.wait() end
            until os.clock() - t >= d
        end
    }
    return methods[math.random(1, #methods)](duration)
end

local function timing_variance()
    local samples = {}
    local methods = {os.clock, tick, time}
    
    for i = 1, 5 do
        local method = methods[math.random(1, #methods)]
        local t1 = method()
        polymorphic_wait(0.05)
        local t2 = method()
        samples[i] = t2 - t1
    end
    
    local min_val = math.huge
    local max_val = -math.huge
    
    for _, v in ipairs(samples) do
        if type(v) == "number" and v == v then
            min_val = math.min(min_val, v)
            max_val = math.max(max_val, v)
        end
    end
    
    return (max_val - min_val) > 0.02 or min_val < 0.03
end

local function entropy_check()
    local values = {}
    for i = 1, 20 do
        values[i] = math.random(1, 2^20)
    end
    
    local sum = 0
    for i = 1, #values do
        for j = i + 1, #values do
            sum = bxor(sum, band(values[i], values[j]))
        end
    end
    
    return sum == 0
end

local function stack_integrity_check()
    local depth = 0
    local max_depth = 200
    
    local function recurse()
        depth = depth + 1
        if depth < max_depth then
            return recurse()
        end
        return depth
    end
    
    local s, result = pcall(recurse)
    
    if not s then
        return true
    end
    
    return result ~= max_depth
end

local function obfuscate(fn)
    local salt = math.random(1, 2^30)
    local noise_a = {}
    local noise_b = {}
    local mask = math.random(1, 2^16)

    for i = 1, 128 do
        noise_a[i] = math.random(1, 2^31 - 1)
        noise_b[i] = bxor(noise_a[i], mask)
    end

    local function transform(value, idx)
        local result = value
        for i = 1, 3 do
            result = bxor(result, noise_a[(idx + i - 1) % #noise_a + 1])
            result = band(result + noise_b[(idx + i - 1) % #noise_b + 1], 2^31 - 1)
            result = bxor(rshift(result, 7), lshift(result, 3))
        end
        return result
    end

    local function layer1(...)
        local args = table.pack(...)
        local x = transform(salt, 1)

        local function layer2()
            local y = transform(x, 2)
            y = bxor(y, mask)

            local function layer3()
                local z = transform(y, 3)
                
                for i = 1, 16 do
                    local idx = i % #noise_a + 1
                    z = bxor(z, noise_a[idx])
                    z = band(z + noise_b[idx], 2^31 - 1)
                    z = bor(band(z, bnot(1)), band(z, 1))
                end

                local function layer4()
                    local w = transform(z, 4)
                    
                    for i = 1, 8 do
                        w = w + i - i
                        w = bxor(w, lshift(i, 4))
                    end
                    
                    local function layer5()
                        local result = transform(w, 5)
                        result = bxor(result, salt)
                        return fn(table.unpack(args, 1, args.n))
                    end

                    return layer5()
                end

                return layer4()
            end

            return layer3()
        end

        return layer2()
    end

    return function(...)
        salt = transform(salt, math.random(1, 100))
        mask = bxor(mask, salt % 2^16)
        return layer1(...)
    end
end

local __checks__ = {
    obfuscate(function() return http_request and is_hooked(http_request) end),
    obfuscate(function() return request and is_hooked(request) end),
    obfuscate(function() return syn and syn.request and is_hooked(syn.request) end),
    obfuscate(function() return http and http.request and is_hooked(http.request) end),
    obfuscate(function() return http and http.get and is_hooked(http.get) end),
    obfuscate(function() return http_service and is_hooked(http_service.GetAsync) end),
    obfuscate(function() return http_service and is_hooked(http_service.PostAsync) end),
    obfuscate(function() return http_service and is_hooked(http_service.RequestAsync) end),
    obfuscate(function() return http_service and is_hooked(http_service.JSONEncode) end),
    obfuscate(function() return http_service and is_hooked(http_service.JSONDecode) end),
    obfuscate(function() return game.HttpGetAsync and is_hooked(game.HttpGetAsync) end),
    obfuscate(function() return game.HttpPostAsync and is_hooked(game.HttpPostAsync) end),
    obfuscate(function() return debug and debug.getinfo and is_hooked(debug.getinfo) end),
    obfuscate(function() return debug and debug.traceback and is_hooked(debug.traceback) end),
    obfuscate(function() return debug and debug.getmetatable and is_hooked(debug.getmetatable) end),
    obfuscate(function() return debug and debug.setmetatable and is_hooked(debug.setmetatable) end),
    obfuscate(function() return debug and debug.getupvalue and is_hooked(debug.getupvalue) end),
    obfuscate(function() return debug and debug.setupvalue and is_hooked(debug.setupvalue) end),
    obfuscate(function() return task and task.spawn and is_hooked(task.spawn) end),
    obfuscate(function() return task and task.defer and is_hooked(task.defer) end),
    obfuscate(function() return task and task.wait and is_hooked(task.wait) end),
    obfuscate(function() return run_service and run_service.Heartbeat and is_hooked(run_service.Heartbeat.Connect) end),
    obfuscate(function() return run_service and run_service.RenderStepped and is_hooked(run_service.RenderStepped.Connect) end),
    obfuscate(function() return getfenv and is_hooked(getfenv) end),
    obfuscate(function() return setfenv and is_hooked(setfenv) end),
    obfuscate(function() return getrawmetatable and is_hooked(getrawmetatable) end),
    obfuscate(function() return setrawmetatable and is_hooked(setrawmetatable) end),
    obfuscate(function() return timing_variance() end),
    obfuscate(function() return entropy_check() end),
    obfuscate(function() return stack_integrity_check() end)
}

local __integrity__ = {
    obfuscate(function() return is_hooked(bxor) end),
    obfuscate(function() return is_hooked(band) end),
    obfuscate(function() return is_hooked(bor) end),
    obfuscate(function() return is_hooked(bnot) end),
    obfuscate(function() return is_hooked(rshift) end),
    obfuscate(function() return is_hooked(lshift) end),
    obfuscate(function() return is_hooked(pcall) end),
    obfuscate(function() return is_hooked(xpcall) end),
    obfuscate(function() return is_hooked(coroutine.wrap) end),
    obfuscate(function() return is_hooked(coroutine.create) end),
    obfuscate(function() return is_hooked(math.random) end),
    obfuscate(function() return is_hooked(os.clock) end),
    obfuscate(function() return is_hooked(tick) end),
    obfuscate(function() return is_hooked(time) end),
    obfuscate(function() return is_hooked(table.pack) end),
    obfuscate(function() return is_hooked(table.unpack) end)
}

print("[ANTITAMPER] checking enviroment")

local function run_checks()
    for i = 1, #__checks__ do
        local s, r = pcall(__checks__[i])
        if s and r then
            print("[ANTITAMPER] detection triggered at check index:", i)
            return true
        end
    end
    
    for i = 1, #__integrity__ do
        local s, r = pcall(__integrity__[i])
        if s and r then
            print("[ANTITAMPER] integrity violation at index:", i)
            return true
        end
    end
    
    return false
end

task.spawn(function()
    print("[ANTITAMPER] background monitoring thread started")
    while true do
        if run_checks() then
            print("[ANTITAMPER] tampering detected in background check")
            error("dtc")
        end
        polymorphic_wait(math.random(5, 15))
    end
end)

if run_checks() then
    print("[ANTITAMPER] initial validation failed")
    error("dtc")
else
    print("[ANTITAMPER] all integrity checks passed")
    print("[ANTITAMPER] environment verified!")
end