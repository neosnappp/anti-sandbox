local function cekMissingArgs(fn, ...)
    local success, err = pcall(fn, ...)
    if not success and string.find(err, "missing") then
        print("real env")
    else
        print("detected!")
    end
end

cekMissingArgs(math.log)