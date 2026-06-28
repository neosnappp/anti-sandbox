local result = print(getrawmetatable(getfenv()))
if result == "nil" then
    print("passed")
else
    print("failed")
end

-- should return table like "table 0x596fe3633018977f"