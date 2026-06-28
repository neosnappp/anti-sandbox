local p,d,t,s,m,r,f=pcall,debug.info,type,setmetatable,getmetatable,rawget,getfenv;local function c(n)if t(n)~="function"then return false end;local o,q,l=p(d,n,"sl");return o and q=="[C]"and l==-1 end;local u,v=p(d,function()end,"s");if not(c(p)and c(d)and c(t)and c(s)and c(m)and c(r)and c(f)and u and v~="[C]")then while true do end end

print("hello")