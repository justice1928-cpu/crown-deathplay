local tyColSphere = createColSphere(2640.0556640625, -2039.7314453125, 13.582352638245, 1)
exports.cr_pool:allocateElement(tyColSphere)

tyrese = createPed (174, 2640.0556640625, -2039.7314453125, 13.582352638245)
exports.cr_pool:allocateElement(tyrese)

setPedRotation(tyrese, 90)
setElementFrozen(tyrese, true)
setElementInterior(tyrese, 0)
setElementDimension(tyrese, 0)
setElementData (tyrese, "activeConvo",  0) -- Set the convo state to 0 so people can start talking to him.
setElementData(tyrese, "name", "Ty")
setElementData(tyrese, "talk", true)
setElementData(tyrese, "rotation", getPedRotation(tyrese), false)

function startTy(thePlayer, matchingDimension)
	if matchingDimension then
		local logged = getElementData(thePlayer, "loggedin")
		
		if (logged==1) then
			if (isElementWithinColShape(thePlayer, tyColSphere)) then
				triggerClientEvent(thePlayer, "startTy_c", root)
			end
		end
	end
end
addEventHandler("onColShapeHit", tyColSphere, startTy)

function tyIntro () -- When player enters the colSphere create GUI with intro output to all local players as local chat.
	-- Give the player the "Find Ty" achievement.
	exports.cr_global:sendLocalMeAction(source,"knocks on the door")
	
	local theTeam = getPlayerTeam(source)
	local factionType = getElementData(theTeam, "type")
	
	if(factionType ~= 0 or getElementData(tyrese, "activeConvo")==1)then
		exports.cr_global:sendLocalText(source, "Ty shouts: Yo', I'm busy!", 255, 255, 255, 10)
		triggerClientEvent(source, "closeTyWindow", root)
	else
		-- Friend of Ty/Rook
		--local query = mysql:query_fetch_assoc("SELECT tyrese, rook FROM characters WHERE charactername='" ..  (getPlayerName(source))  .. "'")
		--local tysFriend = tonumber(query["tyrese"])
		local tysFriend = 1
		--local rooksFriend = tonumber(query["rook"])
		local rooksFriend = 1
		local factionLeader = tonumber(getElementData(source, "factionleader"))
		
		if factionLeader == 0 then
			exports.cr_global:sendLocalText(source, "Ty shouts: Yo', I'm busy!", 255, 255, 255, 10)
			triggerClientEvent(source, "closeTyWindow", root)
		else
			-- Output chat.
			exports.cr_global:sendLocalText(source, "Ty shouts: Yo', who is it?!", 255, 255, 255, 10)
			
			setElementData (tyrese, "activeConvo",  1)
			talkingToTy = source
			addEventHandler("onPlayerQuit", talkingToTy, resetTyConvoStateDelayed)
			addEventHandler("onPlayerWasted", talkingToTy, resetTyConvoStateDelayed)
			
			triggerClientEvent(source, "callback", root, rooksFriend, tysFriend)
		end
	end
end
addEvent("startTyConvo", true)
addEventHandler("startTyConvo", root, tyIntro)

---------------------------- Non-Friends ------------------------------------

-- Statement 4
function tyStatement4_S()
	-- Output the text from the last option to all player in radius
	local name = string.gsub(getPlayerName(source), "_", " ")
	exports.cr_global:sendLocalText(source, name .. " shouts: Yo', c'mon open the fuckin' door, homie.", 255, 255, 255, 5)
	exports.cr_global:sendLocalText(source, "Ty shouts: I don't know you. Get the fuck up outta here!", 255, 255, 255, 5)
	
	setElementData (tyrese, "activeConvo",  0)
	
end
addEvent("tyStatement4ServerEvent", true)
addEventHandler("tyStatement4ServerEvent", root, tyStatement4_S)

-- Statement 5
function tyStatement5_S()
	-- Output the text from the last option to all player in radius
	local name = string.gsub(getPlayerName(source), "_", " ")
	exports.cr_global:sendLocalText(source, name .. " shouts: Rook sent me. He said you needed some help with some business.", 255, 255, 255, 10)
	exports.cr_global:sendLocalText(source, "Ty shouts: A'ight, hold up!", 255, 255, 255, 10)
	exports.cr_global:sendLocalText(source, "* The door unlocks", 255, 51, 102, 10)
	exports.cr_global:sendLocalText(source, "Ty says: Only you. Anyone else is gonna have to wait outside.", 255, 255, 255, 10)
	
	setElementPosition(source, 2640.0556640625, -2039.7314453125, 13.582352638245)
	setElementDimension(source, 0)
	setElementInterior(source, 0)
	
	-- Output the text from the last option to all player in radius
	outputChatBox("Ty says: So you talked to Rook, right? What did he tell you?.", source, 255, 255, 255)
