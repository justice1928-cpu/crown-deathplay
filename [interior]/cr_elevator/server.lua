local timerLoadAllElevators = 30000

mysql = exports.cr_mysql

addEvent("onPlayerInteriorChange", true)

INTERIOR_X = 1
INTERIOR_Y = 2
INTERIOR_Z = 3
INTERIOR_INT = 4
INTERIOR_DIM = 5
INTERIOR_ANGLE = 6
INTERIOR_FEE = 7

INTERIOR_TYPE = 1
INTERIOR_DISABLED = 2
INTERIOR_LOCKED = 3
INTERIOR_OWNER = 4
INTERIOR_COST = 5
INTERIOR_SUPPLIES = 6

-- Small hack
function setElementDataEx(source, field, parameter, streamtoall, streamatall)
	setElementData(source, field, parameter)
end
-- End small hack


function createElevator(thePlayer, commandName, oneway)
	if (exports.cr_integration:isPlayerDeveloper(thePlayer) or exports.cr_integration:isPlayerLeaderAdmin(thePlayer) or exports.cr_integration:isPlayerSeniorAdmin(thePlayer)) then
		if not getElementData(thePlayer, "adm:addelevator") then
			local x, y, z = getElementPosition(thePlayer)
			local rx, ry, rz = getElementRotation(thePlayer)
			local dim = getElementDimension(thePlayer)
			local int = getElementInterior(thePlayer)
			setElementData(thePlayer, "adm:addelevator", {x, y , z, rz, int, dim})
			outputChatBox("[ADDELEVATOR] Source point saved. Please /" .. commandName .. " once again at destination point.", thePlayer, 0, 255, 0)
			return false
		end

		local sourceP = getElementData(thePlayer, "adm:addelevator")

		local x1, y1, z1 = getElementPosition(thePlayer)
		local rx1, ry1, rz1 = getElementRotation(thePlayer)
		local interiorwithin = getElementInterior(thePlayer)
		local dimensionwithin = getElementDimension(thePlayer)
		local ix = tonumber(ix)
		local iy = tonumber(iy)
		local iz = tonumber(iz)
		local id = SmallestElevatorID()
		if id then
			if oneway then
				if(oneway == "1") then
					oneway = "1"
				else
					oneway = "0"
				end
			else
				oneway = "0"
			end
			local query = dbExec(mysql:getConnection(),"INSERT INTO elevators SET id='" .. (id) .. "', x='" .. (x1) .. "', y='" .. (y1) .. "', z='" .. (z1) .. "', tpx='" .. (sourceP[1]) .. "', tpy='" .. (sourceP[2]) .. "', tpz='" .. (sourceP[3]) .. "', dimensionwithin='" .. (dimensionwithin) .. "', interiorwithin='" .. (interiorwithin) .. "', dimension='" .. (sourceP[6]) .. "', interior='" .. (sourceP[5]) .. "',  rot='" .. (rz1) .. "',  tprot='" .. (sourceP[4]) .. "',  oneway=" .. (oneway) .. " ")
			if (query) then
				--reloadOneElevator(id, true)
				loadOneElevator(id)
				outputChatBox("[ADDELEVATOR] Elevator and elevator remote created with ID #" .. id .. ". Check your inventory!", thePlayer, 0, 255, 0)
				exports.cr_global:giveItem(thePlayer, 73, id)
				removeElementData(thePlayer, "adm:addelevator")
			end
		else
			outputChatBox("[ADDELEVATOR] There was an error while creating an elevator. Try again.", thePlayer, 255, 0, 0)
		end
	end
end
addCommandHandler("addelevator", createElevator, false, false)
addCommandHandler("adde", createElevator, false, false)

