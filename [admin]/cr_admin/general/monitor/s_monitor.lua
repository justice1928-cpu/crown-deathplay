function doMonitorList(sourcePlayer, command, targetPlayerName, ...)
	if (exports.cr_integration:isPlayerTrialAdmin(sourcePlayer) or exports.cr_integration:isPlayerSupporter(sourcePlayer)) then
		if not targetPlayerName then
			local dataTable = { }
			for key, value in ipairs(getElementsByType("player")) do
				local loggedin = getElementData(value, "loggedin")
				if (loggedin == 1) then
					local reason = getElementData(value, "admin:monitor")
					if reason and #reason > 0 then
						local playerAccount = getElementData(value, "account:username")
						local playerName = getPlayerName(value):gsub("_", " ")
						table.insert(dataTable, { playerAccount, playerName, reason })
					end
				end
			end
			triggerClientEvent(sourcePlayer, "onMonitorPopup", sourcePlayer, dataTable, exports.cr_integration:isPlayerTrialAdmin(sourcePlayer) or exports.cr_integration:isPlayerSupporter(sourcePlayer))		
		else
			if not ... then
				outputChatBox("KULLANIM: /" .. command .. " [player] [reason]", sourcePlayer, 255, 194, 14)
			else
				local targetPlayer, targetPlayerName = exports.cr_global:findPlayerByPartialNick(sourcePlayer, targetPlayerName)
				if targetPlayer then
					local accountID = tonumber(getElementData(targetPlayer, "account:id"))
					local month = getRealTime().month + 1
					local timeStr = tostring(getRealTime().monthday) .. "/" ..tostring(month)  
					local reason = table.concat({...}, " ") .. " (" .. getElementData(sourcePlayer, "account:username") .. " " .. timeStr .. ")"
					if dbExec(mysql:getConnection(),"UPDATE accounts SET monitored = '" .. exports.cr_mysql:escape_string(reason) .. "' WHERE id = " .. exports.cr_mysql:escape_string(accountID)) then
						setElementData(targetPlayer, "admin:monitor", reason, false)
						outputChatBox("You added " .. getPlayerName(targetPlayer):gsub("_", " ") .. " to the monitor list.", sourcePlayer, 0, 255, 0)
					end
				end
			end
		end
	end
end
addCommandHandler("monitor", doMonitorList)

addEvent("monitor:onSaveEdittedMonitor", true)
addEventHandler("monitor:onSaveEdittedMonitor", root,
	function (sourcePlayer, username, monitorContent, targetPlayerName1)
		local staffUsername = getElementData(sourcePlayer, "account:username")
		local month = getRealTime().month + 1
		local timeStr = tostring(getRealTime().monthday) .. "/" ..tostring(month)  
		local targetPlayer, targetPlayerName = exports.cr_global:findPlayerByPartialNick(sourcePlayer, targetPlayerName1)
		local reason = monitorContent .. " (" .. staffUsername .. " " .. timeStr .. ")"
		if dbExec(mysql:getConnection(),"UPDATE accounts SET monitored = '" .. exports.cr_mysql:escape_string(reason) .. "' WHERE username = '" .. exports.cr_mysql:escape_string(username) .. "'") then
			setElementData(targetPlayer, "admin:monitor", reason, false)
			outputChatBox("[MONITOR] You updated " .. username .. " to the monitor list.", sourcePlayer, 0, 255, 0)
			doMonitorList(sourcePlayer, "monitor") 
			if exports.cr_integration:isPlayerTrialAdmin(sourcePlayer) then
				staffTitle = exports.cr_global:getPlayerAdminTitle(sourcePlayer)
			end
			exports.cr_global:sendMessageToAdmins("[MONITOR] " .. staffTitle .. " " .. staffUsername .. " modified monitor on player '" .. targetPlayerName .. "' (" .. monitorContent .. ").")
			exports.cr_global:sendMessageToSupporters("[MONITOR] " .. staffTitle .. " " .. staffUsername .. " modified monitor on player '" .. targetPlayerName .. "' (" .. monitorContent .. ").")
		else
			outputChatBox("[MONITOR] Failed to update " .. username .. " to the monitor list.", sourcePlayer, 255, 0, 0) 
		end
	end	
)

function offlineMonitorADD(sourcePlayer, command, username, ...)
	if (exports.cr_integration:isPlayerTrialAdmin(sourcePlayer) or exports.cr_integration:isPlayerSupporter(sourcePlayer)) then
		if not ... then
			triggerClientEvent(sourcePlayer, "monitor:oadd", sourcePlayer)
			--outputChatBox("KULLANIM: /" .. command .. " [username] [reason]", sourcePlayer, 255, 194, 14)
		else
			local name = mysql:query_fetch_assoc("SELECT `id`,`username`, `monitored` FROM `accounts` WHERE `username` = '" .. mysql:escape_string(username) .. "'")
			if name then
				local uname = name["username"]
				local uid = name["id"]
			
				local month = getRealTime().month + 1
				local timeStr = tostring(getRealTime().monthday) .. "/" ..tostring(month)  
				local staffUsername = getElementData(sourcePlayer, "account:username")
				
				local reasonTemp = table.concat({...}, " ")
				local reason =  reasonTemp .. " (" .. staffUsername .. " " .. timeStr .. ")"
				
				
				
				if name["monitored"] and #name["monitored"] > 0 then
					reason = name["monitored"] .. " | " .. reason
				end
				
				if dbExec(mysql:getConnection(),"UPDATE accounts SET monitored = '" .. exports.cr_mysql:escape_string(reason) .. "' WHERE id = " .. exports.cr_mysql:escape_string(uid)) then
					setElementData(targetPlayer, "admin:monitor", reason, false)
					outputChatBox("You added " .. name["username"] .. " to the monitor list.", sourcePlayer, 0, 255, 0)
					if exports.cr_integration:isPlayerTrialAdmin(sourcePlayer) then
						staffTitle = exports.cr_global:getPlayerAdminTitle(sourcePlayer)
					end
					exports.cr_global:sendMessageToAdmins("[OMONITOR] " .. staffTitle .. " " .. staffUsername .. " added an offline monitor on player '" .. username .. "' (" .. reasonTemp .. ").")
					exports.cr_global:sendMessageToSupporters("[OMONITOR] " .. staffTitle .. " " .. staffUsername .. " added an offline monitor on player '" .. username .. "' (" .. reasonTemp .. ").")
				end
			end
		end
	end
