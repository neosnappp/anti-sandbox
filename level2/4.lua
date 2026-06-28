local p,t=0,0
local function RunTest(Name, Func)
    t=t+1
    local Success, ErrorCode, Result = pcall(Func)
    if not Success or ErrorCode == 0 then
        local ErrorMessage = if not Success then ErrorCode else Result
        print('detected: ' .. Name .. ' - ' .. tostring(ErrorMessage))
    else
        p=p+1
    end
end
RunTest('HttpRbxApiService Access', function()
    local Success, Service = pcall(function()
        return game:GetService('HttpRbxApiService')
    end)
    return (Success and Service) and 1 or 0, 'Blocked or Missing'
end)
RunTest('LogService.MessageOut Interception', function()
    local Success, Conn = pcall(function()
        return game:GetService('LogService').MessageOut:Connect(function() end)
    end)
    if Conn then
        Conn:Disconnect()
    end
    return Success and 1 or 0, 'Cannot read engine logs (Identity too low)'
end)
RunTest('ScriptContext.Error Suppression', function()
    local Success, Conn = pcall(function()
        return game:GetService('ScriptContext').Error:Connect(function() end)
    end)
    if Conn then
        Conn:Disconnect()
    end
    return Success and 1 or 0, 'Cannot intercept global errors'
end)
RunTest('RobloxReplicatedStorage Traversal', function()
    local Success, Service = pcall(function()
        return game:GetService('RobloxReplicatedStorage')
    end)
    return (Success and Service) and 1 or 0, 'Engine hidden folder locked'
end)
RunTest('NetworkClient Read', function()
    local Success, Service = pcall(function()
        return game:GetService('NetworkClient')
    end)
    return (Success and Service) and 1 or 0, 'Internal networking stats locked'
end)
RunTest('debug.traceback Stack Scrubbing', function()
    local Trace = debug.traceback()
    if string.find(string.lower(Trace), 'corepackages') or string.find(string.lower(Trace), 'custom') then
        return 0, 'Stack trace leaks internal environment paths'
    end
    return 1
end)
RunTest('Deep isreadonly Checks', function()
    if not isreadonly then
        return 0, 'Missing isreadonly function'
    end
    local Success, ReadOnly = pcall(function()
        return isreadonly(math)
    end)
    return (Success and ReadOnly == true) and 1 or 0, 'Core libraries are not read-only'
end)
RunTest('__tostring Native Spoofing', function()
    local TempPart = Instance.new('Part')
    local success, result = pcall(function()
        return tostring(TempPart)
    end)
    TempPart:Destroy()
    return (success and result == 'Part') and 1 or 0, 'tostring(Instance) returns incorrect value: ' .. tostring(result)
end)
RunTest('Thread State Detection', function()
    local Co = coroutine.create(function()
        task.wait(0.1)
    end)
    coroutine.resume(Co)
    local Status = coroutine.status(Co)
    return (Status == 'suspended' or Status == 'dead') and 1 or 0, 'Abnormal thread state detected: ' .. tostring(Status)
end)
RunTest('RemoteFunction Yield Integrity', function()
    local Remote = Instance.new('RemoteFunction')
    local Success, Error = pcall(function()
        task.spawn(function()
            Remote:InvokeServer()
        end)
    end)
    return Success and 1 or 0, 'InvokeServer interaction caused a hard crash'
end)
RunTest('Stats.Workspace Performance Drop', function()
    local start = os.clock()
    local w = workspace
    for i = 1, 1000 do
        local _ = w.Name
    end
    local elapsed = os.clock() - start
    return (elapsed < 0.05) and 1 or 0, 'Metamethod index is severely lagging (' .. tostring(elapsed) .. 's)'
end)
RunTest('Instance.RobloxLocked Modification', function()
    local Success, Error = pcall(function()
        local CorePack = game:GetService('CorePackages')
        local _ = CorePack.Name
    end)
    return Success and 1 or 0, 'Reading CorePackages property crashed/errored'
end)
RunTest('CoreGui Descendant Isolation', function()
    local CoreGui = game:GetService('CoreGui')
    local Success, Inst = pcall(function()
        local F = Instance.new('Frame')
        F.Parent = CoreGui
        return F
    end)
    if Inst then
        Inst:Destroy()
    end
    return Success and 1 or 0, 'Cannot instance objects into CoreGui'
end)
RunTest('VirtualInputManager Binding', function()
    local Success, VIM = pcall(function()
        return game:GetService('VirtualInputManager')
    end)
    if not Success or not VIM then
        return 0, 'VirtualInputManager blocked'
    end
    local SendSuccess, SendErr = pcall(function()
        VIM:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
    end)
    return SendSuccess and 1 or 0, 'Input simulation failed: ' .. tostring(SendErr)
end)
RunTest('GuiService.SelectedCoreObject Spoofing', function()
    local Success, Err = pcall(function()
        game:GetService('GuiService').SelectedCoreObject = nil
    end)
    return Success and 1 or 0, 'Cannot write to SelectedCoreObject'
end)
RunTest('ContentProvider:PreloadAsync Ghosting', function()
    local CP = game:GetService('ContentProvider')
    local Success, Err = pcall(function()
        CP:PreloadAsync({})
    end)
    return Success and 1 or 0, 'PreloadAsync invocation blocked: ' .. tostring(Err)
end)
RunTest('RunService.RenderStepped Thread Identity', function()
    local Success, Result = pcall(function()
        local Identity = 0
        local getthreadcontext = getthreadidentity or getidentity or getthreadcontext or function()
            return 0
        end
        local Conn
        Conn = game:GetService('RunService').RenderStepped:Connect(function()
            Identity = getthreadcontext()
            Conn:Disconnect()
        end)
        task.wait(0.1)
        return Identity
    end)
    return (Success and Result > 2) and 1 or 0, 'Thread identity dropped inside RenderStepped (Got: ' .. tostring(Result) .. ')'
end)
RunTest('CollectionService Tag Ghosting', function()
    local CS = game:GetService('CollectionService')
    local Part = Instance.new('Part')
    local Success, Err = pcall(function()
        CS:AddTag(Part, 'EnvTestTag')
    end)
    Part:Destroy()
    return Success and 1 or 0, 'Failed to interact with CollectionService'
end)
print(p .. "/" .. t)