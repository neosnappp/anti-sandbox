local function depth(n)
    if n==0 then return 0 end
    return depth(n-1)
end
local ok,err=pcall(depth,1500)
if not ok and err:find("stack") then print("pass") else print("failed") end