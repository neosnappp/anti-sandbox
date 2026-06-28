local t1 = workspace:GetServerTimeNow()
task.wait(0.05)
local t2 = workspace:GetServerTimeNow()
local delta = t2 - t1
if type(t1) == "number" and delta > 0 and delta < 5 then
    print("pass")
else
    print("detected")
end