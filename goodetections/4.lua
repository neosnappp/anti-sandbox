local Players = game:GetService('Players')
local rat = 0 

for _,v in pairs(Players:GetPlayers()) do
  rat = rat + 1
end

if rat == 0 then
  error('env logger')
  while true do task.wait() end
end

print('pass')