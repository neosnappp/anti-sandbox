local co = coroutine.create(function() 
    return coroutine.running() 
end)
local _, thread = coroutine.resume(co)
local success, err = pcall(function()
    return tostring(thread):find("thread: 0x")
end)

if not success or not err then
    print("detected")
else
    print("pass")
end