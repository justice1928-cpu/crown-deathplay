unemployedPay = 150

function createFaction(thePlayer, commandName, factionType, ...)
	if exports.cr_integration:isPlayerLeaderAdmin(thePlayer) then
		if not (...) then
			outputChatBox("KULLANIM: /" .. commandName .. " [Faction Type 0=GANG, 1=MAFIA, 2=LAW, 3=GOV, 4=MED, 5=OTHER, 6=NEWS, 7=MECHANIC] [Birlik İsmi]", thePlayer, 255, 194, 14)
		else
			factionName = table.concat({...}, " ")
			factionType = tonumber(factionType)
			
			local theTeam = createTeam(tostring(factionName))
			if theTeam then
				if mysql:query_free("INSERT INTO factions SET name='" .. mysql:escape_string(factionName) .. "', bankbalance='0', type='" .. mysql:escape_string(factionType) .. "'") then
					local id = mysql:insert_id()
					exports.cr_pool:allocateElement(theTeam, id)
					
					dbExec(mysql:getConnection(), "UPDATE factions SET rank_1='Dynamic Rank #1', rank_2='Dynamic Rank #2', rank_3='Dynamic Rank #3', rank_4='Dynamic Rank #4', rank_5='Dynamic Rank #5', rank_6='Dynamic Rank #6', rank_7='Dynamic Rank #7', rank_8='Dynamic Rank #8', rank_9='Dynamic Rank #9', rank_10='Dynamic Rank #10', rank_11='Dynamic Rank #11', rank_12='Dynamic Rank #12', rank_13='Dynamic Rank #13', rank_14='Dynamic Rank #14', rank_15='Dynamic Rank #15', rank_16='Dynamic Rank #16', rank_17='Dynamic Rank #17', rank_18='Dynamic Rank #18', rank_19='Dynamic Rank #19', rank_20='Dynamic Rank #20',  motd='Welcome to the faction.', note = '' WHERE id='" .. id .. "'")
					outputChatBox("[!]#FFFFFF Başarıyla " .. factionName .. " (" .. id .. ") isimli birlik kuruldu.", thePlayer, 0, 255, 0, true)
					setElementData(theTeam, "type", tonumber(factionType))
					setElementData(theTeam, "id", tonumber(id))
					setElementData(theTeam, "money", 0)
					
					local factionRanks = {}
					local factionWages = {}
					for i = 1, 20 do
						factionRanks[i] = "Dynamic Rank #" .. i
						factionWages[i] = 100
					end
					setElementData(theTeam, "ranks", factionRanks, false)
					setElementData(theTeam, "wages", factionWages, false)
					setElementData(theTeam, "motd", "Birliğe hoş geldiniz.", false)
					setElementData(theTeam, "note", "", false)
					exports.cr_logs:dbLog(thePlayer, 4, theTeam, "MAKE FACTION")
				else
					destroyElement(theTeam)
					outputChatBox("[!]#FFFFFF Bir sorun oluştu.", thePlayer, 255, 0, 0, true)
				end
			else
				outputChatBox("[!]#FFFFFF Böyle bir birlik bulunuyor.", thePlayer, 255, 0, 0, true)
			end
		end
	end
end
addCommandHandler("makefaction", createFaction, false, false)

function adminRenameFaction(thePlayer, commandName, factionID, ...)
	if exports.cr_integration:isPlayerLeaderAdmin(thePlayer) then
		if not (factionID) or not (...)  then
			outputChatBox("KULLANIM: /" .. commandName .. " [Birlik ID] [Birlik İsmi]", thePlayer, 255, 194, 14)
		else
			factionID = tonumber(factionID)
			if factionID and factionID > 0 then
				local theTeam = exports.cr_pool:getElement("team", factionID)
				if (theTeam) then
					local factionName = table.concat({...}, " ")
					dbExec(mysql:getConnection(), "UPDATE factions SET name='" .. mysql:escape_string(factionName) .. "' WHERE id='" .. factionID .. "'")
					local oldName = getTeamName(theTeam)
					setTeamName(theTeam, factionName)
					
					exports.cr_global:sendMessageToAdmins(exports.cr_global:getPlayerFullIdentity(thePlayer) .. " renamed faction '" .. oldName .. "' to '" .. factionName .. "'.")
				else
					outputChatBox("[!]#FFFFFF Geçersiz Birlik ID.", thePlayer, 255, 0, 0, true)
				end
			else
				outputChatBox("[!]#FFFFFF Geçersiz Birlik ID.", thePlayer, 255, 0, 0, true)
			end
		end
	end
