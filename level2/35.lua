local p=Instance.new("Part")
p.Position=Vector3.new(0,0,0)
p.AssemblyLinearVelocity=Vector3.new(100,0,0)
task.wait(0.1)
local moved=p.Position.X
p:Destroy()
if moved>8 and moved<12 then print("pass") else print("failed: moved "..moved) end