function createElevatorWithFriend(thePlayer, commandName, targetPlayer)
	if (exports.cr_integration:isPlayerDeveloper(thePlayer) or exports.cr_integration:isPlayerLeaderAdmin(thePlayer) or exports.cr_integration:isPlayerSeniorAdmin(thePlayer)) then
		if not (targetPlayer) then
			outputChatBox("KULLANIM: /" .. commandName .. " [Target Partial Nick or ID]", thePlayer, 255, 194, 14)
		else
			local targetPlayer, tragetPlayerName = exports.cr_global:findPlayerByPartialNick(thePlayer, targetPlayer)
			local x, y, z = getElementPosition(thePlayer)
			local interiorwithin = getElementInterior(thePlayer)
			local dimensionwithin = getElementDimension(thePlayer)
			local ix, iy, iz = getElementPosition(targetPlayer)
			local interior = getElementInterior(targetPlayer)
			local dimension = getElementDimension(targetPlayer)
			local rx1, ry1, rz1 = getElementPosition(thePlayer)
			local rx2, ry2, rz2 = getElementPosition(targetPlayer)
			local id = SmallestElevatorID()
			if id then
				local query = dbExec(mysql:getConnection(),"INSERT INTO elevators SET id='" .. (id) .. "', x='" .. (x) .. "', y='" .. (y) .. "', z='" .. (z) .. "', tpx='" .. (ix) .. "', tpy='" .. (iy) .. "', tpz='" .. (iz) .. "', dimensionwithin='" .. (dimensionwithin) .. "', interiorwithin='" .. (interiorwithin) .. "', dimension='" .. (dimension) .. "', interior='" .. (interior) .. "', rot='" .. (rz1) .. "', tprot='" .. (rz2) .. "' ")
				if (query) then
					loadOneElevator(id)
					outputChatBox("Elevator created with ID #" .. id .. "!", thePlayer, 0, 255, 0)
					outputChatBox(getPlayerName(thePlayer):gsub("_"," ") .. " created an elevator with an ID of " .. id .. "!", targetPlayer, 0, 255, 0)
				end
			else
				outputChatBox("There was an error while creating an elevator. Try again.", thePlayer, 255, 0, 0)
			end
		end
	end
end
addCommandHandler("aelevator", createElevatorWithFriend, false, false)
addCommandHandler("adde2", createElevatorWithFriend, false, false)

function getOposite(rot)
	if not rot or not tonumber(rot) then
		return 0
	end
	rot = tonumber(rot)
	if rot > 180 then
		return rot - 180
	else
		return rot + 180
	end
end

function findElevator(elevatorID)
	elevatorID = tonumber(elevatorID)
	if elevatorID > 0 then
		local possibleInteriors = getElementsByType("elevator")
		for _, elevator in ipairs(possibleInteriors) do
			local eleID = getElementData(elevator, "dbid")
			if eleID == elevatorID then
				local elevatorEntrance = getElementData(elevator, "entrance")
				local elevatorExit = getElementData(elevator, "exit")
				local elevatorStatus = getElementData(elevator, "status")

				return elevatorID, elevatorEntrance, elevatorExit, elevatorStatus, elevator
			end
		end
	end
	return 0
end

function findElevatorElement(elevatorID)
	elevatorID = tonumber(elevatorID)
	if elevatorID > 0 then
		local possibleInteriors = getElementsByType("elevator")
		for _, elevator in ipairs(possibleInteriors) do
			local eleID = getElementData(elevator, "dbid")
			if eleID == elevatorID then
				return  elevator
			end
		end
	end
	return false
end

function reloadOneElevator(elevatorID, skipcheck)
	local dbid, entrance, exit, status, elevatorElement = findElevator(elevatorID)
	if (dbid > 0 or skipcheck)then
		local realElevatorElement = findElevatorElement(dbid)
		if not realElevatorElement then
			outputDebugString("[reloadOneElevator] Can't find element")
		end
		triggerClientEvent(root, "deleteInteriorElement", realElevatorElement, tonumber(dbid))
		destroyElement(realElevatorElement)
		loadOneElevator(tonumber(dbid), false)
	else
		outputDebugString("Tried to reload elevator without ID.")
	end
end

