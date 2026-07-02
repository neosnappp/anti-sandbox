--by neosnapp
--Environment validation

--WyNfuscate

local Rawget, r107, Instance_Or_R109_Result, R110_New, Pcall_Result, Pcall_Result_2, Pcall_Result_5, Pcall_Result_6, Pcall_Result_9, Pcall_Result_10, WYNF_NO_VIRTUALIZE, WYNF_NO_VIRTUALIZE_2
local fenv = getfenv()
local Setmetatable = ((_ENV or _G) or {}).setmetatable
if Setmetatable then
	Rawget = ((_ENV or _G) or {}).rawget
	if Rawget then
		if not Setmetatable then
		end
	end
	if not Setmetatable then
	end
end
if not Rawget then
end
if not Rawget then
end
local _ = debug and debug.info
local _ = debug and debug.traceback
local R3_Result = Setmetatable({}, {
	["__index"] = fenv,
})
local r20 = (Setmetatable and R3_Result) or fenv
if rawget then
	r20.rawget = rawget
	R3_Result.rawget = rawget
end
r20.string = string
R3_Result.string = string
if restorefunction then
	if restorefunction then
		r20.restorefunction = restorefunction
		R3_Result.restorefunction = restorefunction
	end
end
local Clonereference = fenv.clonereference
if Clonereference then
	if Clonereference then
		r20.clonereference = Clonereference
		R3_Result.clonereference = Clonereference
	end
end
if getrawmetatable then
	if getrawmetatable then
		r20.getrawmetatable = getrawmetatable
		R3_Result.getrawmetatable = getrawmetatable
	end
end
if task then
	if task then
		r20.task = task
		R3_Result.task = task
	end
end
if next then
	if next then
		r20.next = next
		R3_Result.next = next
	end
end
if setmetatable then
	if setmetatable then
		r20.setmetatable = setmetatable
		R3_Result.setmetatable = setmetatable
	end
end
if pcall then
	if pcall then
		r20.pcall = pcall
		R3_Result.pcall = pcall
	end
end
local Hookfunc = fenv.hookfunc
if Hookfunc then
	if Hookfunc then
		r20.hookfunc = Hookfunc
		R3_Result.hookfunc = Hookfunc
	end
end
if writefile then
	if writefile then
		r20.writefile = writefile
		R3_Result.writefile = writefile
	end
end
r20.tostring = tostring
R3_Result.tostring = tostring
if clonefunction then
	if clonefunction then
		r20.clonefunction = clonefunction
		R3_Result.clonefunction = clonefunction
	end
end
if setfenv then
	if setfenv then
		r20.setfenv = setfenv
		R3_Result.setfenv = setfenv
	end
end
r20.table = table
R3_Result.table = table
if getfenv then
	if getfenv then
		r20.getfenv = getfenv
		R3_Result.getfenv = getfenv
	end
end
if appendfile then
	if appendfile then
		r20.appendfile = appendfile
		R3_Result.appendfile = appendfile
	end
end
if rawset then
	if rawset then
		r20.rawset = rawset
		R3_Result.rawset = rawset
	end
end
r20.type = type
R3_Result.type = type
r20.tonumber = tonumber
R3_Result.tonumber = tonumber
if getmetatable then
	if getmetatable then
		r20.getmetatable = getmetatable
		R3_Result.getmetatable = getmetatable
	end
end
if select then
	if select then
		r20.select = select
		R3_Result.select = select
	end
end
if xpcall then
	if xpcall then
		r20.xpcall = xpcall
		R3_Result.xpcall = xpcall
	end
end
if assert then
	if assert then
		r20.assert = assert
		R3_Result.assert = assert
	end
end
if hookfunction then
	if hookfunction then
		r20.hookfunction = hookfunction
		R3_Result.hookfunction = hookfunction
	end
end
if error then
	if error then
		r20.error = error
		R3_Result.error = error
	end
end
if rawequal then
	if rawequal then
		r20.rawequal = rawequal
		R3_Result.rawequal = rawequal
	end
