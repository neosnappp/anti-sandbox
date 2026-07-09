--basic but anyways its good not much bat yall can improve , executing on velocity

local runService = game:GetService("RunService")
local httpService = game:GetService("HttpService")
local encodingService = game:GetService("EncodingService")
local logService = game:GetService("LogService")

local function verificationError()
    while true do end
end

local function verifyEnvironment()
    if runService:IsStudio() then
        verificationError()
    end

    local debugInfo = debug.info
    if not debugInfo then
        verificationError()
    end

    if debugInfo(print, "s") ~= "[C]" or debugInfo(require, "s") ~= "[C]" then
        verificationError()
    end

    local success, message = pcall(math.log)
    if success or not string.find(tostring(message), "missing") then
        verificationError()
    end

    local sound = Instance.new("Sound")
    local testSound = pcall(function()
        sound.PlaybackLoudness = 100
    end)
    sound:Destroy()
    if testSound then
        verificationError()
    end

    local textBox = Instance.new("TextBox")
    local testBox = pcall(function()
        textBox.TextBounds = Vector2.new(10, 10)
    end)
    textBox:Destroy()
    if testBox then
        verificationError()
    end

    local testBuffer = buffer.create(8)
    buffer.writestring(testBuffer, 0, "env_auth")
    local compressed = encodingService:CompressBuffer(testBuffer, Enum.CompressionAlgorithm.Zstd, 22)
    local decompressed = encodingService:DecompressBuffer(compressed, Enum.CompressionAlgorithm.Zstd)
    if buffer.readstring(decompressed, 0, 8) ~= "env_auth" then
        verificationError()
    end

    local pcallCheck = select(1, pcall(getfenv, 999))
    if pcallCheck == true then
        verificationError()
    end

    if typeof(game) ~= "Instance" or pcall(function() for _ in game do end end) then
        verificationError()
    end

    local guidSuccess, guidResult = pcall(function()
        return httpService:GenerateGUID(false)
    end)
    if not guidSuccess or #guidResult ~= 36 or string.sub(guidResult, 9, 9) ~= "-" then
        verificationError()
    end

    return true
end

local function runExecution()
    local clockSeed = os.clock()
    task.wait(0.1)
    if (os.clock() - clockSeed) < 0.05 then
        verificationError()
    end

    if verifyEnvironment() then
        print("passsss")
    end
end

task.spawn(runExecution)