local loadedElevators = 0
local initializeSoFarDetector = 0
local stats_numberOfElevators = 0
local timerDelay = 0
function loadOneElevator(elevatorID, massLoad)

	thread:query("SELECT rot, tprot, id, x, y, z, tpx, tpy, tpz, dimensionwithin, interiorwithin, dimension, interior, car, disabled, oneway FROM `elevators` WHERE id = " .. elevatorID,
		function(res, rows, err)
			for index, row in ipairs(res) do
				for k, v in pairs(row) do
					if v == null then
						row[k] = nil
					else
						row[k] = tonumber(v) or v
					end
				end

				local elevatorElement = createElement("elevator", "ele" .. tostring(row.id))
				setElementDataEx(elevatorElement, "dbid", 	row.id, true)

				--												X				Y				Z				Interior				Dimension				Angle	Entree fee
				setElementDataEx(elevatorElement, "entrance", {	row.x, 			row.y, 			row.z, 			row.interiorwithin,		row.dimensionwithin,
				row.rot,		0	},	true	)
				setElementDataEx(elevatorElement, "exit", 	  {	row.tpx, 		row.tpy, 		row.tpz, 		row.interior, 			row.dimension,			row.tprot,		0 	}, 	true	)

				--												Type 		Is diabled?
				setElementDataEx(elevatorElement, "status",  {	row.car,	row.disabled == 1 } 	, true	)
				setElementDataEx(elevatorElement, "name", 	 	row.name, true	)
				setElementDataEx(elevatorElement, "oneway", 	row.oneway == 1 or false, true)

				if massLoad then
					loadedElevators = loadedElevators + 1
					local newInitializeSoFarDetector = math.ceil(loadedElevators/(stats_numberOfElevators/100))
					if loadedElevators == 1 or loadedElevators == stats_numberOfElevators or initializeSoFarDetector ~= newInitializeSoFarDetector then
						triggerClientEvent(root, "elevator:initializeSoFar", root, loadedElevators, stats_numberOfElevators)
						initializeSoFarDetector = newInitializeSoFarDetector
					end
				else
					triggerClientEvent(root, "interior:schedulePickupLoading", root, elevatorElement)
				end
				exports.cr_pool:allocateElement(elevatorElement, tonumber(row.id), true)
			end
		end
	)
	return true
end

function loadAllElevators(res)
	triggerClientEvent(root, "interior:clearElevators", root)
	dbQuery(
		function(qh)
			local res, rows = dbPoll(qh, 0)
			if rows > 0 then
				for index, row in ipairs(res) do
					loadOneElevator(row.id)
				end
			end
		end,
	mysql:getConnection(), "SELECT id FROM elevators")
end
setTimer(loadAllElevators,timerLoadAllElevators, 1)

--addEventHandler("onResourceStart", getResourceRootElement(), loadAllElevators)

--[[function resumeCo()
	for _, value in ipairs(threads) do
		coroutine.resume(value)
	end
end]]

function isInteriorLocked(dimension)
    local data = {}
    local result = (
        dimension and (
            dbQuery(function(qh)
                    local res, rows, _ = dbPoll(
                        qh,
                        0
                   )

                    if rows > 0 then
                        data = res
                    end
                end
            , mysql:getConnection(), 'SELECT type, locked FROM interiors WHERE id = ?', dimension)
       )
   )
end


