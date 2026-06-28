local Closure = getmetatable
for _ = 1, 198 do
    Closure = coroutine.wrap(Closure)
end
local Success, Out = pcall(Closure)
if (not Success) and string.find(Out, "C stack overflow") then
    return print("dtc")
end
Closure = getmetatable
for _ = 1, 199 do
    Closure = coroutine.wrap(Closure)
end
local Success2, Out2 = pcall(Closure)
if Success2 or not string.find(Out2, "C stack overflow") then
    return print("dtc")
end
return print("ud")