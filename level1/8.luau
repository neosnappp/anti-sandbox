local function unixtask()
    local t = task
    if type(t) ~= "table" or type(t.spawn) ~= "function" or type(t.wait) ~= "function" then
        return false
    end

    local ran = false
    local co = t.spawn(function() ran = true end)
    if type(co) ~= "thread" or not ran then return false end
    local yielded = false
    t.spawn(function() t.wait(0); yielded = true end)
    t.wait(0)
    if not yielded then return false end

    local nested = false
    t.spawn(function()
        local co2 = coroutine.create(function() nested = true end)
        t.spawn(co2)
    end)
    t.wait(0)
    if not nested then return false end

    return true
end

if unixtask() then
    print("pass")
else
    print("dtc")
end