--Alern'S NEW  MELTHOD
local elevatorTimer = {}
function enterElevator(goingin)
	local pickup = source
	local player = client

	if getElementType(pickup) ~= "elevator" then
		return false
	end

	local elevatorStatus = getElementData(pickup, "status")
	if elevatorStatus[INTERIOR_TYPE] == 3 then
		outputChatBox("You try the door handle, but it seems to be locked.", player, 255, 0,0, true)
		return false
	end

	vehicle = getPedOccupiedVehicle(player)
	if ((vehicle and elevatorStatus[INTERIOR_TYPE]  ~= 0 and getVehicleOccupant(vehicle) == player) or not vehicle) then
		if not vehicle and elevatorStatus[INTERIOR_TYPE]  == 2 then
			outputChatBox("This entrance is for vehicles only.", player, 255, 0, 0)
			return false
		end
	end

		if elevatorStatus[INTERIOR_DISABLED] then
			outputChatBox("This interior is currently disabled.", player, 255, 0, 0)
			return false
		end

		local currentCP = nil
		local otherCP = nil
		if goingin then
			currentCP = getElementData(pickup, "entrance")
			otherCP = getElementData(pickup, "exit")
		else
			currentCP = getElementData(pickup, "exit")
			otherCP = getElementData(pickup, "entrance")
		end

		local locked = false
		local movingInSameInt = false
		if currentCP[INTERIOR_DIM] == 0 and otherCP[INTERIOR_DIM] ~= 0 then -- entering a house
			locked = isInteriorLocked(otherCP[INTERIOR_DIM])
		elseif currentCP[INTERIOR_DIM] ~= 0 and otherCP[INTERIOR_DIM] == 0 then -- leaving a house
			locked = isInteriorLocked(currentCP[INTERIOR_DIM])
		elseif currentCP[INTERIOR_DIM] ~= 0 and otherCP[INTERIOR_DIM] ~= 0 and currentCP[INTERIOR_DIM] ~= otherCP[INTERIOR_DIM] then -- changing between two houses
			locked = isInteriorLocked(currentCP[INTERIOR_DIM]) or isInteriorLocked(otherCP[INTERIOR_DIM])
		else -- Moving in the same dimension
			locked = false
			movingInSameInt = true
		end

		local oneway = getElementData(pickup, "oneway")
		if oneway then
			if goingin then
				outputChatBox("It seems as if this door can only be opened from the other side.", player, 255, 0,0, true)
				return false
			end
		end

		if locked then
			outputChatBox("You try the door handle, but it seems to be locked.", player, 255, 0,0, true)
			return false
		end

		local dbid, entrance, exit, interiorType, interiorElement  = call(getResourceFromName("cr_interior"), "findProperty", player, otherCP[INTERIOR_DIM])
		if dbid > 0 then

		else
			dbid, entrance, exit, interiorType, interiorElement  = call(getResourceFromName("cr_interior"), "findProperty", player, currentCP[INTERIOR_DIM])
		end

		if vehicle then
			setTimer(warpVehicleIntoInteriorfunction, 500, 1, vehicle, otherCP[INTERIOR_INT], otherCP[INTERIOR_DIM], 2, otherCP[INTERIOR_X],otherCP[INTERIOR_Y],otherCP[INTERIOR_Z],currentCP,otherCP, interiorElement,movingInSameInt)
			if interiorElement and isElement(interiorElement) and getElementType(interiorElement) == "interior" then
				setElementData(interiorElement, "lastused", exports.cr_datetime:now(), true)
				dbExec(mysql:getConnection(),"UPDATE interiors SET lastused=NOW() WHERE id=" .. dbid)
				exports.cr_logs:dbLog("SYSTEM", 31, { interiorElement, player, vehicle } , "ENTERED/EXITED")
				exports["cr_interior-manager"]:addInteriorLogs(dbid, "ENTERED/EXITED", player)
			end
		elseif isElement(player) then
			if movingInSameInt then
				setElementPosition(player, otherCP[INTERIOR_X],otherCP[INTERIOR_Y],otherCP[INTERIOR_Z], true)
			else
				exports["cr_interior"]:setPlayerInsideInterior(interiorElement, player, otherCP,movingInSameInt)
			end
			return true
		else
			outputChatBox("This elevator is locked.", player, 255, 0,0, true)
			return false
		end

	return false
end
addEvent("elevator:enter", true)
addEventHandler("elevator:enter", root, enterElevator)


function warpVehicleIntoInteriorfunction(vehicle, interior, dimension, offset, x,y,z,pickup,other, interiorElement,movingInSameInt)
	if isElement(vehicle) then
		if elevatorTimer[vehicle] then
			return false
		end

		elevatorTimer[vehicle] = true

		setElementFrozen(vehicle, true)
		setElementVelocity(vehicle, 0, 0, 0)
		setElementAngularVelocity(vehicle, 0, 0, 0)

		local offset = getElementData(vehicle, "groundoffset") or 2
		local rx, ry, rz = getVehicleRotation(vehicle)

		setVehicleRotation(vehicle, 0, 0, rz)
		setElementPosition(vehicle, x, y, z - 1 + offset)
		setElementInterior(vehicle, interior)
		setElementDimension(vehicle, dimension)
		setElementRotation(vehicle, 0, 0, getOposite(other[INTERIOR_ANGLE]))

		setElementData(vehicle, "health", getElementHealth(vehicle), false)
		for i = 0, getVehicleMaxPassengers(vehicle) do
			local player = getVehicleOccupant(vehicle, i)
			if player then
				triggerClientEvent(player, "CantFallOffBike", player)
				setElementDimension(player, dimension)
				setElementInterior(player, interior)
				setCameraInterior(player, interior)
				triggerClientEvent(player, "setPlayerInsideInterior", interiorElement, other, interiorElement)
			end
		end

		setTimer(function()
			setElementAngularVelocity(vehicle, 0, 0, 0)
			setElementHealth(vehicle, getElementData(vehicle, "health") or 1000)
			setElementData(vehicle, "health", nil)
			setElementFrozen(vehicle, false)
			elevatorTimer[vehicle] = false
		end, 1000, 1)
	end
