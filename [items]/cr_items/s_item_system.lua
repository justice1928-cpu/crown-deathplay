﻿blackMales = { [310] = true, [311] = true, [300] = true, [301] = true, [302] = true, [296] = true, [297] = true, [268] = true, [269] = true, [270] = true, [271] = true, [272] = true, [7] = true, [14] = true, [15] = true, [16] = true, [17] = true, [18] = true, [20] = true, [21] = true, [22] = true, [24] = true, [25] = true, [28] = true, [35] = true, [36] = true, [50] = true, [51] = true, [66] = true, [67] = true, [78] = true, [79] = true, [80] = true, [83] = true, [84] = true, [102] = true, [103] = true, [104] = true, [105] = true, [106] = true, [107] = true, [134] = true, [136] = true, [142] = true, [143] = true, [144] = true, [156] = true, [163] = true, [166] = true, [168] = true, [176] = true, [180] = true, [182] = true, [183] = true, [185] = true, [220] = true, [221] = true, [222] = true, [249] = true, [253] = true, [260] = true, [262] = true }
whiteMales = {[305] = true, [306] = true, [307] = true, [308] = true, [309] = true, [312] = true, [303] = true, [299] = true, [291] = true, [292] = true, [293] = true, [294] = true, [295] = true, [1] = true, [2] = true, [23] = true, [26] = true, [27] = true, [29] = true, [30] = true, [32] = true, [33] = true, [34] = true, [35] = true, [36] = true, [37] = true, [38] = true, [43] = true, [44] = true, [45] = true, [46] = true, [47] = true, [48] = true, [50] = true, [51] = true, [52] = true, [53] = true, [58] = true, [59] = true, [60] = true, [61] = true, [62] = true, [68] = true, [70] = true, [72] = true, [73] = true, [78] = true, [81] = true, [82] = true, [94] = true, [95] = true, [96] = true, [97] = true, [98] = true, [99] = true, [100] = true, [101] = true, [108] = true, [109] = true, [110] = true, [111] = true, [112] = true, [113] = true, [114] = true, [115] = true, [116] = true, [120] = true, [121] = true, [122] = true, [124] = true, [125] = true, [126] = true, [127] = true, [128] = true, [132] = true, [133] = true, [135] = true, [137] = true, [146] = true, [147] = true, [153] = true, [154] = true, [155] = true, [158] = true, [159] = true, [160] = true, [161] = true, [162] = true, [164] = true, [165] = true, [170] = true, [171] = true, [173] = true, [174] = true, [175] = true, [177] = true, [179] = true, [181] = true, [184] = true, [186] = true, [187] = true, [188] = true, [189] = true, [200] = true, [202] = true, [204] = true, [206] = true, [209] = true, [212] = true, [213] = true, [217] = true, [223] = true, [230] = true, [234] = true, [235] = true, [236] = true, [240] = true, [241] = true, [242] = true, [247] = true, [248] = true, [250] = true, [252] = true, [254] = true, [255] = true, [258] = true, [259] = true, [261] = true, [264] = true, [265] = true, [272] = true }
asianMales = {[290] = true, [49] = true, [57] = true, [58] = true, [59] = true, [60] = true, [117] = true, [118] = true, [120] = true, [121] = true, [122] = true, [123] = true, [170] = true, [186] = true, [187] = true, [203] = true, [210] = true, [227] = true, [228] = true, [229] = true, [294] = true }
blackFemales = {[304] = true, [298] = true, [10] = true, [11] = true, [12] = true, [13] = true, [40] = true, [41] = true, [63] = true, [64] = true, [69] = true, [76] = true, [91] = true, [139] = true, [148] = true, [190] = true, [195] = true, [207] = true, [215] = true, [218] = true, [219] = true, [238] = true, [243] = true, [244] = true, [245] = true, [256] = true, [304] = true }
whiteFemales = {[12] = true, [31] = true, [38] = true, [39] = true, [40] = true, [41] = true, [53] = true, [54] = true, [55] = true, [56] = true, [64] = true, [75] = true, [77] = true, [85] = true, [87] = true, [88] = true, [89] = true, [90] = true, [91] = true, [92] = true, [93] = true, [129] = true, [130] = true, [131] = true, [138] = true, [140] = true, [145] = true, [150] = true, [151] = true, [152] = true, [157] = true, [172] = true, [178] = true, [192] = true, [193] = true, [194] = true, [196] = true, [197] = true, [198] = true, [199] = true, [201] = true, [205] = true, [211] = true, [214] = true, [216] = true, [224] = true, [225] = true, [226] = true, [231] = true, [232] = true, [233] = true, [237] = true, [243] = true, [246] = true, [251] = true, [257] = true, [263] = true, [298] = true }
asianFemales = {[38] = true, [53] = true, [54] = true, [55] = true, [56] = true, [88] = true, [141] = true, [169] = true, [178] = true, [224] = true, [225] = true, [226] = true, [263] = true }local fittingskins = {[0] = {[0] = blackMales, [1] = whiteMales, [2] = asianMales}, [1] = {[0] = blackFemales, [1] = whiteFemales, [2] = asianFemales}}
local badges = getBadges()
local masks = getMasks()

local cokeBottles = {}

local spamTimerMasks = {}

function removeAnimation(player)
	exports.cr_global:removeAnimation(player)
end

function giveHealth(player, health)
	if health ~= nil then
		setElementHealth(player, math.min(100, getElementHealth(player) + health))
	end
end

function removeOOC(text)
	if not text then
		outputChatBox("Error code 0001 occurs, please report to Crown Deathplay MTA Scripting Team at http://forums.crowndeathplay.net/forms.php?do=form&fid=1")
		return ""
	end
	return text:gsub("%s*%(%(([^)]+)%)%)%s*","") -- removes the (()) part
end

local shields = { }
local presents = { 1, 7, 8, 15, 11, 12, 19, 26, 59, 71 }
local glowstickColor = 1

