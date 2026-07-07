local EncodingService = game:GetService("EncodingService")

local b = buffer.create(6)

buffer.writestring(b, 0, "sexxxx")

local compressed = EncodingService:CompressBuffer(b, Enum.CompressionAlgorithm.Zstd, 22)

local decompressed = EncodingService:DecompressBuffer(compressed, Enum.CompressionAlgorithm.Zstd)

if buffer.readstring(decompressed, 0, 6) ~= "sexxxx" then

    error("skidder :)))")

end



