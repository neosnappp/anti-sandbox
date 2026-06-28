local function antienv()
   if getmetatable(workspace) ~= "The metatable is locked" then error('layer 1',0) end
   if getmetatable(game) ~= "The metatable is locked" then error('layer 2',0) end
   if getmetatable(game:GetService("Players")) ~= "The metatable is locked" then error('layer 3',0) end
   if getmetatable(game:GetService("RunService")) ~= "The metatable is locked" then error('layer 4',0) end
   if typeof(CFrame.new()) == type(CFrame.new()) then error('layer 5',0) end
   if typeof(Vector3.new()) == type(Vector3.new()) then error('layer 6',0) end
   if typeof(UDim2.new()) == type(UDim2.new()) then error('layer 7',0) end
   if typeof(Color3.new()) == type(Color3.new()) then error('layer 8',0) end
   if type(Instance.new("Folder")) ~= "userdata" then error('layer 9',0) end
   if type(workspace) ~= "userdata" then error('layer 10',0) end
   if type(game) ~= "userdata" then error('layer 11',0) end
   if game.ClassName ~= "DataModel" then error('layer 12',0) end
   if workspace.ClassName ~= "Workspace" then error('layer 13',0) end
   if not rawequal(game:GetService("RunService"), game:GetService("RunService")) then error('layer 14',0) end
   if not rawequal(game:GetService("Players"), game:GetService("Players")) then error('layer 16',0) end
   local p1 = pcall(function() getmetatable(game).__index = nil end)
   if p1 then error('layer 17',0) end
   local p2 = pcall(function() getmetatable(workspace).__newindex = nil end)
   if p2 then error('layer 18',0) end
   local p3 = pcall(function() getmetatable(game).__type = "test" end)
   if p3 then error('layer 19',0) end
   if not tostring(workspace):find("Workspace") then error('layer 20',0) end
   local f = Instance.new("Folder")
   if not rawequal(f.Parent, f.Parent) then f:Destroy() error('layer 26',0) end
   f:Destroy()
   local v = Vector3.new(1,2,3)
   if v.X ~= 1 or v.Y ~= 2 or v.Z ~= 3 then error('layer 27',0) end
   local cf = CFrame.new(1,2,3)
   if cf.X ~= 1 or cf.Y ~= 2 or cf.Z ~= 3 then error('layer 28',0) end
   local c = Color3.new(1,0,0)
   if c.R ~= 1 or c.G ~= 0 or c.B ~= 0 then error('layer 29',0) end
   local u = UDim2.new(1,0,1,0)
   if u.X.Scale ~= 1 or u.Y.Scale ~= 1 then error('layer 30',0) end
   if not game:IsA("DataModel") then error('layer 31',0) end
   if not workspace:IsA("Workspace") then error('layer 32',0) end
   if not game:GetService("Players"):IsA("Players") then error('layer 33',0) end
   local p4 = pcall(function() game:GetService("NonExistentService123456") end)
   if not p4 then else end
   local ts = game:GetService("TweenService")
   if not ts:IsA("TweenService") then error('layer 35',0) end
   local uis = game:GetService("UserInputService")
   local cs = game:GetService("CollectionService")
   if typeof(Enum.KeyCode.E) ~= "EnumItem" then error('layer 38',0) end
   if typeof(Enum.UserInputType.MouseButton1) ~= "EnumItem" then error('layer 39',0) end
   print('passed')
end

antienv()
