local hb = 0
local conn = game:GetService("RunService").Heartbeat:Connect(function() hb = hb + 1 end)
task.wait(0.2)
conn:Disconnect()
if hb >= 2 then print("✓ PASSED: Heartbeat fires (" .. hb .. " times)") else print("✗ FAILED: Heartbeat fires (only " .. hb .. " times)") end