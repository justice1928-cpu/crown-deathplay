addEvent("vm:ped:start", true)
function diPedStart(pedName)
	exports['cr_global']:sendLocalText(client, "Vanna Spadafora says: Hello, how can I help you?", 255, 255, 255, 10)
end
addEventHandler("vm:ped:start", root, diPedStart)

addEvent("vm:ped:help", true)
function diPedHelp(pedName)
	exports['cr_global']:sendLocalText(client, "" .. pedName .. " says: Okay great, I'll notify the salesmen ASAP.", 255, 255, 255, 10)
	for key, value in ipairs(getPlayersInTeam(getTeamFromName("Volkswagen AG"))) do
		outputChatBox("[RADIO] There's someone awaiting a salesman in the lobby.  ((" .. getPlayerName(client):gsub("_"," ") .. "))", value, 173, 255, 47)
	end
end
addEventHandler("vm:ped:help", root, diPedHelp)

addEvent("vm:ped:appointment", true)
function diPedAppointment(pedName)
	exports['cr_global']:sendLocalText(client, "Vanna Spadafora says: I'll notify the mechanics now, have a seat in the meantime.", 255, 255, 255, 10)
	for key, value in ipairs(getPlayersInTeam(getTeamFromName("Volkswagen AG"))) do
		outputChatBox("[RADIO] There's someone with an appointment at the front desk. ((" .. getPlayerName(client):gsub("_"," ") .. "))", value, 173, 255, 47)
	end
end
addEventHandler("vm:ped:appointment", root, diPedAppointment)