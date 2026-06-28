--anti tamper found by neosnapp (n1oh) on discord 
local nonce, sig, auth = "IVDMNGh7jEE3Rn3UlWzfhDamBs9XX7hM", "nggCT6bTjjk3ca96XqvNN6HkiZUAzUGQfxTrVkiErz8", "https://www.keyforge.win/v1/auth?e=1"
local serverProof = "14c57565a4e862891aa8f00dc1d781ff7a367b552c5422b7bfb47701db1defd2"
local HttpService = game:GetService("HttpService")
local function fail(msg)
  if type(error) == "function" then return error(tostring(msg), 0) end
  while true do end
end
local okEnv = pcall(function()
  assert(game and game.ClassName == "DataModel")
  assert(workspace and type(workspace.GetChildren) == "function")
end)
if not okEnv then fail("this script must be run from a real Roblox executor") end
local req = (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request) or request or http_request
if type(req) ~= "function" then
  req = function(o)
    local ok, res = pcall(function()
      return HttpService:RequestAsync({
        Url = o.Url,
        Method = o.Method or "POST",
        Headers = o.Headers or {},
        Body = o.Body,
      })
    end)
    if ok and type(res) == "table" then
      return { StatusCode = res.StatusCode or 0, Body = res.Body or "", body = res.Body or "" }
    end
    if (o.Method or "POST") == "GET" then
      local getOk, getBody = pcall(function()
        if type(httpget) == "function" then return httpget(o.Url) end
        if game.HttpGetAsync then return game:HttpGetAsync(o.Url) end
        return game:HttpGet(o.Url, true)
      end)
      if getOk and type(getBody) == "string" then
        return { StatusCode = 200, Body = getBody, body = getBody }
      end
    end
    local postOk, postBody = pcall(function() return game:HttpPost(o.Url, o.Body or "", "application/json") end)
    if not postOk and game.HttpPostAsync then
      postOk, postBody = pcall(function() return game:HttpPostAsync(o.Url, o.Body or "", "application/json") end)
    end
    if not postOk then error("request failed", 0) end
    return { StatusCode = 200, Body = postBody or "", body = postBody or "" }
  end
end
if type(ishookfunction) == "function" then
  local _candidates = {}
  pcall(function()
    if type(request) == "function" then _candidates[#_candidates + 1] = request end
    if syn and type(syn.request) == "function" then _candidates[#_candidates + 1] = syn.request end
    if http and type(http.request) == "function" then _candidates[#_candidates + 1] = http.request end
    if fluxus and type(fluxus.request) == "function" then _candidates[#_candidates + 1] = fluxus.request end
    if type(http_request) == "function" then _candidates[#_candidates + 1] = http_request end
  end)
  for _, fn in ipairs(_candidates) do
    local ok, hooked = pcall(ishookfunction, fn)
    if ok and hooked then
      if type(error) == "function" then error("environment check failed", 0) end
      while true do end
    end
  end
end
local deviceId
pcall(function()
  local UGS = UserSettings():GetService("UserGameSettings")
  local key = "nil  nil  "
  local charset = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789"
  local function readBits()
    local state = UGS:GetTutorialState(key)
    local out = ""
    for i = 1, 16 do
      local base = (i - 1) * 5
      local byteIndex = math.floor(base / 8) + 1
      local shift = base % 8
      local v = bit32 and bit32.band(bit32.rshift(state[byteIndex] or 0, shift), 31) or 0
      out = out .. charset:sub(v + 1, v + 1)
    end
    return out
  end
  local existing = readBits()
  if existing:match("^[%w]+$") and #existing == 16 then
    deviceId = existing
    return
  end
  local seed = (os.clock and os.clock() or tick()) * 100000
  local state = {}
  for i = 1, 10 do state[i] = 0 end
  for i = 1, 16 do
    seed = (seed * 1103515245 + 12345) % 2147483648
    local v = seed % 32
    local base = (i - 1) * 5
    local byteIndex = math.floor(base / 8) + 1
    local shift = base % 8
    if bit32 then
      state[byteIndex] = bit32.bor(state[byteIndex] or 0, bit32.lshift(v, shift))
    end
  end
  UGS:SetTutorialState(key, state)
  deviceId = readBits()
end)
local executor, hwid, analyticsClientId
pcall(function()
  if identifyexecutor then
    local a, b = identifyexecutor()
    executor = b and (tostring(a) .. " " .. tostring(b)) or tostring(a)
  elseif getexecutorname then
    executor = tostring(getexecutorname())
  end
end)
pcall(function()
  if gethwid then hwid = tostring(gethwid())
  else hwid = tostring(game:GetService("RbxAnalyticsService"):GetClientId()) end
end)
pcall(function() analyticsClientId = tostring(game:GetService("RbxAnalyticsService"):GetClientId()) end)
local placeId, jobId, gameId, localPlayerUserId
pcall(function()
  placeId = game.PlaceId
  gameId = game.GameId
  jobId = tostring(game.JobId or "")
  local lp = game:GetService("Players").LocalPlayer
  if lp then localPlayerUserId = tostring(lp.UserId) end
end)
local body = HttpService:JSONEncode({
  nonce = nonce,
  signature = sig,
  fingerprint = {
    isRobloxEnv = true,
    hasHttp = true,
    executor = executor,
    hwid = hwid,
    deviceId = deviceId,
    analyticsClientId = analyticsClientId,
    placeId = placeId,
    gameId = gameId,
    jobId = jobId,
    localPlayerUserId = localPlayerUserId,
    serverProof = serverProof,
    buildTimestamp = 1782332108,
  },
})
local res = req({
  Url = auth,
  Method = "POST",
  Headers = { ["Content-Type"] = "application/json", ["X-KeyForge-Executor"] = "1", ["X-KeyForge-Nonce"] = nonce },
  Body = body,
})
local status = type(res) == "table" and (res.StatusCode or res.status_code or 0) or 0
local payload = type(res) == "table" and (res.Body or res.body or "") or ""
if status ~= 200 or payload == "" then
  local msg = payload ~= "" and payload or ("authentication failed (HTTP " .. tostring(status) .. ")")
  if type(error) == "function" then error(tostring(msg), 0) end
  while true do end
end
local function kfResolveLoad()
  if type(loadstring) == "function" then return loadstring end
  if type(load) == "function" then return load end
  local ge = (type(getgenv) == "function" and getgenv()) or _G
  if type(ge) == "table" then
    if type(ge.loadstring) == "function" then return ge.loadstring end
    if type(ge.load) == "function" then return ge.load end
  end
  return nil
end
local _kf_ls = kfResolveLoad()
if type(_kf_ls) ~= "function" then error("[Keyforge Auth] no loader function", 0) end
local fn, err = _kf_ls(payload)
if type(fn) ~= "function" then
  error("failed to load script: " .. tostring(err or fn or "not a function"), 0)
end
local _kf_ok, _kf_runerr = pcall(fn)
if not _kf_ok then error(tostring(_kf_runerr), 0) end
return _kf_runerr