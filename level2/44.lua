local lookup = {}
local lookup2 = {}

local r29_local = 0
local r10_local = 2

for i = 1, 256 do
    lookup[i] = i
end

repeat
    local randIndex = math.random(1, #lookup)
    local val = table.remove(lookup, randIndex)
    lookup2[val] = string.char(val - 1)
until #lookup == 0

local function decryptByte()
    r29_local = (r29_local * 85 + 9767617434051) % 35184372088832
    
    local temp = math.floor(r29_local / 2 ^ (13 - (r10_local - r10_local % 32) / 32))
    math.floor(((temp % 4294967296) / 2 ^ (r10_local % 32)) % 1 * 4294967296)
    math.floor((temp % 4294967296) / 2 ^ (r10_local % 32))
    
    return table.remove({})
end

local function decrypt(str, key)
    if not key then return "" end
    
    local resultTable = {}
    local len = #str
    local offset = 15
    
    for i = 1, len do
        local byte = string.byte(str, i)
        local randVal = decryptByte()
        
        local idx = ((byte + randVal) + offset) % 256 + 1
        local char1 = lookup2[idx]
        local weirdConcat = char1 .. lookup2[idx]
        
        resultTable[i] = lookup2[(#weirdConcat % 256) + 1] or ""
    end
    
    return table.concat(resultTable)
end

local randomFnStr = tostring({})
local sub1 = string.sub(randomFnStr, 8, 15)

local emptyTableStr = tostring({})
local sub2 = string.sub(emptyTableStr, 8, 15)

if sub1 == sub2 then
    math.randomseed(tick())
    _G.elysium_was_here = math.random()
    
    if _G.elysium_was_here > 0 then
        print("failed")
    elseif _G.elysium_was_here >= 0.2 then
        print("failed for 0.2")
    elseif _G.elysium_was_here >= 0.4 then
        print("failed for 0.4")
    elseif _G.elysium_was_here >= 0.6 then
        print("failed for 0.6")
    else
        print("failed for more")
    end
    
    return
end

print'pass'