end

function fadeToBlack(player)
	fadeCamera (player, true, 0, 0, 0, 0)
	fadeCamera (player, false, 1, 0, 0, 0)
end

function fadeFromBlack(player)
	setTimer(fadeCamera, 2000, 1, player, true, 1, 0, 0, 0)
end

function deleteElevator(thePlayer, commandName, id)
	if (exports.cr_integration:isPlayerDeveloper(thePlayer) or exports.cr_integration:isPlayerLeaderAdmin(thePlayer) or exports.cr_integration:isPlayerSeniorAdmin(thePlayer)) then
		if not (tonumber(id)) then
			outputChatBox("KULLANIM: /" .. commandName .. " [ID]", thePlayer, 255, 194, 14)
		else
			id = tonumber(id)

			local dbid, entrance, exit, status, elevatorElement = findElevator(id)

			if elevatorElement then
				local query = dbExec(mysql:getConnection(),"DELETE FROM elevators WHERE id='" .. (dbid) .. "'")
				if query then
					reloadOneElevator(dbid)
					if commandName ~= "PROPERTYCLEANUP" then
						outputChatBox("Elevator #" .. id .. " Deleted!", thePlayer, 0, 255, 0)
					end
				else
					if commandName ~= "PROPERTYCLEANUP" then
						outputChatBox("ELE0015 Error, please report to a scripter.", thePlayer, 255, 0, 0)
					end
				end
			else
				if commandName ~= "PROPERTYCLEANUP" then
					outputChatBox("Elevator ID does not exist!", thePlayer, 255, 0, 0)
				end
			end
		end
	end
end
addCommandHandler("delelevator", deleteElevator, false, false)
addCommandHandler("dele", deleteElevator, false, false)

function getNearbyElevators(thePlayer, commandName)
		if (exports.cr_integration:isPlayerDeveloper(thePlayer) or exports.cr_integration:isPlayerLeaderAdmin(thePlayer) or exports.cr_integration:isPlayerSeniorAdmin(thePlayer)) then
		local posX, posY, posZ = getElementPosition(thePlayer)
		local dimension = getElementDimension(thePlayer)
		outputChatBox("Nearby Elevators:", thePlayer, 255, 126, 0)
		local found = false

		local possibleElevators = getElementsByType("elevator")
		for _, elevator in ipairs(possibleElevators) do
			local elevatorEntrance = getElementData(elevator, "entrance")
			local elevatorExit = getElementData(elevator, "exit")

			for _, point in ipairs({ elevatorEntrance, elevatorExit }) do
				if (point[INTERIOR_DIM] == dimension) then
					local distance = getDistanceBetweenPoints3D(posX, posY, posZ, point[INTERIOR_X], point[INTERIOR_Y], point[INTERIOR_Z])
					if (distance <= 11) then
						local dbid = getElementData(elevator, "dbid")
						if point == elevatorEntrance then
							outputChatBox(" ID " .. dbid  .. ", leading to dimension " .. elevatorExit[INTERIOR_DIM], thePlayer, 255, 126, 0)
						else
							outputChatBox(" ID " .. dbid  .. ", leading to dimension " .. elevatorEntrance[INTERIOR_DIM], thePlayer, 255, 126, 0)
						end

						found = true
					end
				end
			end
		end

		if not found then
			outputChatBox("   None.", thePlayer, 255, 126, 0)
		end
	end
end
addCommandHandler("nearbyelevators", getNearbyElevators, false, false)
addCommandHandler("nearbye", getNearbyElevators, false, false)

