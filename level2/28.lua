do
local s,e=pcall(function()
        local a=game:GetService("AnimationClipProvider"):GetMemStats()
        local c,d=0,0
        for k,v in pairs(a)do
            if type(k)=="string"then c=c+1 end
            if type(v)=="number"then d=d+1 end
        end
        if c==0 or d==0 or c~=d then error("Dark Triad",2)end

        local p=game:GetService("Players"):GetCharacterAppearanceInfoAsync(1)
        if type(p)~="table"or type(p.assets)~="table"or#p.assets==0 then error("Dark Triad",2)end
    end)
    if not s then error("Dark Triad Blocked",2)end
end

print("Dark Triad PASSED")
print("hi iam pass")