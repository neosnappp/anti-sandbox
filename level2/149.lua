local function cat()
    local success = pcall(function()
        rawset(Enum.PartType, "Detected", true)
    end)
    local ok = (not success)
    print(ok and "ok" or "dtc")
end
cat()