end
addCommandHandler("renamefaction", adminRenameFaction, false, false)

function adminSetPlayerFaction(thePlayer, commandName, partialNick, factionID)
	if exports.cr_integration:isPlayerLeaderAdmin(thePlayer) then
		factionID = tonumber(factionID)
		if not (partialNick) or not (factionID) then
			outputChatBox("KULLANIM: /" .. commandName .. " [Karakter Adı / ID] [Faction ID (-1 for none)]", thePlayer, 255, 194, 14)
		else
			local targetPlayer, targetPlayerNick = exports.cr_global:findPlayerByPartialNick(thePlayer, partialNick)
			
			if targetPlayer then
				local theTeam = exports.cr_pool:getElement("team", factionID)
				if not theTeam and factionID ~= -1 then
					outputChatBox("[!]#FFFFFF Geçersiz Birlik ID.", thePlayer, 255, 0, 0, true)
					return
				end
				
				if dbExec(mysql:getConnection(), "UPDATE characters SET faction_leader = 0, faction_id = " .. factionID .. ", faction_rank = 1, faction_phone = NULL, duty = 0 WHERE id=" .. getElementData(targetPlayer, "dbid")) then
					setPlayerTeam(targetPlayer, theTeam)
					if factionID > 0 then
						setElementData(targetPlayer, "faction", factionID, true)
						setElementData(targetPlayer, "factionrank", 1, true)
						setElementData(targetPlayer, "factionphone", nil, true)
						setElementData(targetPlayer, "factionleader", 0, true)
						triggerEvent("duty:offduty", targetPlayer)
						
						outputChatBox("[!]#FFFFFF " .. targetPlayerNick .. " isimli oyuncu " .. getTeamName(theTeam) .. " (" .. factionID .. ") isimli birliğine eklendi.", thePlayer, 0, 255, 0, true)
						outputChatBox("[!]#FFFFFF " .. exports.cr_global:getPlayerFullAdminTitle(thePlayer) .. " isimli yetkili sizi " .. getTeamName(theTeam) .. " (" .. factionID .. ") isimli birliğe ekledi.", targetPlayer, 0, 0, 255, true)
						
						triggerEvent("onPlayerJoinFaction", targetPlayer, theTeam)
						outputChatBox("You were set to Faction '" .. getTeamName(theTeam) .. "'.", targetPlayer, 255, 194, 14)
						
						exports.cr_logs:dbLog(thePlayer, 4, { targetPlayer, theTeam }, "SET TO FACTION")
					else
						local citizenTeam = getTeamFromName("Citizen")
						setPlayerTeam(targetPlayer, citizenTeam)
						setElementData(targetPlayer, "faction", -1, true)
						setElementData(targetPlayer, "factionrank", 1, true)
						setElementData(targetPlayer, "factionphone", nil, true)
						setElementData(targetPlayer, "factionleader", 0, true)
						if getElementData(targetPlayer, "duty") and getElementData(targetPlayer, "duty") > 0 then
							takeAllWeapons(targetPlayer)
							setElementData(targetPlayer, "duty", 0, true)
						end
						
						outputChatBox("[!]#FFFFFF " .. targetPlayerNick .. " isimli oyuncu " .. getTeamName(theTeam) .. " (" .. factionID .. ") isimli birliğine eklendi.", thePlayer, 0, 255, 0, true)
						outputChatBox("[!]#FFFFFF " .. exports.cr_global:getPlayerFullAdminTitle(thePlayer) .. " isimli yetkili sizi " .. getTeamName(theTeam) .. " (" .. factionID .. ") isimli birliğe ekledi.", targetPlayer, 0, 0, 255, true)
						
						exports.cr_logs:dbLog(thePlayer, 4, { targetPlayer }, "REMOVE FROM FACTION")
					end
				end
			end
		end
	end
end
addCommandHandler("setfaction", adminSetPlayerFaction, false, false)

