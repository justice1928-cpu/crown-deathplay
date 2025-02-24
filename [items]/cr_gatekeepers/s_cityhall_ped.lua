function makeIDCard()
	local characterName = getPlayerName(client)
	local gender = getElementData(client, "gender")
	local month = getElementData(client, "month")
	local day = getElementData(client, "day")
	local age = getElementData(client, "age")
	local fingerprint = getElementData(client, "fingerprint")
	if characterName and gender and month and day and age and fingerprint and exports.cr_global:takeMoney(client, 5) then
		exports.cr_global:giveItem(client, 152, characterName .. ";" .. (gender==0 and "Male" or "Female") .. ";" .. exports.cr_global:numberToMonth(month or 1) .. " " .. exports.cr_global:formatDate(day or 1) .. ", " .. exports.cr_global:getBirthYearFromAge(age) .. ";" .. fingerprint)
		outputChatBox("A new Identification Card has been created and given into your inventory for $5.", client)
	else
		outputChatBox("You need $5 for a new ID card.", client)
	end
end
addEvent("cityhall:makeIdCard", true)
addEventHandler("cityhall:makeIdCard", root, makeIDCard)