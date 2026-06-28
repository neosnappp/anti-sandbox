local run = game:GetService("RunService")
local hb = 0
local conn = run.Heartbeat:Connect(function()
	hb += 1
end)

local t0 = tick()
local e0 = elapsedTime()
local s0 = time()
local dt = task.wait(0.2)
local t1 = tick()
local e1 = elapsedTime()
local s1 = time()
conn:Disconnect()

print("dt", dt)
print("heartbeat_count", hb)
print("tick_delta", t1 - t0)
print("elapsed_delta", e1 - e0)
print("time_delta", s1 - s0)
print("repro done")
