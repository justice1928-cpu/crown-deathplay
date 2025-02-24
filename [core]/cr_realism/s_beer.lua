addEvent("realism:startdrinking", true)
addEventHandler("realism:startdrinking", root,
	function(hand)
		if not (hand) then
			hand = 0
		else
			hand = tonumber(hand)
		end	
		
		triggerClientEvent(root, "realism:drinkingsync", source, true, hand)
		setElementData(source, "realism:drinking", true, false)
		setElementData(source, "realism:drinking:hand", hand, false)
		setTimer (stopdrinking, 300000, 1, thePlayer)
	end
);


function stopdrinking(thePlayer)
	if not thePlayer then
		thePlayer = source
	end
	
	if (isElement(thePlayer)) then	
		local isdrinking = getElementData(thePlayer, "realism:drinking")
		if (isdrinking) then
			triggerClientEvent(root, "realism:drinkingsync", thePlayer, false, 0)
			setElementData(thePlayer, "realism:drinking", false, false)
		end
	end
end
addEvent("realism:stopdrinking", true)
addEventHandler("realism:stopdrinking", root, stopdrinking)

function stopdrinkingCMD(thePlayer)
	local isdrinking = getElementData(thePlayer, "realism:drinking")
	if (isdrinking) then
		stopdrinking(thePlayer)
		exports.cr_global:sendLocalMeAction(thePlayer, "throws their beerette on the ground.")
	end
end
addCommandHandler("throwbeer", stopdrinkingCMD)

-- Sync to new players
addEvent("realism:drinking.request", true)
addEventHandler("realism:drinking.request", root, 
	function ()
		local players = exports.cr_pool:getPoolElementsByType("player")
		for key, thePlayer in ipairs(players) do
			local isdrinking = getElementData(thePlayer, "realism:drinking")
			if (isdrinking) then
				local drinkingHand = getElementData(thePlayer, "realism:drinking:hand")
				triggerClientEvent(source, "realism:drinkingsync", thePlayer, isdrinking, drinkingHand)
			end
		end
	end
);