end
addEvent("tyStatement5ServerEvent", true)
addEventHandler("tyStatement5ServerEvent", root, tyStatement5_S)

-- Statement 6
function tyStatement6_S()
	-- Output the text from the last option to all player in radius
	local name = string.gsub(getPlayerName(source), "_", " ")
	exports.cr_global:sendLocalText(source, name .. " says: He said you had connects but needed someone to put it all to use.", 255, 255, 255, 5)
	exports.cr_global:sendLocalText(source, "Ty says: Yeah that's right. So you down? Here's how it'll work.", 255, 255, 255, 5)
	exports.cr_global:sendLocalText(source, "Ty says: I got some people's I can call up on when I need that produce.", 255, 255, 255, 5)
	exports.cr_global:sendLocalText(source, "Ty says: I'll act as middle man and sell to you at wholesale. You then can do whatever you want with it.", 255, 255, 255, 5)
end
addEvent("tyStatement6ServerEvent", true)
addEventHandler("tyStatement6ServerEvent", root, tyStatement6_S)

-- Statement 7
function tyStatement7_S()
	-- Output the text from the last option to all player in radius
	local name = string.gsub(getPlayerName(source), "_", " ")
	exports.cr_global:sendLocalText(source, name .. " says: He said you had connects but didn't know what to do with them.", 255, 255, 255, 5)
	exports.cr_global:sendLocalText(source, "Ty says: Fuck you! I ain't no amateur. Get the fuck up out of here. ", 255, 255, 255, 5)
	
	setElementPosition(source, 2532.8212890625, -2029.841796875, 13.546875)
	setElementDimension(source, 0)
	setElementInterior(source, 0)
	
	resetTyConvoStateDelayed()
	
end
addEvent("tyStatement7ServerEvent", true)
addEventHandler("tyStatement7ServerEvent", root, tyStatement7_S)

-- Statement 8
function tyStatement8_S()
	-- Output the text from the last option to all player in radius
	local name = string.gsub(getPlayerName(source), "_", " ")
	exports.cr_global:sendLocalText(source, name .. " says: Sounds a'ight.", 255, 255, 255, 5)
	exports.cr_global:sendLocalText(source, "Ty says: You ever need the shit just come by.", 255, 255, 255, 5)
	
	setElementPosition(source, 2532.8212890625, -2029.841796875, 13.546875)
	setElementDimension(source, 0)
	setElementInterior(source, 0)
	
	resetTyConvoStateDelayed()
	
	mysql:query_free("UPDATE characters SET tyrese='1' WHERE charactername='" ..  (getPlayerName(source)) .. "' LIMIT 1")
end
addEvent("tyStatement8ServerEvent", true)
addEventHandler("tyStatement8ServerEvent", root, tyStatement8_S)

-- Statement 9
function tyStatement9_S()
	-- Output the text from the last option to all player in radius
	local name = string.gsub(getPlayerName(source), "_", " ")
	exports.cr_global:sendLocalText(source, name .. " says: Wholesale? I thought we were partners.", 255, 255, 255, 5)
	exports.cr_global:sendLocalText(source, "Ty says: If you ain't down I can find some other niggas.", 255, 255, 255, 5)
end
addEvent("tyStatement9ServerEvent", true)
addEventHandler("tyStatement9ServerEvent", root, tyStatement9_S)

-- Statement 10
function tyStatement10_S()
	-- Output the text from the last option to all player in radius
	local name = string.gsub(getPlayerName(source), "_", " ")
	exports.cr_global:sendLocalText(source, name .. " says: Na, it's cool. We got a deal.", 255, 255, 255, 5)
	exports.cr_global:sendLocalText(source, "Ty says: You ever need me to hook you up, just stop by.", 255, 255, 255, 5)
	
	setElementPosition(source, 2532.8212890625, -2029.841796875, 13.546875)
	setElementDimension(source, 0)
	setElementInterior(source, 0)
	
	resetTyConvoStateDelayed()
	
	mysql:query_free("UPDATE characters SET tyrese='1' WHERE charactername='" ..  (getPlayerName(source)) .. "' LIMIT 1")
