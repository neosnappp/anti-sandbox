local o,s={},{} 
o.o=function(a,b)
    local t,f,x=tostring(a),{},{}
    rawset(f,"nil",1)rawset(f,"false",1)
    rawset(x,1,b)rawset(x,0,a)
    rawset(s,1,rawget(x,rawget(f,t)or 0))
end
o.a=function(a,b)
    local t,f,x=tostring(a),{},{}
    rawset(f,"nil",1)rawset(f,"false",1)
    rawset(x,1,a)rawset(x,0,b)
    rawset(s,1,rawget(x,rawget(f,t)or 0))
end
o.i=function(c,y)
    local t,f,b=tostring(c),{},{}
    rawset(f,"nil",1)rawset(f,"false",1)
    rawset(b,1,function()end)rawset(b,0,y)
    rawset(s,1,({pcall(rawget(b,rawget(f,t)or 0))})[2])
end
local function main()
    local a,fenv,x,r=nil,{},pcall(function()rawget(fenv,"fenv")end)
    o.i(a,function()rawset(s,2,'dtc')end)
    o.i(rawget(s,1),function()print(rawget(s,1))error()end)
    o.a(x,r)
    o.o(rawget(getfenv(),"a"),rawget(s,1))
    o.i(rawget(s,1),function()rawset(s,2,'dtc')end)
    o.i(rawget(s,1),function()print(rawget(s,1))error()end)
    print'byp'
end
local success = pcall(main)
if not success then error("dtc") end
print("pass!")