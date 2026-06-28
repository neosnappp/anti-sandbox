if pcall(setfenv, print, getfenv(print)) then
error("1",0)
end