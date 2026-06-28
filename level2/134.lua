local function check_gsub_stack()
    local depth = 0
    string.gsub("a", ".", function()
        local i = 1
        while debug.info(i, "f") do
            depth = i
            i = i + 1
        end
    end)
    local ok = depth >= 4 and depth <= 6
    print(ok and "ok" or "dtc")
end
check_gsub_stack()