local benches = { }

function startBenchMark()
	local benchID = #benches + 1
	benches[benchID] = getTickCount()
	return benchID
end

function endBenchMark(benchID)
	if (benches[benchID]) then
		return  getTickCount() - benches[benchID]
	end
	return -1
end

function split(str, pat)
   local t = {}  -- NOTE: use {n = 0} in Lua-5.0
   local fpat = "(.-)" .. pat
   local last_end = 1
   local s, e, cap = str:find(fpat, 1)
   while s do
      if s ~= 1 or cap ~= "" then
	 table.insert(t,cap)
      end
      last_end = e+1
      s, e, cap = str:find(fpat, last_end)
   end
   if last_end <= #str then
      cap = str:sub(last_end)
      table.insert(t, cap)
   end
   return t
end