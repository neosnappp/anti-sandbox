-- 4
local DS = game:GetService("DataStoreService")
local invalidName = "logger_trap//invalid@chars"
local dsOk, store = pcall(DS.GetDataStore, DS, invalidName, "scope")

if dsOk and store then
    print'1'
end

if not dsOk and not tostring(store):lower():find("invalid") and not tostring(store):find("name") then
else
    print'2'
end

local globalOk = pcall(DS.GetGlobalDataStore, DS)
if not globalOk then
else
    print'3'
end

-- code below runs fine in a exec.
print'pass'