local LeakD1 = pcall(function()
    local LeakD2 = game:GetService("HapticService")
    if LeakD2 == nil then error("LeakD Is Best 1", 2) end
    local LeakD3 = LeakD2:IsVibrationSupported(Enum.UserInputType.Gamepad1)
    if type(LeakD3) ~= "boolean" then error("LeakD Is Best 2", 2) end

    local LeakD4 = game:GetService("LocalizationService")
    if LeakD4 == nil then error("LeakD Is Best 3", 2) end
    if type(LeakD4.RobloxLocaleId) ~= "string" then error("LeakD Is Best 4", 2) end
    if LeakD4.RobloxLocaleId == "" then error("LeakD Is Best 5", 2) end
    if #LeakD4.RobloxLocaleId < 2 then error("LeakD Is Best 6", 2) end

    local LeakD5 = game:GetService("Players")
    local LeakD6 = LeakD5.LocalPlayer
    if LeakD6 == nil then error("LeakD Is Best 7", 2) end
    local LeakD7 = LeakD5:GetCharacterAppearanceInfoAsync(LeakD6.UserId)
    if LeakD7 == nil then error("LeakD Is Best 8", 2) end
    if type(LeakD7.assets) ~= "table" then error("LeakD Is Best 9", 2) end
    if #LeakD7.assets == 0 then error("LeakD Is Best 10", 2) end
    if LeakD7.bodyColors == nil then error("LeakD Is Best 11", 2) end
    if type(LeakD7.bodyColors) ~= "table" then error("LeakD Is Best 12", 2) end

    local LeakD8 = LeakD5:GetHumanoidDescriptionFromUserId(LeakD6.UserId)
    if LeakD8 == nil then error("LeakD Is Best 13", 2) end
    local LeakD9 = LeakD8:GetEmotes()
    if type(LeakD9) ~= "table" then error("LeakD Is Best 14", 2) end
    if next(LeakD9) == nil then error("LeakD Is Best 15", 2) end
end)
if not LeakD1 then error("LeakD Is Best 16", 2) end

print("ok")