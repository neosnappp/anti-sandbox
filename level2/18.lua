-- 0. Anti-dump: Poison decompilation debug functions
-- Only poison debug.info/getinfo (used by env loggers for script dumping)
-- Keep getupvalue/setupvalue/getlocal/sethook intact — obfuscated VMs need them
pcall(function()
  if debug then
    debug.info = nil
    debug.getinfo = nil
  end
end)
pcall(function()
  if decompile then decompile = function() return "" end end
  if getscriptbytecode then getscriptbytecode = function() return "" end end
  if dumpstring then dumpstring = function() return "" end end
end)

-- 0b. Anti-hook: Log C closure status of critical functions
-- Some legit executors (Solara, etc.) wrap built-ins as Lua closures,
-- so this is informational only — not a hard fail.
pcall(function()
  if iscclosure then
    _ENV_RESULTS.functions_hooked = false
    _ENV_RESULTS.cclosure_loadstring = pcall(iscclosure, loadstring) and iscclosure(loadstring) or false
    _ENV_RESULTS.cclosure_tostring = pcall(iscclosure, tostring) and iscclosure(tostring) or false
    _ENV_RESULTS.cclosure_type = pcall(iscclosure, type) and iscclosure(type) or false
  end
end)

-- 1. Hookfunction detection
pcall(function()
  _ENV_RESULTS.has_hookfunction = (hookfunction ~= nil or hookmetamethod ~= nil)
  if hookfunction then
    local original = print
    local hooked = false
    local old = hookfunction(print, function(...)
      hooked = true
      return original(...)
    end)
    if old then hookfunction(print, old) end
    _ENV_RESULTS.hookfunction_test = not hooked
  end
end)

-- 2. Game environment info
pcall(function()
  _ENV_RESULTS.place_id = tostring(game.PlaceId)
  _ENV_RESULTS.job_id = tostring(game.JobId)
  _ENV_RESULTS.game_id = tostring(game.GameId)
  _ENV_RESULTS.creator_id = tostring(game.CreatorId)
end)

-- 3. Player info
pcall(function()
  local Players = game:GetService("Players")
  local lp = Players.LocalPlayer
  if lp then
    _ENV_RESULTS.user_id = tostring(lp.UserId)
    _ENV_RESULTS.username = lp.Name
    _ENV_RESULTS.display_name = lp.DisplayName
  end
end)

-- 4. Executor function checks
pcall(function()
  _ENV_RESULTS.has_getgenv = (getgenv ~= nil)
  _ENV_RESULTS.has_getrenv = (getrenv ~= nil)
  _ENV_RESULTS.has_getnamecallmethod = (getnamecallmethod ~= nil)
  _ENV_RESULTS.has_newcclosure = (newcclosure ~= nil)
  _ENV_RESULTS.has_iscclosure = (iscclosure ~= nil)
  _ENV_RESULTS.has_checkcaller = (checkcaller ~= nil)
  _ENV_RESULTS.has_getcallingscript = (getcallingscript ~= nil)
end)

-- 5. Studio detection
pcall(function()
  local RunService = game:GetService("RunService")
  _ENV_RESULTS.is_studio = RunService:IsStudio()
  _ENV_RESULTS.is_client = RunService:IsClient()
  _ENV_RESULTS.is_server = RunService:IsServer()
end)

-- 6. Crypto library availability (for E2EE)
pcall(function()
  _ENV_RESULTS.has_crypt = (crypt ~= nil)
  if crypt then
    _ENV_RESULTS.has_crypt_encrypt = (crypt.encrypt ~= nil)
    _ENV_RESULTS.has_crypt_decrypt = (crypt.decrypt ~= nil)
    _ENV_RESULTS.has_crypt_generatekey = (crypt.generatekey ~= nil)
    _ENV_RESULTS.has_crypt_hash = (crypt.hash ~= nil)
    _ENV_RESULTS.has_crypt_base64 = (crypt.base64encode ~= nil)
  end
  -- Check syn.crypt fallback
  if syn and syn.crypt then
    _ENV_RESULTS.has_syn_crypt = true
  end
end)

-- 7. HWID retrieval
pcall(function()
  if gethwid then
    _ENV_RESULTS.hwid = gethwid()
  elseif getexecutorname and getexecutorname():lower():find("wave") then
    _ENV_RESULTS.hwid = "wave_" .. tostring(game:GetService("Players").LocalPlayer.UserId)
  end
end)

-- 8. HttpService availability
pcall(function()
  local HttpService = game:GetService("HttpService")
  _ENV_RESULTS.http_enabled = HttpService.HttpEnabled
end)

