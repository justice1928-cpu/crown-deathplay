function editVehicle(thePlayer, commandName)
	if exports.cr_integration:isPlayerGeneralAdmin(thePlayer) then
		local theVehicle = getPedOccupiedVehicle(thePlayer) or false
		if not theVehicle then
			outputChatBox("You must be in a vehicle.", thePlayer, 255, 194, 14)
			return false
		end
		
		local vehID = getElementData(theVehicle, "dbid") or false
		if not vehID or vehID < 0 then	
			outputChatBox("This vehicle can not have custom properties.", thePlayer, 255, 194, 14)
			return false
		end
		
		local veh = {}
		local row = mysql:query_fetch_assoc("SELECT * FROM `vehicles_custom` WHERE `id` = '" .. mysql:escape_string(vehID) .. "' LIMIT 1") or false
		if row then
			veh.id = row.id
			veh.brand = row.brand
			veh.model = row.model
			veh.price = row.price
			veh.tax = row.tax
			veh.handling = row.handling
			veh.notes = row.notes
			veh.doortype = getRealDoorType(row.doortype)
		end
		triggerClientEvent(thePlayer, "vehlib:handling:editVehicle", thePlayer, row)
		
		--exports["cr_vehicle"]:reloadVehicle(tonumber(vehID))
		exports.cr_logs:dbLog(thePlayer, 4, { theVehicle, thePlayer }, commandName)
		return true
	end
end
addCommandHandler("editvehicle", editVehicle)
addCommandHandler("editveh", editVehicle)

function createUniqueVehicle(data, existed)
	if not data then
		outputDebugString("VEHICLE MANAGER / createUniqueVehicle / NO DATA RECIEVED FROM CLIENT")
		return false
	end

	data.doortype = getRealDoorType(data.doortype) or 'NULL'
	
	local vehicle = exports.cr_pool:getElement("vehicle", tonumber(data.id))
	local forumText = [=[
[B]General Information[/B]:
[INDENT]Vehicle ID:   [B]]=] ..tostring(data.id) ..[=[[/B][/INDENT]
[INDENT]Current Owner:   [B]]=] ..tostring(getVehicleOwner(vehicle)) ..[=[[/B][/INDENT]
[INDENT]Edited by:   [B]]=] ..tostring(getElementData(client, "account:username")) ..[=[[/B][/INDENT]
[INDENT]Note:   [B]]=] ..tostring(data.note) ..[=[[/B][/INDENT]
[B]New Vehicle Data[/B]:
[INDENT]Brand:   [B]]=] ..tostring(data.brand) ..[=[[/B][/INDENT]
[INDENT]Model:   [B]]=] ..tostring(data.model) ..[=[[/B][/INDENT]
[INDENT]Year:    [B]]=] ..tostring(data.year) ..[=[[/B][/INDENT]
[INDENT]Price:   [B]]=] ..tostring(data.price) ..[=[[/B][/INDENT]
[INDENT]Tax:     [B]]=] ..tostring(data.tax) ..[=[[/B][/INDENT]
[INDENT]Door Type: [B]]=] ..tostring(data.doortype) ..[=[[/B][/INDENT]
[B]Old Vehicle Data[/B]:
[INDENT]Brand:   [B]]=] ..tostring(getElementData(vehicle, "brand")) ..[=[[/B][/INDENT]
[INDENT]Model:   [B]]=] ..tostring(getElementData(vehicle, "maximemodel")) ..[=[[/B][/INDENT]
[INDENT]Year:    [B]]=] ..tostring(getElementData(vehicle, "year")) ..[=[[/B][/INDENT]
[INDENT]Price:   [B]]=] ..tostring(getElementData(vehicle, "carshop:cost")) ..[=[[/B][/INDENT]
[INDENT]Tax:     [B]]=] ..tostring(getElementData(vehicle, "carshop:taxcost")) ..[=[[/B][/INDENT]
[INDENT]Door Type: [B]]=] ..tostring(getElementData(vehicle, "vDoorType") or 'NULL') ..[=[[/B][/INDENT]]=]

	if not existed then
		--outputDebugString(data.id)
		local mQuery1 = mysql:query_insert_free("INSERT INTO `vehicles_custom` SET `id`='" .. toSQL(data["id"]) .. "', `brand`='" .. toSQL(data["brand"]) .. "', `model`='" .. toSQL(data["model"]) .. "', `year`='" .. toSQL(data["year"]) .. "', `price`='" .. toSQL(data["price"]) .. "', `tax`='" .. toSQL(data["tax"]) .. "', `createdby`='" .. toSQL(getElementData(client, "account:id")) .. "', `notes`='" .. toSQL(data["note"]) .. "', `doortype` = " .. data.doortype)
		if not mQuery1 then
			outputDebugString("VEHICLE MANAGER / VEHICLE LIB / createUniqueVehicle / DATABASE ERROR")
			outputChatBox("[VEHICLE MANAGER] Failed to create unique vehicle.", client, 255,0,0)
			return false
		end
		outputChatBox("[VEHICLE MANAGER] Unique vehicle created.", client, 0,255,0)
		exports.cr_logs:dbLog(client, 6, { client }, " Created unique vehicle #" .. data.id .. ".")
		exports.cr_global:sendMessageToAdmins("[VEHICLE-MANAGER]: " .. getElementData(client, "account:username") .. " has created new unique vehicle #" .. data.id .. ".")
		exports["cr_vehicle"]:reloadVehicle(tonumber(data.id))
		local topicLink = createForumThread(getElementData(client, "account:username") .. " created unique vehicle #" .. data.id, forumText)
		addVehicleLogs(tonumber(data.id), 'editveh: ' .. topicLink, client)
		return true
	else
		local mQuery1 = mysql:query_free("UPDATE `vehicles_custom` SET `brand`='" .. toSQL(data["brand"]) .. "', `model`='" .. toSQL(data["model"]) .. "', `year`='" .. toSQL(data["year"]) .. "', `price`='" .. toSQL(data["price"]) .. "', `tax`='" .. toSQL(data["tax"]) .. "', `updatedby`='" .. toSQL(getElementData(client, "account:id")) .. "', `notes`='" .. toSQL(data["note"]) .. "', `updatedate`=NOW(), `doortype` = " .. data.doortype .. "  WHERE `id`='" .. toSQL(data["id"]) .. "' ")
		if not mQuery1 then
			outputDebugString("VEHICLE MANAGER / VEHICLE LIB / createUniqueVehicle / DATABASE ERROR")
			outputChatBox("[VEHICLE MANAGER] Update unique vehicle #" .. data.id .. " failed.", client, 255,0,0)
			return false
		end
		
		outputChatBox("[VEHICLE MANAGER] You have updated unique vehicle #" .. data.id .. ".", client, 0,255,0)
		exports.cr_logs:dbLog(client, 6, { client }, " Updated unique vehicle #" .. data.id .. ".")
		exports.cr_global:sendMessageToAdmins("[VEHICLE-MANAGER]: " .. getElementData(client, "account:username") .. " has updated unique vehicle #" .. data.id .. ".")
		exports["cr_vehicle"]:reloadVehicle(tonumber(data.id))
		local topicLink = createForumThread(getElementData(client, "account:username") .. " updated unique vehicle #" .. data.id, forumText)
		addVehicleLogs(tonumber(data.id), 'editveh: ' .. topicLink, client)
		return true
	end
