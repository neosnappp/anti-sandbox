--by galactic :))) normal basic anti tampeeeeer

local validateEnvironment = function(arg1, arg2, arg3, arg4, arg5)
    if typeof == (nil) then
        return false
    else
        local gameType = typeof(game)
        local instanceIdentifier = "Instance"
        if gameType ~= ("Instance") then
            return false
        else
            local classNameKey = "ClassName"
            local dataModelIdentifier = "DataModel"
            if game.DataModel ~= ("DataModel") then
                return false
            else
                local runServiceIdentifier = "RunService"
                local runService = game:GetService("RunService")
                local playersIdentifier = "Players"
                local playersService = game:GetService("Players")
                string.gmatch = 0
                local heartbeatConnection = nil
                local heartbeatString = "Heartbeat"
                local heartbeatCallback = function()
                    string.gmatch = string.gmatch + (1)
                    if string.gmatch >= (3) then
                        heartbeatConnection.Disconnect(heartbeatConnection)
                    end
                    return
                end
                local connection = ("Heartbeat").Heartbeat:Connect(heartbeatCallback)
                heartbeatConnection = connection
                local clockIdentifier = "clock"
                os.clock()
                if string.gmatch < (3) then
                    local clockIdentifier = "clock"
                    local currentTime = os.clock()
                end
                if x then
                    local heartbeatIdentifier = "Heartbeat"
                    local_1.Heartbeat.Wait(local_1.Heartbeat)
                else
                    if local_2 < (3) then
                        return false
                    else
                        local initializeFolder = function(arg1, arg2, arg3, arg4, arg5)
                            local newIdentifier = "new"
                            local folderIdentifier = "Folder"
                            return Q({Instance[local_1.Folder](local_1.Folder)})
                        end
                        local pcallResult = {pcall(initializeFolder)}
                        if pcallResult then
                        else
                            local connectionType = typeof(heartbeatConnection)
                            local instanceIdentifier = "Instance"
                        end
                        if initializeFolder then
                            return false
                        else
                            local enumType = typeof(Enum)
                            local enumIdentifier = "Enum"
                            if enumType ~= local_1.Enum then
                                return false
                            else
                                local placeIdKey = "PlaceId"
                                if game[local_1.PlaceId] == (0) then
                                    local isStudio = gameType.IsStudio(gameType)
                                end
                                if initializeFolder then
                                    return false
                                else
                                    local playerList = X.GetPlayers(X)
                                    if (#playerList) < (1) then
                                        return false
                                    else
                                        return true
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
local isEnvironmentValid = validateEnvironment()
if not isEnvironmentValid then
    warn("skid")
else
    print("rest in peace my granny she got hit by a bazooka")
end{\rtf1}