end
addEvent("tyStatement10ServerEvent", true)
addEventHandler("tyStatement10ServerEvent", root, tyStatement10_S)

-- Statement 11
function tyStatement11_S()
	-- Output the text from the last option to all player in radius
	local name = string.gsub(getPlayerName(source), "_", " ")
	exports.cr_global:sendLocalText(source, name .. " says: Yeah you do that.", 255, 255, 255, 5)
	exports.cr_global:sendLocalText(source, "Ty says: Then we're done here.  Get the steppin'.", 255, 255, 255, 5)
	
	setElementPosition(source, 2532.8212890625, -2029.841796875, 13.546875)
	setElementDimension(source, 0)
	setElementInterior(source, 0)
	
	resetTyConvoStateDelayed()
	
end
addEvent("tyStatement11ServerEvent", true)
addEventHandler("tyStatement11ServerEvent", root, tyStatement11_S)

---------------- friends----------------------
function tyFriendStatement2_S()
	-- Output the text from the last option to all player in radius
	local name = string.gsub(getPlayerName(source), "_", " ")
	exports.cr_global:sendLocalText(source, name .. " shouts: Yo it's me. Open the door.", 255, 255, 255, 10)
	exports.cr_global:sendLocalText(source, "Ty shouts: A'ight hold up .. ", 255, 255, 255, 10)
	exports.cr_global:sendLocalText(source, "* The door unlocks", 255, 51, 102, 10)
	
	setElementPosition(source, 226.48, 1239.87, 1082.14)
	setElementDimension(source, 364)
	setElementInterior(source, 2)
	
	outputChatBox("Ty says: So what you looking for this time?", source, 255, 255, 255)
		
end
addEvent("tyFriendStatement2ServerEvent", true)
addEventHandler("tyFriendStatement2ServerEvent", root, tyFriendStatement2_S)

local count = 0
function giveTyItems(itemNumber)

	if(itemNumber == 1)then
		itemID = 30
		cost = 10
	elseif (itemNumber == 2)then
		itemID = 32
		cost = 20
	elseif (itemNumber == 3)then
		itemID = 33
		cost = 20
	--elseif (itemNumber == 4)then
	--	itemID = 31
	--	cost = 25
	end
		
	-- does the player have enough money?
	if not exports.cr_global:takeMoney(source, cost) then
		exports.cr_global:sendLocalText(tyrese, "Ty says: I ain't givin' this shit away. Come back when you got the money.", 255, 255, 255, 5)
		
		setElementPosition(source, 2532.8212890625, -2029.841796875, 13.546875)
		setElementDimension(source, 0)
		setElementInterior(source, 0)
		
		triggerClientEvent(source, "closeTyWindow", root)
		
		setTimer(resetTyConvoStateDelayed, 600000, 1)
	
	else
		count = count + 1
		exports.cr_global:giveItem(source, itemID, 1)
		outputChatBox("You have bought a drug item from Ty for $" .. cost .. ".", source)
		if count >= 4 then
			tyClose_S()
		end
	end
end
addEvent("tyGiveItem", true)
addEventHandler("tyGiveItem", root, giveTyItems)


function tyClose_S()
	local name = string.gsub(getPlayerName(source), "_", " ")
	exports.cr_global:sendLocalText(tyrese, name .. " says: I'm set.", 255, 255, 255, 5)
	exports.cr_global:sendLocalText(tyrese, "Ty says: Peace, homie.", 255, 255, 255, 5)
	
	setElementPosition(source, 2532.8212890625, -2029.841796875, 13.546875)
	setElementDimension(source, 0)
	setElementInterior(source, 0)
	
	setTimer(resetTyConvoStateDelayed, 600000, 1)
end
addEvent("tyFriendClose", true)
addEventHandler("tyFriendClose", root, tyClose_S)

------------------------ Reset -----------------------------
function resetTyConvoState()
	setElementData(tyrese,"activeConvo", 0)
end

function resetTyConvoStateDelayed()
	if talkingToTy then
		removeEventHandler("onPlayerQuit", talkingToTy, resetTyConvoStateDelayed)
		removeEventHandler("onPlayerWasted", talkingToTy, resetTyConvoStateDelayed)
		triggerClientEvent(talkingToTy, "closeTyWindow", root)
		talkingToTy = nil
		count = 0
	end
	setTimer(resetTyConvoState, 120000, 1)
end
