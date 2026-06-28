local detected = false
task.defer(function() end)

local ok = pcall(function()
    local testScript = Instance.new("LocalScript")
    local bytecode = getscriptbytecode(testScript)
    if type(bytecode) ~= "string" or #bytecode < 10 then error("bad") end
end)
if not ok then else
    warn("dtc 16")
    detected = true
end

local ok = pcall(function()
    local func = function() end
    local proto = debug.getproto(func, 1)
    if type(proto) ~= "function" then error("bad") end
end)
if not ok then else
    warn("dtc 17")
    detected = true
end

local ok = pcall(function()
    local module = Instance.new("ModuleScript")
    module.Source = "return 69420"
    local result = require(module)
    if result ~= 69420 then error("bad") end
end)
if not ok then else
    warn("dtc 19")
    detected = true
end

local ok = pcall(function()
    local mt = getmetatable("")
    if type(mt) == "table" and rawget(mt, "__metatable") == nil then error("bad") end
end)
if not ok then
    warn("dtc 22")
    detected = true
end

if not detected then
    print("All checks passed - clean environment")
else
    print("Some detections triggered - possible logger/sandbox")
end