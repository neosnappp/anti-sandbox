local str = "yes your really detected"
local buf = buffer.fromstring(str)
local dtc = false
local SuccessSVC, ResultSVC = pcall(function()
    return game:GetService("EncodingService")
end)
if not SuccessSVC or typeof(ResultSVC) ~= "Instance" then
    dtc = true
else
    local SuccessENC, ResultENC = pcall(function()
        return ResultSVC:CompressBuffer(buf, Enum.CompressionAlgorithm.Zstd, 1)
    end)
    if not SuccessENC or typeof(ResultENC) ~= "buffer" then
        dtc = true
    else
        local SuccessDEC, ResultDEC = pcall(function()
            return ResultSVC:DecompressBuffer(ResultENC, Enum.CompressionAlgorithm.Zstd)
        end)
        if not SuccessDEC or typeof(ResultDEC) ~= "buffer" or buffer.tostring(ResultDEC) ~= str then
            dtc = true
        end
    end
end
print(dtc)