local function Test()
    local TextChatService = game:GetService("TextChatService")
    local player = game.Players.LocalPlayer
    local channel = TextChatService.TextChannels:WaitForChild("RBXGeneral")

    local sent = false

    local connection
    connection = TextChatService.MessageReceived:Connect(function(message)
        if message.Text == "," and message.TextSource and message.TextSource.UserId == player.UserId then
            sent = true
        end
    end)

    channel:SendAsync(",")

    task.wait(0.5)

    connection:Disconnect()

    return sent
end

if not Test() then
    warn("fail")
    return
end

print("passed")