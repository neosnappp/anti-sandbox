local detected = false
task.defer(function() end)

local ok = pcall(function()
    local old = hookmetamethod(game, "__index", function(self, key)
        return old(self, key)
    end)
    hookmetamethod(game, "__index", old)
end)
if not ok then else
    warn("failed 34")
    detected = true
end

local ok = pcall(function()
    local nils = getnilinstances()
    if type(nils) ~= "table" or #nils < 10 then error("bad") end
end)
if not ok then
    warn("failed 35")
    detected = true
end

local ok = pcall(function()
    local old = getfflag("TestFlag")
    setfflag("TestFlag", "true")
    local new = getfflag("TestFlag")
    if new == old then error("bad") end
end)
if not ok then else
    warn("failed 36")
    detected = true
end

local ok = pcall(function()
    local info = debug.info(1, "f")
    if type(info) ~= "function" then error("bad") end
end)
if not ok then
    warn("failed 37")
    detected = true
end

local ok = pcall(function()
    local asset = getcustomasset("rbxasset://test.txt")
    if type(asset) ~= "string" then error("bad") end
end)
if not ok then else
    warn("failed 39")
    detected = true
end

local ok = pcall(function()
    if syn or fluxus or krnl or scriptware then error("bad") end
end)
if not ok then
    warn("failed 40")
    detected = true
end

if not detected then
    print("All checks passed")
else
    print("Some fails detected, wont work")
end