function adminSetFactionLeader(thePlayer, commandName, partialNick, factionID)
	if exports.cr_integration:isPlayerLeaderAdmin(thePlayer) then
		factionID = tonumber(factionID)
		if not (partialNick) or not (factionID)  then
			outputChatBox("KULLANIM: /" .. commandName .. " [Player Partial Name] [Birlik ID]", thePlayer, 255, 194, 14)
		elseif factionID > 0 then
			local targetPlayer, targetPlayerNick = exports.cr_global:findPlayerByPartialNick(thePlayer, partialNick)
			
			if targetPlayer then
				local theTeam = exports.cr_pool:getElement("team", factionID)
				if not theTeam then
					outputChatBox("[!]#FFFFFF Geçersiz Birlik ID.", thePlayer, 255, 0, 0, true)
					return
				end
				
				if dbExec(mysql:getConnection(), "UPDATE characters SET faction_leader = 1, faction_id = " .. tonumber(factionID) .. ", faction_rank = 1, faction_phone = NULL, duty = 0 WHERE id = " .. getElementData(targetPlayer, "dbid")) then
					setPlayerTeam(targetPlayer, theTeam)
					setElementData(targetPlayer, "faction", factionID, true)
					setElementData(targetPlayer, "factionrank", 1, true)
					setElementData(targetPlayer, "factionleader", 1, true)
					setElementData(targetPlayer, "factionphone", nil, true)
					triggerEvent("duty:offduty", targetPlayer)
					
					outputChatBox("[!]#FFFFFF Başarıyla " .. targetPlayerNick .. " isimli oyuncu " .. getTeamName(theTeam) .. " (" .. factionID .. ") isimli birliğe eklendi.", thePlayer, 0, 255, 0, true)
					outputChatBox("[!]#FFFFFF " .. exports.cr_global:getPlayerFullAdminTitle(thePlayer) .. " isimli yetkili sizi " .. getTeamName(theTeam) .. " (" .. factionID .. ") isimli birliğe ekledi.", targetPlayer, 0, 0, 255, true)
					triggerEvent("onPlayerJoinFaction", targetPlayer, theTeam)
					
					exports.cr_logs:dbLog(thePlayer, 4, { targetPlayer, theTeam }, "SET TO FACTION LEADER")
				else
					outputChatBox("[!]#FFFFFF Geçersiz Birlik ID.", thePlayer, 255, 0, 0, true)
				end
			end
		end
	end
end
addCommandHandler("setfactionleader", adminSetFactionLeader, false, false)

function adminSetFactionRank(thePlayer, commandName, partialNick, factionRank)
	if exports.cr_integration:isPlayerLeaderAdmin(thePlayer) then
		factionRank = math.ceil(tonumber(factionRank) or -1)
		if not (partialNick) or not (factionRank)  then
			outputChatBox("KULLANIM: /" .. commandName .. " [Player Partial Name] [Faction Rank, 1-20]", thePlayer, 255, 194, 14)
		elseif factionRank >= 1 and factionRank <= 20 then
			local targetPlayer, targetPlayerNick = exports.cr_global:findPlayerByPartialNick(thePlayer, partialNick)
			
			if targetPlayer then
				local theTeam = getPlayerTeam(targetPlayer)
				if not theTeam or getTeamName(theTeam) == "Citizen" then
					outputChatBox("Player is not in a faction.", thePlayer, 255, 0, 0)
					return
				end
				
				if dbExec(mysql:getConnection(), "UPDATE characters SET faction_rank = " .. factionRank .. " WHERE id = " .. getElementData(targetPlayer, "dbid")) then
					setElementData(targetPlayer, "factionrank", factionRank, true)
					
					outputChatBox("Player " .. targetPlayerNick .. " is now rank " .. factionRank .. ".", thePlayer, 0, 255, 0)
					outputChatBox("Admin " .. getPlayerName(thePlayer):gsub("_"," ") .. " set you to rank " .. factionRank .. ".", targetPlayer, 0, 255, 0)
					
					exports.cr_logs:dbLog(thePlayer, 4, { targetPlayer, theTeam }, "SET TO FACTION RANK " .. factionRank)
				else
					outputChatBox("Error #125151 - Report on Mantis.", thePlayer, 255, 0, 0)
				end
			end
		else
			outputChatBox("Invalid Rank - valid ones are 1 to 20", thePlayer, 255, 0, 0)
		end
	end
end
addCommandHandler("setfactionrank", adminSetFactionRank, false, false)