end
if debug then
	if debug then
		r20.debug = debug
		R3_Result.debug = debug
	end
end
if getgenv then
	if getgenv then
		r20.getgenv = getgenv
		R3_Result.getgenv = getgenv
	end
end
if cloneref then
	if cloneref then
		r20.cloneref = cloneref
		R3_Result.cloneref = cloneref
	end
end
if typeof then
	if typeof then
		r20.typeof = typeof
		R3_Result.typeof = typeof
	end
end
if rawlen then
	if rawlen then
		r20.rawlen = rawlen
		R3_Result.rawlen = rawlen
	end
end
if math then
	if math then
		r20.math = math
		R3_Result.math = math
	end
end
local Getgc = fenv.getgc
if Getgc then
	if Getgc then
		r20.getgc = Getgc
		R3_Result.getgc = Getgc
	end
end
r20.print = print
R3_Result.print = print
local Getreg = fenv.getreg
if Getreg then
	if Getreg then
		r20.getreg = Getreg
		R3_Result.getreg = Getreg
	end
end
if coroutine then
	if coroutine then
		r20.coroutine = coroutine
		R3_Result.coroutine = coroutine
	end
end
if os then
	if os then
		r20.os = os
		R3_Result.os = os
	end
end
if isfunctionhooked then
	if isfunctionhooked then
		r20.isfunctionhooked = isfunctionhooked
		R3_Result.isfunctionhooked = isfunctionhooked
	end
end
local Setreadonly = fenv.setreadonly
if Setreadonly then
	if Setreadonly then
		r20.setreadonly = Setreadonly
		R3_Result.setreadonly = Setreadonly
	end
end
if pairs then
	if pairs then
		r20.pairs = pairs
		R3_Result.pairs = pairs
	end
end
r20.bit32 = bit32
R3_Result.bit32 = bit32
if newcclosure then
	if newcclosure then
		r20.newcclosure = newcclosure
		R3_Result.newcclosure = newcclosure
	end
end
if ipairs then
	if ipairs then
		r20.ipairs = ipairs
		R3_Result.ipairs = ipairs
	end
end
r20.unpack = unpack
R3_Result.unpack = unpack
if _ENV then
end
if _ENV then
end
local Getregistry = fenv.getregistry
if Getregistry then
	if Getregistry then
		r20.getregistry = Getregistry
		R3_Result.getregistry = Getregistry
	end
	r107 = game and (type(game) ~= "table")
	if r107 then
		local _ = r107 and 43
		Instance_Or_R109_Result = Instance
			or (function(a_31, b_31, c_31, ...)
				local _ = Instance and Instance
				return Instance
			end)()
		R110_New = Instance_Or_R109_Result.new
		local _ = Instance_Or_R109_Result and R110_New
		if R110_New and (type(R110_New) == "function") then
		end
	end
end
local _ = (debug and (type(debug) == "table")) and debug
local _ = debug and debug.info
local _ = debug and debug.traceback
if string.match then
	local success, r124 = pcall(function(a, b, c)
		return debug.info(debug.info, "s")
	end)
end
if success and (r124 == "[C]") then
	local success_1, r127 = pcall(function(a_2, b_2, c_2)
		return debug.info(debug.traceback, "s")
	end)
end
if success_1 and (r127 == "[C]") then
	local success_2, r130 = pcall(function(a_3, b_3, c_3)
		return debug.info(function(a_32, b_32, c_32)
			return 1
		end, "l")
	end)
	if success_2 and (type(r130) == "number") then
		local success_3, r134 = pcall(function(a_4, b_4, c_4)
			return debug.info(pcall, "s")
		end)
	end
end
if success_3 and (r134 == "[C]") then
	local success_4, r137 = pcall(function(a_5, b_5, c_5)
		return debug.info(string.match, "s")
	end)
end
if success_4 and (r137 == "[C]") then
	if not fenv.k1 then
	else
		Pcall_Result, Pcall_Result_2 = pcall(function(a_6, b_6, c_6)
			return debug.info(4, "s")
		end)
	end
