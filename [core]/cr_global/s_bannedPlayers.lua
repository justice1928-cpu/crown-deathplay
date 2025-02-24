local IPs = { }
local serials = { }

function fillBans(res)
	if res == getThisResource() then
		local ipCounter = 0
		local serialCounter = 0
		local result = exports.cr_mysql:query("SELECT * FROM bannedIPs")
		if result then
			while true do
				local row = exports.cr_mysql:fetch_assoc(result)
				if not row then break end
				table.insert(IPs, row["ip"])
				ipCounter = ipCounter + 1
			end
        end
		result = exports.cr_mysql:query("SELECT * FROM bannedSerials")
		if result then
			while true do
				local row = exports.cr_mysql:fetch_assoc(result)
				if not row then break end
				table.insert(serials, row["serial"])
				serialCounter = serialCounter + 1
			end
        end
		outputDebugString(ipCounter .. " IP bans have been loaded")
		outputDebugString(serialCounter .. " serial bans have been loaded")
    end
end
--addEventHandler("onResourceStart", root, fillBans)

function fetchIPs()
	return IPs
end

function fetchSerials()
	return serials
end

function updateBans()
	IPs = { }
	serials = { }
	fillBans(getThisReasource())
end