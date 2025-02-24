﻿addEvent("pd:ped:start", true)
function pdPedStart(pedName)
	exports['cr_global']:sendLocalText(client, "Joe McDonald says: Hello, how can I help you?", 255, 255, 255, 10)
end
addEventHandler("pd:ped:start", root, pdPedStart)

addEvent("pd:ped:help", true)
function pdPedHelp(pedName)
	exports['cr_global']:sendLocalText(client,"Joe McDonald says: Alright, I'll notify any available units now, please wait patiently.", 255, 255, 255, 10)
	for key, value in ipairs(getPlayersInTeam(getTeamFromName("Los Santos Police Department"))) do
	outputChatBox("[RADIO] This is dispatch, we've got a civilian in the lobby reporting a crime. ((" .. getPlayerName(client):gsub("_"," ") .. "))", value, 0, 183, 239)
	end
end
addEventHandler("pd:ped:help", root, pdPedHelp)

addEvent("pd:ped:appointment", true)
function pdPedAppointment(pedName)
	exports['cr_global']:sendLocalText(client, "Joe McDonald says: I'll notify any available Officers now, please take a seat.", 255, 255, 255, 10)
	for key, value in ipairs(getPlayersInTeam(getTeamFromName("Los Santos Police Department"))) do
		outputChatBox("[RADIO] This is dispatch, we've got a civilian in the lobby requesting to speak to an Officer. ((" .. getPlayerName(client):gsub("_"," ") .. "))", value, 0, 183, 239)
	end
end
addEventHandler("pd:ped:appointment", root, pdPedAppointment)