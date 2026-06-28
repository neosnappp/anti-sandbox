local ud = Instance.new("DataStoreIncrementOptions")
local tbl = {hi = true}
ud:SetMetadata(tbl)
if ud:GetMetadata().hi ~= tbl.hi then
    error("dtc")
else
    print("ud")
end