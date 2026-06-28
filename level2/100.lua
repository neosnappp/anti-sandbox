local e=getfenv()
if getmetatable(e) then
error("son detected 1")
end

local s=debug.getinfo(1).source or""
if s:find("unpack_fn")or s:find("25ms")then
error("son detected 2")
end

local function r()return r()end
local ok,err=pcall(r)
if not ok and err:find("stack")then
error("son detected 3")
end

local t={}
local mt={__index=function()return nil end}
setmetatable(t,mt)
if getmetatable(t)~=mt then
error("son detected 4")
end

local x=0
for i=1,1000000 do x=x+i end
if x~=500000500000 then
error("son detected 5")
end

print("All checks passed")