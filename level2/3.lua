if not pcall(setthreadidentity, -1) then
    return print('pass')
end

print('fail')