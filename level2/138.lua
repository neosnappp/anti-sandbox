local a = islclosure(print) == false and iscclosure(print) == true
local b = getgenv() ~= getrenv() and iscclosure(newcclosure(function() end)) == true
local c = getfenv(0) == getfenv(1) and type(getgc()) == "table"
print(a and b and c and "success" or "fail")