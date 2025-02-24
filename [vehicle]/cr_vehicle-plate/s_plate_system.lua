--Warning, not sure who originally made this but it's very noobish and messy. If you're about to modify this, better remake a new one :< / Farid
local mysql = exports.cr_mysql
local serverRegFee = 2000

function getPlateList()
	local allVehicles = getElementsByType("vehicle")
	local vehicleTable = { }
	local playerDBID = getElementData(client,"dbid")
	if not playerDBID then
		return
	end
	for _,vehicleElement in ipairs(exports.cr_pool:getPoolElementsByType("vehicle")) do
		if (getElementData(vehicleElement, "owner")) and (tonumber(getElementData(vehicleElement, "owner")) == tonumber(playerDBID)) and exports['cr_vehicle']:hasVehiclePlates(vehicleElement) then
			local vehicleID = getElementData(vehicleElement, "dbid")
			table.insert(vehicleTable, { vehicleID, vehicleElement })
		end
	end
	triggerClientEvent(client, "vehicle-plate-system:clist", client, vehicleTable)
end
addEvent("vehicle-plate-system:list", true)
addEventHandler("vehicle-plate-system:list", root, getPlateList)

function getRegisterList()
	local allVehicles = getElementsByType("vehicle")
	local vehicleTable = { }
	local playerDBID = getElementData(client,"dbid")
	if not playerDBID then
		return
	end
	for _,vehicleElement in ipairs(exports.cr_pool:getPoolElementsByType("vehicle")) do
		if (getElementData(vehicleElement, "owner")) and (tonumber(getElementData(vehicleElement, "owner")) == tonumber(playerDBID)) and exports['cr_vehicle']:hasVehiclePlates(vehicleElement) then
			local vehicleID = getElementData(vehicleElement, "dbid")
			table.insert(vehicleTable, { vehicleID, vehicleElement })
		end
	end
	triggerClientEvent(client, "vehicle-plate-system:rlist", client, vehicleTable)
end
addEvent("vehicle-plate-system:registerlist", true)
addEventHandler("vehicle-plate-system:registerlist", root, getRegisterList)

function pedTalk(state)
	if (state == 1) then
		--exports.cr_global:sendLocalText(source, "Gabrielle McCoy says: Welcome! Would you be unregistering, registering or changing your vehice plates today?", 255, 255, 255, 10)
		--outputChatBox("The fee is $" ..  exports.cr_global:formatMoney(serverRegFee) .. " per vehicle.", source, 200, 200, 200)
	elseif (state == 2) then
		--exports.cr_global:sendLocalText(source, "Gabrielle McCoy says: Sorry but the fee to register new plates is $" .. exports.cr_global:formatMoney(serverRegFee) .. ". Please come back once you have the money.", 255, 255, 255, 10)
		outputChatBox(source, "You lack of GCs to activate this feature.", 255,0,0)
	elseif (state == 3) then
		--exports.cr_global:sendLocalText(source, "Gabrielle McCoy says: That is great! Lets get everything set up for you in our system.", 255, 255, 255, 10)
	elseif (state == 4) then
		exports.cr_global:sendLocalText(source, "Gabrielle McCoy says: No? Well I hope you change your mind later. Have a nice day!", 255, 255, 255, 10)
	elseif (state == 5) then
		exports.cr_global:sendLocalText(source, " *Gabrielle McCoy begins inputting the information into her computer.", 255, 51, 102)
		exports.cr_global:sendLocalText(source, "Gabrielle McCoy says: Alright, you should be good to go. Have a nice day!", 255, 255, 255, 10)
	elseif (state == 6) then
		exports.cr_global:sendLocalText(source, "Gabrielle McCoy says: Hmmm. According to our records, that is already a registered license plate.", 255, 255, 255, 10)
	elseif (state == 7) then
		exports.cr_global:sendLocalText(source, "Gabrielle McCoy says: Well, I'm sorry but your vehicle doesn't require a registered plate or papers.", 255, 255, 255, 10)
	elseif (state == 8) then
		exports.cr_global:sendLocalText(source, "Gabrielle McCoy says: I'm sorry but are you the owner of this vehicle on papers?", 255, 255, 255, 10)
	end
end
addEvent("platePedTalk", true)
addEventHandler("platePedTalk", root, pedTalk)

function setNewInfo(data, car)
	if not (data) or not (car) then
		outputChatBox("Internal Error", source, 255,0,0)
		return false
	end

	local tvehicle = exports.cr_pool:getElement("vehicle", car)
	if not exports['cr_vehicle']:hasVehiclePlates(tvehicle) then
		triggerEvent("platePedTalk", source, 7)
		return false
	end

	if getElementData(source, "dbid") ~= getElementData(tvehicle, "owner") then
		triggerEvent("platePedTalk", source, 8)
		return false
	end

	local cquery = mysql:query_fetch_assoc("SELECT COUNT(*) as no FROM `vehicles` WHERE `plate`='" ..  mysql:escape_string(data) .. "'")
	if (tonumber(cquery["no"]) > 0) then
		triggerEvent("platePedTalk", source, 6)
		return false
	end

	local accountID = getElementData(source, "account:id")
	local credits = mysql:query_fetch_assoc("SELECT `credits` FROM `accounts` WHERE `id`='" ..  mysql:escape_string(accountID) .. "'")
	credits = tonumber(credits["credits"])
	if credits < 2 then
		triggerEvent("platePedTalk", source, 2)
		return false
	end

	mysql:query_free("UPDATE `accounts` SET `credits`=`credits`-2 WHERE `id`='" .. accountID .. "' ")
	mysql:query_free("UPDATE `vehicles` SET `plate`='" .. mysql:escape_string(data) .. "' WHERE `id` = '" .. mysql:escape_string(car) .. "'")

	setElementData(tvehicle, "plate", data, true)
	--setElementData(tvehicle, "show_plate", 1, true)
	setVehiclePlateText(tvehicle, data)

	triggerEvent("platePedTalk", source, 5)
end
addEvent("sNewPlates", true)
addEventHandler("sNewPlates", root, setNewInfo)

function setNewReg(car)
	if not (car) then
		return false
	end

	local tvehicle = exports.cr_pool:getElement("vehicle", car)
	if getElementData(source, "dbid") ~= getElementData(tvehicle, "owner") then
		triggerEvent("platePedTalk", source, 8)
		return false
	end
	
	if not exports['cr_vehicle']:hasVehiclePlates(tvehicle) then
		triggerEvent("platePedTalk", source, 7)
		return false
	end

	if getElementData(tvehicle, "registered") == 0 then
		data = 1
	else
		data = 0
	end

	if not exports.cr_global:takeMoney(source, data == 1 and 175 or 50) then
		exports.cr_global:sendLocalText(source, "Gabrielle McCoy says: Could I have $" .. (data == 1 and 175 or 50) .. " please?", 255, 255, 255, 10)
	end

	setElementData(tvehicle, "registered", data, true)
	mysql:query_free("UPDATE vehicles SET registered='" .. (data) .. "' WHERE id = '" .. mysql:escape_string(car) .. "'")
	triggerEvent("platePedTalk", source, 5)
end
addEvent("sNewReg", true)
addEventHandler("sNewReg", root, setNewReg)

function givePaperToSellVehicle(thePlayer)
	source = thePlayer
	exports.cr_global:takeMoney(thePlayer, 100)
	exports.cr_global:giveItem(thePlayer, 173, 1)
end
addEvent("givePaperToSellVehicle", true)
addEventHandler("givePaperToSellVehicle", getResourceRootElement(), givePaperToSellVehicle)