-- 9. Luau runtime fingerprint (anti-emulation)
-- Real Roblox Luau error messages use backticks for property names.
-- Emulated/spoofed environments won't replicate this formatting.
pcall(function()
  local _, errMsg = pcall(function() game.IsLoaded = true end)
  _ENV_RESULTS.luau_runtime = type(errMsg) == "string" and string.find(errMsg, "`") ~= nil
  -- Informational only — some real executors (e.g. Solara) don't produce backtick errors
end)

-- =============================================
-- Anti-Sandbox / Anti-Env-Logger Checks
-- Env loggers run code in sandboxed environments
-- that don't fully replicate Roblox runtime behavior
-- =============================================

-- 10. Heartbeat frame counter
-- Real Roblox fires RunService.Heartbeat every frame (~60fps).
-- Env loggers run connections once or never — they won't reach 2 fires.
pcall(function()
  local ranTimes = 0
  local conn = game:GetService("RunService").Heartbeat:Connect(function()
    ranTimes = ranTimes + 1
  end)
  local attempts = 0
  repeat
    task.wait()
    attempts = attempts + 1
  until ranTimes >= 2 or attempts >= 8
  conn:Disconnect()
  _ENV_RESULTS.heartbeat_frames = ranTimes
end)

-- 11. Memory usage check
-- Real executors have active Lua GC memory > 0. Sandboxes often report 0.
pcall(function()
  local mem = 0
  if gcinfo then
    mem = gcinfo()
  end
  if mem == 0 then
    local ok, result = pcall(collectgarbage, "count")
    if ok and type(result) == "number" then
      mem = result
    end
  end
  _ENV_RESULTS.memory_kb = mem
end)

-- 12. Task scheduler timing validation
-- In real Roblox, task.wait() takes real frame time (~16ms at 60fps).
-- In sandboxes, task.wait() may return instantly (0ms).
pcall(function()
  local t0 = os.clock()
  task.wait()
  local elapsed = os.clock() - t0
  _ENV_RESULTS.frame_time = elapsed
end)

-- 13. CoreGui / PlayerGui depth check
-- Real Roblox has a populated Players service and valid player hierarchy.
-- Sandboxes often have empty or shallow instance trees.
pcall(function()
  local count = 0
  local lp = game:GetService("Players").LocalPlayer
  if lp then
    for _, child in ipairs(lp:GetChildren()) do
      count = count + 1
    end
  end
  _ENV_RESULTS.player_children = count
end)

-- 14. os.clock / tick consistency check
-- Real Roblox has consistent time sources. Sandboxes may return 0 or static values.
pcall(function()
  local clockVal = os.clock()
  local tickVal = tick()
  _ENV_RESULTS.os_clock = clockVal
  _ENV_RESULTS.tick_val = tickVal
  _ENV_RESULTS.time_consistent = (clockVal > 0 and tickVal > 0)
end)

-- 15. Metamethod hooking detection
-- Detect if __namecall, __index, __newindex on game objects are hooked
pcall(function()
  if getrawmetatable then
    local mt = getrawmetatable(game)
    if mt then
      local nc = rawget(mt, "__namecall")
      local idx = rawget(mt, "__index")
      local ni = rawget(mt, "__newindex")
      _ENV_RESULTS.namecall_is_c = (nc ~= nil and iscclosure ~= nil) and (pcall(iscclosure, nc) and iscclosure(nc)) or nil
      _ENV_RESULTS.index_is_c = (idx ~= nil and iscclosure ~= nil) and (pcall(iscclosure, idx) and iscclosure(idx)) or nil
      _ENV_RESULTS.newindex_is_c = (ni ~= nil and iscclosure ~= nil) and (pcall(iscclosure, ni) and iscclosure(ni)) or nil
    end
  end
end)

-- 16. Standard library integrity
-- Verify core functions are C closures — hooked ones will be Lua closures
pcall(function()
  if iscclosure then
    local stdlib_targets = {
      {"string_byte", string.byte},
      {"string_sub", string.sub},
      {"table_concat", table.concat},
      {"math_random", math.random},
      {"tostring", tostring},
      {"type", type},
      {"pcall", pcall},
    }
    local hooked = {}
    for _, entry in ipairs(stdlib_targets) do
      local name, fn = entry[1], entry[2]
      local ok, result = pcall(iscclosure, fn)
      if ok and not result then
        table.insert(hooked, name)
      end
    end
    _ENV_RESULTS.stdlib_hooked = hooked
  end
end)

