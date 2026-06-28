-- 9
local Run = game:GetService("RunService")
local steppedDelta, renderDelta = 0, 0
local conStep = Run.Stepped:Connect(function(_, dt) steppedDelta = dt end)
local conRender = Run.RenderStepped:Connect(function(dt) renderDelta = dt end)
task.wait(.15)
conStep:Disconnect()
conRender:Disconnect()
if math.abs(steppedDelta - renderDelta) < 1e-8 then
    print'failed, if you see this then pass, it means you failed as theres no inf loop so its easier to debug.' -- inf loop
end

-- code below runs fine in a exec.
print'pass'