--TEMP FIX ELEVATOR FOR PLAYERS / Farid
function fixNearbyElevator(thePlayer)
	local posX, posY, posZ = getElementPosition(thePlayer)
	local dimension = getElementDimension(thePlayer)
	outputChatBox("Fixing Nearby Elevators:", thePlayer, 255, 126, 0)
	local found = false
	local possibleElevators = getElementsByType("elevator")
	for _, elevator in ipairs(possibleElevators) do
		local elevatorEntrance = getElementData(elevator, "entrance")
		local elevatorExit = getElementData(elevator, "exit")
		elevator = elevator

		for _, point in ipairs({ elevatorEntrance, elevatorExit }) do
			if (point[INTERIOR_DIM] == dimension) then
				local distance = getDistanceBetweenPoints3D(posX, posY, posZ, point[INTERIOR_X], point[INTERIOR_Y], point[INTERIOR_Z])
				if (distance <= 11) then
					local dbid = getElementData(elevator, "dbid")
					if point == elevatorEntrance then
						reloadOneElevator(dbid)
						outputChatBox(" Fixed elevator ID " .. dbid  .. ", leading to int ID #" .. elevatorExit[INTERIOR_DIM], thePlayer, 255, 126, 0)
					else
						reloadOneElevator(dbid)
						outputChatBox(" Fixed elevator ID " .. dbid  .. ", leading to intID #" .. elevatorEntrance[INTERIOR_DIM], thePlayer, 255, 126, 0)
					end

					found = true
				end
			end
		end
	end

	if not found then
		outputChatBox("   There is no elevators around here, please get an admin to create a new one.", thePlayer, 255, 126, 0)
	end
end
addCommandHandler("fixnearbyelevators", fixNearbyElevator, false, false)
addCommandHandler("fixnearbye", fixNearbyElevator, false, false)

function delNearbyElevators(thePlayer, commandName)
	if (exports.cr_integration:isPlayerDeveloper(thePlayer) or exports.cr_integration:isPlayerLeaderAdmin(thePlayer) or exports.cr_integration:isPlayerSeniorAdmin(thePlayer)) then
		local posX, posY, posZ = getElementPosition(thePlayer)
		local dimension = getElementDimension(thePlayer)
		outputChatBox("Deleting Nearby Elevators:", thePlayer, 255, 126, 0)
		local found = false

		local possibleElevators = getElementsByType("elevator")
		for _, elevator in ipairs(possibleElevators) do
			local elevatorEntrance = getElementData(elevator, "entrance")
			local elevatorExit = getElementData(elevator, "exit")

			for _, point in ipairs({ elevatorEntrance, elevatorExit }) do
				if (point[INTERIOR_DIM] == dimension) then
					local distance = getDistanceBetweenPoints3D(posX, posY, posZ, point[INTERIOR_X], point[INTERIOR_Y], point[INTERIOR_Z])
					if (distance <= 11) then
						local dbid = getElementData(elevator, "dbid")
						if point == elevatorEntrance then
							if deleteElevator(thePlayer, "dele", dbid) then
								outputChatBox(" Elevator ID #" .. dbid  .. " was deleted.", thePlayer, 255, 126, 0)
							end
						else
							if deleteElevator(thePlayer, "dele", dbid) then
								outputChatBox(" Elevator ID #" .. dbid  .. " was deleted.", thePlayer, 255, 126, 0)
							end
						end
						found = true
					end
				end
			end
		end
		if not found then
			outputChatBox("   None was deleted.", thePlayer, 255, 126, 0)
		end
	end
end
addCommandHandler("delnearbyelevators", delNearbyElevators, false, false)
addCommandHandler("delnearbye", delNearbyElevators, false, false)