end
if Pcall_Result and (Pcall_Result_2 == "[C]") then
end
if Pcall_Result and Pcall_Result_2 then
end
local r148, Pcall_Result_3 = pcall(debug.traceback)
local _ = (r148 and (type(Pcall_Result_3) == "string")) and string.byte
for i = 1, #Pcall_Result_3 do
end
string.byte(Pcall_Result_3, 1)
string.byte(Pcall_Result_3, 2)
string.byte(Pcall_Result_3, 3)
string.byte(Pcall_Result_3, 4)
string.byte(Pcall_Result_3, 5)
string.byte(Pcall_Result_3, 6)
string.byte(Pcall_Result_3, 7)
string.byte(Pcall_Result_3, 8)
string.byte(Pcall_Result_3, 9)
string.byte(Pcall_Result_3, 10)
string.byte(Pcall_Result_3, 11)
string.byte(Pcall_Result_3, 12)
string.byte(Pcall_Result_3, 13)
string.byte(Pcall_Result_3, 14)
string.byte(Pcall_Result_3, 15)
string.byte(Pcall_Result_3, 16)
string.byte(Pcall_Result_3, 17)
string.byte(Pcall_Result_3, 18)
local success_12, Pcall_Result_4 = pcall(function(a_14, b_14, c_14)
	local success_6, r173 = pcall(function(a_8, b_8, c_8)
		return debug.info(1, "s")
	end)
	if not success_6 or not r173 then
	end
	local success_7, r177 = pcall(function(a_9, b_9, c_9)
		return debug.info(2, "s")
	end)
	if not success_7 or not r177 then
	end
	local success_8, r181 = pcall(function(a_10, b_10, c_10)
		return debug.info(3, "s")
	end)
	if not success_8 or not r181 then
	end
	local success_9, r185 = pcall(function(a_11, b_11, c_11)
		return debug.info(4, "s")
	end)
	if not success_9 or not r185 then
	end
	local success_10, r189 = pcall(function(a_12, b_12, c_12)
		return debug.info(5, "s")
	end)
	if not success_10 or not r189 then
	end
	local success_11, r193 = pcall(function(a_13, b_13, c_13)
		return debug.info(6, "s")
	end)
	if not success_11 or not r193 then
	end
	return 5
end)
if success_12 and (type(Pcall_Result_4) == "number") then
	if Pcall_Result_4 > 8 then
	end
end
if debug.traceback then
	local success_13, r202 = pcall(function(a_15, b_15, c_15)
		return debug.info(3, "s")
	end)
	local success_14, r203 = pcall(function(a_16, b_16, c_16)
		return debug.info(4, "s")
	end)
	local success_15, r204 = pcall(function(a_17, b_17, c_17)
		return debug.info(6, "s")
	end)
	local success_16, r205 = pcall(function(a_18, b_18, c_18)
		return debug.info(8, "s")
	end)
	Pcall_Result_5, Pcall_Result_6 = pcall(function(a_19, b_19, c_19)
		return debug.info(11, "s")
	end)