-- callbacks
function useItem(itemSlot, additional)
	if not itemSlot then
		return
	end

	local items = getItems(source)
	local itemID = items[itemSlot][1]
	local itemValue = items[itemSlot][2]
	local itemName = getItemName(itemID, itemValue)
	if isPedDead(source) or getElementData(source, "injuriedanimation") then return end

	local hasItemProtect = hasItem(source, tonumber(itemID), tostring(itemValue)) or  hasItem(source, tonumber(itemID), tonumber(itemValue))
	if not hasItemProtect then
		return
	end

	if itemID then
		if (itemID==1) then -- hotdog
			giveHunger(source, 45)
			takeThirst(source, 3)
			
			
			--setElementHealth(source, 100)
			triggerEvent('sendAme', source, "bir adet sosisli yer.")
			takeItemFromSlot(source, itemSlot)
		elseif (itemID==3) then -- car key
			local veh = getPedOccupiedVehicle(source)
			if veh and getElementData(veh, "dbid") == itemValue then
				triggerEvent("lockUnlockInsideVehicle", source, veh)
			else
				-- unlock nearby cars
				local value = exports.cr_pool:getElement("vehicle", itemValue)
				if value then
					local vx, vy, vz = getElementPosition(value)
					local x, y, z = getElementPosition(source)

					if getDistanceBetweenPoints3D(x, y, z, vx, vy, vz) <= 30 then -- car found
						triggerEvent("lockUnlockOutsideVehicle", source, value)
					else
						outputChatBox("You are too far from the vehicle.", source, 255, 194, 14)
					end
				else
					outputChatBox("Invalid Vehicle.", source, 255, 194, 14)
				end
			end
		elseif (itemID==4) or (itemID==5) then -- house key or business key
			local itemValue = tonumber(itemValue)
			local found = false

			local posX, posY, posZ = getElementPosition(source)
			local dimension = getElementDimension(source)
			local possibleInteriors = getElementsByType("interior")
			for _, interior in ipairs(possibleInteriors) do
				local interiorEntrance = getElementData(interior, "entrance")
				local interiorExit = getElementData(interior, "exit")
				local interiorID = getElementData(interior, "dbid")
				if interiorID == itemValue then
					for _, point in ipairs({ interiorEntrance, interiorExit }) do
						if (point[5] == dimension) then
							local distance = getDistanceBetweenPoints3D(posX, posY, posZ, point[1], point[2], point[3])
							if (distance <= 6) then
								found = interiorID
								break
							end
						end
					end
				end
			end

			if not found then
				local possibleElevators = getElementsByType("elevator")
				for _, elevator in ipairs(possibleElevators) do
					local elevatorEntrance = getElementData(elevator, "entrance")
					local elevatorExit = getElementData(elevator, "exit")

					for _, point in ipairs({ elevatorEntrance, elevatorExit }) do
						if (point[5] == dimension) then
							local distance = getDistanceBetweenPoints3D(posX, posY, posZ, point[1], point[2], point[3])
							if (distance < 6) then
								if elevatorEntrance[5] == itemValue then
									found = elevatorEntrance[5]
									break
								elseif elevatorExit[5] == itemValue  then
									found = elevatorExit[5]
									break
								end
							end
						end
					end
				end
			end

			if found then
				local dbid, entrance, exit, interiorType, interiorElement = exports['cr_interior']:findProperty(source, found)
				local interiorStatus = getElementData(interiorElement, "status")
				local locked = interiorStatus[3] and 1 or 0

				locked = 1 - locked -- Invert status


				local newRealLockedValue = false
				mysql:query_free("UPDATE interiors SET locked='" .. locked .. "' WHERE id='" .. found .. "' LIMIT 1")
				if locked == 0 then
					triggerEvent('sendAme', source, "kapıya anahtarı takar ve kilidi açar.")
					if not (exports.cr_global:hasItem(source, 4, found)) and not (exports.cr_global:hasItem(source, 5, found)) then
						exports.cr_logs:logMessage("[INTERIOR-UNLOCK] Interior #" .. found .. " was unlocked by " .. getPlayerName(source), 21)
					end
				else
					newRealLockedValue = true
					triggerEvent('sendAme', source, "kapıya anahtarı takar ve kilitler.")

					if not (exports.cr_global:hasItem(source, 4, found)) and not (exports.cr_global:hasItem(source, 5, found)) then
						exports.cr_logs:logMessage("[INTERIOR-LOCK] Interior #" .. found .. " was locked by " .. getPlayerName(source), 21)
					end
				end

				interiorStatus[3] = newRealLockedValue
				setElementData(interiorElement, "status", interiorStatus, true)
			else
				outputChatBox("Kapıdan çok uzaksınız.", source, 255, 194, 14)
			end
			
		elseif (itemID >= 890 and itemID <= 898) then
			local result = mysql:query("SELECT * FROM pets WHERE owner=" .. getElementData(client, "dbid"))
			if mysql:num_rows(result) > 1 then
				outputChatBox("[!] #f0f0f0En fazla 1 adet evcil hayvana sahip olabilirsiniz.", client, 255, 0, 0, thePlayer)
			else
				local petModel = 310
				if itemID == 891 then
					petModel = 310
				elseif itemID == 890 then
					petModel = 311
				elseif itemID == 892 then
					petModel = 304
				elseif itemID == 893 then
					petModel = 298
				elseif itemID == 894 then
					petModel = 301
				elseif itemID == 895 then
					petModel = 302
				elseif itemID == 896 then
					petModel = 10
				elseif itemID == 898 then
					petModel = 31
				end
				triggerClientEvent(client, "hayvan:namePet", client, petModel)
				takeItemFromSlot(source, itemSlot)
			end
			
		elseif (itemID==73) then -- elevator remote
			local itemValue = tonumber(itemValue)
			local found = nil

			local dimension = getElementDimension(source)
			local posX, posY, posZ = getElementPosition(source)
			local possibleElevators = getElementsByType("elevator")
			for _, elevator in ipairs(possibleElevators) do
				local elevatorEntrance = getElementData(elevator, "entrance")
				local elevatorExit = getElementData(elevator, "exit")
				local elevatorID = getElementData(elevator, "dbid")
				if elevatorID == itemValue then
					for _, point in ipairs({ elevatorEntrance, elevatorExit }) do
						if (point[5] == dimension) then
							local distance = getDistanceBetweenPoints3D(posX, posY, posZ, point[1], point[2], point[3])
							if (distance < 6) then
								found = elevator
								break
							end
						end
					end
				end
			end

			if not found then
				outputChatBox("Kapıdan çok uzaksınız.", source, 255, 194, 14)
			else
				triggerEvent("toggleCarTeleportMode", found, source)
			end
		elseif (itemID==8) then -- sandwich
			giveHunger(source, 70)
			takeThirst(source, 7)
			
			exports.cr_global:applyAnimation(source, "food", "eat_burger", 4000, false, true, true)
			toggleAllControls(source, true, true, true)
			triggerClientEvent(source, "onClientPlayerWeaponCheck", source)
			triggerEvent('sendAme', source, "bir sandviç yer.")
			takeItemFromSlot(source, itemSlot)
		elseif (itemID==9) then -- sprunk
			giveThirst(source, 65)
			takeHunger(source, 2)
			
			--giveHealth(source, 30)
			exports.cr_global:applyAnimation(source, "VENDING", "VEND_Drink_P", 4000, false, true, true)
			toggleAllControls(source, true, true, true)
			triggerClientEvent(source, "onClientPlayerWeaponCheck", source)
			triggerEvent('sendAme', source, "drinks a sprunk.")
			takeItemFromSlot(source, itemSlot)
		elseif (itemID==10) then -- red dice
			local max = tonumber(itemValue) or 6
			if max == 1 then
				max = 6
			end
			exports.cr_global:sendLocalText(source, "* " .. getPlayerName(source):gsub("_", " ") .. " bir " .. (max == 6 and "" or (max .. "-yüzlü ")) .. " zar atar ve '" .. math.random(1, max)  .. "' sayısı gelir.", 255, 51, 102)
		elseif (itemID==11) then -- adana
			giveHunger(source, 80)
			takeThirst(source, 20)
			
			exports.cr_global:applyAnimation(source, "FOOD", "EAT_Burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "bir porsiyon adana kebap yer.")
			takeItemFromSlot(source, itemSlot)
		elseif (itemID==12) then -- cheeseburger
			giveHunger(source, 75)
			takeThirst(source, 15)
			
			exports.cr_global:applyAnimation(source, "FOOD", "EAT_Burger", 4000, false, true, true)
			setTimer(removeAnimation, 4000, 1, source)
			triggerEvent('sendAme', source, "bir hamburger yer.")
			takeItemFromSlot(source, itemSlot)
		elseif (itemID==13) then -- donut
			giveHunger(source, 20)
			takeThirst(source, 5)
			
			exports.cr_global:applyAnimation(source, "FOOD", "EAT_Burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "bir donut yer.")
			takeItemFromSlot(source, itemSlot)
		elseif (itemID==14) then -- cookie
			giveHunger(source, 20)
			takeThirst(source, 5)
			
			exports.cr_global:applyAnimation(source, "FOOD", "EAT_Burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "bir kurabiye yer.")
			takeItemFromSlot(source, itemSlot)
		elseif (itemID==15) then -- water
			giveHealth(source, 100)
			giveThirst(source, 100)
			giveThirst(source, 100)
			
			exports.cr_global:applyAnimation(source, "VENDING", "VEND_Drink_P", 4000, false, true, true)
			triggerEvent('sendAme', source, "bir şişe su içer.")
			takeItemFromSlot(source, itemSlot)
		elseif (itemID==16) then -- clothes
			local result = mysql:query_fetch_assoc("SELECT gender,skincolor FROM characters WHERE id='" .. getElementData(source, "dbid") .. "' LIMIT 1")
			local gender = tonumber(result["gender"])
			local race = tonumber(result["skincolor"])

			local skin, clothingid = unpack(split(tostring(itemValue), ':'))
			skin = tonumber(skin)
			clothingid = tonumber(clothingid) or nil
			setElementModel(source, skin)
			setElementData(source, "clothing:id", clothingid)
			dbExec(mysql:getConnection(), "UPDATE characters SET skin = " .. skin .. ", clothingid = " .. (clothingid or 'NULL') .. " WHERE id = " .. getElementData(source, "dbid"))
			triggerEvent('sendAme', source, "üzerindeki kıyafetleri adım adım değiştirir.")
		elseif (itemID==17) then -- watch
			triggerEvent('sendAme', source, "saate bakar.")
			outputChatBox("The time is " .. string.format("%02d:%02d", getTime()) .. ".", source, 255, 194, 14)
			exports.cr_global:applyAnimation(source, "COP_AMBIENT", "Coplook_watch", 4000, false, true, true)
		elseif (itemID==20) then -- STANDARD FIGHTING
			setPedFightingStyle(source, 4)
			outputChatBox("You read a book on how to do Standard Fighting.", source, 255, 194, 14)
			mysql:query_free("UPDATE characters SET fightstyle = 4 WHERE id = " .. getElementData(source, "dbid"))
		elseif (itemID==21) then -- BOXING
			setPedFightingStyle(source, 5)
			outputChatBox("You read a book on how to do Boxing.", source, 255, 194, 14)
			mysql:query_free("UPDATE characters SET fightstyle = 5 WHERE id = " .. getElementData(source, "dbid"))
		elseif (itemID==22) then -- KUNG FU
			setPedFightingStyle(source, 6)
			outputChatBox("You read a book on how to do Kung Fu.", source, 255, 194, 14)
			mysql:query_free("UPDATE characters SET fightstyle = 6 WHERE id = " .. getElementData(source, "dbid"))
		elseif (itemID==23) then -- KNEE HEAD
			--setPedFightingStyle(source, 7)
			outputChatBox("You open the book, and notice that the book is written in old greek.", source, 255, 194, 14)
			--mysql:query_free("UPDATE characters SET fightstyle = 7 WHERE id = " .. getElementData(source, "dbid"))
		elseif (itemID==24) then -- GRAB KICK
			setPedFightingStyle(source, 15)
			outputChatBox("You read a book on how to do Grab Kick Fighting.", source, 255, 194, 14)
			mysql:query_free("UPDATE characters SET fightstyle = 15 WHERE id = " .. getElementData(source, "dbid"))
		elseif (itemID==25) then -- ELBOWS
			setPedFightingStyle(source, 16)
			outputChatBox("You read a book on how to do Elbow Fighting.", source, 255, 194, 14)
			mysql:query_free("UPDATE characters SET fightstyle = 16 WHERE id = " .. getElementData(source, "dbid"))
		elseif (itemID==27) then -- FLASHBANG
			takeItemFromSlot(source, itemSlot)

			local obj = createObject(343, unpack(additional))
			exports.cr_pool:allocateElement(obj)
			setTimer(explodeFlash, math.random(400, 800), 1, obj)
			triggerEvent('sendAme', source, "throws a flashbang.")
			setElementInterior(obj, getElementInterior(source))
			setElementDimension(obj, getElementDimension(source))
		elseif (itemID==28) then -- GLOWSTICK
			takeItemFromSlot(source, itemSlot)

			local x, y, groundz = unpack(additional)
			local marker = nil
			if tostring(itemValue) == "2" then
				marker = createMarker(x, y, groundz, "corona", 1, 255, 0, 0, 150)
			elseif tostring(itemValue) == "3" then
				marker = createMarker(x, y, groundz, "corona", 1, 0, 255, 0, 150)
			elseif tostring(itemValue) == "4" then
				marker = createMarker(x, y, groundz, "corona", 1, 255, 255, 0, 150)
			elseif tostring(itemValue) == "5" then
				marker = createMarker(x, y, groundz, "corona", 1, 255, 0, 255, 150)
			elseif tostring(itemValue) == "6" then
				marker = createMarker(x, y, groundz, "corona", 1, 0, 255, 255, 150)
			elseif tostring(itemValue) == "7" then
				marker = createMarker(x, y, groundz, "corona", 1, 255, 255, 255, 150)
			else
				marker = createMarker(x, y, groundz, "corona", 1, 0, 0, 255, 150)
			end
			exports.cr_pool:allocateElement(marker)
			triggerEvent('sendAme', source, "drops a glowstick.")
			setTimer(destroyElement, 600000, 1, marker)
		elseif (itemID==29) then -- RAM
			--if (getElementData(source, "duty") > 0) and (getElementModel(source) == 285) then
				local found = false
				local lastDistance = 5
				local posX, posY, posZ = getElementPosition(source)
				local dimension = getElementDimension(source)
				local possibleInteriors = getElementsByType("interior")
				for _, interior in ipairs(possibleInteriors) do
					local interiorEntrance = getElementData(interior, "entrance")
					local interiorExit = getElementData(interior, "exit")

					for _, point in ipairs({ interiorEntrance, interiorExit }) do
						if (point[5] == dimension) then
							local distance = getDistanceBetweenPoints3D(posX, posY, posZ, point[1], point[2], point[3])
							if (distance < lastDistance) then
								found = interior
								lastDistance = distance
							end
						end
					end
				end

				if not (found) then
					outputChatBox("Kapıya yakın değilsiniz.", source, 255, 194, 14)
				else
					local dbid = getElementData(found, "dbid")
					local interiorStatus = getElementData(found, "status")

					if (interiorStatus[1] ~= 2) and (interiorStatus[4] < 0) and (interiorStatus[3]) and not (interiorStatus[2]) then
						outputChatBox("Bu kapı herhangi bir oyuncuya ait değil.", source, 255, 0, 0)
					elseif interiorStatus[2] then
						outputChatBox("Kapı devre dışı bırakılmış.", source, 255, 0, 0)
					elseif (interiorStatus[3]) then
						interiorStatus[3] = false
						setElementData(found, "status", interiorStatus, true)
						mysql:query_free("UPDATE interiors SET locked='0' WHERE id='" .. mysql:escape_string(dbid) .. "' LIMIT 1")
						triggerEvent('sendAme', source, "swings the ram into the door, opening it.")
						exports.cr_global:sendMessageToAdmins("Player " .. getPlayerName(source) .. " opened interior " .. dbid .. " with a doorram")
						exports.cr_logs:dbLog(source, 31, { source, found }, "UNLOCK WITH DOORRAM")
					else
						outputChatBox("Kapı kilitli değil.", source, 255, 0, 0)
					end
				end
			--[[else
				outputChatBox("You are not on SWAT duty.", source, 255, 0, 0)
			end]]
		elseif (itemID==34) then
			takeItemFromSlot(source, itemSlot)
			triggerEvent('sendAme', source, "biraz Kokain koklar.")
			
			setPedArmor(source, getPedArmor(source) + 30)
			setElementData(source, "gecici_armor", 30)
			setTimer(
				function() 
					setElementData(source, "gecici_armor", 0)
					if (getPedArmor(source) - 30 < 0) then
						setPedArmor(source, 0)
					else
						setPedArmor(source, getPedArmor(source) - 30)
					end
				end,
			600000, 1)
			
			bagimlilikArttir()
			setElementData(source, "uyusturucu_kriz", false)
			setTimer(setElementData, 50*60*1000, 1, source, "uyusturucu_kriz", true)
		elseif (itemID==35) then
			takeItemFromSlot(source, itemSlot)
			triggerEvent('sendAme', source, "swallows a Morphine pill.")
			
			setPedArmor(source, getPedArmor(source) + 25)
			setElementData(source, "gecici_armor", 25)
			setTimer(600000, 1, 
				function() 
					setElementData(source, "gecici_armor", 0)
					if (getPedArmor(source) - 25 < 0) then
						setPedArmor(source, 0)
					else
						setPedArmor(source, getPedArmor(source) - 25)
					end
				end
			)
			
			bagimlilikArttir()
			setElementData(source, "uyusturucu_kriz", false)
			setTimer(setElementData, 35*60*1000, 1, source, "uyusturucu_kriz", true)
		elseif (itemID==36) then
			takeItemFromSlot(source, itemSlot)
			triggerEvent('sendAme', source, "swallows a Sexual Health pill.")
			
			setPedArmor(source, getPedArmor(source) + 25)
			setTimer(
				function() 
					if (getPedArmor(source) - 25 < 0) then
					setPedArmor(source, 0)
					else
						setPedArmor(source, getPedArmor(source) - 5)
					end
				end,
			600000, 1)
			
			bagimlilikArttir()
			setElementData(source, "uyusturucu_kriz", false)
			setTimer(setElementData, 20*60*1000, 1, source, "uyusturucu_kriz", true)
		elseif (itemID==37) then
			takeItemFromSlot(source, itemSlot)
			triggerEvent('sendAme', source, "injects some Heroin.")
			
			setPedArmor(source, getPedArmor(source) + 40)
			setElementData(source, "gecici_armor", 40)
			setTimer(
				function() 
					setElementData(source, "gecici_armor", 0)
					if (getPedArmor(source) - 40 < 0) then
					setPedArmor(source, 0)
					else
						setPedArmor(source, getPedArmor(source) - 40)
					end
				end,
			600000, 1)

			bagimlilikArttir()
			setElementData(source, "uyusturucu_kriz", false)
			setTimer(setElementData, 35*60*1000, 1, source, "uyusturucu_kriz", true)
		elseif (itemID==999) then
			takeItemFromSlot(source, itemSlot)
			triggerEvent('sendAme', source, "libidosunu yükseltmek için Sexual Health kullanır.")
			
			setPedArmor(source, getPedArmor(source) + 5)
			setTimer(
				function() 
					if (getPedArmor(source) - 5 < 0) then
					setPedArmor(source, 0)
					else
						setPedArmor(source, getPedArmor(source) - 5)
					end
				end,
			600000, 1)
			
			bagimlilikArttir()
			setElementData(source, "uyusturucu_kriz", false)
			setTimer(setElementData, 60*60*1000, 1, source, "uyusturucu_kriz", true)
		elseif (itemID==38) then
            local sucess, key, itemvalue = hasItem(source, 181)
            local itemVal = {}
            local i = 0
            for token in string.gmatch(tostring(itemValue), "[^%s]+") do
                i = i + 1
                itemVal[i] = token
            end
            if (tonumber(itemVal[1]) > 0) then
                if sucess then
                    if (tonumber(itemvalue) >= 1) then
                        if (hasSpaceForItem(source, 182, 1)) then
                            takeItemFromSlot(source, itemSlot)
                            giveItem(source, itemID, tonumber(itemVal[1]) - 1)
                            giveItem(source, 182, 1)
                            takeItem(source, 181, itemvalue)
                            exports.cr_global:sendLocalMeAction(source, "çantadan bir esrar tomurcuğu çıkardı, sarma paketinin arasına koyarak yuvarlamaya başladı.")
                            giveItem(source, 181, itemvalue - 1)
                        else
                            outputChatBox("Your Inventory is full.", source, 255, 0, 0)
                        end
                    else
                        outputChatBox("That Rolling Papers pack is over!", source, 255, 0, 0)
                    end
                else
                    outputChatBox("You need a pack of Smoking Rolling Papers to use this.", source, 255, 0, 0)
                end
            else
                triggerEvent('sendAme', source, "looks inside their bag of Marijuana. It's empty.")
            end
			
		elseif (itemID==39) then
			takeItemFromSlot(source, itemSlot)
			triggerEvent('sendAme', source, "sniffs some Methamphetamine.")

			setPedArmor(source, getPedArmor(source) + 60)
			setElementData(source, "gecici_armor", 60)
			setTimer(600000, 1, 
				function() 
					setElementData(source, "gecici_armor", 0)
					if (getPedArmor(source) - 60 < 0) then
						setPedArmor(source, 0)
					else
						setPedArmor(source, getPedArmor(source) - 60)
					end
				end
			)
			
			bagimlilikArttir()
			setElementData(source, "uyusturucu_kriz", false)
			setTimer(setElementData, 35*60*1000, 1, source, "uyusturucu_kriz", true)
		elseif (itemID==40) then
			takeItemFromSlot(source, itemSlot)
			triggerEvent('sendAme', source, "injects a Epinephrine pen.")
			

			setPedArmor(source, getPedArmor(source) + 30)
			setElementData(source, "gecici_armor", 30)
			setTimer(600000, 1, 
				function() 
					setElementData(source, "gecici_armor", 0)
					if (getPedArmor(source) - 30 < 0) then
						setPedArmor(source, 0)
					else
						setPedArmor(source, getPedArmor(source) - 30)
					end
				end
			)
			
			bagimlilikArttir()
			setElementData(source, "uyusturucu_kriz", false)
			setTimer(setElementData, 20*60*1000, 1, source, "uyusturucu_kriz", true)
		elseif (itemID==41) then
			takeItemFromSlot(source, itemSlot)
			triggerEvent('sendAme', source, "pours a drop of LSD down into his mouth.")

			setPedArmor(source, getPedArmor(source) + 40)
			setElementData(source, "gecici_armor", 40)
			setTimer(600000, 1, 
				function() 
					setElementData(source, "gecici_armor", 0)
					if (getPedArmor(source) - 40 < 0) then
						setPedArmor(source, 0)
					else
						setPedArmor(source, getPedArmor(source) - 40)
					end
				end
			)
			
			bagimlilikArttir()
			setElementData(source, "uyusturucu_kriz", false)
			setTimer(setElementData, 30*60*1000, 1, source, "uyusturucu_kriz", true)
		elseif (itemID==42) then
			takeItemFromSlot(source, itemSlot)
			triggerEvent('sendAme', source, "eats some dried shrooms")

			setPedArmor(source, getPedArmor(source) + 25)
			setElementData(source, "gecici_armor", 25)
			setTimer(600000, 1, 
				function() 
					setElementData(source, "gecici_armor", 0)
					if (getPedArmor(source) - 25 < 0) then
						setPedArmor(source, 0)
					else
						setPedArmor(source, getPedArmor(source) - 25)
					end
				end
			)
			
			bagimlilikArttir()
			setElementData(source, "uyusturucu_kriz", false)
			setTimer(setElementData, 15*60*1000, 1, source, "uyusturucu_kriz", true)
		elseif (itemID==43) then
			takeItemFromSlot(source, itemSlot)
			triggerEvent('sendAme', source, "swallows some PCP pills")
			
			setPedArmor(source, getPedArmor(source) + 35)
			setElementData(source, "gecici_armor", 35)
			setTimer(600000, 1, 
				function() 
					setElementData(source, "gecici_armor", 0)
					if (getPedArmor(source) - 35 < 0) then
						setPedArmor(source, 0)
					else
						setPedArmor(source, getPedArmor(source) - 35)
					end
				end
			)
			
			bagimlilikArttir()
			setElementData(source, "uyusturucu_kriz", false)
			setTimer(setElementData, 25*60*1000, 1, source, "uyusturucu_kriz", true)
		elseif itemID == 48 then -- Briefcase
			----triggerEvent("artifacts:toggle", source, source, "backpack")
		elseif (itemID==49) then
			----triggerEvent("artifacts:toggle", source, source, "rod")
			triggerEvent("fish", source)
		elseif (itemID==50) then -- highway code book
			local bookTitle = "The Los Santos Highway Code"
			local bookName = "SFHighwayCode"
			triggerEvent('sendAme', source, "reads " ..  bookTitle  .. ".")
			triggerClientEvent(source, "showBook", source, bookName, bookTitle)
		elseif (itemID==51) then -- chemistry book
			local bookTitle = "Chemistry 101"
			local bookName = "Chemistry101"
			triggerEvent('sendAme', source, "reads " ..  bookTitle  .. ".")
			triggerClientEvent(source, "showBook", source, bookName, bookTitle)
		elseif (itemID==52) then -- PD manual book
			local bookTitle = "The Police Officer's Manual"
			local bookName = "PDmanual"
			triggerEvent('sendAme', source, "reads " ..  bookTitle  .. ".")
			triggerClientEvent(source, "showBook", source, bookName, bookTitle)
		elseif (itemID==54) then -- GHETTOBLASTER
			triggerEvent('sendAme', source, "places a ghettoblaster on the ground.")
			local x, y, z = unpack(additional)

			triggerEvent("dropItem", source, itemSlot, x, y, z+0.3)
		elseif (itemID==55) then -- Stevie's business card
			triggerEvent('sendAme', source, "looks at a piece of paper.")
			outputChatBox("The card reads: 'Steven Pullman - L.V. Freight Depot, Tel: 12555'", source, 255, 51, 102)
		elseif (itemID==57) then -- FUEL CAN
			local nearbyVehicles = exports.cr_global:getNearbyElements(source, "vehicle")

			if #nearbyVehicles < 1 then return end

			local found = nil
			local shortest = 6
			local x, y, z = getElementPosition(source)
			for i, veh in ipairs(nearbyVehicles) do
				local distanceToVehicle = getDistanceBetweenPoints3D(x, y, z, getElementPosition(veh))
				if shortest > distanceToVehicle then
					shortest = distanceToVehicle
					found = veh
				end
			end

			if found then
				triggerEvent("fillFuelTankVehicle", source, found, itemValue)
			else
				outputChatBox("You are too far from a vehicle.", source, 255, 194, 14)
			end
		elseif (itemID==58) then
			takeItemFromSlot(source, itemSlot)
			triggerEvent('sendAme', source, "bir şişe Efes Pilsen Bira içer.")
			setElementHealth(source,getElementHealth(source)-5)
		elseif (itemID==59) then -- MUDKIP
			takeItemFromSlot(source, itemSlot)
			triggerEvent('sendAme', source, "eats a mudkip.")
			--killPed(source)
		elseif (itemID==60) then
			local x,y,z = getElementPosition(source)
			local rz = getPedRotation(source)
			local dimension = getElementDimension(source)
			local retval = call(getResourceFromName("cr_interior"), "addSafeAtPosition", source, x,y,z, rz) --0 no error, 1 safe already exists, 2 player does not own interior
			if (retval == 0) then
				triggerEvent('sendAme', source, "bir kasa yerleştirir.")
				takeItemFromSlot(source, itemSlot)
			elseif (retval == 2) then
				outputChatBox("Bir interiorda değilsiniz.", source, 255, 0, 0)
			elseif (retval == 3) then
				outputChatBox("Kasayı sadece kendi interiorunuza koyabilirsiniz!", source, 255, 0, 0)
			end
		elseif (itemID==62) then
			takeItemFromSlot(source, itemSlot)
			triggerEvent('sendAme', source, "bir şişe İstanblue Votka içer.")
			setElementHealth(source,getElementHealth(source)-10)
		elseif (itemID==63) then
			takeItemFromSlot(source, itemSlot)
			triggerEvent('sendAme', source, "bir şişe Jack Daniels viski içer.")
			setElementHealth(source,getElementHealth(source)-10)
		elseif (itemID==68) then
			triggerEvent('sendAme', source, "looks at their lottery ticket.")
			outputChatBox("You glance at the lottery ticket and read the number: " .. itemValue, source, 0, 255, 0)
		elseif (itemID==72) then -- Note
			triggerEvent('sendAme', source, "bir not okur.")
		--[=[REMOVED :> mabako, 11th January 2012 (plus it'd be broken, /lazy)
		elseif (itemID==74) then
			takeItemFromSlot(source, itemSlot)
			local x, y, z = getElementPosition(source)
			createExplosion(x, y, z, 10, source)
			createExplosion(x, y, z, 10, source)
		elseif (itemID==75) then
			triggerEvent('sendAme', source, "pushes some kind of red button which reads 'do not push'.")
			local px, py, pz = getElementPosition(source)
			for k, v in pairs(getElementsByType("object", getResourceRootElement())) do
				if isElement(v) and getElementData(v, "itemID") == 74 and getElementData(v, "itemValue") == itemValue then
					local x, y, z = getElementPosition(v)
					if getDistanceBetweenPoints3D(x, y, z, px, py, pz) < 200 then
						mysql:query_free("DELETE FROM worlditems WHERE id = " .. getElementData(v, "id"))
						createExplosion(x, y, z, 10, source)
						createExplosion(x, y, z, 10, source)
						destroyElement(v)
					end
				end
			end

			for k, v in pairs(exports.cr_global:getNearbyElements(source, "vehicle", 200)) do
				if hasItem(v, 74, itemValue) then
					blowVehicle(v)

					while hasItem(v, 74) do
						takeItem(v, 74)
					end
				end
			end

			for k, v in pairs(exports.cr_global:getNearbyElements(source, "player", 200)) do
				if hasItem(v, 74, itemValue) then
					local x, y, z = getElementPosition(v)
					createExplosion(x, y, z, 10, source)
					createExplosion(x, y, z, 10, source)

					while hasItem(v, 74) do
						takeItem(v, 74)
					end
				end
			end
		]=]
		elseif (itemID==76) then -- SHIELD
			if (shields[source]) then -- Already using the shield
				destroyElement(shields[source])
				shields[source] = nil
			else
				local x, y, z = getElementPosition(source)
				local rot = getPedRotation(source)

				x = x + math.sin(math.rad(rot)) * 1.5
				y = y + math.cos(math.rad(rot)) * 1.5

				local object = createObject(1631, x, y, z)
				attachElements(object, source, 0, 1, 0)
				shields[source] = object
			end
		elseif (itemID==77) then -- Card Deck
			local cards = { "As", "İki", "Üç", "Dört", "Beş", "Altı", "Yedi", "Sekiz", "Dokuz", "On", "Vale (J)", "Kız (Q)", "Papaz (K)" }
			local sign = { "Sinek", "Kupa", "Maça", "Karo" }
			local number = math.random(1, #cards)
			local snumber = math.random(1, #sign)
			exports.cr_global:sendLocalText(source, "* " .. getPlayerName(source):gsub("_", " ") .. " bir kart çeker ve kart " ..  sign[snumber] .. (number == 1 and "n" or "") .. " " .. cards[number]  .. " gelmiştir.", 255, 51, 102)
		elseif (itemID==79) then -- Porn tape
			exports.cr_global:applyAnimation(source, "PAULNMAC", "wank_loop", -1, true, false, false)
		elseif (itemID==80) then -- Generic Item
			showItem(removeOOC(itemName))
		elseif (itemID==83) then -- Coffee
			giveThirst(source, 40)
			takeHunger(source, 5)
		
			exports.cr_global:applyAnimation(source, "VENDING", "VEND_Drink_P", 4000, false, true, true)
			triggerEvent('sendAme', source, "bir kupa kahve içer.")
			takeItemFromSlot(source, itemSlot)
		elseif (itemID==88) then -- earpiece
			outputChatBox("You can use this earpiece with an radio.", source, 255, 194, 14)
		elseif (itemID==89) then -- Generic Food
			giveHunger(source, math.random(30, 50))
			takeThirst(source, 5)
			
			exports.cr_global:applyAnimation(source, "food", "eat_burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "bir " .. itemName .. " yer.")
			takeItemFromSlot(source, itemSlot)
		elseif (itemID==91) then
			takeItemFromSlot(source, itemSlot)
			triggerEvent('sendAme', source, "drinks some good Eggnog.")
		elseif (itemID==92) then
			exports.cr_global:applyAnimation(source, "FOOD", "EAT_Burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "yasaklı yiyeceği yer.")
			takeItemFromSlot(source, itemSlot)
		elseif (itemID==93) then
			giveHunger(source, 15)
			takeThirst(source, 5)
			
			exports.cr_global:applyAnimation(source, "FOOD", "EAT_Burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "biraz puding yer.")
			takeItemFromSlot(source, itemSlot)
		elseif (itemID==94) then

			local id = math.random(1, 10)
			local prizeID = presents[id]
			takeItemFromSlot(source, itemSlot)
			giveItem(source, prizeID, 1)
			triggerEvent('sendAme', source, "opens a Christmas Present")
		elseif (itemID==95) then -- Generic Drink
			giveThirst(source, math.random(30, 50))
		
			exports.cr_global:applyAnimation(source, "VENDING", "VEND_Drink_P", 4000, false, true, true)
			triggerEvent('sendAme', source, "biraz " .. itemName .. " içer.")
			takeItemFromSlot(source, itemSlot)
		elseif (itemID==96) then -- PDA
			triggerEvent('sendAme', source, "turns their " .. (itemValue == 1 and "PDA" or itemValue) .. " on.")
			triggerClientEvent(source, "useCompItem", source)
		elseif (itemID==97) then -- SFES Procedures Manual (book)
			local bookTitle = "SFES Procedure Manual"
			local bookName = "SFESProcedureManual"
			triggerEvent('sendAme', source, "reads " ..  bookTitle  .. ".")
			triggerClientEvent(source, "showBook", source, bookName, bookTitle)
		elseif (itemID==98) then -- Garage Remote
			local id = tonumber(itemValue)
			if id and id >= 0 and id <= 49 then
				setGarageOpen(itemValue, not isGarageOpen(itemValue))

				local garages = {}
				for i = 0, 49 do
					garages[i] = isGarageOpen(i)
				end
				mysql:query_free("UPDATE settings SET value = '" .. mysql:escape_string(toJSON(garages)) .. "' WHERE name = 'garagestates'")
			end
		elseif (itemID==99) then --[ADDED: 2/22/10 by herbjr] tray
			giveHunger(source, 70)
			takeThirst(source, 15)
			
			exports.cr_global:applyAnimation(source, "food", "eat_burger", 4000, false, true, true)
			toggleAllControls(source, true, true, true)
			triggerClientEvent(source, "onClientPlayerWeaponCheck", source)
			triggerEvent('sendAme', source, "tepsideki yemeği yer.")
			takeItemFromSlot(source, itemSlot)
		elseif (itemID==100) then --[ADDED: 2/22/10 by herbjr] milk
			giveHealth(source, 15)
			giveThirst(source, 40)
			giveHunger(source, 5)
			
			exports.cr_global:applyAnimation(source, "VENDING", "VEND_Drink_P", 4000, false, true, true)
			toggleAllControls(source, true, true, true)
			triggerClientEvent(source, "onClientPlayerWeaponCheck", source)
			triggerEvent('sendAme', source, "bir küçük şişe süt içer.")
			takeItemFromSlot(source, itemSlot)
		elseif (itemID==101) then --[ADDED: 2/22/10 by herbjr] juice
			giveHealth(source, 5)
			giveThirst(source, 60)
			
			exports.cr_global:applyAnimation(source, "VENDING", "VEND_Drink_P", 4000, false, true, true)
			toggleAllControls(source, true, true, true)
			triggerClientEvent(source, "onClientPlayerWeaponCheck", source)
			triggerEvent('sendAme', source, "bir küçük şişe meyve suyu içer.")
			takeItemFromSlot(source, itemSlot)
		elseif (itemID==102) then --[ADDED: 2/23/10 by herbjr] Cabbage (Asked for by Misha)
			giveHealth(source, 15)
			giveHunger(source, 40)
			takeThirst(source, 20)
			
			exports.cr_global:applyAnimation(source, "food", "eat_burger", 4000, false, true, true)
			toggleAllControls(source, true, true, true)
			triggerClientEvent(source, "onClientPlayerWeaponCheck", source)
			triggerEvent('sendAme', source, "bir parça Kabak yer.")
			takeItemFromSlot(source, itemSlot)
		elseif (itemID==104) then -- portable TV
			triggerEvent("useTV", source, source)
			local isTvUsed = getElementData(source, "isTvUsed")
			if isTvUsed == nil or isTvUsed == false then
				triggerEvent('sendAme', source, "turns on a small portable TV.")
				setElementData(source, "isTvUsed", true, false)
			else
				setElementData(source, "isTvUsed", false, false)
			end
		elseif (itemID == 105) then -- Pack of cigarettes. Withdraw one if it still has one
			if (itemValue > 0) then
				if (hasSpaceForItem(source, 106, 1)) then
					takeItemFromSlot(source, itemSlot)
					giveItem(source, itemID, itemValue - 1)
					giveItem(source, 106, 1)
					triggerEvent('sendAme', source, "sigara paketinin içine bakar ve bir tane çıkarır.")
				else
					outputChatBox("Your Inventory is full.", source, 255, 0, 0)
				end
			else
				triggerEvent('sendAme', source, "looks inside their pack of cigarettes. It's empty.")
			end
		elseif (itemID == 106) then -- Cigarette
			if hasItem(source, 107) then
				triggerEvent('sendAme', source, "bir sigara yakar.")
				outputChatBox("[!]#FFFFFF Sigarayı atmak için '/sigaraat', Elindeki sigarayı değişmek için '/sigaradegistir' komutlarını kullanabilirsiniz.", source, 0, 0, 255, true)
				triggerEvent("realism:startsmoking", source, 0)
				takeItemFromSlot(source, itemSlot)
			else
				triggerEvent('sendAme', source, "herkese bir sigara gösterir.")
				outputChatBox("[!]#FFFFFF Sigara yakmak için bir çakmağa ihtiyacın var.", source, 255, 0, 0, true)
			end
		elseif (itemID == 107) then
			triggerEvent('sendAme', source, "herkese bir çakmak gösterir.")
		elseif (itemID==108) then -- donut
			giveHealth(source, -5)
			
			giveHunger(source, 35)
			takeThirst(source, 7)
			
			exports.cr_global:applyAnimation(source, "FOOD", "EAT_Burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "bir pankek yer.")
			takeItemFromSlot(source, itemSlot)
		elseif (itemID==109) or (itemID==110) then -- Fruit
			giveHealth(source, 5)
			
			giveHunger(source, 25)
			takeThirst(source, 7)
			
			exports.cr_global:applyAnimation(source, "food", "eat_burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "bir " .. itemName .. " yer.")
			takeItemFromSlot(source, itemSlot)
		elseif (itemID == 113) then -- Pack of glowsticks, Withdraw one if it still has one
			if (itemValue > 0) then
				if (hasSpaceForItem(source, 28, 1)) then
					glowStickColour = 1 + ((glowStickColour or 0) + 1) % 7

					takeItemFromSlot(source, itemSlot)
					giveItem(source, itemID, itemValue - 1)
					giveItem(source, 28, glowStickColour)
					triggerEvent('sendAme', source, "looks inside their pack of glowsticks, sliding one out.")
				else
					outputChatBox("Your Inventory is full.", source, 255, 0, 0)
				end
			else
				triggerEvent('sendAme', source, "looks inside their pack of glowsticks. It's empty.")
			end
		elseif itemID == 114 then
			local vehicle = getPedOccupiedVehicle(source)
			local noUpgrades = { Boat = true, Helicopter = true, Plane = true, Train = true, BMX = true }

			if vehicle and not noUpgrades[getVehicleType(vehicle)] --[[and getElementDimension(vehicle) > 0]] and getItemDescription(itemID, itemValue) ~= "?" then
				addUpgrade(source, vehicle, itemSlot, itemID, itemValue)
			else
				outputChatBox("Use this in a vehicle to add it as permanent upgrade.", source, 255, 194, 14)
			end
		elseif itemID == 126 then
			outputChatBox("Nice duty belt you got there. ;)", source, 0, 255, 0)
		elseif itemID == 130 then
			outputChatBox("Place this alarm system in a vehicle inventory to install it.", source, 0, 255, 0)
		elseif itemID == 132 then
			takeItemFromSlot(source, itemSlot)
			outputChatBox("You took your " .. itemValue .. " prescription.", source)
			triggerEvent('sendAme', source, "takes some prescription medicine.")
			exports.cr_global:applyAnimation(source, "VENDING", "VEND_Drink_P", 4000, false, true, true)
		elseif itemID == 134 then
			--outputChatBox("$" .. exports.cr_global:formatMoney(itemValue) .. " of currency.", source)
		elseif itemID == 137 then -- New snake cam, Adams
			executeCommandHandler('snakecam', source)
		elseif itemID == 138 then
			outputChatBox("Place this device in a vehicle inventory to install it.", source, 0, 255, 0)
		elseif itemID == 160 then -- Briefcase
			--triggerEvent("artifacts:toggle", source, source, "briefcase")
		elseif itemID == 163 then
			triggerEvent("artifacts:toggle", source, source, "dufflebag")
	    elseif itemID == 254 then
			--triggerEvent("artifacts:toggle", source, source, "yilbasiSapka")
		elseif itemID == 255 then
			--triggerEvent("artifacts:toggle", source, source, "gozlukTak1")
		elseif itemID == 256 then
			--triggerEvent("artifacts:toggle", source, source, "gozlukTak2")
		elseif itemID == 257 then
			--triggerEvent("artifacts:toggle", source, source, "polisSapka")
		elseif itemID == 258 then
			--triggerEvent("artifacts:toggle", source, source, "polisCap1")
		elseif itemID == 259 then
			--triggerEvent("artifacts:toggle", source, source, "ozelSapka1")
		elseif itemID == 260 then
			--triggerEvent("artifacts:toggle", source, source, "bereSapka1")
		elseif itemID == 261 then
			--triggerEvent("artifacts:toggle", source, source, "bereSapka2")
		elseif itemID == 262 then
			--triggerEvent("artifacts:toggle", source, source, "kisSapka1")
		elseif itemID == 263 then	
		       --triggerEvent("artifacts:toggle", source, source, "gozlukTak3")
		elseif itemID == 264 then
			--triggerEvent("artifacts:toggle", source, source, "gozlukTak4")
		elseif itemID == 265 then
			--triggerEvent("artifacts:toggle", source, source, "gozlukTak5")
		elseif itemID == 266 then
			--triggerEvent("artifacts:toggle", source, source, "motorcuKask1")
		elseif itemID == 267 then
			--triggerEvent("artifacts:toggle", source, source, "motorcuKaski2")
		elseif itemID == 287 then
			--triggerEvent("artifacts:toggle", source, source, "atkafasi")
		elseif itemID == 268 then
			--triggerEvent("artifacts:toggle", source, source, "siyahsapka1")
		elseif itemID == 293 then
			--triggerEvent("artifacts:toggle", source, source, "mask")
		elseif itemID == 294 then
			--triggerEvent("artifacts:toggle", source, source, "turkes")
		elseif itemID == 162 then
			--triggerEvent("artifacts:toggle", source, source, "kevlar")
		elseif badges[itemID] then
			toggleBadge(source, badges, itemID ,itemValue)
		elseif masks[itemID] then
			if isTimer(spamTimerMasks[source]) then return end
			if getElementData(source, "vip") > 0 then
				local data = masks[itemID]
				local mask = getElementData(source, data[1])

				if mask then
					-- triggerEvent('sendAme', source, data[3]:gsub("#name",itemName) .. ".")
					setElementData(source, data[1], false, true)

					if itemID == 90 then -- Helmet
						triggerEvent("artifacts:remove", source, source, "helmet")
					elseif itemID == 26 then -- Gas mask
						triggerEvent("artifacts:remove", source, source, "gasmask")
					elseif itemID == 254 then 
						triggerEvent("artifacts:remove", source, source, "yilbasiSapka")
					elseif itemID == 171 then -- Biker Helmet
						triggerEvent("artifacts:remove", source, source, "bikerhelmet")
					elseif itemID == 172 then -- Full Face Helmet
						triggerEvent("artifacts:remove", source, source, "fullfacehelmet")
					end
				elseif getPedOccupiedVehicle(source) and getElementData(getPedOccupiedVehicle(source), "job") > 0 and getVehicleOccupant(getPedOccupiedVehicle(source)) == source then
					outputChatBox("You can't use this in a Civilian vehicle.", source, 255, 0, 0)
				else
					-- triggerEvent('sendAme', source, data[2]:gsub("#name",itemName)  .. ".")
					setElementData(source, data[1], true, true)

					if itemID == 90 then -- Helmet
						if getElementData(source, "bikerhelmet") then
							setElementData(source, "bikerhelmet", false, true)
							triggerEvent("artifacts:remove", source, source, "bikerhelmet")
						end
						if getElementData(source, "fullfacehelmet") then
							setElementData(source, "fullfacehelmet", false, true)
							triggerEvent("artifacts:remove", source, source, "fullfacehelmet")
						end
						local customTexture = getItemTexture(itemID, itemValue)
						triggerEvent("artifacts:add", source, source, "helmet", false, customTexture)
					elseif itemID == 26 then -- Gas mask
						triggerEvent("artifacts:add", source, source, "gasmask")
					elseif itemID == 254 then
						triggerEvent("artifacts:add", source, source, "yilbasiSapka")
					elseif itemID == 171 then -- Biker Helmet
						if getElementData(source, "helmet") then
							setElementData(source, "helmet", false, true)
							triggerEvent("artifacts:remove", source, source, "helmet")
						end
						if getElementData(source, "fullfacehelmet") then
							setElementData(source, "fullfacehelmet", false, true)
							triggerEvent("artifacts:remove", source, source, "fullfacehelmet")
						end
						local customTexture = getItemTexture(itemID, itemValue)
						triggerEvent("artifacts:add", source, source, "bikerhelmet", false, customTexture)
					elseif itemID == 172 then -- Full Face Helmet
						if getElementData(source, "helmet") then
							setElementData(source, "helmet", false, true)
							triggerEvent("artifacts:remove", source, source, "helmet")
						end
						if getElementData(source, "bikerhelmet") then
							setElementData(source, "bikerhelmet", false, true)
							triggerEvent("artifacts:remove", source, source, "bikerhelmet")
						end
						local customTexture = getItemTexture(itemID, itemValue)
						triggerEvent("artifacts:add", source, source, "fullfacehelmet", false, customTexture)
					end
				end
			else
				outputChatBox("[!]#FFFFFF Maske takmak için VIP üyeliğine ihtiyacınız var.", source, 255, 0, 0, true)
			end
			spamTimerMasks[source] = setTimer(function() end, 1000, 1)
		elseif itemID == 139 then
			outputChatBox("((Bu objeyi aracınızın envanterine ekleyin.))", source, 255, 0, 0)
		elseif itemID == 143 then
			outputChatBox("Place this device in a vehicle inventory to install it.", source, 0, 255, 0)
		elseif itemID == 145 then
			outputChatBox("Broken.", source, 255, 0, 0)
		elseif itemID == 173 then
			local px, py, pz = getElementPosition (source)
			local distance = getDistanceBetweenPoints3D(px, py, pz, 1152.0625, -1757.287109375, 13.647765159607)
			if distance < 25 then
				triggerClientEvent(source, "build_carsale_gui", source)
			else
				outputChatBox("Aracınızı satmanız için aracınızın noterin önünde olması, aracınızın içerisinde olmanız", source, 0, 255, 0)
				outputChatBox("ve alıcının yanınızda olması gerekir.", source, 0, 255, 0)
			end
		elseif itemID == 151 then
            local px, py, pz = getElementPosition (source)

            for i,v in ipairs (getElementsByType ("object")) do
                local x, y, z = getElementPosition (v)
                local distance = getDistanceBetweenPoints3D (px, py, pz, x, y, z)

                if distance < 30 and getElementData (v, "dbid") == tonumber (itemValue) and not getElementData (v, "lift.moving") then
                    local lift = getElementData (v, "lift")
                    local lx, ly, lz = getElementPosition (lift)

                    setElementData (v, "lift.moving", true)

                    if not getElementData (v, "lift.up") then
                        setElementData (v, "lift.up", true)
                        moveObject (lift, 4000, lx, ly, lz + 2.33)
                        triggerEvent('sendAme',  source, "presses the button on the ramp controls raising the car lift")
                        mysql:query_free ("UPDATE ramps SET state = 1 WHERE id = " .. getElementData (v, "dbid"))
                    else
                        setElementData (v, "lift.up", false)
                        moveObject (lift, 4000, lx, ly, lz - 2.33)
                        triggerEvent('sendAme',  source, "presses the button on the ramp controls lowering the car lift")
                        mysql:query_free ("UPDATE ramps SET state = 0 WHERE id = " .. getElementData (v, "dbid"))
                    end

                    setTimer (setElementData, 4000, 1, v, "lift.moving", false)
                end
            end
        elseif itemID == 181 then
        	triggerEvent("sendAme", source, "herkese bir Sigara Paketi gösterir.")
    	elseif (itemID == 182) then
            if hasItem(source, 107) then
				triggerEvent('sendAme', source, "bir sigara yakar.")
				outputChatBox("[!]#FFFFFF Sigarayı atmak için '/sigaraat', Elindeki sigarayı değişmek için '/sigaradegistir' komutlarını kullanabilirsiniz.", source, 0, 0, 255, true)
				triggerEvent("realism:startsmoking", source, 0)
				takeItemFromSlot(source, itemSlot)
				setPedArmor(source, getPedArmor(source) + 20)
			else
				triggerEvent('sendAme', source, "herkese bir sigara gösterir.")
				outputChatBox("[!]#FFFFFF Sigara yakmak için bir çakmağa ihtiyacın var.", source, 255, 0, 0, true)
			end
        elseif (itemID == 209) then
        	triggerEvent("gunlicense:weaponlicenses", root, source)
		elseif (itemID==210) then -- Coca-Cola Christmas Edition
			--if(getElementData(source,"drinking")) then
			--	return
			--end
			--setElementData(source, "drinking", true)
			if cokeBottles[source] then
				return
			end
			takeItemFromSlot(source, itemSlot)
			local x, y, z = getElementPosition(source)
			local int = getElementInterior(source)
			local dim = getElementDimension(source)
			local bottleObj = createObject(2880, x, y, z)
			cokeBottles[source] = bottleObj
			setElementInterior(bottleObj, int)
			setElementDimension(bottleObj, dim)
			setObjectScale(bottleObj, 1)
			setElementDoubleSided(bottleObj, false)
			exports.cr_boneattach:attachElementToBone(bottleObj,source,11,0,0,0,0,0,0)
			thePlayer = source
			setTimer(function()
				exports.cr_global:applyAnimation(thePlayer, "VENDING", "VEND_Drink_P", 4000, false, true, true)
				toggleAllControls(thePlayer, true, true, true)
				triggerClientEvent(thePlayer, "onClientPlayerWeaponCheck", thePlayer)
				exports.cr_global:sendLocalMeAction(thePlayer, "drinks a coke.")
				setTimer(giveHealth,4000,1,thePlayer,5)
				--setTimer(christmasCoke,4000,1,thePlayer) --DISABLE THIS LINE WHEN ITS NOT CHRISTMAS OR XMAS RESOUCE NOT RUNNING
				--setTimer(destroyElement,5000,1,bottleObj)
				setTimer(function()
					destroyElement(cokeBottles[thePlayer])
				end,4000,1)
				setTimer(function()
					cokeBottles[thePlayer] = nil
				end,5000,1)
				--setTimer(setElementData,6000,1,thePlayer,"drinking",false)
			end,3000,1)
			return
		elseif (itemID==213) then --pinnekjott
			giveHealth(source, 10)
			exports.cr_global:applyAnimation(source, "FOOD", "EAT_Burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "eats a pinnekjott.")
			takeItemFromSlot(source, itemSlot)
			--local thisAnimFunc = exports.cr_global:applyAnimation
			setTimer(function()
				exports.cr_global:applyAnimation(source, "BSKTBALL", "BBALL_Jump_Shot", 4000, false, true, true)
			end, 5000, 1)
			if getResourceState(getResourceFromName("cr_xmas")) == "running" then
				setTimer(triggerClientEvent, 7000, 1, "xmas:santaSound", root, "hoho", source)
			end
		elseif (itemID==214) then
			triggerEvent('sendAme', source, "takes a " ..  itemName  .. ".")
			takeItemFromSlot(source, itemSlot)
		elseif (itemID>=452) and (itemID<=503) then
			exports["cr_wearable"]:triggerWearableSystem(source, itemID, itemSlot)
		elseif (itemID==226) then
			if not (getElementData(source, "Atatürk Bayrağı")) then
				bayrak = createObject(2914, 0, 0, 0, 0, 180, 0, true)
				local texture = getItemTexture(226, itemValue)
				if texture then
					for k,v in ipairs(texture) do
						exports["cr_item-texture"]:addTexture(bayrak, v[2], v[1])
					end
				end
				--exports.cr_boneattach:attachElementToBone(bayrak, source, 11, 0, 0, 0, 0, 180, 100)
				exports.cr_boneattach:attachElementToBone(bayrak, source, 12, 0, 0, 0, 0, 200, 30)
				triggerEvent("sendLocalMeAction", root, source, "eline bir " .. getItemName(226, itemValue) .. " alır.")
				setElementData(source, "Atatürk Bayrağı", bayrak)
			else				
				local bayrak = getElementData(source, "Atatürk Bayrağı")
				exports.cr_boneattach:detachElementFromBone(bayrak)
				destroyElement(bayrak)
				bayrak = nil
				setElementData(source, "Atatürk Bayrağı", false)
				triggerEvent("sendLocalMeAction", root, source, "elindeki " .. getItemName(226, itemValue) .. " objesini bırakır.")
			end
		elseif itemID == 228 then -- Photo camera
			triggerEvent("camera_showPhoto", source, itemValue)
		elseif (itemID >= 231 and itemID <= 233) then -- ÇAY, KUŞBURNU, ORALET
			giveHealth(source, 10)
			
			giveThirst(source, 40)
			takeHunger(source, 3)
			
			exports.cr_global:applyAnimation(source, "VENDING", "VEND_Drink_P", 4000, false, true, true)
			if itemID == 231 then
				triggerEvent('sendAme', source, "bir bardak sıcak çay içer.")
			elseif itemID == 232 then
				triggerEvent('sendAme', source, "bir bardak sıcak oralet içer.")
			elseif itemID == 233 then
				triggerEvent('sendAme', source, "bir bardak sıcak kuşburnu içer.")
			end
			takeItemFromSlot(source, itemSlot)
		--------------------------------------------------- OCAKBAŞI
		elseif (itemID == 234) then -- TAVUK DÖNER DÜRÜM
			giveHunger(source, 40)
			takeThirst(source, 10)
			
			exports.cr_global:applyAnimation(source, "FOOD", "EAT_Burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "bir tavuk döner dürümü yer.")
			takeItemFromSlot(source, itemSlot)	
		elseif (itemID == 235) then -- TAVUK DÖNER PORSİYON
			giveHunger(source, 55)
			takeThirst(source, 7)
			
			exports.cr_global:applyAnimation(source, "FOOD", "EAT_Burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "bir porsiyon tavuk döner yer.")
			takeItemFromSlot(source, itemSlot)	
		elseif (itemID == 236) then -- ET DÖNER DÜRÜM
			giveHunger(source, 45)
			takeThirst(source, 10)
			
			exports.cr_global:applyAnimation(source, "FOOD", "EAT_Burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "bir et döner dürümü yer.")
			takeItemFromSlot(source, itemSlot)		
		elseif (itemID == 237) then -- ET DÖNER PORSİYON
			giveHunger(source, 55)
			takeThirst(source, 7)
			
			exports.cr_global:applyAnimation(source, "FOOD", "EAT_Burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "bir porsiyon et döner yer.")
			takeItemFromSlot(source, itemSlot)	
		elseif (itemID == 238) then -- ADANA KEBAP DÜRÜM
			giveHunger(source, 50)
			takeThirst(source, 10)
			
			exports.cr_global:applyAnimation(source, "FOOD", "EAT_Burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "bir adana döner dürümü yer.")
			takeItemFromSlot(source, itemSlot)	
		elseif (itemID == 239) then -- ADANA KEBAP PORSİYON
			giveHunger(source, 60)
			takeThirst(source, 13)
			
			exports.cr_global:applyAnimation(source, "FOOD", "EAT_Burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "bir porsiyon döner dürümü yer.")
			takeItemFromSlot(source, itemSlot)	
		elseif (itemID == 240) then -- BEYTİ
			giveHunger(source, 70)
			takeThirst(source, 10)
			
			exports.cr_global:applyAnimation(source, "FOOD", "EAT_Burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "bir porsiyon beyti yer.")
			takeItemFromSlot(source, itemSlot)	
		elseif (itemID == 241) then -- KUZU ŞİŞ DÜRÜM
			giveHunger(source, 50)
			takeThirst(source, 7)
			
			exports.cr_global:applyAnimation(source, "FOOD", "EAT_Burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "bir kuzu şiş dürüm yer.")
			takeItemFromSlot(source, itemSlot)		
		elseif (itemID == 242) then -- KUZU ŞİŞ PORSİYON
			giveHunger(source, 70)
			takeThirst(source, 10)
			
			exports.cr_global:applyAnimation(source, "FOOD", "EAT_Burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "bir porsiyon kuzu şiş yer.")
			takeItemFromSlot(source, itemSlot)			
		elseif (itemID == 243) then -- PİRZOLA PORSİYON
			giveHunger(source, 70)
			takeThirst(source, 7)
			
			exports.cr_global:applyAnimation(source, "FOOD", "EAT_Burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "bir porsiyon pirzola yer.")
			takeItemFromSlot(source, itemSlot)		
		elseif (itemID == 244) then -- KUZU CİĞER ŞİŞ DÜRÜM
			giveHunger(source, 60)
			takeThirst(source, 7)
			
			exports.cr_global:applyAnimation(source, "FOOD", "EAT_Burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "bir kuzu ciğer şiş dürüm yer.")
			takeItemFromSlot(source, itemSlot)		
		elseif (itemID == 245) then -- KUZU CİĞER ŞİŞ PORSİYON
			giveHunger(source, 70)
			takeThirst(source, 10)
			
			exports.cr_global:applyAnimation(source, "FOOD", "EAT_Burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "bir porsiyon kuzu ciğer şiş yer.")
			takeItemFromSlot(source, itemSlot)	
		elseif (itemID == 246) then -- TAVUK ŞİŞ DÜRÜM
			giveHunger(source, 50)
			takeThirst(source, 7)
			
			exports.cr_global:applyAnimation(source, "FOOD", "EAT_Burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "bir tavuk şiş dürümü yer.")
			takeItemFromSlot(source, itemSlot)	
		elseif (itemID == 247) then -- TAVUK ŞİŞ PORSİYON
			giveHunger(source, 60)
			takeThirst(source, 10)
			
			exports.cr_global:applyAnimation(source, "FOOD", "EAT_Burger", 4000, false, true, true)
			triggerEvent('sendAme', source, "bir porsiyon tavuk şiş yer.")
			takeItemFromSlot(source, itemSlot)	
		elseif (itemID == 249) then -- RUHSAT
			triggerEvent("ruhsat:sendVehicleInfo", source, itemValue)
		elseif (itemID >= 410 and itemID <= 416) then
			local result = mysql:query("SELECT * FROM pets WHERE owner=" .. getElementData(client, "dbid"))
			if mysql:num_rows(result) > 1 then
				outputChatBox("[!] #f0f0f0En fazla 1 adet evcil hayvana sahip olabilirsiniz.", client, 255, 0, 0, thePlayer)
			else
				local petModel = 310
				if itemID == 410 then
					petModel = 310
				elseif itemID == 411 then
					petModel = 311
				elseif itemID == 412 then
					petModel = 304
				elseif itemID == 413 then
					petModel = 298
				elseif itemID == 414 then
					petModel = 301
				elseif itemID == 415 then
					petModel = 302
				elseif itemID == 520 then
					petModel = 309
				elseif itemID == 416 then
					petModel = 10
				elseif itemID == 296 then
					petModel = 10
				end
				triggerClientEvent(client, "hayvan:namePet", client, petModel)
				takeItemFromSlot(source, itemSlot)
			end
		elseif (itemID==579) then
			takeItemFromSlot(source, itemSlot)
			setElementHealth(source, 100)
		elseif (itemID==580) then
			takeItemFromSlot(source, itemSlot)
			setPedArmor(source, 100)
		elseif (itemID==581) then
			takeItemFromSlot(source, itemSlot)
			useLuckBox(source, 1)
		elseif (itemID==582) then
			takeItemFromSlot(source, itemSlot)
			useLuckBox(source, 2)
		elseif (itemID==583) then
			takeItemFromSlot(source, itemSlot)
			useLuckBox(source, 3)
		elseif (itemID==584) then
			takeItemFromSlot(source, itemSlot)
			useLuckBox(source, 4)
		elseif (itemID==585) then
			takeItemFromSlot(source, itemSlot)
			useLuckBox(source, 5)
		end
	end
end

addEvent("useItem", true)
addEventHandler("useItem", root, useItem)
addCommandHandler("useitem",
	function(thePlayer, commandName, itemID, ...)
		if tonumber(itemID) then
			local args = {...}
			local itemValue
			if #args > 0 then
				itemValue = table.concat(args, " ")
				itemValue = tonumber(itemValue) or itemValue
			end

			local has, slot = hasItem(thePlayer, tonumber(itemID), itemValue)
			if has then
				triggerEvent("useItem", thePlayer, slot)
			end
		end
	end
)

function useLuckBox(thePlayer, luckBoxID)
	if thePlayer and isElement(thePlayer) and luckBoxID and tonumber(luckBoxID) then
		if luckBoxID == 1 then
			local randomNumber = math.random(1, 10)
			if randomNumber == 1 or randomNumber == 3 or randomNumber == 4 or randomNumber == 5 or randomNumber == 7 or randomNumber == 9 then
				local randomMoney = math.random(50000, 100000)
				exports.cr_global:giveMoney(thePlayer, randomMoney)
				outputChatBox("[!]#FFFFFF Bronz Şans Kutusu açtınız ve " .. exports.cr_global:formatMoney(randomMoney) .. "$ kazandınız!", thePlayer, 0, 255, 0, true)
				triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
			elseif randomNumber == 2 or randomNumber == 6 then
				if not (getElementData(thePlayer, "vip") > 0) then
					local randomVIP = math.random(1, 2)
					if randomVIP == 1 then
						exports.cr_vip:addVIP(thePlayer, 2, 3)
						outputChatBox("[!]#FFFFFF Bronz Şans Kutusu açtınız ve 3 günlük VIP 2 kazandınız!", thePlayer, 0, 255, 0, true)
						triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
					else
						exports.cr_vip:addVIP(thePlayer, 2, 7)
						outputChatBox("[!]#FFFFFF Bronz Şans Kutusu açtınız ve 7 günlük VIP 2 kazandınız!", thePlayer, 0, 255, 0, true)
						triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
					end
				else
					local randomMoney = math.random(50000, 100000)
					exports.cr_global:giveMoney(thePlayer, randomMoney)
					outputChatBox("[!]#FFFFFF Bronz Şans Kutusu açtınız ve " .. exports.cr_global:formatMoney(randomMoney) .. "$ kazandınız!", thePlayer, 0, 255, 0, true)
					triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
				end
			elseif randomNumber == 8 then
				local randomNumber = math.random(1, 3)
				if randomNumber == 2 then
					local characterDatabaseID = getElementData(thePlayer, "account:character:id")
					local serial = exports.cr_global:createWeaponSerial(3, characterDatabaseID, characterDatabaseID)
					local itemValue = "32:" .. serial .. ":" .. getWeaponNameFromID(32)
					if exports.cr_items:hasSpaceForItem(thePlayer, 115, itemValue) then
						exports.cr_global:giveItem(thePlayer, 115, itemValue)
						outputChatBox("[!]#FFFFFF Bronz Şans Kutusu açtınız ve Tec-9 kazandınız!", thePlayer, 0, 255, 0, true)
						triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
					else
						outputChatBox("[!]#FFFFFF Bronz Şans Kutusu açtınız ve Tec-9 kazandınız ama envanteriniz dolu.", thePlayer, 255, 0, 0, true)
						outputChatBox("[!]#FFFFFF Ödülünüzü almak için lütfen discord adresimizden destek talebi açınız.", thePlayer, 255, 0, 0, true)
						playSoundFrontEnd(thePlayer, 4)
					end
				else
					local randomMoney = math.random(50000, 100000)
					exports.cr_global:giveMoney(thePlayer, randomMoney)
					outputChatBox("[!]#FFFFFF Bronz Şans Kutusu açtınız ve " .. exports.cr_global:formatMoney(randomMoney) .. "$ kazandınız!", thePlayer, 0, 255, 0, true)
					triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
				end
			else
				outputChatBox("[!]#FFFFFF Bronz Şans Kutusu açtınız ama kutu boş çıktı.", thePlayer, 255, 0, 0, true)
				playSoundFrontEnd(thePlayer, 4)
			end
		elseif luckBoxID == 2 then
			local randomNumber = math.random(1, 10)
			if randomNumber == 1 or randomNumber == 3 or randomNumber == 4 or randomNumber == 5 or randomNumber == 7 or randomNumber == 9 then
				local randomMoney = math.random(150000, 250000)
				exports.cr_global:giveMoney(thePlayer, randomMoney)
				outputChatBox("[!]#FFFFFF Gümüş Şans Kutusu açtınız ve " .. exports.cr_global:formatMoney(randomMoney) .. "$ kazandınız!", thePlayer, 0, 255, 0, true)
				triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
			elseif randomNumber == 2 or randomNumber == 6 then
				if not (getElementData(thePlayer, "vip") > 0) then
					local randomVIP = math.random(1, 2)
					if randomVIP == 1 then
						exports.cr_vip:addVIP(thePlayer, 2, 15)
						outputChatBox("[!]#FFFFFF Gümüş Şans Kutusu açtınız ve 15 günlük VIP 2 kazandınız!", thePlayer, 0, 255, 0, true)
						triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
					else
						exports.cr_vip:addVIP(thePlayer, 3, 3)
						outputChatBox("[!]#FFFFFF Gümüş Şans Kutusu açtınız ve 3 günlük VIP 3 kazandınız!", thePlayer, 0, 255, 0, true)
						triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
					end
				else
					local randomMoney = math.random(150000, 250000)
					exports.cr_global:giveMoney(thePlayer, randomMoney)
					outputChatBox("[!]#FFFFFF Gümüş Şans Kutusu açtınız ve " .. exports.cr_global:formatMoney(randomMoney) .. "$ kazandınız!", thePlayer, 0, 255, 0, true)
					triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
				end
			elseif randomNumber == 8 then
				local randomNumber = math.random(1, 3)
				if randomNumber == 2 then
					local characterDatabaseID = getElementData(thePlayer, "account:character:id")
					local serial = exports.cr_global:createWeaponSerial(3, characterDatabaseID, characterDatabaseID)
					local itemValue = "29:" .. serial .. ":" .. getWeaponNameFromID(29)
					if hasSpaceForItem(thePlayer, 115, itemValue) then
						exports.cr_global:giveItem(thePlayer, 115, itemValue)
						outputChatBox("[!]#FFFFFF Gümüş Şans Kutusu açtınız ve MP5 kazandınız!", thePlayer, 0, 255, 0, true)
						triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
					else
						outputChatBox("[!]#FFFFFF Gümüş Şans Kutusu açtınız ve MP5 kazandınız ama envanteriniz dolu.", thePlayer, 255, 0, 0, true)
						outputChatBox("[!]#FFFFFF Ödülünüzü almak için lütfen discord adresimizden destek talebi açınız.", thePlayer, 255, 0, 0, true)
						playSoundFrontEnd(thePlayer, 4)
					end
				else
					local randomMoney = math.random(150000, 250000)
					exports.cr_global:giveMoney(thePlayer, randomMoney)
					outputChatBox("[!]#FFFFFF Gümüş Şans Kutusu açtınız ve " .. exports.cr_global:formatMoney(randomMoney) .. "$ kazandınız!", thePlayer, 0, 255, 0, true)
					triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
				end
			else
				outputChatBox("[!]#FFFFFF Gümüş Şans Kutusu açtınız ama kutu boş çıktı.", thePlayer, 255, 0, 0, true)
				playSoundFrontEnd(thePlayer, 4)
			end
		elseif luckBoxID == 3 then
			local randomNumber = math.random(1, 10)
			if randomNumber == 1 or randomNumber == 3 or randomNumber == 4 or randomNumber == 5 or randomNumber == 7 or randomNumber == 9 then
				local randomMoney = math.random(300000, 500000)
				exports.cr_global:giveMoney(thePlayer, randomMoney)
				outputChatBox("[!]#FFFFFF Altın Şans Kutusu açtınız ve " .. exports.cr_global:formatMoney(randomMoney) .. "$ kazandınız!", thePlayer, 0, 255, 0, true)
				triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
			elseif randomNumber == 2 or randomNumber == 6 then
				if not (getElementData(thePlayer, "vip") > 0) then
					local randomVIP = math.random(1, 2)
					if randomVIP == 1 then
						exports.cr_vip:addVIP(thePlayer, 3, 7)
						outputChatBox("[!]#FFFFFF Altın Şans Kutusu açtınız ve 7 günlük VIP 3 kazandınız!", thePlayer, 0, 255, 0, true)
						triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
					else
						exports.cr_vip:addVIP(thePlayer, 3, 15)
						outputChatBox("[!]#FFFFFF Altın Şans Kutusu açtınız ve 15 günlük VIP 3 kazandınız!", thePlayer, 0, 255, 0, true)
						triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
					end
				else
					local randomMoney = math.random(300000, 500000)
					exports.cr_global:giveMoney(thePlayer, randomMoney)
					outputChatBox("[!]#FFFFFF Altın Şans Kutusu açtınız ve " .. exports.cr_global:formatMoney(randomMoney) .. "$ kazandınız!", thePlayer, 0, 255, 0, true)
					triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
				end
			elseif randomNumber == 8 then
				local randomNumber = math.random(1, 3)
				if randomNumber == 2 then
					local characterDatabaseID = getElementData(thePlayer, "account:character:id")
					local serial = exports.cr_global:createWeaponSerial(3, characterDatabaseID, characterDatabaseID)
					local itemValue = "30:" .. serial .. ":" .. getWeaponNameFromID(30)
					if hasSpaceForItem(thePlayer, 115, itemValue) then
						exports.cr_global:giveItem(thePlayer, 115, itemValue)
						outputChatBox("[!]#FFFFFF Altın Şans Kutusu açtınız ve AK47 kazandınız!", thePlayer, 0, 255, 0, true)
						triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
					else
						outputChatBox("[!]#FFFFFF Altın Şans Kutusu açtınız ve AK47 kazandınız ama envanteriniz dolu.", thePlayer, 255, 0, 0, true)
						outputChatBox("[!]#FFFFFF Ödülünüzü almak için lütfen discord adresimizden destek talebi açınız.", thePlayer, 255, 0, 0, true)
						playSoundFrontEnd(thePlayer, 4)
					end
				else
					local randomMoney = math.random(300000, 500000)
					exports.cr_global:giveMoney(thePlayer, randomMoney)
					outputChatBox("[!]#FFFFFF Altın Şans Kutusu açtınız ve " .. exports.cr_global:formatMoney(randomMoney) .. "$ kazandınız!", thePlayer, 0, 255, 0, true)
					triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
				end
			else
				outputChatBox("[!]#FFFFFF Altın Şans Kutusu açtınız ama kutu boş çıktı.", thePlayer, 255, 0, 0, true)
				playSoundFrontEnd(thePlayer, 4)
			end
		elseif luckBoxID == 4 then
			local randomNumber = math.random(1, 10)
			if randomNumber == 1 or randomNumber == 3 or randomNumber == 4 or randomNumber == 5 or randomNumber == 7 or randomNumber == 9 then
				local randomMoney = math.random(550000, 750000)
				exports.cr_global:giveMoney(thePlayer, randomMoney)
				outputChatBox("[!]#FFFFFF Elmas Şans Kutusu açtınız ve " .. exports.cr_global:formatMoney(randomMoney) .. "$ kazandınız!", thePlayer, 0, 255, 0, true)
				triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
			elseif randomNumber == 2 or randomNumber == 6 then
				if not (getElementData(thePlayer, "vip") > 0) then
					local randomVIP = math.random(1, 2)
					if randomVIP == 1 then
						exports.cr_vip:addVIP(thePlayer, 4, 3)
						outputChatBox("[!]#FFFFFF Elmas Şans Kutusu açtınız ve 3 günlük VIP 4 kazandınız!", thePlayer, 0, 255, 0, true)
						triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
					else
						exports.cr_vip:addVIP(thePlayer, 4, 7)
						outputChatBox("[!]#FFFFFF Elmas Şans Kutusu açtınız ve 7 günlük VIP 4 kazandınız!", thePlayer, 0, 255, 0, true)
						triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
					end
				else
					local randomMoney = math.random(550000, 750000)
					exports.cr_global:giveMoney(thePlayer, randomMoney)
					outputChatBox("[!]#FFFFFF Elmas Şans Kutusu açtınız ve " .. exports.cr_global:formatMoney(randomMoney) .. "$ kazandınız!", thePlayer, 0, 255, 0, true)
					triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
				end
			elseif randomNumber == 8 then
				local randomNumber = math.random(1, 3)
				if randomNumber == 2 then
					local characterDatabaseID = getElementData(thePlayer, "account:character:id")
					local serial = exports.cr_global:createWeaponSerial(3, characterDatabaseID, characterDatabaseID)
					local itemValue = "31:" .. serial .. ":" .. getWeaponNameFromID(31)
					if hasSpaceForItem(thePlayer, 115, itemValue) then
						exports.cr_global:giveItem(thePlayer, 115, itemValue)
						outputChatBox("[!]#FFFFFF Elmas Şans Kutusu açtınız ve M4 kazandınız!", thePlayer, 0, 255, 0, true)
						triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
					else
						outputChatBox("[!]#FFFFFF Elmas Şans Kutusu açtınız ve M4 kazandınız ama envanteriniz dolu.", thePlayer, 255, 0, 0, true)
						outputChatBox("[!]#FFFFFF Ödülünüzü almak için lütfen discord adresimizden destek talebi açınız.", thePlayer, 255, 0, 0, true)
						playSoundFrontEnd(thePlayer, 4)
					end
				else
					local randomMoney = math.random(550000, 750000)
					exports.cr_global:giveMoney(thePlayer, randomMoney)
					outputChatBox("[!]#FFFFFF Elmas Şans Kutusu açtınız ve " .. exports.cr_global:formatMoney(randomMoney) .. "$ kazandınız!", thePlayer, 0, 255, 0, true)
					triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
				end
			else
				outputChatBox("[!]#FFFFFF Elmas Şans Kutusu açtınız ama kutu boş çıktı.", thePlayer, 255, 0, 0, true)
				playSoundFrontEnd(thePlayer, 4)
			end
		elseif luckBoxID == 5 then
			local randomNumber = math.random(1, 10)
			if randomNumber == 1 or randomNumber == 3 or randomNumber == 4 or randomNumber == 5 or randomNumber == 9 then
				local randomMoney = math.random(500000, 1000000)
				exports.cr_global:giveMoney(thePlayer, randomMoney)
				outputChatBox("[!]#FFFFFF Yılbaşı Kutusu açtınız ve " .. exports.cr_global:formatMoney(randomMoney) .. "$ kazandınız!", thePlayer, 0, 255, 0, true)
				triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
			elseif randomNumber == 2 or randomNumber == 6 then
				if not (getElementData(thePlayer, "vip") > 0) then
					local randomVIP = math.random(1, 2)
					if randomVIP == 1 then
						local randomVIP = math.random(3, 4)
						local randomDay = math.random(1, 7)
						exports.cr_vip:addVIP(thePlayer, randomVIP, randomDay)
						outputChatBox("[!]#FFFFFF Yılbaşı Kutusu açtınız ve " .. randomDay .. " günlük VIP " .. randomVIP .. " kazandınız!", thePlayer, 0, 255, 0, true)
						triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
					else
						local randomMoney = math.random(500000, 1000000)
						exports.cr_global:giveMoney(thePlayer, randomMoney)
						outputChatBox("[!]#FFFFFF Yılbaşı Kutusu açtınız ve " .. exports.cr_global:formatMoney(randomMoney) .. "$ kazandınız!", thePlayer, 0, 255, 0, true)
						triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
					end
				else
					local randomMoney = math.random(500000, 1000000)
					exports.cr_global:giveMoney(thePlayer, randomMoney)
					outputChatBox("[!]#FFFFFF Yılbaşı Kutusu açtınız ve " .. exports.cr_global:formatMoney(randomMoney) .. "$ kazandınız!", thePlayer, 0, 255, 0, true)
					triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
				end
			elseif randomNumber == 7 then
				local randomBalance = math.random(5, 10)
				setElementData(thePlayer, "balance", getElementData(thePlayer, "balance") + randomBalance)
				dbExec(mysql:getConnection(), "UPDATE accounts SET balance = ? WHERE id = ?", getElementData(thePlayer, "balance"), getElementData(thePlayer, "account:id"))
				outputChatBox("[!]#FFFFFF Yılbaşı Kutusu açtınız ve " .. randomBalance .. " TL bakiye kazandınız!", thePlayer, 0, 255, 0, true)
				triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
			elseif randomNumber == 8 then
				local characterDatabaseID = getElementData(thePlayer, "account:character:id")
				local serial = exports.cr_global:createWeaponSerial(3, characterDatabaseID, characterDatabaseID)
				
				local randomWeapon = math.random(1, 4)
				local weapons = {
					[1] = {29, "MP5"},
					[2] = {32, "Tec-9"},
					[3] = {30, "AK47"},
					[4] = {31, "M4"},
				}
				
				local itemValue = weapons[randomWeapon][1] .. ":" .. serial .. ":" .. getWeaponNameFromID(weapons[randomWeapon][1])
				
				if hasSpaceForItem(thePlayer, 115, itemValue) then
					exports.cr_global:giveItem(thePlayer, 115, itemValue)
					outputChatBox("[!]#FFFFFF Yılbaşı Kutusu açtınız ve " .. weapons[randomWeapon][2] .. " kazandınız!", thePlayer, 0, 255, 0, true)
					triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
				else
					outputChatBox("[!]#FFFFFF Yılbaşı Kutusu açtınız ve " .. weapons[randomWeapon][2] .. " kazandınız ama envanteriniz dolu.", thePlayer, 255, 0, 0, true)
					outputChatBox("[!]#FFFFFF Ödülünüzü almak için lütfen discord adresimizden destek talebi açınız.", thePlayer, 255, 0, 0, true)
					playSoundFrontEnd(thePlayer, 4)
				end
			else
				outputChatBox("[!]#FFFFFF Yılbaşı Kutusu açtınız ama kutu boş çıktı.", thePlayer, 255, 0, 0, true)
				playSoundFrontEnd(thePlayer, 4)
			end
		else
			outputChatBox("[!]#FFFFFF Bir sorun oluştu.", thePlayer, 255, 0, 0, true)
			playSoundFrontEnd(thePlayer, 4)
		end
	end
end

local isOpen = false
local colShape = createColSphere(2490.8017578125, -1668.0302734375, 13.34375, 5)

function yilbasiKutuAl(thePlayer, commandName)
	for index, colShape in ipairs(getElementsByType("colshape", resourceRoot)) do
		if isElementWithinColShape(thePlayer, colShape) then
			if isOpen then
				if exports.cr_global:hasMoney(thePlayer, 500000) then
					if hasSpaceForItem(thePlayer, 584, 1) then
						exports.cr_global:takeMoney(thePlayer, 500000)
						exports.cr_global:giveItem(thePlayer, 584, 1)
						outputChatBox("[!]#FFFFFF Başarıyla 1 adet Yılbaşı Kutusu satın aldınız!", thePlayer, 0, 255, 0, true)
						triggerClientEvent(thePlayer, "playSuccessfulSound", thePlayer)
					else
						outputChatBox("[!]#FFFFFF Envanteriniz dolu.", thePlayer, 255, 0, 0, true)
						playSoundFrontEnd(thePlayer, 4)
					end
				else
					outputChatBox("[!]#FFFFFF Yeterli paranız bulunmuyor.", thePlayer, 255, 0, 0, true)
					playSoundFrontEnd(thePlayer, 4)
				end
			else
				outputChatBox("[!]#FFFFFF Yılbaşı Kutusu satın alımları daha başlamadı.", thePlayer, 255, 0, 0, true)
				playSoundFrontEnd(thePlayer, 4)
			end
		end
	end
end
addCommandHandler("ykutual", yilbasiKutuAl, false, false)

function yilbasiKutuAc(thePlayer, commandName)
	if exports.cr_integration:isPlayerDeveloper(thePlayer) then
		outputChatBox("[!]#FFFFFF Yılbaşı Kutusu satın alımları başarıyla " .. (false == isOpen and "açıldı" or "kapatıldı") .. ".", player, 0, 255, 0, true)
		isOpen = false == isOpen and true or false
	else
		outputChatBox("[!]#FFFFFF Bu komutu kullanabilmek için gerekli yetkiye sahip değilsiniz.", thePlayer, 255, 0, 0, true)
		playSoundFrontEnd(thePlayer, 4)
	end
end
--addCommandHandler("ykutuac", yilbasiKutuAc, false, false)

function npcUseItem(element, itemID)
	local source = element
	if itemID then	
		local hasItem, key, itemValue, itemIndex = hasItem(element, tonumber(itemID))
		if (hasItem) then
			local pedname = getElementData(element, "rpp.npc.name")
			if badges[itemID] then
				if (getElementData(source, badges[itemID][1])) then
					setElementData(source, badges[itemID][1], false, true)
					if pedname then
						--exports.cr_global:sendLocalMeAction(source, "removes " .. badges[itemID][2] .. ".")
						exports.cr_global:sendLocalText(source, "* " .. tostring(pedname) .. " removes " .. badges[itemID][2] .. ".", 255, 51, 102, 5)
					end
				else
					for key, badge in pairs (badges) do
						if key ~= itemID then
							if (getElementData (source, badge[1])) then
								setElementData(source, badge[1], false, true)
								if pedname then
									--exports.cr_global:sendLocalMeAction(source, "removes " .. badge[2] .. ".")
									exports.cr_global:sendLocalText(source, "* " .. tostring(pedname) .. " removes " .. badge[2] .. ".", 255, 51, 102, 5)
								end
							end
						end
					end

					setElementData(source, badges[itemID][1], removeOOC(tostring(itemValue)), true)
					if pedname then
						--exports.cr_global:sendLocalMeAction(source, "puts on " .. badges[itemID][2] .. ".")
						exports.cr_global:sendLocalText(source, "* " .. tostring(pedname) .. " puts on " .. badges[itemID][2] .. ".", 255, 51, 102, 5)
					end
					return true
				end
				--exports.cr_global:updateNametagColor(source)
			elseif masks[itemID] then
				local data = masks[itemID]
				local mask = getElementData(source, data[1])

				if mask then
					--exports.cr_global:sendLocalMeAction(source, data[3] .. ".")
					setElementData(source, data[1], false, true)
					if pedname then
						exports.cr_global:sendLocalText(source, "* " .. tostring(pedname) .. " " .. data[3] .. ".", 255, 51, 102, 5)
					end
					return false
				elseif getPedOccupiedVehicle(source) and getElementData(getPedOccupiedVehicle(source), "job") > 0 and getVehicleOccupant(getPedOccupiedVehicle(source)) == source then
					--outputChatBox("You can't use this in a Civilian vehicle.", source, 255, 0, 0)
					return false
				else
					--exports.cr_global:sendLocalMeAction(source, data[2]  .. ".")
					setElementData(source, data[1], true, true)
					if pedname then
						exports.cr_global:sendLocalText(source, "* " .. tostring(pedname) .. " " .. data[2] .. ".", 255, 51, 102, 5)
					end
					return true
				end
			else
				return false
			end
		else
			outputDebugString("The ped does not have that item")
			return false
		end
	end
end

function isBadge(item)
	if badges[item] then
		return true
	else
		return false		
	end
end
function isWearingBadge(element, item)
	if item then
		if isBadge(item) then
			if(getElementData(source, badges[item][1])) then
				return true
			else
				for key, badge in pairs (badges) do
					if key ~= item then
						if (getElementData (source, badge[1])) then
							return true
						end
					end
				end
			end
		end
	else
		for key, badge in pairs (badges) do
			if (getElementData (source, badge[1])) then
				return true
			end
		end		
	end
	return false
end

--[[addEventHandler("onCharacterLogin", root, function()
	if not source then source = client end
	addPlayerArtifacts(source)
end)]]


function explodeFlash(obj)
	local players = exports.cr_global:getNearbyElements(obj, "player")

	destroyElement(obj)
	for key, value in ipairs(players) do
		local gasmask = getElementData(value, "gasmask")

		if not (gasmask) then
			playSoundFrontEnd(value, 47)
			fadeCamera(value, false, 0.5, 255, 255, 255)
			setTimer(cancelEffect, 5000, 1, value)
			setTimer(playSoundFrontEnd, 1000, 1, value, 48)
		end
	end
end

function cancelEffect(thePlayer)
	fadeCamera(thePlayer, true, 6.0)
end

tags = {1524, 1525, 1526, 1527, 1528, 1529, 1530, 1531 }

function destroyGlowStick(marker)
	destroyElement(marker)
end

function destroyItem(itemID)
	if isPedDead(source) or getElementData(source, "injuriedanimation") then return end
	local itemName = ""
	local value = ""
	if itemID and itemID > 0 then
		local itemSlot = itemID
		local item = getItems(source)[itemSlot]
		if item then
			local itemID = item[1]
			local itemValue = item[2]
			value = itemValue

			if itemID == 48 and countItems(source, 48) == 1 then -- backpack
				if getCarriedWeight(source) - getItemWeight(48, 1) > 10 then
					return
				end
			end


			if itemID == 126 and countItems(source, 126) == 1 then -- duty belt
				if getCarriedWeight(source) - getItemWeight(126, 1) > 10 then
					return
				end
			end

			if itemID == 115 then
				outputChatBox("[!]#FFFFFF Silahı silemezsiniz.", source, 255, 0, 0, true)
				playSoundFrontEnd(source, 4)
				return
			end
			
			if itemID == 134 then
				outputChatBox("[!]#FFFFFF Parayı silemezsiniz.", source, 255, 0, 0, true)
				playSoundFrontEnd(source, 4)
				return
			end

			itemName = getItemName(itemID, itemValue)
			takeItemFromSlot(source, itemSlot)

			triggerClientEvent(source, "item:updateclient", source)

			doItemGiveawayChecks(source, itemID)
		else
			return
		end
	else
		if itemID == -100 then
			setPedArmor(source, 0)
			itemName = "Body Armor"
		else
			exports.cr_global:takeWeapon(source, tonumber(-itemID))
			itemName = getWeaponNameFromID(-itemID)
		end
	end
	triggerEvent('sendAme', source, itemName .. " isimli nesneyi çöpe atar.")
	exports.cr_discord:sendMessage("item-log","[ITEM-DELETE] " .. getPlayerName(source) .. " isimli kişi " .. itemName .. " (" .. value .. ") isimli nesneyi çöpe atar.")
end
addEvent("destroyItem", true)
addEventHandler("destroyItem", root, destroyItem)

function isVowel(text)
	if not text or text == "" then
		return false
	end
	text = string.sub(text, 1, 1)
	text = string.lower(text)
	return text == "a" or text == "o" or text == "i" or text == "u" or text == "e"
end

function showItem(itemName)
	if isPedDead(source) or getElementData(source, "injuriedanimation") then return end
	triggerEvent('sendAme', source, "shows everyone " .. (isVowel(itemName) and "an" or "a") .. " " .. removeOOC(itemName) .. ".")
end
addEvent("showItem", true)
addEventHandler("showItem", root, showItem)

function resetAnim(thePlayer)
	exports.cr_global:removeAnimation(thePlayer)
end

function showInventoryRemote(thePlayer, commandName, targetPlayer)
	if exports.cr_integration:isPlayerSeniorAdmin(thePlayer) then
		if not (targetPlayer) then
			outputChatBox("KULLANIM: /" .. commandName .. " [Karakter Adı / ID]", thePlayer, 255, 194, 14)
		else
			local targetPlayer = exports.cr_global:findPlayerByPartialNick(thePlayer, targetPlayer)
			if targetPlayer then
				triggerEvent("subscribeToInventoryChanges",thePlayer,targetPlayer)
				triggerClientEvent(thePlayer,"showInventory",thePlayer,targetPlayer)
			end
		end
	end
end
addCommandHandler("showinv", showInventoryRemote, false, false)

function sortMoney(thePlayer, commandName, moneyAmountCurrent, moneyAmountSort)
	if not (moneyAmountCurrent) or not (moneyAmountSort) or tonumber(moneyAmountCurrent) < 0 or tonumber(moneyAmountSort) < 0 then
		outputChatBox("KULLANIM: /" .. commandName .. " [Money amount you have] [Money amount to sort]", thePlayer, 255, 194, 14)
	else
		local playerMoney = getElementData(thePlayer, "money")
		if tonumber(moneyAmountCurrent) <= tonumber(playerMoney) and tonumber(moneyAmountSort) <= tonumber(playerMoney) then
			if exports.cr_global:hasItem(thePlayer, 134, tonumber(moneyAmountCurrent)) then
				outputChatBox("You sorted $" .. exports.cr_global:formatMoney(moneyAmountSort) .. " out of $" .. exports.cr_global:formatMoney(moneyAmountCurrent) .. ".", thePlayer)
				exports.cr_global:takeItem(thePlayer, 134, tonumber(moneyAmountCurrent))
				exports.cr_global:giveItem(thePlayer, 134, tonumber(moneyAmountSort))
				exports.cr_global:giveItem(thePlayer, 134, tonumber(moneyAmountCurrent)-tonumber(moneyAmountSort))
			else
				outputChatBox("You don't have that amount of money in one sorted item.", thePlayer, 255, 0, 0)
			end
		else
			outputChatBox("You don't have that amount of money.", thePlayer, 255, 0, 0)
		end
	end
end
addCommandHandler("sortmoney", sortMoney)

function combineMoney(thePlayer, commandName)
		for i = 134, 134 do
			while exports['cr_items']:takeItem(thePlayer, i) do
			end
		end
		local playerMoney = getElementData(thePlayer, "money")
		if tonumber(playerMoney) > 0 then
			exports.cr_global:giveItem(thePlayer, 134, playerMoney)
			outputChatBox("You combined $" .. exports.cr_global:formatMoney(playerMoney) .. ".", thePlayer)
		else
			outputChatBox("You can't combine money you don't have!", thePlayer, 255, 0, 0)
		end
end
addCommandHandler("combinemoney", combineMoney)

function toggleBadge(source, badges, itemID , itemValue)
	if (getElementData(source, badges[itemID][1])) then
		removeElementData(source, "kullandığıBadge")
		setElementData(source, badges[itemID][1], false, true)
	else
		for key, badge in pairs (badges) do
			if key ~= itemID then
				if (getElementData (source, badge[1])) then
					setElementData(source, badge[1], false, true)
				end
			end
		end
		if itemID == 122 or itemID == 123 or itemID == 124 or itemID == 125 or itemID == 135 or itemID == 136 or itemID == 158 or itemID == 168 then
			setElementData(source, badges[itemID][1], true)
		else
			setElementData(source, "kullandığıBadge", badges[itemID][1])
			setElementData(source, badges[itemID][1], removeOOC(itemValue), true)
		end
	end
	exports.cr_global:updateNametagColor(source)
end
addEvent("item-system:toggleBadge", true)
addEventHandler("item-system:toggleBadge", root, toggleBadge)


---------------------------------------
-- START CHRISTMAS BOTTLES (Exciter) --
---------------------------------------
--SETTINGS:
local santaCharID = 19379
local santaCokeID = 210
local santaLotteryTicketID = 211

local christmasLotteryPrizes = {
	--itemID,value
	{210,"1"}, --A coke bottle
	{17,"1"}, --Watch
	{10,"1"}, --Dice
	{55,"Santa Claus. 1, North Pole."}, --Business Card
	{113,"3"}, --Pack of glowsticks
	{59,"1"}, --Mudkip
	{160,"1"}, --Briefcase
	{91,"1"}, --Eggnog
	{92,"1"}, --Turkey
	{93,"1"}, --Christmas Pudding
	{94,"1"}, --Christmas Present
	{213,"1"}, --Pinnekjott

}
function christmasCoke(thePlayer)
	local santaCars = {}
	for k,v in ipairs(getElementsByType("Vehicle")) do
		if(tonumber(getElementData(v,"owner")) == santaCharID and getElementData(v,"faction") == -1) then
			table.insert(santaCars,v)
		end
	end
	if(#santaCars > 0) then
		local chance = 2 --percentage chance of getting a car
		local chanceSuper = 1 --percentage chance of getting a supercar
		for k,v in ipairs(santaCars) do
			local vehID = tonumber(getElementData(v,"dbid"))
			local thisChance = 0
			if(vehID == 2439) then --enter supercar ids here
				thisChance = chanceSuper
			--elseif(getElementData(thePlayer,"username") == "Exciter") then
			--	thisChance = 50
			elseif(getPlayerName(thePlayer) == "Santa_Claus") then
					thisChance = 100
			else
				thisChance = chance
			end

			if math.random(100) >= thisChance then --if no car won
				--do nothing, we'll give the chance of other prizes at the end of this func
			else
				outputChatBox("You found a car key in the bottle!",thePlayer,0,255,0)
				local gender = tonumber(getElementData(thePlayer, "gender")) or 0
				local gendertext
				if gender > 0 then
					gendertext = "her"
				else
					gendertext = "his"
				end
				exports.cr_global:sendLocalMeAction(thePlayer, "finds a car key in " .. tostring(gendertext) .. " christmas coca-cola bottle.")
				giveItem(thePlayer, 3, vehID) --give the vehicle key
				return
			end
		end
	end

	if math.random(100) >= 40 then
		--no prize
	else
		local prizes = christmasLotteryPrizes
		local prize = math.random(1,#prizes)
		local ticketValue = prize+89027548971875
		outputChatBox("You found a christmas lottery ticket in the bottle!",thePlayer,0,255,0)
		giveItem(thePlayer, santaLotteryTicketID, tostring(ticketValue)) --give a christmas lottery ticket
		local gender = tonumber(getElementData(thePlayer, "gender")) or 0
		local gendertext
		if gender > 0 then
			gendertext = "her"
		else
			gendertext = "his"
		end
		exports.cr_global:sendLocalMeAction(thePlayer, "finds a lottery ticket in " .. tostring(gendertext) .. " christmas coca-cola bottle.")
	end
end

function christmasLotteryUseTicket(santa)
	local thePlayer = client
	local hasItem, itemSlot, itemValue = exports.cr_global:hasItem(thePlayer, santaLotteryTicketID)
	if hasItem then
		takeItemFromSlot(thePlayer, itemSlot)
		local prizes = christmasLotteryPrizes
		local prize = tonumber(itemValue)-89027548971875
		if prizes[prize] then
			giveItem(thePlayer, prizes[prize][1], prizes[prize][2])
			local itemName = g_items[prizes[prize][1]][1]
			local playerName = getPlayerName(thePlayer):gsub("_", " ")
			exports.cr_global:sendLocalMeAction(santa, "gives " .. tostring(playerName) .. " a " .. tostring(itemName) .. ".")
		else
			outputChatBox("Sorry, you won nothing on that ticket.",thePlayer,255,0,0)
			outputDebugString("item-system/s_item_system: Prize was " .. tostring(prize) .. " (invalid)")
		end
	end
end
addEvent("item-system:useChristmasLotteryTicket", true)
addEventHandler("item-system:useChristmasLotteryTicket", root, christmasLotteryUseTicket)

function christmasGetCokeFromSanta(santa)
	local thePlayer = client
	--local cokesGotten = tonumber(getElementData(thePlayer, "cokesgotten")) or 0
	--if(cokesGotten > 5) then
	--	return
	--end
	giveItem(thePlayer, santaCokeID, "1")
	--setElementData(thePlayer, "cokesgotten", cokesGotten+1)
	local playerName = getPlayerName(thePlayer):gsub("_", " ")
	exports.cr_global:sendLocalMeAction(santa, "gives " .. tostring(playerName) .. " a coke.")
end
addEvent("item-system:santaGetCoke", true)
addEventHandler("item-system:santaGetCoke", root, christmasGetCokeFromSanta)

function christmasInitialize()
	for k,v in ipairs(getElementsByType("Player")) do
		setElementData(v,"drinking",false)
	end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), christmasInitialize)

addEventHandler("onPlayerQuit", root,
function()
	if cokeBottles[source] then
		destroyElement(cokeBottles[source])
		cokeBottles[source] = nil
	end
end)

addEventHandler("accounts:characters:change", root,
function()
	if cokeBottles[client] then
		destroyElement(cokeBottles[client])
		cokeBottles[client] = nil
	end
end)

function giveHunger(player, amount)
	if player and amount then
		local playerHunger = getElementData(player, "hunger")
		if playerHunger + tonumber(amount) >= 100 then
			setElementData(player, "hunger", 100)
		else
			setElementData(player, "hunger", playerHunger + tonumber(amount) or 100)
		end
	end
end

function giveThirst(player, amount)
	if player and amount then
		local playerThirst = getElementData(player, "thirst")
		if playerThirst + tonumber(amount) >= 100 then
			setElementData(player, "thirst", 100)
		else
			setElementData(player, "thirst", playerThirst + tonumber(amount) or 100)
		end
	end
end

function takeHunger(player, amount)
	if player and amount then
		local playerHunger = getElementData(player, "hunger")
		if playerHunger - tonumber(amount) <= 0 then
			setElementData(player, "hunger", 0)
		else
			setElementData(player, "hunger", playerHunger - tonumber(amount) or 100)
		end
	end
end

function takeThirst(player, amount)
	if player and amount then
		local playerThirst = getElementData(player, "thirst")
		if playerThirst - tonumber(amount) <= 0 then
			setElementData(player, "thirst", 0)
		else
			setElementData(player, "thirst", playerThirst - tonumber(amount) or 100)
		end
	end
end