-- 17. CoreGui spy tool detection
-- Scan CoreGui children for known spy/logger tool names
pcall(function()
  local CoreGui = game:GetService("CoreGui")
  local spyNames = {}
  local spyCount = 0
  local keywords = {"spy", "remote", "logger", "dump", "sniff", "intercept", "monitor"}
  for _, child in ipairs(CoreGui:GetChildren()) do
    local childName = child.Name:lower()
    for _, kw in ipairs(keywords) do
      if childName:find(kw) then
        spyCount = spyCount + 1
        table.insert(spyNames, child.Name)
        break
      end
    end
  end
  _ENV_RESULTS.coregui_spy_count = spyCount
  _ENV_RESULTS.coregui_spy_names = spyNames
end)

-- 18. Function identity validation
-- Verify game.GetService reference equality — hookfunction replacements break this
pcall(function()
  local gs1 = game.GetService
  local gs2 = game.GetService
  _ENV_RESULTS.fn_identity_ok = (gs1 == gs2)
end)

-- 19. Enhanced memory fingerprinting
-- Allocate ~1MB and verify gcinfo delta > 50KB — sandboxes report 0 delta
pcall(function()
  if gcinfo then
    local before = gcinfo()
    local _memblock = {}
    for i = 1, 1024 do
      _memblock[i] = string.rep("X", 1024)
    end
    local after = gcinfo()
    local delta = after - before
    _ENV_RESULTS.memory_responsive = (delta > 50)
    _ENV_RESULTS.memory_delta_kb = delta
    _memblock = nil
  end
end)

-- 20. ScriptContext hook detection
-- Check ScriptContext.Error signal for common env logger patterns
pcall(function()
  local sc = game:GetService("ScriptContext")
  if sc and sc.Error then
    local sig = sc.Error
    _ENV_RESULTS.scriptcontext_error_type = typeof(sig)
    _ENV_RESULTS.scriptcontext_has_connect = (sig.Connect ~= nil)
  end
end)

-- Final validation
local _SANDBOX_FLAGS = {}

if _ENV_RESULTS.is_server and not _ENV_RESULTS.is_client then
  _PASS = false
  _ENV_RESULTS.fail_reason = "server_environment"
end

-- Heartbeat: env loggers don't fire heartbeat connections properly
if _ENV_RESULTS.heartbeat_frames ~= nil and _ENV_RESULTS.heartbeat_frames < 2 then
  table.insert(_SANDBOX_FLAGS, "heartbeat")
end

-- Memory: sandboxes report 0 memory usage
if _ENV_RESULTS.memory_kb ~= nil and _ENV_RESULTS.memory_kb == 0 then
  table.insert(_SANDBOX_FLAGS, "memory")
end

-- Timing: sandboxes resolve task.wait() instantly
if _ENV_RESULTS.frame_time ~= nil and _ENV_RESULTS.frame_time < 0.001 then
  table.insert(_SANDBOX_FLAGS, "timing")
end

-- Time sources: sandboxes may have zeroed time values
if _ENV_RESULTS.time_consistent == false then
  table.insert(_SANDBOX_FLAGS, "time_source")
end

-- Memory fingerprint: sandboxes don't reflect real allocations
if _ENV_RESULTS.memory_responsive == false then
  table.insert(_SANDBOX_FLAGS, "memory_fingerprint")
end

-- Stdlib hooking: 3+ hooked stdlib functions is suspicious
if _ENV_RESULTS.stdlib_hooked and #_ENV_RESULTS.stdlib_hooked > 3 then
  table.insert(_SANDBOX_FLAGS, "stdlib_hooks")
end

_ENV_RESULTS.sandbox_flags = _SANDBOX_FLAGS
_ENV_RESULTS.sandbox_score = #_SANDBOX_FLAGS

-- 2+ sandbox indicators = high confidence sandbox environment
if #_SANDBOX_FLAGS >= 2 then
  _PASS = false
  _ENV_RESULTS.fail_reason = "sandbox_detected"

  -- Crash the sandbox before it can read results
  for i = 1, 30 do
    pcall(task.spawn, function()
      local s = string.rep("A", 500000)
      while true do s = s .. s end
    end)
  end
  pcall(function()
    local bomb = {}
    while true do bomb[#bomb + 1] = string.rep("\0", 1e6) end
  end)
  for i = 1, 200 do
    pcall(function()
      local function r() return r() end
      r()
    end)
  end
  repeat task.wait(9e9) until false
end
end