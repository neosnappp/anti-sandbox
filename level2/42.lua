local test_tab={}
local mt={__newindex=function() error("blocked") end}
setmetatable(test_tab,mt)
local success,err=pcall(function() test_tab.x=1 end)
if not success then
error("Check 16 Failed: ...I have no words honestly first you go for my metatable now my newindex you are unbelievable")
end