function adminDeleteFaction(thePlayer, commandName, factionID)
	if exports.cr_integration:isPlayerLeaderAdmin(thePlayer) then
		if not (factionID)  then
			outputChatBox("KULLANIM: /" .. commandName .. " [Birlik ID]", thePlayer, 255, 194, 14)
		else
			factionID = tonumber(factionID)
			if factionID and factionID > 0 then
				local theTeam = exports.cr_pool:getElement("team", factionID)
				
				if (theTeam) then
					
					dbExec(mysql:getConnection(), "DELETE FROM factions WHERE id='" .. factionID .. "'")
					
					outputChatBox("Faction #" .. factionID .. " was deleted.", thePlayer, 0, 255, 0)
					exports.cr_logs:dbLog(thePlayer, 4, theTeam, "DELETE FACTION")
					local civTeam = getTeamFromName("Citizen")
					for key, value in pairs(getPlayersInTeam(theTeam)) do
						setPlayerTeam(value, civTeam)
						setElementData(value, "faction", -1, true)
						--triggerClientEvent(targetPlayer, "updateFactionInfo", targetPlayer, -1, 1)
					end
					destroyElement(theTeam)
				
				else
					outputChatBox("[!]#FFFFFF Geçersiz Birlik ID.", thePlayer, 255, 0, 0, true)
				end
			else
				outputChatBox("[!]#FFFFFF Geçersiz Birlik ID.", thePlayer, 255, 0, 0, true)
			end
		end
	end
end
addCommandHandler("delfaction", adminDeleteFaction, false, false)

