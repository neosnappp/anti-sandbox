-- Made by Project Diamond (Unix Anti-Env Logger) https://discord.gg/X8Y2JmxJCZ
local ProjectDiamond_triggered = false

local ProjectDiamond_ok, ProjectDiamond_err = pcall(function()
    local ProjectDiamond_c1 = game.ClassName == "DataModel" -- checking for correct classnames
    local ProjectDiamond_c2 = workspace.ClassName == "Workspace"
    local ProjectDiamond_c3 = typeof(Enum.Material.Plastic) == "EnumItem"
    local ProjectDiamond_c4 = Enum.Material.Plastic.Value == 256
    local ProjectDiamond_c5 = typeof(game.Changed) == "RBXScriptSignal"
    local ProjectDiamond_c6 = typeof(workspace.Changed) == "RBXScriptSignal"
    local ProjectDiamond_rs = game:GetService("RunService")
    local ProjectDiamond_c7 = ProjectDiamond_rs.ClassName == "RunService"
    local ProjectDiamond_c8 = typeof(ProjectDiamond_rs.Heartbeat) == "RBXScriptSignal"
    local ProjectDiamond_c9 = ProjectDiamond_rs:IsClient() ~= ProjectDiamond_rs:IsServer()
    local ProjectDiamond_part = Instance.new("Part")
    local ProjectDiamond_c10 = typeof(ProjectDiamond_part) == "Instance" and ProjectDiamond_part.ClassName == "Part"
    ProjectDiamond_part:Destroy()
    local ProjectDiamond_c11 = workspace:GetFullName() == "Workspace"
    local ProjectDiamond_cf = CFrame.new(1, 2, 3)
    local ProjectDiamond_c12 = ProjectDiamond_cf.X == 1 and ProjectDiamond_cf.Y == 2 and ProjectDiamond_cf.Z == 3
    local ProjectDiamond_t1 = workspace.DistributedGameTime
    task.wait(0.1)
    local ProjectDiamond_t2 = workspace.DistributedGameTime
    local ProjectDiamond_c13 = (ProjectDiamond_t2 - ProjectDiamond_t1) > 0
    local ProjectDiamond_guid_ok, ProjectDiamond_guid = pcall(function()
        return game:GetService("HttpService"):GenerateGUID(false)
    end)
    local ProjectDiamond_c14 = ProjectDiamond_guid_ok and #ProjectDiamond_guid == 36 and ProjectDiamond_guid:sub(9,9) == "-"
    local ProjectDiamond_checks = {
        ProjectDiamond_c1, ProjectDiamond_c2, ProjectDiamond_c3, ProjectDiamond_c4,
        ProjectDiamond_c5, ProjectDiamond_c6, ProjectDiamond_c7, ProjectDiamond_c8,
        ProjectDiamond_c9, ProjectDiamond_c10, ProjectDiamond_c11, ProjectDiamond_c12,
        ProjectDiamond_c13, ProjectDiamond_c14 -- checking all 14 project diamond checks :P
    }
    local ProjectDiamond_passed = 0
    for _, ProjectDiamond_v in ipairs(ProjectDiamond_checks) do
        if ProjectDiamond_v then ProjectDiamond_passed += 1 end
    end
    if ProjectDiamond_passed < #ProjectDiamond_checks then
        ProjectDiamond_triggered = true
    end
end)

if not ProjectDiamond_ok then
    ProjectDiamond_triggered = true
end

if ProjectDiamond_triggered then
    task.delay(math.random(6, 7), function() -- 67 city boiii
        print("detected by project diamond :P / unix https://discord.gg/fQ2j42dfTf")
    end)
    return
end

--[[ YOUR SCRIPT BELOW ]]--
print("this passed env logger check")