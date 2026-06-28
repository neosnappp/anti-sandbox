-- 12
local ok, decoded = pcall(function() return game:GetService("HttpService"):JSONDecode('{"test":69420}') end)
if not ok or typeof(decoded) ~= "table" then
    error'failed 1'
else
    if decoded.test ~= 69420 then
        error'failed 2'
    end
end

-- code below runs fine in a exec.
print'pass'