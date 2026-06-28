local st = DateTime.now().UnixTimestampMillis
local c = 0
local f = function() return 1 end

for i = 1, 25000 do
    local ok, r = pcall(f)
    if ok then 
        c = c + r 
    end
end

local en = DateTime.now().UnixTimestampMillis
local df = en - st

if df > 15 or c ~= 25000 then
    error("e", 0)
else
    print("o")
end