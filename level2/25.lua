local sc, resc = pcall(function()
    return game:Clone()
end)
if sc or typeof(resc) ~= "string" or resc ~= "Ugc cannot be cloned" then
    print(1)
else
print("ud")
end;