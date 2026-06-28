local getfenv = getfenv
getfenv().getfenv = setmetatable({}, {__call = getfenv, __metatable = "skid"})
if getmetatable(getfenv().getfenv) ~= "skid" then
    return (nil)()
end