end
addEvent("vehlib:handling:createUniqueVehicle", true)
addEventHandler("vehlib:handling:createUniqueVehicle", root, createUniqueVehicle)

function resetUniqueVehicle(vehID)
	if not vehID or not tonumber(vehID) then
		outputDebugString("VEHICLE MANAGER / resetUniqueVehicle / NO DATA RECIEVED FROM CLIENT")
		return false
	end
	
	local mQuery1 = mysql:query_free("DELETE FROM `vehicles_custom` WHERE `id`='" .. toSQL(vehID) .. "' ")
	if not mQuery1 then
		outputDebugString("VEHICLE MANAGER / VEHICLE LIB / resetUniqueVehicle / DATABASE ERROR")
		outputChatBox("[VEHICLE MANAGER] Remove unique vehicle #" .. vehID .. " failed.", client, 255,0,0)
		return false
	end
	outputChatBox("[VEHICLE MANAGER] You have removed unique vehicle #" .. vehID .. ".", client, 0,255,0)
	exports.cr_logs:dbLog(client, 6, { client }, " Removed unique vehicle #" .. vehID .. ".")
	exports.cr_global:sendMessageToAdmins("[VEHICLE-MANAGER]: " .. getElementData(client, "account:username") .. " has removed unique vehicle #" .. vehID .. ".")
	exports["cr_vehicle"]:reloadVehicle(tonumber(vehID))

	local vehicle = exports.cr_pool:getElement("vehicle", tonumber(vehID))
	local forumText = [=[
		[INDENT]Vehicle ID:   [B]]=] ..tostring(vehID) ..[=[[/B][/INDENT]
		[INDENT]Current Owner:   [B]]=] ..tostring(getVehicleOwner(vehicle)) ..[=[[/B][/INDENT]
		[INDENT]Edited by:   [B]]=] ..tostring(getElementData(client, "account:username")) ..[=[[/B][/INDENT]]=]
	local topicLink = createForumThread(getElementData(client, "account:username") .. " reset unique vehicle #" .. vehID, forumText)
	addVehicleLogs(tonumber(vehID), 'editveh reset: ' .. topicLink, client)
	return true
end
addEvent("vehlib:handling:resetUniqueVehicle", true)
addEventHandler("vehlib:handling:resetUniqueVehicle", root, resetUniqueVehicle)

---HANDLINGS
function openUniqueHandling(vehdbid, existed)
	if exports.cr_integration:isPlayerVehicleConsultant(client) or exports.cr_integration:isPlayerSeniorAdmin(client) then
		local theVehicle = getPedOccupiedVehicle(client) or false
		if not theVehicle then
			outputChatBox("You must be in a vehicle.", client, 255, 194, 14)
			return false
		end
		
		local vehID = getElementData(theVehicle, "dbid") or false
		if not vehID or vehID < 0 then	
			outputChatBox("This vehicle can not have custom properties.", client, 255, 194, 14)
			return false
		end
		
		if existed then
			local row = mysql:query_fetch_assoc("SELECT `handling` FROM `vehicles_custom` WHERE `id` = '" .. mysql:escape_string(vehdbid) .. "' LIMIT 1") or false
			if not row then
				outputChatBox("[VEHICLE-MANAGER] Failed to retrieve current handlings from SQL.", client, 255, 194, 14)
				outputDebugString("VEHICLE MANAGER / openUniqueHandling / DATABASE ERROR")
				return false
			end
			triggerClientEvent(client, "veh-manager:handling:edithandling", client, 1)
		else
			triggerClientEvent(client, "veh-manager:handling:edithandling", client, 1)
		end
		
		return true
	end
end
addEvent("vehlib:handling:openUniqueHandling", true)
addEventHandler("vehlib:handling:openUniqueHandling", root, openUniqueHandling)
