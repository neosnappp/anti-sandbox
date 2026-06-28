local es = game:GetService("EncodingService")
local b = buffer.create(7)
buffer.writestring(b, 0, "buluark")
local compressed = es:CompressBuffer(b, Enum.CompressionAlgorithm.Zstd, 22)
local decompressed = es:DecompressBuffer(compressed, Enum.CompressionAlgorithm.Zstd)
if buffer.readstring(decompressed, 0, 7) ~= "buluark" then
    error'detected'
end
print"pass"