-- Made by Project Diamond (Unix Anti-Env Logger) https://discord.gg/X8Y2JmxJCZ
do
    local ok, err = pcall(function()
        local dts = {}
        local count = 0
        local conn
        conn = game:GetService("RunService").Heartbeat:Connect(function(dt)
            count = count + 1
            dts[count] = dt
            if count >= 5 then conn:Disconnect() end
        end)
        while count < 5 do task.wait() end
        for _, dt in next, dts do
            if type(dt) ~= "number" or dt <= 0 or dt > 1 then error("[project diamond] detected you @ https://discord.gg/zCWtC74t25") end
        end
        local same = true
        for i = 2, #dts do
            if dts[i] ~= dts[1] then same = false break end
        end
        if same then error("[project diamond] detected you @ https://discord.gg/zCWtC74t25") end
    end)
    if not ok then error("[project diamond] detected you @ https://discord.gg/zCWtC74t25") end
end

print("pass")