function delElevatorsFromInterior(thePlayer, commandName, intID)
	if (exports.cr_integration:isPlayerTrialAdmin(thePlayer)) or commandName == "PROPERTYCLEANUP" then
		if (not tonumber(intID) or tonumber(intID)%1~= 0) and commandName ~= "PROPERTYCLEANUP" then
			outputChatBox("KULLANIM: /" .. commandName .. " [ID]", thePlayer, 255, 194, 14)
			outputChatBox("Deletes all elevators within an interior, Int 0 = World map.", thePlayer, 220, 170, 0)
		else
			if tonumber(intID) == 0 and not exports.cr_integration:isPlayerSeniorAdmin(thePlayer) then
				outputChatBox("Only Head+ Admins can delete all elevators from world map.", thePlayer, 255,0,0)
				return false
			end

			if commandName ~= "PROPERTYCLEANUP" then
				outputChatBox("Deleting Elevators From Interior ID #" .. intID .. ":", thePlayer, 255, 126, 0)
			end
			local found = false

			dbQuery(
				function(qh, thePlayer)
					local res, rows, err = dbPoll(qh, 0)
					if rows > 0 then
						local row = res[1]
						if deleteElevator(thePlayer, "PROPERTYCLEANUP", tonumber(row["id"])) then
							if commandName ~= "PROPERTYCLEANUP" then
								outputChatBox(" Elevator ID #" .. tonumber(row["id"])  .. " was deleted.", thePlayer, 255, 126, 0)
								found = true
							end
						end
					end
				end,
			{thePlayer}, mysql:getConnection(), "SELECT `id` FROM `elevators` WHERE `dimensionwithin` = '" .. (intID) .. "' OR `dimension` = '" .. (intID) .. "'")
		end
	end
end
addCommandHandler("delefromint", delElevatorsFromInterior, false, false)
addCommandHandler("delelevatorsfrominterior", delElevatorsFromInterior, false, false)

function SmallestElevatorID() -- finds the smallest ID in the SQL instead of auto increment
    local query = dbQuery(mysql:getConnection(), "SELECT MIN(e1.id+1) AS nextID FROM elevators AS e1 LEFT JOIN elevators AS e2 ON e1.id +1 = e2.id WHERE e2.id IS NULL")
    local result = dbPoll(query, -1)
    if result then
        return  tonumber(result[1]["nextID"]) or 1
    end
    return false
end

addEvent("toggleCarTeleportMode", false)
addEventHandler("toggleCarTeleportMode", root,
	function(player)
		local elevatorStatus = getElementData(source, "status")
		local mode = (elevatorStatus[INTERIOR_TYPE] + 1) % 4
		local query = dbExec(mysql:getConnection(),"UPDATE elevators SET car = " .. (mode) .. " WHERE id = " .. (getElementData(source, "dbid")))
		if query then
			elevatorStatus[INTERIOR_TYPE] = mode
			setElementData(source, "status", elevatorStatus, false)
			if mode == 0 then
				outputChatBox("You changed the mode to 'players only'.", player, 0, 255, 0)
			elseif mode == 1 then
				outputChatBox("You changed the mode to 'players and vehicles'.", player, 0, 255, 0)
			elseif mode == 2 then
				outputChatBox("You changed the mode to 'vehicles only'.", player, 0, 255, 0)
			else
				outputChatBox("You changed the mode to 'no entrance'.", player, 0, 255, 0)
			end
		else
			outputChatBox("Error 9019 - Report on Forums.", player, 255, 0, 0)
		end
	end
)

function toggleElevator(thePlayer, commandName, id)
	if (exports.cr_integration:isPlayerDeveloper(thePlayer) or exports.cr_integration:isPlayerLeaderAdmin(thePlayer) or exports.cr_integration:isPlayerSeniorAdmin(thePlayer)) then
		id = tonumber(id)
		if not id then
			outputChatBox("KULLANIM: /" .. commandName .. " [ID]", thePlayer, 255, 194, 14)
		else
			local dbid, entrance, exit, status, elevatorElement = findElevator(id)

			if elevatorElement then
				if status[INTERIOR_DISABLED] then
					dbExec(mysql:getConnection(),"UPDATE elevators SET disabled = 0 WHERE id = " .. (dbid))
				else
					dbExec(mysql:getConnection(),"UPDATE elevators SET disabled = 1 WHERE id = " .. (dbid))
				end
				reloadOneElevator(dbid)

			else
				outputChatBox("Elevator not found.", thePlayer, 255, 194, 14)
			end
		end
	end
end
addCommandHandler("toggleelevator", toggleElevator)
addCommandHandler("togglee", toggleElevator)
