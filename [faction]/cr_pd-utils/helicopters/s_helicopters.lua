function unsitInHelicopter(vehicle)
	local seat = getElementData(source, "seat")
	
	if (isElement(vehicle)) then
		if not (getElementType(vehicle)=="vehicle") then
			local vehicles = exports.cr_pool:getPoolElementsByType("vehicle")
			local helicopters = { }
			for key, value in ipairs(vehicles) do
				if (getElementModel(value)==497) or (getElementModel(value)==563) then
					table.insert(helicopters, value)
				end
			end
			
			for key, value in ipairs(helicopters) do
				local players = getElementData(value, "player")
				
				if (players) then
					local removed = false
					for key, value in ipairs(players) do
						if (value==source) then
							removed = true
							table.remove(players, key)
						end
					end
					
					if (removed) then
						setElementData(value, "player", players, true)
					end
				end
			end
			
			setElementData(source, "seat")
			detachElements(source, vehicle)
			exports.cr_global:removeAnimation(source)
		elseif (seat) and (seat>0) then
			local players = getElementData(vehicle, "player")
			
			for key, value in ipairs(players) do
				if (value==source) then
					table.remove(players, key)
				end
			end
			setElementData(vehicle, "player", players, true)
			setElementData(source, "seat")
			detachElements(source, vehicle)
			exports.cr_global:removeAnimation(source)
		end
	end
end
addEvent("unsitInHelicopter", true)
addEventHandler("unsitInHelicopter", root, unsitInHelicopter)

function sitInHelicopter(vehicle)
	local players = getElementData(vehicle, "player")
	
	--[[for key, value in ipairs(players) do
		if not isElement(argument) or not getElementType(argument) == "player" then
			table.remove(players, key)
		elseif not isElementAttached (value) then
			setElementData(value, "seat")
			table.remove(players, key)
		elseif value == source then
			setElementData(value, "seat")
			table.remove(players, key)
		end
	end]]
	
	if (not players) or (#players<3) then
		local seat = 0
		if not (players) then
			players = { }
			seat = 1
		end
		
		
		local s1 = false
		local s2 = false
		local s3 = false

		for key, value in ipairs(players) do
			if (key==1) then
				s1 = true
			elseif (key==2) then
				s2 = true
			elseif (key==3) then
				s3 = true
			end
		end
		
		if not (s1) then
			seat = 1
			
			local x, y, z = getElementPosition(vehicle)
			local rx, ry, rz = getVehicleRotation(vehicle)
			x = x - math.sin(math.rad(rz))*1.01
			y = y - math.cos(math.rad(rz))*1.01
			
			attachElements(source, vehicle, -1.3, 0, 0)
			setPedRotation(source, rz+90)
			exports.cr_global:applyAnimation(source, "FOOD", "FF_Sit_Look", 999999, true, true, false)
			setPedWeaponSlot(source, 5)
		elseif not (s2) then
			seat = 2
			
			local x, y, z = getElementPosition(vehicle)
			local rx, ry, rz = getVehicleRotation(vehicle)
			x = x + math.sin(math.rad(rz))*1.01
			y = y + math.cos(math.rad(rz))*1.01
			
			attachElements(source, vehicle, 1.3, 0, 0)
			setPedRotation(source, rz-90)
			exports.cr_global:applyAnimation(source, "FOOD", "FF_Sit_Look", 999999, true, true, false)
			setPedWeaponSlot(source, 5)
		elseif not (s3) then
			seat = 3
			
			local x, y, z = getElementPosition(vehicle)
			local rx, ry, rz = getVehicleRotation(vehicle)
			x = x + math.sin(math.rad(rz))*1.01
			y = y + math.cos(math.rad(rz))*1.01
			
			attachElements(source, vehicle, 1.3, 1, 0)
			setPedRotation(source, rz-90)
			exports.cr_global:applyAnimation(source, "FOOD", "FF_Sit_Look", 999999, true, true, false)
			setPedWeaponSlot(source, 5)		
		end
		
		players[seat] = source
		setElementData(source, "seat", seat)
		
		setElementData(vehicle, "player", players, true)
	else
		outputChatBox("This helicopter is full.", source, 255, 0, 0)
	end
end
addEvent("sitInHelicopter", true)
addEventHandler("sitInHelicopter", root, sitInHelicopter)