end
if success_13 and (r202 == "[C]") then
end
if success_14 and (r203 == "[C]") then
end
if success_15 and (r204 == "[C]") then
end
if success_16 and (r205 == "[C]") then
end
if Pcall_Result_5 and (Pcall_Result_6 == "[C]") then
end
if Pcall_Result_5 and Pcall_Result_6 then
end
local success_18, r219 = pcall(function(a_20, b_20, c_20)
	return debug.info(3, "s")
end)
local success_19, r220 = pcall(function(a_21, b_21, c_21)
	return debug.info(4, "s")
end)
local success_20, r221 = pcall(function(a_22, b_22, c_22)
	return debug.info(6, "s")
end)
local success_21, r222 = pcall(function(a_23, b_23, c_23)
	return debug.info(8, "s")
end)
local Pcall_Result_7, Pcall_Result_8 = pcall(function(a_24, b_24, c_24)
	return debug.info(11, "s")
end)
if success_18 and (r219 == "[C]") then
end
if success_19 and (r220 == "[C]") then
end
if success_20 and (r221 == "[C]") then
end
if success_21 and (r222 == "[C]") then
end
if Pcall_Result_7 and (Pcall_Result_8 == "[C]") then
end
if Pcall_Result_7 and Pcall_Result_8 then
end
local ENV_And_R236_Result_Or_Nil_2 = (_ENV and nil) or nil
if ((ENV_And_R236_Result_Or_Nil_2 and nil) or nil) and ((ENV_And_R236_Result_Or_Nil_2 and nil) or nil) then
else
	local success_23, r246 = pcall(function(a_25, b_25, c_25)
		return debug.info(3, "s")
	end)
	local success_24, r247 = pcall(function(a_26, b_26, c_26)
		return debug.info(4, "s")
	end)
	local success_25, r248 = pcall(function(a_27, b_27, c_27)
		return debug.info(6, "s")
	end)
	local success_26, r249 = pcall(function(a_28, b_28, c_28)
		return debug.info(8, "s")
	end)
	Pcall_Result_9, Pcall_Result_10 = pcall(function(a_29, b_29, c_29)
		return debug.info(11, "s")
	end)
end
if success_23 and (r246 == "[C]") then
end
if success_24 and (r247 == "[C]") then
end
if success_25 and (r248 == "[C]") then
end
if success_26 and (r249 == "[C]") then
end
if Pcall_Result_9 and (Pcall_Result_10 == "[C]") then
end
if Pcall_Result_9 and Pcall_Result_10 then
end
if pcall then
	if rawget then
		if getgenv then
			if not getgenv then
			end
		end
		local r268, r269 = pcall(getgenv)
	end
end
if not r268 or (type(r269) ~= "table") then
end
if getfenv then
	if pairs then
		if math then
			if coroutine then
				if xpcall then
					if rawset then
						if getmetatable then
							if error then
								if pcall then
									if rawget then
										if setfenv then
											if next then
												if setmetatable then
													WYNF_NO_VIRTUALIZE = fenv.WYNF_NO_VIRTUALIZE
													if WYNF_NO_VIRTUALIZE then
													end
												end
												local _ = WYNF_NO_VIRTUALIZE
													or function(p1_32, a_32, b_32, c_32)
														return p1_32
													end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end
if ipairs then
	if assert then
		if select then
			if math then
				if rawget then
					if rawset then
						if setmetatable then
							if getmetatable then
								if error then
									if assert then
										if pairs then
											if ipairs then
												if next then
													if pcall then
														if xpcall then
															if select then
																WYNF_NO_VIRTUALIZE_2 = fenv.WYNF_NO_VIRTUALIZE
																if WYNF_NO_VIRTUALIZE_2 then
																end
															end
															local _ = WYNF_NO_VIRTUALIZE_2
																or function(p1_32, a_32, b_32, c_32)
																	return p1_32
																end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end
if coroutine then
	if setfenv then
		if getfenv then
			local _ = debug and debug.getinfo
			if debug.getinfo then
				local _ = debug and debug.info
				if debug.info then
					if select then
						if xpcall then
							if getmetatable then
								if assert then
									if setmetatable then
										if rawget then
											if pcall then
												if math then
													if ipairs then
														if next then
															if coroutine then
																if rawset then
																	if pairs then
																		if string.match then
																			debug.info(2, "l")
																		end
																	end
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end
if getfenv then
	setfenv(function(a_32, b_32, c_32) end, {})
end
if getfenv then
end
local Array = {
	"" .. math.random(99999),
	"" .. math.random(99999),
	"" .. math.random(99999),
}
local _ = Array[math.random(3)] .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
math.random(#Array)
local _ = nil .. math.random(99999)
if setfenv then
	if math and false then
	else
		local success_29, r1132 = pcall(function(a_31, b_31, c_31)
			return (not pcall(function(a_30, b_30, c_30)
				(nil)()
			end))
		end)
	end
	local _ = (success_29 and r1132) and 173
end
while true do
end
error "too many iterations"