end
addCommandHandler("omonitor", offlineMonitorADD)

function offlineMonitorADD2(sourcePlayer, command, username, ...)
	if (exports.cr_integration:isPlayerTrialAdmin(sourcePlayer) or exports.cr_integration:isPlayerSupporter(sourcePlayer)) then
		if not ... then
			triggerClientEvent(sourcePlayer, "monitor:oadd2", sourcePlayer)
			--outputChatBox("KULLANIM: /" .. command .. " [username] [reason]", sourcePlayer, 255, 194, 14)
		else
			local name = mysql:query_fetch_assoc("SELECT `id`,`username`, `monitored` FROM `accounts` WHERE `username` = '" .. mysql:escape_string(username) .. "'")
			if name then
				local uname = name["username"]
				local uid = name["id"]
			
				local month = getRealTime().month + 1
				local timeStr = tostring(getRealTime().monthday) .. "/" ..tostring(month)  
			
				local reason =  table.concat({...}, " ") .. " (" .. getElementData(sourcePlayer, "account:username") .. " " .. timeStr .. ")"
				
				
				
				if name["monitored"] and #name["monitored"] > 0 then
					reason = name["monitored"] .. " | " .. reason
				end
				
				if dbExec(mysql:getConnection(),"UPDATE accounts SET monitored = '" .. exports.cr_mysql:escape_string(reason) .. "' WHERE id = " .. exports.cr_mysql:escape_string(uid)) then
					setElementData(targetPlayer, "admin:monitor", reason, false)
					outputChatBox("You added " .. name["username"] .. " to the monitor list.", sourcePlayer, 0, 255, 0)
				end
			end
		end
	end
end
addCommandHandler("omonitor2", offlineMonitorADD2)

addEvent("monitor:add", true)
addEventHandler("monitor:add", root,
	function(name, reason)
		if exports.cr_integration:isPlayerTrialAdmin(client) or exports.cr_integration:isPlayerSupporter(client) then
			offlineMonitorADD(client, "omonitor", name, reason)
		end
	end
)

addEvent("monitor:checkUsername", true)
addEventHandler("monitor:checkUsername", root,
	-- function(name, reason)
		-- if exports.cr_integration:isPlayerTrialAdmin(client) or exports.cr_integration:isPlayerSupporter(client) then
			-- offlineMonitorADD(client, "omonitor", name, reason)
		-- end
	-- end
	function (username)
		local name = mysql:query_fetch_assoc("SELECT `id`,`username`, `monitored` FROM `accounts` WHERE `username` = '" .. mysql:escape_string(username) .. "'")
			if name then
				local uname = name["username"]
				local uid = name["id"]
				local month = getRealTime().month + 1
				local timeStr = tostring(getRealTime().monthday) .. "/" ..tostring(month)  
				--local reason =  table.concat({...}, " ") .. " (" .. getElementData(sourcePlayer, "account:username") .. " " .. timeStr .. ")"
				
				triggerClientEvent()
			else
			
			
			end
	end
)

addEvent("monitor:remove", true)
addEventHandler("monitor:remove", root,
	function()
		if exports.cr_integration:isPlayerTrialAdmin(client) or exports.cr_integration:isPlayerSupporter(client) then
			local staffUsername = getElementData(client, "account:username")
			local playerUsername = getElementData(source, "account:username")
			local accountID = tonumber(getElementData(source, "account:id"))
			if dbExec(mysql:getConnection(),"UPDATE accounts SET monitored = '' WHERE id = " .. exports.cr_mysql:escape_string(accountID)) then
				setElementData(source, "admin:monitor", false, false)
				outputChatBox("You removed " .. getPlayerName(source):gsub("_", " ") .. " from the monitor list.", client, 0, 255, 0)
				
				staffTitle = exports.cr_global:getPlayerAdminTitle(client)
				exports.cr_global:sendMessageToAdmins("[MONITOR] " .. staffTitle .. " " .. staffUsername .. " removed monitor on player '" .. playerUsername .. "'.")
				exports.cr_global:sendMessageToSupporters("[MONITOR] " .. staffTitle .. " " .. staffUsername .. " removed monitor on player '" .. playerUsername .. "'.")
				
				doMonitorList(client)
			end
		end
	end
)


--[[
function onCharacterLogin(characterName, factionID)
	local thePlayer = source
	local reason = getElementData(thePlayer, "admin:monitor")
	if reason and #reason > 0 then
		local playerAccount = getElementData(thePlayer, "account:username")
		local playerName = getPlayerName(thePlayer):gsub("_", " ")
		exports.cr_global:sendMessageToAdmins("[MONITOR] Player '" .. playerName .. "' (" .. playerAccount .. ") logged in. MR: " .. reason)
	end
end
addEventHandler("onCharacterLogin", root, onCharacterLogin)]]