function adminShowFactions(thePlayer)
	if (exports.cr_integration:isPlayerTrialAdmin(thePlayer) or exports.cr_integration:isPlayerSupporter(thePlayer) or exports.cr_integration:isPlayerScripter(thePlayer)) then
		local result = mysql:query("SELECT id, name, type, (SELECT COUNT(*) FROM characters c WHERE c.faction_id = f.id) AS members FROM factions f ORDER BY id ASC")
		if result then
			local factions = { }
			
			while true do
				local row = mysql:fetch_assoc(result)
				if not row then break end
				
				table.insert(factions, { row.id, row.name, row.type, (getTeamFromName(row.name) and #getPlayersInTeam(getTeamFromName(row.name)) or "?") .. " / " .. row.members })
			end
			
			mysql:free_result(result)
			triggerClientEvent(thePlayer, "showFactionList", root, factions)
		else
			outputChatBox("Error 300001 - Report on forums.", thePlayer, 255, 0, 0)
		end
	end
end
addCommandHandler("showfactions", adminShowFactions, false, false)

function adminShowFactionOnlinePlayers(thePlayer, commandName, factionID)
	if (exports.cr_integration:isPlayerTrialAdmin(thePlayer) or exports.cr_integration:isPlayerSupporter(thePlayer)) then
		if not (factionID)  then
			outputChatBox("KULLANIM: /" .. commandName .. " [Birlik ID]", thePlayer, 255, 194, 14)
		else
			factionID = tonumber(factionID)
			if factionID and factionID > 0 then
				local theTeam = exports.cr_pool:getElement("team", factionID)
				local theTeamName = getTeamName(theTeam)
				local teamPlayers = getPlayersInTeam(theTeam)
				
				if #teamPlayers == 0 then
					outputChatBox("There are no players online in faction '" ..  theTeamName  .. "'", thePlayer, 255, 194, 14)
				else
					local teamRanks = getElementData(theTeam, "ranks")
					outputChatBox("Players online in faction '" ..  theTeamName  .. "':", thePlayer, 255, 194, 14)
					for k, teamPlayer in ipairs(teamPlayers) do
						local leader = ""
						local playerRank = teamRanks [getElementData(teamPlayer, "factionrank")]
						if (getElementData(teamPlayer, "factionleader") == 1) then
							leader = "LEADER "
						end
						outputChatBox("  " .. leader .. " " ..  getPlayerName(teamPlayer)  .. " - " .. playerRank, thePlayer, 255, 194, 14)
					end
				end
			else
				outputChatBox("Faction not found.", thePlayer, 255, 194, 14)
			end
		end
	end
end
addCommandHandler("showfactionplayers", adminShowFactionOnlinePlayers, false, false)

function callbackAdminPlayersFaction(teamID)
	adminShowFactionOnlinePlayers(client, "showfactionplayers", teamID)
end
addEvent("faction:admin:showplayers", true)
addEventHandler("faction:admin:showplayers", root, callbackAdminPlayersFaction)

addEvent('faction:admin:showf3', true)
addEventHandler('faction:admin:showf3', root,
	function(id, fromF3)
		if exports.cr_integration:isPlayerTrialAdmin(client) --[[or exports.cr_integration:isPlayerSupporter(client)]] then
			showFactionMenuEx(client, id, fromF3)
		end
	end)

function setFactionMoney(thePlayer, commandName, factionID, amount)
	if (exports.cr_integration:isPlayerGeneralAdmin(thePlayer)) then
		if not (factionID) or not (amount)  then
			outputChatBox("KULLANIM: /" .. commandName .. " [Birlik ID] [Money]", thePlayer, 255, 194, 14)
		else
			factionID = tonumber(factionID)
			if factionID and factionID > 0 then
				local theTeam = exports.cr_pool:getElement("team", factionID)
				amount = tonumber(amount) or 0
				if amount and amount > 500000*2 then
					outputChatBox("For security reason, you're not allowed to set more than $1,000,000 at once to a faction.", thePlayer, 255, 0, 0)
					return false
				end
				
				if (theTeam) then
					if exports.cr_global:setMoney(theTeam, amount) then
						outputChatBox("Set faction '" .. getTeamName(theTeam) .. "'s money to " .. amount .. " $.", thePlayer, 255, 194, 14)
					else
						outputChatBox("Could not set money to that faction.", thePlayer, 255, 194, 14)
					end
				else
					outputChatBox("[!]#FFFFFF Geçersiz Birlik ID.", thePlayer, 255, 0, 0, true)
				end
			else
				outputChatBox("[!]#FFFFFF Geçersiz Birlik ID.", thePlayer, 255, 0, 0, true)
			end
		end
	end
end
addCommandHandler("setfactionmoney", setFactionMoney, false, false)

function getTax(thePlayer)
	loadWelfare()
	outputChatBox("Welfare: $" .. exports.cr_global:formatMoney(unemployedPay), thePlayer, 255, 194, 14)
	outputChatBox("Tax: " .. (exports.cr_global:getTaxAmount(thePlayer) * 100) .. "%", thePlayer, 255, 194, 14)
	outputChatBox("Income Tax: " .. (exports.cr_global:getIncomeTaxAmount(thePlayer) * 100) .. "%", thePlayer, 255, 194, 14)
end
addCommandHandler("gettax", getTax, false, false)

function setFactionBudget(thePlayer, commandName, factionID, amount)
	if getPlayerTeam(thePlayer) == getTeamFromName("Los Santos President") and getElementData(thePlayer, "factionrank") >= 15 then
		local amount = tonumber(amount)
		if not factionID or not amount or amount < 0 then
			outputChatBox("KULLANIM: /" .. commandName .. " [Birlik ID] [Money]", thePlayer, 255, 194, 14)
		else
			factionID = tonumber(factionID)
			if factionID and factionID > 0 then
				local theTeam = exports.cr_pool:getElement("team", factionID)
				amount = tonumber(amount)
				
				if (theTeam) then
					if getElementData(theTeam, "type") >= 2 and getElementData(theTeam, "type") <= 6 then
						if exports.cr_global:takeMoney(getPlayerTeam(thePlayer), amount) then
							exports.cr_global:giveMoney(theTeam, amount)
							outputChatBox("You added $" .. exports.cr_global:formatMoney(amount) .. " to the budget of '" .. getTeamName(theTeam) .. "' (Total: " .. exports.cr_global:getMoney(theTeam) .. ").", thePlayer, 255, 194, 14)
							dbExec(mysql:getConnection(),  "INSERT INTO wiretransfers (`from`, `to`, `amount`, `reason`, `type`) VALUES (" .. -getElementData(getPlayerTeam(thePlayer), "id") .. ", " .. -getElementData(theTeam, "id") .. ", " .. amount .. ", '', 8)")
						else
							outputChatBox("You can't afford this.", thePlayer, 255, 194, 14)
						end
					else
						outputChatBox("You can't set a budget for that faction.", thePlayer, 255, 194, 14)
					end
				else
					outputChatBox("[!]#FFFFFF Geçersiz Birlik ID.", thePlayer, 255, 0, 0, true)
				end
			else
				outputChatBox("[!]#FFFFFF Geçersiz Birlik ID.", thePlayer, 255, 0, 0, true)
			end
		end
	end
end
addCommandHandler("setbudget", setFactionBudget, false, false)

function setTax(thePlayer, commandName, amount)
	if getPlayerTeam(thePlayer) == getTeamFromName("Los Santos President") and getElementData(thePlayer, "factionrank") >= 15 then
		local amount = tonumber(amount)
		if not amount or amount < 0 or amount > 30 then
			outputChatBox("KULLANIM: /" .. commandName .. " [0-30%]", thePlayer, 255, 194, 14)
		else
			exports.cr_global:setTaxAmount(amount)
			outputChatBox("New Tax is " .. amount .. "%", thePlayer, 0, 255, 0)
		end
	end
end
addCommandHandler("settax", setTax, false, false)

function setIncomeTax(thePlayer, commandName, amount)
	if getPlayerTeam(thePlayer) == getTeamFromName("Los Santos President") and getElementData(thePlayer, "factionrank") >= 15 then
		local amount = tonumber(amount)
		if not amount or amount < 0 or amount > 25 then
			outputChatBox("KULLANIM: /" .. commandName .. " [0-25%]", thePlayer, 255, 194, 14)
		else
			exports.cr_global:setIncomeTaxAmount(amount)
			outputChatBox("New Income Tax is " .. amount .. "%", thePlayer, 0, 255, 0)
		end
	end
end
addCommandHandler("setincometax", setIncomeTax, false, false)

function setWelfare(thePlayer, commandName, amount)
	if getPlayerTeam(thePlayer) == getTeamFromName("Los Santos President") and getElementData(thePlayer, "factionrank") >= 15 then
		local amount = tonumber(amount)
		if not amount or amount <= 0 then
			outputChatBox("KULLANIM: /" .. commandName .. " [Money]", thePlayer, 255, 194, 14)
		elseif dbExec(mysql:getConnection(),  "UPDATE settings SET value = " .. unemployedPay .. " WHERE name = 'welfare'") then
			unemployedPay = amount
			outputChatBox("New Welfare is $" .. exports.cr_global:formatMoney(unemployedPay) .. "/payday", thePlayer, 0, 255, 0)
		else
			outputChatBox("Error 129314 - Report on Mantis.", thePlayer, 255, 0, 0)
		end
	end
end
addCommandHandler("setwelfare", setWelfare, false, false)

function issueGovLicense(thePlayer, commandName, type, ...)
	local licenseTypes = {"Business License - Regular", "Business License - Premium", "Adult Entertainment License", "Gambling License", "Liquor License"}
	if getPlayerTeam(thePlayer) == getTeamFromName("Los Santos President") and getElementData(thePlayer, "factionrank") >= 3 then
		local type = tonumber(type)
		if not type or not licenseTypes[type] or not ... then
			outputChatBox("KULLANIM: /" .. commandName .. " [type] [biz name]", thePlayer, 255, 194, 14)
			for k, v in ipairs(licenseTypes) do
			outputChatBox("  " .. k .. ": " .. v, thePlayer, 255, 194, 14)
			end
		else
			local text = licenseTypes[type] .. " - " .. table.concat({...}, " ")
			local success, error = exports.cr_global:giveItem(thePlayer, 80, text)
			if success then
				outputChatBox("Created a " .. text .. ".", thePlayer, 0, 255, 0)
			else
				outputChatBox(error, thePlayer, 255, 0, 0)
			end
		end
	end
end
addCommandHandler("govlicense", issueGovLicense, false, false)

--

function respawnFactionVehicles(thePlayer, commandName, factionID)
	if (exports.cr_integration:isPlayerTrialAdmin(thePlayer)) then
		local factionID = tonumber(factionID)
		if (factionID) and (factionID > 0) then
			local theTeam = exports.cr_pool:getElement("team", factionID)
			if (theTeam) then
				for key, value in ipairs(exports.cr_pool:getPoolElementsByType("vehicle")) do
					local faction = tonumber(getElementData(value, "faction"))
					if (faction == factionID and not getVehicleOccupant(value, 0) and not getVehicleOccupant(value, 1) and not getVehicleOccupant(value, 2) and not getVehicleOccupant(value, 3) and not getVehicleTowingVehicle(value)) then
						respawnVehicle(value)
						setElementInterior(value, getElementData(value, "interior"))
						setElementDimension(value, getElementData(value, "dimension"))
					end
				end
				
				local hiddenAdmin = tonumber(getElementData(thePlayer, "hiddenadmin"))
				local adminTitle = exports.cr_global:getPlayerAdminTitle(thePlayer)
				local username = getPlayerName(thePlayer):gsub("_"," ")
				
				for _, player in ipairs(getPlayersInTeam(theTeam)) do
					outputChatBox(">> Tüm birlik araçları " .. (hiddenAdmin == 0 and adminTitle .. " " .. username or "Gizli Yetkili") .. " tarafından yenilendi.", player, 255, 194, 14)
				end
				
				exports.cr_global:sendMessageToAdmins("[ADM] " .. tostring(adminTitle) .. " " .. username .. " respawned all unoccupied faction vehicles for faction ID " .. factionID .. ".")
				exports.cr_logs:dbLog(thePlayer, 4, theTeam, "FACTION RESPAWN for " .. factionID)
			else
				outputChatBox("Invalid faction ID.", thePlayer, 255, 0, 0, false)
			end
		else
			outputChatBox("KULLANIM: /" .. commandName .. " [Birlik ID]", thePlayer, 255, 194, 14)
		end
	end
end
addCommandHandler("respawnfaction", respawnFactionVehicles, false, false)

-- // Chaos - Script stealers go away, make something for yourself.
function adminDutyStart()
	local result = mysql:query("SELECT id, name FROM factions WHERE type >= 2 ORDER BY id ASC")
	local max = mysql:query("SELECT id FROM duty_allowed ORDER BY id DESC LIMIT 0, 1")
	if result and max then
		dutyAllow = { }
		dutyAllowChanges = { }
		i = 0

		local maxrow = mysql:fetch_assoc(max)
		--maxIndex = tonumber(maxrow.id) or 0
			
		while true do
			local row = mysql:fetch_assoc(result)
			if not row then break end

			table.insert(dutyAllow, { row.id, row.name, { --[[Duty information]] } })
			i = i+1
				
			local result1 = mysql:query("SELECT * FROM duty_allowed WHERE faction=" .. tonumber(row.id))
			if result1 then
				while true do
					local row1 = mysql:fetch_assoc(result1)
					if not row1 then break end

					table.insert(dutyAllow[i][3], { row1.id, tonumber(row1.itemID), row1.itemValue })
				end
			end
		end

		setElementData(resourceRoot, "maxIndex", maxIndex)
		setElementData(resourceRoot, "dutyAllowTable", dutyAllow)
		mysql:free_result(result)
		mysql:free_result(result1)
		mysql:free_result(max)
	else
		outputDebugString("[Factions] ERROR: Duty allow permissions failed.")
	end
end
addEventHandler("onResourceStart", resourceRoot, adminDutyStart)

function getAllowList(factionID)
	local factionID = tonumber(factionID)
	if factionID then
		for k,v in pairs(dutyAllow) do
			if tonumber(v[1]) == factionID then
				key = k
				break
			end
		end
		return dutyAllow[key][3]
	end
end

function adminDuty(thePlayer)
	if (exports.cr_integration:isPlayerLeaderAdmin(thePlayer) or exports.cr_integration:isPlayerScripter(thePlayer)) then
		if not getElementData(resourceRoot, "dutyadmin") and type(dutyAllow) == "table" then
			triggerClientEvent(thePlayer, "adminDutyAllow", resourceRoot, dutyAllow, dutyAllowChanges)
			setElementData(resourceRoot, "dutyadmin", true)
		elseif type(dutyAllow) ~= "table" then
			outputChatBox("There was a issue with the startup caching of this resource. Contact a Scripter.", thePlayer, 255, 0, 0)
		else
			outputChatBox("Oops! Someone is already editing duty permissions. Sorry!", thePlayer, 255, 0, 0) -- No time to set up proper syncing + kinda not needed.
		end
	end
end
addCommandHandler("dutyadmin", adminDuty, false, false)

function saveChanges()
	outputDebugString("[Factions] Duty secenekleri database'ye kaydediliyor...")
	local tick = getTickCount()

	for key,value in pairs(dutyAllowChanges) do
		if value[2] == 0 then -- Delete row
			dbExec(mysql:getConnection(), "DELETE FROM duty_allowed WHERE id=" .. mysql:escape_string(tonumber(value[3])))
		elseif value[2] == 1 then
			dbExec(mysql:getConnection(), "INSERT INTO duty_allowed SET id=" .. mysql:escape_string(tonumber(value[3])) .. ", faction=" .. mysql:escape_string(tonumber(value[1])) .. ", itemID=" .. mysql:escape_string(tonumber(value[4])) .. ", itemValue='" .. mysql:escape_string(value[5]) .. "'")
		end
	end

	outputDebugString("[Factions] " ..  math.floor((getTickCount()-tick)/60)  .. " Saniyede tamamlandi.")
end
addEventHandler("onResourceStop", resourceRoot, saveChanges)

function updateTable(newTable, changesTable)
	dutyAllow = newTable
	dutyAllowChanges = changesTable
	removeElementData(resourceRoot, "dutyadmin")
	setElementData(resourceRoot, "dutyAllowTable", dutyAllow)
end
addEvent("dutyAdmin:Save", true)
addEventHandler("dutyAdmin:Save", resourceRoot, updateTable)


function birlikOnayla(thePlayer, commandName, factionID, onay)
	if (exports.cr_integration:isPlayerLeaderAdmin(thePlayer) or exports.cr_integration:isPlayerScripter(thePlayer)) then
		if not (factionID) or not (onay)  then
			outputChatBox("KULLANIM: /" .. commandName .. " [Birlik ID] [1 / 0]", thePlayer, 255, 194, 14)
		else
			factionID = tonumber(factionID)
			if factionID and factionID > 0 then
				local theTeam = exports.cr_pool:getElement("team", factionID)
				if (theTeam) then
					dbExec(exports.cr_mysql:getConnection(),"UPDATE factions SET onay='" .. tonumber(onay) .. "' WHERE id='" .. factionID .. "'")
					local oldName = getTeamName(theTeam)
					setElementData(theTeam, "birlik_onay", tonumber(onay))
					
					if tonumber(onay) == 1 then
						exports.cr_global:sendMessageToAdmins(exports.cr_global:getPlayerFullIdentity(thePlayer) .. " '" .. oldName .. "' isimli birliği onayladı!")
					elseif tonumber(onay) == 0 then
						exports.cr_global:sendMessageToAdmins(exports.cr_global:getPlayerFullIdentity(thePlayer) .. " '" .. oldName .. "' isimli birliği onayını kaldırdı!")
					end
				else
					outputChatBox("[!]#FFFFFF Geçersiz Birlik ID.", thePlayer, 255, 0, 0, true)
				end
			else
				outputChatBox("[!]#FFFFFF Geçersiz Birlik ID.", thePlayer, 255, 0, 0, true)
			end
		end
	end
end
addCommandHandler("birlikonay", birlikOnayla)

function aracimiBirligeVer(thePlayer, commandName, vehID)
	if vehID then
		local playerID = getElementData(thePlayer, "dbid")
		local vehElement = exports.cr_pool:getElement("vehicle", vehID)
		local vehOwner = getElementData(vehElement, "owner")
		local vehFaction = getElementData(vehElement, "faction")
		if  vehFaction == -1 then
			if vehOwner == playerID then
				local playerBirlik = getElementData(thePlayer, "faction")
				if playerBirlik then
					local elementSet = setElementData(vehElement, "faction", playerBirlik)
					local query = mysql:query("UPDATE vehicles SET faction='" .. playerBirlik .. "' WHERE id='" .. vehID .. "'")
					if elementSet and query then
						exports["cr_items"]:deleteAll(3, vehID)
						outputChatBox("[!]#FFFFFF Aracınız başarıyla birliğe verilmiştir.", thePlayer, 0, 255, 0, true)
					end
				else
					outputChatBox("[!]#FFFFFF Bir birlikte değilsiniz.", thePlayer, 255, 0, 0, true)
				end
			else
				outputChatBox("[!]#FFFFFF Araç size ait değil.", thePlayer, 255, 0, 0, true)
			end
		else
			outputChatBox("[!]#FFFFFF Araç zaten bir birliğe ait.", thePlayer, 255, 0, 0, true)
		end
	else
		outputChatBox("KULLANIM: /" .. commandName .. " [Araç ID]", thePlayer, 255, 194, 14)
	end
end
addCommandHandler("abv", aracimiBirligeVer)

function aracimiBirlikGeriVer(thePlayer, commandName, vehID)
	if vehID then
		local playerID = getElementData(thePlayer, "dbid")
		local vehElement = exports.cr_pool:getElement("vehicle", vehID)
		local vehOwner = getElementData(vehElement, "owner")
		local vehFaction = getElementData(vehElement, "faction")
		local factionLeader = getElementData(thePlayer, "factionleader")
		local playerBirlik = getElementData(thePlayer, "faction")
		if playerBirlik then
			if playerBirlik == vehFaction then
				if factionLeader == 1 then
					local elementSet = setElementData(vehElement, "faction", -1)
					local query = mysql:query("UPDATE vehicles SET faction='-1' WHERE id='" .. vehID .. "'")
					if elementSet and query then
						outputChatBox("[!]#FFFFFF Aracınız başarıyla sahibine geri verilmiştir!", thePlayer, 0, 255, 0, true)
					end
				else
					outputChatBox("[!]#FFFFFF Aracı sahibine geri verebilmek için birlik lideri olmalısınız.", thePlayer, 255, 0, 0, true)
				end
			end
		else
			outputChatBox("[!]#FFFFFF Bir birlikte değilsiniz.", thePlayer, 255, 0, 0, true)
		end
	else
		outputChatBox("KULLANIM: /" .. commandName .. " [Araç ID]", thePlayer, 255, 194, 14)
	end
end
addCommandHandler("abg", aracimiBirlikGeriVer)