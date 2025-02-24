local startCamX, startCamY, startCamZ, startCamLX, startCamLY, startCamLZ = 2459.5144042969, -1982.6452636719, 23.969715118408, 2392.5031738281, -1920.1370849609, -16.058067321777
local endCamX, endCamY, endCamZ, endCamLX, endCamLY, endCamLZ = 2445.8383789062, -1976.8269042969, 13.969347953796, 2300.8334960938, -1976.7239990234, 0
local cameraTime = 2000

local localCharacters = {}
local characterVeriables = {}
local pedData = {}
local pedID = {}

local access = false

local screen = Vector2(guiGetScreenSize())
local click = 0
local fonts = {
    font1 = exports.cr_fonts:getFont("UbuntuRegular", 10),
    font2 = exports.cr_fonts:getFont("SweetSixteen", 35),
    font3 = exports.cr_fonts:getFont("UbuntuRegular", 10)
}

function loadCharacterSelector(characters)
    setElementDimension(localPlayer, 1)
    
    if isEventHandlerAdded("onClientRender", root, onClientRender) and isEventHandlerAdded("onClientCharacter", root, onClientCharacter) and isEventHandlerAdded("onClientKey", root, onClientKey) and isEventHandlerAdded("onClientClick", root, onClientClick) then
		removeEventHandler("onClientRender", root, onClientRender)
		removeEventHandler("onClientCharacter", root, onClientCharacter)
		removeEventHandler("onClientKey", root, onClientKey)
		removeEventHandler("onClientClick", root, onClientClick)
	end

    selectedCharacter = 1
    pedData = getElementData(localPlayer, "account:characters") or characters
    
    if #pedData ~= 0 then
        localCharacters[selectedCharacter] = createPed(pedData[selectedCharacter][5], 2442.404296875, -1976.8037109375, 13.546875, 270)
        characterVeriables[selectedCharacter] = pedData[selectedCharacter][2]
	    pedID[selectedCharacter] = pedData[selectedCharacter][1]
	    setElementDimension(localCharacters[selectedCharacter], getElementDimension(localPlayer))
	    setElementFrozen(localCharacters[selectedCharacter], true)
        setPedAnimation(localCharacters[selectedCharacter], "ped", "XPRESSscratch", -1, true, false, false)

        addEventHandler("onClientRender", root, characterSelectRender)
        addEventHandler("onClientKey", root, characterSelectKey)
		showCursor(true)
    end
    
    if #pedData == 0 then
        for k, v in pairs(localCharacters) do
            if isElement(v) then
                destroyElement(v)
            end
            localCharacters[k] = nil
        end

		startCharReg()
    end
end
addEvent("account.loadCharacterSelector", true)
addEventHandler("account.loadCharacterSelector", root, loadCharacterSelector)

function getCamSpeed(index1, startCam1, endCam1, globalspeed1)
	return (math.abs(startCam1[index1]-endCam1[index1])/globalspeed1)
end

function characterSelectRender()
    smoothMoveCamera(startCamX, startCamY, startCamZ, startCamLX, startCamLY, startCamLZ, endCamX, endCamY, endCamZ, endCamLX, endCamLY, endCamLZ, cameraTime)

    if access and localCharacters[selectedCharacter] then
		local username = getElementData(localPlayer, "account:username") or "N/A"
		dxDrawText(username, 25, screen.y - 75, nil, nil, tocolor(255, 255, 255, 250), 1, fonts.font2)
		
		dxDrawRectangle(20, 20, 200, 40, exports.cr_ui:inArea(20, 20, 200, 40) and tocolor(0, 157, 110, 250) or tocolor(0, 157, 110, 200))
		dxDrawText("Karaktere Gir [ENTER]", 45, 31, nil, nil, tocolor(255, 255, 255, 250), 1, fonts.font3)
		
		if exports.cr_ui:inArea(20, 20, 200, 40) and getKeyState("mouse1") and click+500 <= getTickCount() then
			click = getTickCount()
			if selectedCharacter then
				removeEventHandler("onClientRender", root, characterSelectRender)
				removeEventHandler("onClientKey", root, characterSelectKey)

				triggerServerEvent("account.spawnCharacter", localPlayer, pedID[selectedCharacter])

				for k, v in pairs(localCharacters) do
					if isElement(v) then
						destroyElement(v)
					end
					localCharacters[k] = nil
				end
			end
		end
		
		dxDrawRectangle(20, 70, 200, 40, exports.cr_ui:inArea(20, 70, 200, 40) and tocolor(21, 124, 165, 250) or tocolor(21, 124, 165, 200))
		dxDrawText("Karakter Oluştur [SPACE]", 35, 81, nil, nil, tocolor(255, 255, 255, 250), 1, fonts.font3)
		
		if exports.cr_ui:inArea(20, 70, 200, 40) and getKeyState("mouse1") and click+500 <= getTickCount() then
			click = getTickCount()
			if not (#getElementData(localPlayer, "account:characters") >= getElementData(localPlayer, "charlimit")) then
                removeEventHandler("onClientRender", root, characterSelectRender)
                removeEventHandler("onClientRender", root, renderVignette)
                removeEventHandler("onClientKey", root, characterSelectKey)
                
                for k, v in pairs(localCharacters) do
                    if isElement(v) then
                        destroyElement(v)
                    end
                    localCharacters[k] = nil
                end
        
                startCharReg()
			else
				exports.cr_infobox:addBox("error", "Karakter limitiniz bulunmuyor.")
			end
		end
		
		local vx, vy, vz = getPedBonePosition(localCharacters[selectedCharacter], 7)
		local x, y = getScreenFromWorldPosition(vx, vy, vz + 0.2)
		if x and y then
			dxDrawText(string.gsub(pedData[selectedCharacter][2], "_", " "), x + 5, y - 5, x, y, tocolor(255, 255, 255, 250), 1, fonts.font1, "center", "top", false, false, false, true, false)
		end
    end
end

local spamTimersCharacter = {}

function characterSelectKey(key, state)
    if state then
        cancelEvent()
        pedData = getElementData(localPlayer, "account:characters")

        if access then
            if key == "arrow_l" and selectedCharacter > 1 then
                if isTimer(spamTimersCharacter[localPlayer]) then return end
                destroyElement(localCharacters[selectedCharacter])

                selectedCharacter = selectedCharacter - 1

                if selectedCharacter < 1 then
                    selectedCharacter = 1
                    characterVeriables[selectedCharacter] = selectedCharacter				
                end

                localCharacters = {}
                characterVeriables = {}
                pedID = {}

                localCharacters[selectedCharacter] = createPed(pedData[selectedCharacter][5], 2442.404296875, -1976.8037109375, 13.546875, 270)
                characterVeriables[selectedCharacter] = pedData[selectedCharacter][2]
                pedID[selectedCharacter] = pedData[selectedCharacter][1]
                setElementDimension(localCharacters[selectedCharacter], getElementDimension(localPlayer))
                setElementFrozen(localCharacters[selectedCharacter], true)
                setPedAnimation(localCharacters[selectedCharacter], "ped", "XPRESSscratch", -1, true, false, false)

                spamTimersCharacter[localPlayer] = setTimer(function() end, 500, 1)
            elseif key == "arrow_r" and selectedCharacter < #pedData then
                if isTimer(spamTimersCharacter[localPlayer]) then return end
                destroyElement(localCharacters[selectedCharacter])

                selectedCharacter = selectedCharacter + 1

                if selectedCharacter > #pedData then
                    selectedCharacter = #pedData
                    characterVeriables[selectedCharacter] = selectedCharacter				
                end

                localCharacters = {}
                characterVeriables = {}
                pedID = {}

                localCharacters[selectedCharacter] = createPed(pedData[selectedCharacter][5], 2442.404296875, -1976.8037109375, 13.546875, 270)
                characterVeriables[selectedCharacter] = pedData[selectedCharacter][2]
                pedID[selectedCharacter] = pedData[selectedCharacter][1]
                setElementDimension(localCharacters[selectedCharacter], getElementDimension(localPlayer))
                setElementFrozen(localCharacters[selectedCharacter], true)
                setPedAnimation(localCharacters[selectedCharacter], "ped", "XPRESSscratch", -1, true, false, false)

                spamTimersCharacter[localPlayer] = setTimer(function() end, 500, 1)
            elseif key == "enter" and selectedCharacter then
                removeEventHandler("onClientRender", root, characterSelectRender)
                removeEventHandler("onClientKey", root, characterSelectKey)

                triggerServerEvent("account.spawnCharacter", localPlayer, pedID[selectedCharacter])

                for k, v in pairs(localCharacters) do
                    if isElement(v) then
                        destroyElement(v)
                    end
                    localCharacters[k] = nil
                end
            elseif key == "space" and not (#getElementData(localPlayer, "account:characters") >= getElementData(localPlayer, "charlimit")) then
                removeEventHandler("onClientRender", root, characterSelectRender)
                removeEventHandler("onClientRender", root, renderVignette)
                removeEventHandler("onClientKey", root, characterSelectKey)
                
                for k, v in pairs(localCharacters) do
                    if isElement(v) then
                        destroyElement(v)
                    end
                    localCharacters[k] = nil
                end
        
                startCharReg()
            elseif key == "space" then
                exports.cr_infobox:addBox("error", "Karakter limitiniz bulunmuyor.")	
            end
        end
    end
end

function isEventHandlerAdded(sEventName, pElementAttachedTo, func)
    if type(sEventName) == 'string' and isElement(pElementAttachedTo) and type(func) == 'function' then
        local aAttachedFunctions = getEventHandlers(sEventName, pElementAttachedTo)
        if type(aAttachedFunctions) == 'table' and #aAttachedFunctions > 0 then
            for i, v in ipairs(aAttachedFunctions) do
                if v == func then
                    return true
                end
            end
        end
    end
    return false
end

--==========================================================================================================

local sm = {}
sm.moov = 0
sm.object1, sm.object2 = nil, nil
 
function removeCamHandler()
	if (sm.moov == 1)then
		sm.moov = 0
        access = true
        removeEventHandler("onClientPreRender", root, camRender)
	end
end
 
function camRender()
	if (sm.moov == 1) then
		local x1,y1,z1 = getElementPosition(sm.object1)
		local x2,y2,z2 = getElementPosition(sm.object2)
		setCameraMatrix(x1,y1,z1,x2,y2,z2)
	end
end
addEventHandler("onClientPreRender", root, camRender)
 
function smoothMoveCamera(x1,y1,z1,x1t,y1t,z1t,x2,y2,z2,x2t,y2t,z2t,time)
	if(sm.moov == 1)then return false end
	sm.object1 = createObject(1337,x1,y1,z1)
	sm.object2 = createObject(1337,x1t,y1t,z1t)
	setElementAlpha(sm.object1,0)
	setElementAlpha(sm.object2,0)
	setObjectScale(sm.object1,0.01)
	setObjectScale(sm.object2,0.01)
	moveObject(sm.object1,time,x2,y2,z2,0,0,0,"InOutQuad")
	moveObject(sm.object2,time,x2t,y2t,z2t,0,0,0,"InOutQuad")
	sm.moov = 1
	setTimer(removeCamHandler,time,1)
	setTimer(destroyElement,time,1,sm.object1)
	setTimer(destroyElement,time,1,sm.object2)
	return false
end

--=========================================================================================================

textbars = {}
local awesome = exports.cr_fonts:getFont('FontAwesome',10)
local roboto = exports.cr_fonts:getFont('UbuntuRegular',11)
local liveIcon = exports.cr_fonts:getIcon('fa-user')
local ageIcon = exports.cr_fonts:getIcon('fa-calendar')
local widhtIcon = exports.cr_fonts:getIcon('fa-street-view')
local heighticon = exports.cr_fonts:getIcon('fa-child')
local state = false
local oText = "*"
local disabledKey = {
    ["capslock"] = true,
    ["lctrl"] = true,
    ["rctrl"] = true,
    ["lalt"] = true,
    ["ralt"] = true,
    ["home"] = true,
    [";"] = true,
    ["'"] = true,
    ["]"] = true,
    ["["] = true,
    ["="] = true,
    ["_"] = true,
    ["á"] = true,
    ["é"] = true,
    ["ű"] = true,
    ["#"] = true,
    ["\\"] = true,
    ["/"] = true,
    --["."] = true,
    [","] = true,
    ['"'] = true,
    ["_"] = true,
    ["-"] = true,
    ["*"] = true,
    ["-"] = true,
    ["+"] = true,
    ["//"] = true,
    --[" "] = true,
    [""] = true,
}

local subWord = {
    [";"] = "é",
    ["#"] = "á",
    ["["] = "ő",
    ["]"] = "ú",
    ["="] = "ó",
    ["/"] = "ü",
}

local changeKey = {
    ["num_0"] = "0",
    ["num_1"] = "1",
    ["num_2"] = "2",
    ["num_3"] = "3",
    ["num_4"] = "4",
    ["num_5"] = "5",
    ["num_6"] = "6",
    ["num_7"] = "7",
    ["num_8"] = "8",
    ["num_9"] = "9",
}
local guiState = false
local now = 0
local tick = 0
 
local instantBars = {
    ["Test"] = true
}
--[[
Bar felépítése tábla alapján:
textbars["Bar név"] = {{details(x,y,w,h)}, {options(hosszúság, defaultText, onlyNumber, color, font, fontsize, alignX, alingY, secured)}, id}
A defaultText állandóan változik azaz nem kell külön text változó táblába
]]

local gui 

function onGuiBlur2()
    --outputChatBox("asd")
    setTimer(onGuiBlur, 100, 1)
end
--bindKey("F8", "down", onGuiBlur2)

function CreateNewBar(name, details, options, id, needRefresh)
    textbars[name] = {details, options, id}
    if instantBars[name] then --name == "Char-Reg.Age" or name == "Char-Reg.Name" or name == "Char-Reg.Weight" or name == "Char-Reg.Height" then
        now = name
        SetText(now, "") -- textbars[now][2][2] = ""
        --outputChatBox(k)
        tick = 250

        if isElement(gui) then
            removeEventHandler("onClientGUIBlur", gui, onGuiBlur)
            if isTimer(checkTimers) then killTimer(checkTimers) end
            removeEventHandler("onClientGUIChanged", gui, onGuiChange)
            destroyElement(gui)
        end
        gui = GuiEdit(-1, -1, 1, 1, "", true)
        --setTimer(function() gui:setProperty("AlwaysOnTop", "True") end, 100, 1)
        gui.maxLength = textbars[now][2][1]
        --guiEditSetCaretIndex(gui, 1)
        --guiSetProperty(gui, "AlwaysOnTop", "True")
        if isTimer(guiBringToFrontTimer) then killTimer(guiBringToFrontTimer) end
        guiBringToFrontTimer = setTimer(guiBringToFront, 50, 1, gui)

        addEventHandler("onClientGUIBlur", gui, onGuiBlur, true)
        
        checkTimers = setTimer(onGuiBlur, 150, 0)
        addEventHandler("onClientGUIChanged", gui, onGuiChange, true)
        
        --setElementData(localPlayer, "bar >> Use", true)
        guiState = true
        allSelected = false
    end
    
    if not state then
        addEventHandler("onClientRender", root, DrawnBars, true, "low-5")
        state = true
    end
    
    if name == "ForgetPass" or needRefresh then
        if state then
            removeEventHandler("onClientRender", root, DrawnBars)
            addEventHandler("onClientRender", root, DrawnBars, true, "low-5")
        end
    end
end

function RemoveBar(name)
    if textbars[name] then
        textbars[name] = nil
        
        for k,v in pairs(textbars) do
            return
        end
        
        if state then
            removeEventHandler("onClientRender", root, DrawnBars)
            --setElementData(localPlayer, "bar >> Use", false)
            state = false
        end
    end
end

function Clear()
    textbars = {}
    if isElement(gui) then
        removeEventHandler("onClientGUIBlur", gui, onGuiBlur)
        if isTimer(checkTimers) then killTimer(checkTimers) end
        removeEventHandler("onClientGUIChanged", gui, onGuiChange)
        destroyElement(gui)
    end
    if instantBars[now] then --now == "Char-Reg.Age" or now == "Char-Reg.Name" or now == "Char-Reg.Weight" or now == "Char-Reg.Height" then
        --setElementData(localPlayer, "bar >> Use", false)
        guiState = false
        tick = 0
        now = 0
    end
    if state then
        removeEventHandler("onClientRender", root, DrawnBars)
        --setElementData(localPlayer, "bar >> Use", false)
        state = false
    end
end

function UpdatePos(name, details)
    if textbars[name] then
        textbars[name][1] = details
        if not state then
            addEventHandler("onClientRender", root, DrawnBars, true, "low-5")
            state = true
        end
    end
end

function UpdateAlpha(name, newColor)
    if textbars[name] then
        textbars[name][2][4] = newColor
        if not state then
            addEventHandler("onClientRender", root, DrawnBars, true, "low-5")
            state = true
        end
    end
end

function GetText(name)
    return textbars[name][2][2]
end

function SetText(name, val)
    if textbars[name] then
        textbars[name][2][2] = val
        return true
    end
    
    return false
end

local subTexted = {
    ["CharRegisterHeiht"] = " kg",
    ["CharRegisterWeight"] = " cm",
    ["CharRegisterAge"] = " yaş",
}

function DrawnBars()
    for k,v in pairs(textbars) do
        local details = v[1]
        local x,y,w,h = unpack(details)
        --dxDrawRectangle(x,y,w,h,tocolor(0,0,0,180))
        local w,h = x + w, y + h
        --outputChatBox("x:" .. x)
        --outputChatBox("y:" .. y)
        --outputChatBox("w:" .. w)
        --outputChatBox("h:" .. h)
        --outputChatBox("k:" .. k)
        local options = v[2]
        local text = options[2]
        local color = options[4]
        local font = options[5]
        local fontsize = options[6]
        local alignX = options[7]
        local alignY = options[8]
        local secured = options[9]
        --local rot1,rot2,rot3 = unpack(options[10])
        
        if secured then
            text = utfSub(oText, 1, #options[2])
        end
        
        if not instantBars[now] then -- then
            if now == k then
                tick = tick + 5
                if tick >= 425 then
                    tick = 0
                elseif tick >= 250 then
                    text = text .. "|"
                end 
            end

            if k == "Char-Reg.Height" then
                if text ~= "150cm-220cm Arası" then
                    local color = "#496886"
                    text = text .. color .. " santimetre"
                end
            end
            
            if k == "Char-Reg.Weight" then
                if text ~= "45kg-150kg Arası." then
                    local color = "#496886"
                    text = text .. color .. " kilogram"
                end
            end
            
            if k == "Char-Reg.Age" then
                if text ~= "10-80 arası" then
                    local color = "#496886"
                    text = text .. color .. " yaşında"
                end
            end

            if k == "Char-Reg.Name" then
                if text ~= "İsim Soyisim" then
                    local color = "#496886"
                    text = text .. color .. ""
                end
            end
            
            if subTexted[k] then
                text = text .. subTexted[k]
            end
            
            --dxDrawRectangle(x,y,w - x,h - y, tocolor(0,0,0,120))
            dxDrawText(text, x,y, w,h, color, fontsize, font, alignX, alignY, false, false, false, true)
        end
    end
end

local allSelected = false

addEventHandler("onClientClick", root,
    function(b, s)
        local screen = {guiGetScreenSize()}
        local defSize = {250, 28}
        local defMid = {screen[1]/2 - defSize[1]/2, screen[2]/2 - defSize[2]/2}
        if s == "down" then
            local x,y,w,h = defMid[1] + defSize[1] - 25, defMid[2] + 38, 20, 20
            --outputChatBox("asd2.-1")
            if exports.cr_ui:inArea(x,y,w,h) and page == "Login" then
                --outputChatBox("asd2")
                saveJSON["canSeePassword"] = not saveJSON["canSeePassword"]
                if textbars["Login.Password"] then
                    --outputChatBox("asd2.1")
                    textbars["Login.Password"][2][9] = not saveJSON["canSeePassword"]
                    return
                end
                
                if textbars["Register.Password1"] then
                    --outputChatBox("asd2.1")
                    textbars["Register.Password1"][2][9] = not saveJSON["canSeePassword"]
                    textbars["Register.Password2"][2][9] = not saveJSON["canSeePassword"]
                    return
                end
            end
            if instantBars[now] then --now == "Char-Reg.Age" or now == "Char-Reg.Name" or now == "Char-Reg.Weight" or now == "Char-Reg.Height" then
                return
            end
            for k,v in pairs(textbars) do
                local x,y,w,h = unpack(v[1])
                if exports.cr_ui:inArea(x,y,w,h) then
                    if bitExtract(v[2][4], 24, 8) >= 255 then
                        now = k
                        SetText(now, "") --textbars[now][2][2] = ""
                        --outputChatBox(k)
                        tick = 250

                        if isElement(gui) then
                            removeEventHandler("onClientGUIBlur", gui, onGuiBlur)
                            if isTimer(checkTimers) then killTimer(checkTimers) end
                            removeEventHandler("onClientGUIChanged", gui, onGuiChange)
                            destroyElement(gui)
                        end
                        gui = GuiEdit(-1, -1, 1, 1, GetText(now), true)
                        --setTimer(function() gui:setProperty("AlwaysOnTop", "True") end, 100, 1)
                        gui.maxLength = textbars[now][2][1]
                        --guiEditSetCaretIndex(gui, 1)
                        --guiSetProperty(gui, "AlwaysOnTop", "True")
                        if isTimer(guiBringToFrontTimer) then killTimer(guiBringToFrontTimer) end
                        guiBringToFrontTimer = setTimer(guiBringToFront, 50, 1, gui)

                        addEventHandler("onClientGUIBlur", gui, onGuiBlur, true)
                        checkTimers = setTimer(onGuiBlur, 150, 0)
                        addEventHandler("onClientGUIChanged", gui, onGuiChange, true)
                        return
                    end
                end
            end
            ----setElementData(localPlayer, "bar >> Use", false)
            guiState = false
            tick = 0
            now = 0
            
            if isElement(gui) then
                removeEventHandler("onClientGUIBlur", gui, onGuiBlur)
                if isTimer(checkTimers) then killTimer(checkTimers) end
                removeEventHandler("onClientGUIChanged", gui, onGuiChange)
                destroyElement(gui)
            end
        end
    end
)

function onGuiBlur()
    if isElement(gui) then
        guiBringToFront(gui)
    end
end

local specIgnore = {
    ["Char-Reg.Name"] = true,
    ["Register.Email"] = true,
    ["Login.Name"] = true,
    ["ForgetPass"] = true,
    ["ForgetCode"] = true,
}

function onGuiChange()
    playSound(":cr_ui/public/sounds/key.mp3")
    
    if textbars[now][2][3] then --if now == "Char-Reg.Age" or now == "Char-Reg.Weight" or now == "Char-Reg.Height" then
        if tonumber(guiGetText(gui)) then
            SetText(now, guiGetText(gui))
        else
            guiSetText(gui, "")
            SetText(now, guiGetText(gui))
            guiEditSetCaretIndex(gui, #GetText(now))
        end
        
        return
    end
    
    if not specIgnore[now] then
        local st = ""
        for k in string.gmatch(guiGetText(gui), "%w+") do
            st = st .. k
        end
        guiSetText(gui, st)
        guiEditSetCaretIndex(gui, #guiGetText(gui))
        SetText(now, guiGetText(gui))
    end    
    
    if now == "Char-Reg.Name" then
        local st = ""
        for k in string.gmatch(guiGetText(gui), "[%a+%s]") do
            st = st .. k
        end
        guiSetText(gui, st)
        guiEditSetCaretIndex(gui, #guiGetText(gui))
        SetText(now, guiGetText(gui))
        
        if utfSub(guiGetText(gui), #guiGetText(gui), #guiGetText(gui)) == "_" then
            guiSetText(gui, utfSub(guiGetText(gui), 1, #guiGetText(gui) - 1))
            guiEditSetCaretIndex(gui, #guiGetText(gui))
           -- exports['cr_infobox']:addNotification("warning", "Használj space-t a(z) '_' - helyett")
        end
        
        if utfSub(guiGetText(gui), #guiGetText(gui), #guiGetText(gui)) == " " and utfSub(guiGetText(gui), #guiGetText(gui) - 1, #guiGetText(gui) - 1) == " " then
            --outputChatBox("asd2")
            --outputChatBox("asd2")
            guiSetText(gui, utfSub(guiGetText(gui), 1, #guiGetText(gui) - 1))
            guiEditSetCaretIndex(gui, #guiGetText(gui))
            --exports['cr_infobox']:addNotification("warning", "Használj space-t a(z) '_' - helyett")
        end
        
        SetText(now, guiGetText(gui))
    else
        SetText(now, guiGetText(gui):gsub(" ", ""))
    end
    
    guiSetText(gui, GetText(now))
    guiEditSetCaretIndex(gui, #GetText(now))
    
    local b = utfSub(GetText(now), #GetText(now), #GetText(now))
    local a2 = utfSub(GetText(now), 1, #GetText(now) - 1)
    if changeKey[b] then 
        b = changeKey[b] 
    end

    if disabledKey[b] then
        local b2 = " " .. b .. " "
        if subWord[b] or b2 == " \ " then
            --exports["cr_pb_infobox"]:addNotification("warning", "A nevedben nem szerepelhet ékezet!")
            SetText(now, a2)
            return
        elseif tonumber(b) then
            SetText(now, a2)
            return
        end
    end
end

addEventHandler("onClientKey", root,
    function(b, s)
        if isElement(gui) and s and now and tostring(now) ~= "" and tostring(now) ~= " " then
            if b == "enter" then
                --[[
                if now == "Char-Reg.Age" then
                    ageNext()
                elseif now == "Char-Reg.Name" then
                    nameNext()
                elseif now == "Char-Reg.Height" then
                    heightNext()
                elseif now == "Char-Reg.Weight" then
                    weightNext()
                end]]
            elseif b == "tab" then
                if now == "ForgetPass" then
                    return
                end
                
                local idTable = {}
                --idTable[k] = i
                for k,v in pairs(textbars) do
                    local i = textbars[k][3]
                    idTable[k] = i
                    idTable[i] = k
                end
                local newNum = idTable[now] + 1
                if idTable[newNum] then
                    now = idTable[newNum]
                    
                    if isElement(gui) then
                        removeEventHandler("onClientGUIBlur", gui, onGuiBlur)
                        if isTimer(checkTimers) then killTimer(checkTimers) end
                        removeEventHandler("onClientGUIChanged", gui, onGuiChange)
                        destroyElement(gui)
                    end
                    gui = GuiEdit(-1, -1, 1, 1, GetText(now), true)
                    --setTimer(function() gui:setProperty("AlwaysOnTop", "True") end, 100, 1)
                    gui.maxLength = textbars[now][2][1]
                    guiEditSetCaretIndex(gui, #GetText(now))
                    --guiSetProperty(gui, "AlwaysOnTop", "True")
                    if isTimer(guiBringToFrontTimer) then killTimer(guiBringToFrontTimer) end
                    guiBringToFrontTimer = setTimer(guiBringToFront, 50, 1, gui)
                    
                    addEventHandler("onClientGUIBlur", gui, onGuiBlur, true)
                    checkTimers = setTimer(onGuiBlur, 150, 0)
                    addEventHandler("onClientGUIChanged", gui, onGuiChange, true)
                else    
                    now = idTable[1]
                    
                    if isElement(gui) then
                        removeEventHandler("onClientGUIBlur", gui, onGuiBlur)
                        if isTimer(checkTimers) then killTimer(checkTimers) end
                        removeEventHandler("onClientGUIChanged", gui, onGuiChange)
                        destroyElement(gui)
                    end
                    gui = GuiEdit(-1, -1, 1, 1, GetText(now), true)
                    --setTimer(function() gui:setProperty("AlwaysOnTop", "True") end, 100, 1)
                    gui.maxLength = textbars[now][2][1]
                    guiEditSetCaretIndex(gui, #GetText(now))
                    --guiSetProperty(gui, "AlwaysOnTop", "True")
                    if isTimer(guiBringToFrontTimer) then killTimer(guiBringToFrontTimer) end
                    guiBringToFrontTimer = setTimer(guiBringToFront, 50, 1, gui)
                    
                    addEventHandler("onClientGUIBlur", gui, onGuiBlur, true)
                    checkTimers = setTimer(onGuiBlur, 150, 0)
                    addEventHandler("onClientGUIChanged", gui, onGuiChange, true)
                end
                return
            end
        end
    end
)

vehicles = {
    --[[
    [ID] = {
        {x,y,z,rot},
    },
   ]]
    [1] = {
        {1944.1199951172, -1459.9942626953, 13.3828125, 90},
        {1968.9836425781, -1459.9942626953, 13.3828125, 90},
        {1890.0771484375, -1466.7960205078, 13.3828125, 270},
        {1865.3251953125, -1466.7960205078, 13.3828125, 270},
    },
}

boats = {
    --[[
    [ID] = {
        {x,y,z,rot, modelid},
    },
   ]]
    [1] = {
        {1904.2830810547, -1408.080078125, 10.949999809265, 212, 453},
        {1929.7830810547, -1415.080078125, 10.949999809265, -120, 493},
        --{1930.8334960938, -1411.3967285156, 12.328356742859, 180, 473},
        --{1919.2698974609, -1427.8817138672, 12.275784492493, 63, 472},
    },
}

-- vehicles = {
    -- --[[
    -- [ID] = {
        -- {x,y,z,rot},
    -- },
    --]]
    -- [1] = {
        -- {2241.4875488281, -1413.5705566406, 23.458066940308, 90},
        -- {2228.9467773438, -1417.7987060547, 23.458572387695, 270},
    -- },
-- }

peds = {
    --[[
    [ID] = {
        {x,y,z,rot,walk,{anim1, anim2}},
    },
   ]]
    [1] = {
        -- Bal oldal (Sétáló emberek)
        {1898.5695800781, -1454.2180419922, 13.546875, -270, true, nil},
        {1896.5695800781, -1453.2180419922, 13.546875, -270, true, nil},
        {1895.5695800781, -1454.0180419922, 13.546875, -270, true, nil},
        -- Jobb oldal (Sétáló emberek)
        {1940.0695800781, -1452.5180419922, 13.546875, -90, true, nil},
        {1941.8695800781, -1451.5180419922, 13.546875, -90, true, nil},
        {1943.4695800781, -1451.5180419922, 13.546875, -90, true, nil},
        -- Híd rész (Sétáló emberek)
        {1910.0190429688, -1448.9539794922, 13.465784072876, -35, true, nil},
        -- Animált pedek
        {1926.0682373047, -1445.4796142578, 13.49942779541, 116, false, {"GHANDS", "gsign1", -1, true, false, false}},
        {1924.7113037109, -1446.294921875, 13.491995811462, 284, false, {"GHANDS", "gsign2", -1, true, false, false}},
        {1923.8895263672, -1441.5638427734, 13.533559799194, 166, false, {"BEACH", "parksit_m_loop", -1, true, false, false}}, 
        --{724.52783203125,-1665.9119873047,10.68751335144, 178, false, {"ped", "walk_gang1", -1, true, false, false}},
        --{2220.2058105469, -1400.3887939453, 23.984985351563, 180, false, {"ped", "walk_gang2", -1, true, false, false}},
        --{2203.1433105469, -1413.5979003906, 23.984375, 270, false, {"LOWRIDER", "M_smklean_loop", -1, true, false, false}},
        --{2203.595703125, -1409.9279785156, 23.984375, 160, false, {"RIOT", "RIOT_ANGRY", -1, true, false, false}},
    }
}

valiableVehicles = {579, 489, 496, 536, 412, 523, 602, 589, 445, 421, 416, 596, 597, 603, 506, 502, 503, 411, 451}
valiableSkins = {18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 32, 33, 34, 35, 36, 37, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 57,63, 64, 69, 75, 76, 77, 85, 87, 88, 89, 90, 91, 92, 93, 129, 130, 131, 138, 139, 140, 141, 145, 148, 150}

cameraPos = {
    [1] = {
        [1] = {1918.3963623047, -1480.9674072266, 18.920900344849, 1918.3980712891, -1479.9686279297, 18.870922088623 },
        [2] = {2217.4819335938, -1416.349609375, 25.4547996521, 2218.4270019531, -1416.3302001953, 26.128324508667},
    },
}



local eCache = {
    ["vehicle"] = {},
    ["ped"] = {},
    ["boat"] = {},
}

local timers = {}

function changeCameraPos(id, oid2, id2, time)
    local x0, y0, z0, x1, y1, z1 = unpack(cameraPos[id][oid2])
    --outputChatBox(x0 .. " " .. y0 .. " " .. z0)
    local x2, y2, z2, x3, y3, z3 = unpack(cameraPos[id][id2])
    --outputChatBox(x2 .. " " .. y2 .. " " .. z2)
    --outputChatBox(time)
    smoothMoveCamera(x0, y0, z0, x1, y1, z1, x2, y2, z2, x3, y3, z3, time)
    setTimer(
        function()
            setCameraMatrix(x2, y2, z2, x3, y3, z3)
        end, time, 1
   )
end

function createSituation(id, refresh, id2)
    local id = id or 1
    local id2 = id2 or 1
    setCameraMatrix(unpack(cameraPos[id][id2]))
    setTimer(
        function()
            if id == 1 then
                for k,v in pairs(vehicles[id]) do
                    local x,y,z,rot = unpack(v)
                    local model, pedModel = valiableVehicles[math.random(1,#valiableVehicles)], valiableSkins[math.random(1,#valiableSkins)]
                    local veh = createVehicle(model, x,y,z)
                    local ped = createPed(pedModel, 0,0,0)
                    setElementFrozen(ped, true)
                    warpPedIntoVehicle(ped, veh)
                    setVehicleHandling(veh, "maxVelocity", math.random(50, 80))
                    setElementRotation(veh, 0, 0, rot)
                    setElementDimension(veh, getElementDimension(localPlayer))
                    setElementDimension(ped, getElementDimension(localPlayer))
                    eCache["vehicle"][veh] = true
                    eCache["vehicle"][ped] = true
                    setTimer(setPedControlState, 300, 1, ped, "accelerate", true)
                end
                
                for k,v in pairs(boats[id]) do
                    local x,y,z,rot,model = unpack(v)
                    local veh = createVehicle(model, x,y,z)
                    --local ped = createPed(pedModel, 0,0,0)
                    --setElementFrozen(veh, true)
                    --warpPedIntoVehicle(ped, veh)
                    setVehicleHandling(veh, "maxVelocity", math.random(50, 80))
                    setElementRotation(veh, 0, 0, rot)
                    setElementDimension(veh, getElementDimension(localPlayer))
                    --setElementDimension(ped, getElementDimension(localPlayer))
                    eCache["boat"][veh] = true
                    --eCache["vehicle"][ped] = true
                    --setTimer(setPedControlState, 300, 1, ped, "accelerate", true)
                end

                timers["refilTimer"] = setTimer(
                    function()
                        for k,v in pairs(eCache["vehicle"]) do
                            if isElement(k) then
                                destroyElement(k)
                            end
                            eCache["vehicle"][k] = nil
                        end

                        for k,v in pairs(vehicles[id]) do
                            local x,y,z,rot = unpack(v)
                            local model, pedModel = valiableVehicles[math.random(1,#valiableVehicles)], valiableSkins[math.random(1,#valiableSkins)]
                            local veh = createVehicle(model, x,y,z)
                            local ped = createPed(pedModel, 0,0,0)
                            setElementFrozen(ped, true)
                            warpPedIntoVehicle(ped, veh)
                            setVehicleHandling(veh, "maxVelocity", math.random(50, 80))
                            setElementRotation(veh, 0, 0, rot)
                            setElementDimension(veh, getElementDimension(localPlayer))
                            setElementDimension(ped, getElementDimension(localPlayer))
                            eCache["vehicle"][veh] = true
                            eCache["vehicle"][ped] = true
                            setTimer(setPedControlState, 300, 1, ped, "accelerate", true)
                        end
                    end, 10000, 0
               )

                for k,v in pairs(peds[id]) do
                    local x,y,z,rot,walk,animDetails = unpack(v)
                    local pedModel = valiableSkins[math.random(1,#valiableSkins)]
                    local ped = createPed(pedModel, x,y,z)
                    setElementDimension(ped, getElementDimension(localPlayer))
                    setElementRotation(ped, 0, 0, rot)
                    if not walk then
                        setElementFrozen(ped, true)
                        setPedAnimation(ped, unpack(animDetails))
                    else
                        setTimer(setPedControlState, 300, 1, ped, "forwards", true)
                        setTimer(setPedControlState, 300, 1, ped, "walk", true)
                    end
                    eCache["ped"][ped] = true
                end

                timers["refilTimer2"] = setTimer(
                    function()
                        for k,v in pairs(eCache["ped"]) do
                            if getPedControlState(k, "forwards") then
                                destroyElement(k)
                                eCache["ped"][k] = nil
                            end
                        end

                        for k,v in pairs(peds[id]) do
                            local x,y,z,rot,walk,animDetails = unpack(v)
                            local pedModel = valiableSkins[math.random(1,#valiableSkins)]
                            if walk then
                                local ped = createPed(pedModel, x,y,z)
                                setElementDimension(ped, getElementDimension(localPlayer))
                                setElementRotation(ped, 0, 0, rot)
                                setTimer(setPedControlState, 300, 1, ped, "forwards", true)
                                setTimer(setPedControlState, 300, 1, ped, "walk", true)
                                eCache["ped"][ped] = true
                            end
                        end
                    end, 30000, 0
               )
            end
        end, 500, 1
   )
end

function stopSituations()
    if isTimer(timers["refilTimer"]) then
        killTimer(timers["refilTimer"])
    end
    if isTimer(timers["refilTimer2"]) then
        killTimer(timers["refilTimer2"])
    end
    for k,v in pairs(eCache) do
        for k2, v2 in pairs(eCache[k]) do
            if isElement(k2) then
                k2:destroy()
                eCache[k][k2] = nil
            end
        end
    end
end


local charReg = {}
local font, tWidth, selected, cSelected
local gender
local se = 0
local iState = "?"

pSkins = {
    --[[
    [Nemzetiség (A panel sorrendje alapján)] = {
        [1 = FÉRFI] = {Skinek pld: 107, 109},
        [2 = NŐ] = {Skinek pld: 107, 109},
    },
   ]]
    [1] = { -- európai
        [1] = {3, 15, 16, 17, 18, 19, 20, 24, 25, 26},
        [2] = {1, 2, 4, 5, 7, 8, 10, 11, 14, 23},
    },
    [2] = { -- amerikai
        [1] = {7, 240, 1},
        [2] = {10, 40, 69},
    },
    [3] = { -- ázsiai
        [1] = {57, 58, 49},
        [2] = {169, 56, 141},
    },
    [4] = { -- afrikai
        [1] = {17, 21, 22},
        [2] = {13,  195, 245},
    },
}



anims = {
    {"DANCING", "DAN_Right_A", -1, true, false, false},
    {"DANCING", "DAN_Down_A", -1, true, false, false},
    {"DANCING", "dnce_M_d", -1, true, false, false},
    {"DANCING", "dance_loop", -1, true, false, false},
    {"DANCING", "dnce_m_c", -1, true, false, false},
    {"DANCING", "dnce_m_e", -1, true, false, false},
    {"DANCING", "dnce_m_a", -1, true, false, false},
    {"DANCING", "dan_up_a", -1, true, false, false},
    {"DANCING", "dan_left_a", -1, true, false, false},
}

function dxDrawBorder(x, y, w, h, radius, color)
	dxDrawRectangle(x - radius, y, radius, h, color)
	dxDrawRectangle(x + w, y, radius, h, color)
	dxDrawRectangle(x - radius, y - radius, w + (radius * 2), radius, color)
	dxDrawRectangle(x - radius, y + h, w + (radius * 2), radius, color)
end

function dxCreateBorder(x,y,w,h,color)
	dxDrawRectangle(x,y-1,w+1,1,color) -- Fent
	dxDrawRectangle(x,y+1,1,h,color) -- Bal Oldal
	dxDrawRectangle(x+1,y+h,w,1,color) -- Lent Oldal
	dxDrawRectangle(x+w,y-1,1,h+1,color) -- Jobb Oldal
end

startAnimationTime = 500
startAnimation = "InOutQuad"

sx, sy = guiGetScreenSize()

function startCharReg()
    --requestTextBars
    fadeCamera(false, 0)
    setCameraMatrix(1111.7548828125, -1137.9794921875, 24.2, 1111.7548828125, -1137.9794921875, 24.2)
    stopSituations()
    details = {}
   -- stopLoginPanel()
    --stopLoginSound()
    --stopLogoAnimation()
    setElementData(localPlayer, "keysDenied", true)
    setElementData(localPlayer, "hudVisible", false)
    page = "CharReg"
    iState = "start"
 

    id = 1
    local skin = pSkins[1][1][id]
    skinPed = createPed(skin, 1111.986328125, -1133.6943359375, 23.828125, 178)
    skinPed:setFrozen(true)
    skinPed:setDimension(localPlayer:getDimension())
    skinPed:setInterior(localPlayer:getInterior())
    --local anim = (anims[math.random(1,#anims)])
    --skinPed:setAnimation(unpack(anim))

   setTimer(
        function()
            text = "Bir taç altında unutulmaz bir Deathplay deneyimi!"
            tStart = true
            tStartTick = getTickCount()
            addEventHandler("onClientRender", root, drawnText, true, "low-5")
            setTimer(
                function()
                    tStart = false
                    tStartTick = getTickCount()
                end, 5000, 1
           )
        end, 1000, 1
   )
end
addEvent("Start.Char-Register", true)
addEventHandler("Start.Char-Register", root, startCharReg)

function stopCharacterRegistration()
    Clear()
    removeEventHandler("onClientRender",root,drawnCharRegPanel)

    details["skin"] = skinPed.model
    skinPed:destroy()
    unbindKey("arrow_l", "down", LeftSkinC)
    unbindKey("arrow_r", "down", RightSkinC)
	

   -- local t = {getElementData(localPlayer, "acc >> username"), getElementData(localPlayer, "acc >> id")}
   -- triggerServerEvent("character.Register", localPlayer, localPlayer, details, t)
    --startTour()
    startVideo()
end

function stopCharReg()
    if page == "CharReg" then
        removeEventHandler("onClientRender", root, drawnLogin)
        --stopLogoAnimation()
    end
end

addEventHandler("onClientResourceStop", resourceRoot,
    function()
    end
)

function drawnText()
    local alpha
    local nowTick = getTickCount()
    if tStart then
        local elapsedTime = nowTick - tStartTick
        local duration = (tStartTick + startAnimationTime) - tStartTick
        local progress = elapsedTime / duration
        local alph = interpolateBetween(
            0, 0, 0,
            255, 0, 0,
            progress, startAnimation
       )

        alpha = alph
    else
        local elapsedTime = nowTick - tStartTick
        local duration = (tStartTick + startAnimationTime) - tStartTick
        local progress = elapsedTime / duration
        local alph = interpolateBetween(
            255, 0, 0,
            0, 0, 0,
            progress, startAnimation
       )

        alpha = alph

        if progress >= 1 then
            removeEventHandler("onClientRender", root, drawnText)
            alpha = 0
            multipler = 1
            fadeCamera(true)

            setTimer(
                function()
                    alphaTickD = getTickCount();
                    alphaTick2D = getTickCount();
                    nowAnim = "fadein"
					--addEventHandler("onClientRender", root, drawnBoxNationality, true, "low-5")
					startCharRegPanel()
                end, 900, 1
           )
            return
        end
    end
    local font = exports.cr_fonts:getFont("UbuntuRegular", 13)
    dxDrawText(text, sx/2, sy/2, sx/2, sy/2, tocolor(156,156,156,alpha), 1, font, "center", "center")
end

function drawnBoxNationality()
    local alpha
    local options = 4
    selected = nil
    local font = exports.cr_fonts:getFont("UbuntuRegular", 13)
    --local awesomeFont = exports['cr_fonts']:getFont("awesomeFont", 12)
    if nowAnim == 'fadein' then
        alpha = {interpolateBetween(0,0,0, 150, 150, 100, (getTickCount() - alphaTickD) / 500, "OutQuad")}
    elseif nowAnim == 'fadeout' then
        alpha = {interpolateBetween(150, 150, 100, 0,0,0, (getTickCount() - alphaTickD) / 500, "OutQuad")}
    else
        alpha = {0,0,0}
    end

    --exports["cr_Job"]:createBlur(0,0, s[1], s[2], alpha[1])
    --dxDrawRectangle(0,0, sx, sy, tocolor(0,0,0, alpha[2]))

    text = "Karakterinizin uyruğunu seçin"

    w = dxGetTextWidth(text, 0.75, font, true) + 20
    h = 45 + (28 * options)--95
    x, y = sx/2 - w/2, sy/2 - h/2
    dxDrawRectangle(x, y, w, h, tocolor(20,20,20,alpha[2]))
    dxDrawBorder(x, y, w, h, 2, tocolor(0,0,0,alpha[3]))

    dxDrawText(text, x, y, x + w, y + 40, tocolor(200,200,200,alpha[2]),0.75, font, "center", 'center', false, false, false, true)
    dxDrawRectangle(x, y, w, 40)

    local btnText, btnIcon
    for i = 0, options - 1 do

        if i == 0 then
            btnText = 'Avrupa';
            btnIcon = "public/images/europe.png"--Cache["Carshop Textures"]["tick"]
            ir, ig, ib = 255,255,255
        elseif i == 1 then
            btnText = 'Amerika';
            btnIcon = "public/images/american.png"--Cache["Carshop Textures"]["x"]
            ir, ig, ib = 255,255,255
        elseif i == 2 then
            btnText = 'Asya';
            btnIcon = "public/images/asia.png"--Cache["Carshop Textures"]["x"]
            ir, ig, ib = 255,255,255
        elseif i == 3 then
            btnText = 'Afrika';
            btnIcon = "public/images/africa.png"--Cache["Carshop Textures"]["x"]
            ir, ig, ib = 255,255,255
        end

        if exports.cr_ui:inArea(x + 5, y + 40 + (i*28), w - 10, 25) or se == i + 1 then
            if exports.cr_ui:inArea(x + 5, y + 40 + (i*28), w - 10, 25) then
                selected = i
            end
            dxDrawRectangle(x + 5, y + 40 + (i*28), w - 10, 25, tocolor(61,122,188, alpha[3]))
        else
            dxDrawRectangle(x + 5, y + 40 + (i*28), w - 10, 25, tocolor(40, 40, 40, alpha[3]))
        end

        dxDrawText(btnText, x + 35, y + 40 + (i*28), 0, y + 40 + (i*28) + 25, tocolor(200,200,200,alpha[2]),0.8, font, _, "center")
        dxDrawImage(x + 10, y + 40 + (i*28) + 25/2 - 20/2, 20, 20, btnIcon, 0,0,0, tocolor(ir, ig, ib, alpha[2]))
    end
end

addEventHandler("onClientClick", root,
    function(b,s)
        if page == "CharReg" then
            if iState == "Nationality" then
                if b == "left" and s == "down" then
                    --outputChatBox(selected)
                    --outputChatBox(se)
                    if selected == 0 then
                        if se == 1 then
                            se = 0
                        else
                            se = 1
                            local skin = pSkins[1][1][id]
                            skinPed:setModel(skin)
                        end
                    elseif selected == 1 then
                        if se == 2 then
                            se = 0
                        else
                            se = 2
                            local skin = pSkins[2][1][id]
                            skinPed:setModel(skin)
                        end
                    elseif selected == 2 then
                        if se == 3 then
                            se = 0
                        else
                            se = 3
                            local skin = pSkins[3][1][id]
                            skinPed:setModel(skin)
                        end
                    elseif selected == 3 then
                        if se == 4 then
                            se = 0
                        else
                            se = 4
                            local skin = pSkins[4][1][id]
                            skinPed:setModel(skin)
                        end
                    end
                end
            end
        end
    end
)

function nationalityNext()


    alpha = 0
    multipler = 1
    details["nationality"] = se
    se = 0
    unbindKey("enter", "down", nationalityNext)

    alphaTickD = getTickCount();
    alphaTick2D = getTickCount();
    nowAnim = "fadeout"

            removeEventHandler("onClientRender", root, drawnBoxNationality)
            startCharRegPanel()
end

local start, startTick
function startCharRegPanel()
    nationality = details["nationality"]
    id = 1
    local skin = pSkins[1][1][id]
    skinPed:setModel(skin)

    cHover = nil
    cSelected = 1
	gender = 0
    iState = "Char-Reg>Panel"
    start = true
    startTick = getTickCount()
    addEventHandler("onClientRender", root, drawnCharRegPanel, true, "low-5")
    font = exports['cr_fonts']:getFont("UbuntuRegular", 10)
    tWidth = math.floor(dxGetTextWidth("Bir görünüm seçin.", 1, font, true) + 10)

    bindKey("arrow_l", "down", LeftSkinC)
    bindKey("arrow_r", "down", RightSkinC)

    local font = exports['cr_fonts']:getFont("UbuntuRegular", 11)
    CreateNewBar("Char-Reg.Name", {0,0,0,0}, {30, "İsim Soyisim", false, tocolor(156,156,156,255), font, 1, "center", "center", false}, 1)
    CreateNewBar("Char-Reg.Age", {0,0,0,0}, {2, "10 - 80", true, tocolor(156,156,156,255), font, 1, "center", "center", false}, 2)
    CreateNewBar("Char-Reg.Height", {0,0,0,0}, {3, "150cm - 220cm", true, tocolor(156,156,156,255), font, 1, "center", "center", false}, 4)
    CreateNewBar("Char-Reg.Weight", {0,0,0,0}, {2, "45kg - 120kg", true, tocolor(156,156,156,255), font, 1, "center", "center", false}, 3)
end

local swears = {
    --
    {"fos"},
    {"f"},
    {"f*s"},
    {"fo*"},
    --
    {"kurva"},
    {"k*rva"},
    {"ku*va"},
    {"kur*a"},
    {"kurv*"},
    --
    {"anyád"},
    {"anyad"},
    {"any*d"},
    {"*ny*d"},
    {"any*d"},
    --
    {"hülye"},
    {"hulye"},
    {"h*lye"},
    {"h*ly*"},
    {"hüje"},
    {"huje"},
    {"h*je"},
    {"h*j*"},
    {"hűlye"},
    {"hűje"},
    --
    {"szar"},
    {"sz*r"},
    {"sz"},
    {"sza*"},
    --
    {"faszfej"},
    {"foszfej"},
    {"fasz fej"},
    {"fosz fej"},
    --
    {"fasszopo"},
    {"faszopo"},
    --
    {"mocskos"},
    {"m*cskos"},
    --
    {"dögölnél"},
    {"dogolnel"},
    --
    {"fasz"},
    {"fassz"},
    {"fsz"},
    {"fosz"},
    {"f*sz"},
    {"fa"},
    --
    {"pina"},
    {"pna"},
    {"puna"},
    {"p*na"},
    {"pi"},
    --
    {"punci"},
    {"p*nci"},
    --
    {"gci"},
    {"geci"},
    {"g*ci"},
    {"ge*i"},
    {"gecci"},
    {"gacci"},
    --
    {"tetves"},
    {"tötves"},
    {"t*tves"},
    --
    {"noob"},
    {"nob"},
    {"nb"},
    {"n*b"},
    --
    {"balfasz"},
    {"b*lfasz"},
    --
    {"csicska"},
    {"cs*cska"},
    {"cscska"},
    --
    {"nyomorék"},
    {"nyomorek"},
    {"nyomor*k"},
    {"nyomorult"},
    {"nyomorúlt"},
    --
    {"csíra"},
    {"csira"},
    {"csra"},
    {"cs*ra"},
    --
    {"bazdmeg"},
    {"bozdmeg"},
    {"b*zdmeg"},
    {"b*zdm*g"},
    --
    {"bazd"},
    {"b*zd"},
    {"bzd"},
    --
    {"buzi"},
    {"b*zi"},
    {"bzi"},
    --[[
    {"see", true},
    {"látás", true},
    {"hl", true},
    {"hungary", true},
    {"life", true},
    {"avrp", true},
    {"fine", true},
    {"replay", true},
    {"social", true},
    {"gaming", true},
    {"mta", true},
    {"fly", true},
    {"owl", true},
    {"lv", true},
    {"v2", true},
    {"v3", true},
    {"v4", true},
    {"las venturas", true},]]
}

local stars = ""

function findSwear(msg)
    local color = "#d23131"
    local color2 = "#d23131"
    local white = "#FFFFFF "
    local without = msg
    local strF = without
    for k,v in pairs(swears) do
        local swear = v[1]
        local last = 1
        --outputChatBox("asd1")
        --outputChatBox(swear)
        while true do
            local a, b = without:lower():find(swear:lower(), last, true)
            if a or b then
                if not v[2] then
                    --outputChatBox(syntax .. "Tiltott " .. color .. "szót" .. white .. " használtál! (" .. color..swear..white .. ")", 255,255,255,true)
                end

                local str = without:sub(1, a - 1)
                str = str .. stars:sub(1, #swear)
                str = str .. without:sub(b + 1, #without)

                without = str
                last = b + 1
            else
                break
            end
        end
    end
    
    return without
end
lastClickTick = getTickCount()
function stopCharRegPanel()
    local height = tonumber(GetText("Char-Reg.Height")) or 0
    local age = tonumber(GetText("Char-Reg.Age")) or 0
    local weight = tonumber(GetText("Char-Reg.Weight")) or 0
    local name = (GetText("Char-Reg.Name")) or ""

    if height < 150 or height > 220  then
        exports.cr_infobox:addBox("error", "Boyunuz 150 ile 220 cm aralığında olmalıdır.")
        return
    end

    if weight < 45 or weight > 150  then
        exports.cr_infobox:addBox("error", "Kilonuz 45 ile 150 aralığında olmalıdır.")
        return
    end

    if age < 10 or age > 80 then
        exports.cr_infobox:addBox("error", "Yaşınız 10 ile 80 aralığında olmalıdır.")

        return
    end

    name = name:gsub("_", " ")
    name = name:gsub("%p", " ")
    local fullName = ""
    local count = 1

    while true do
        local a = gettok(name, count, string.byte(' '))
        if a then
            if #a <= 2 then
               exports.cr_infobox:addBox("error", "Girdiğiniz isim uygun değil.")
                return
            end
            count = count + 1
            a = a .. "_"
            a = string.upper(utfSub(a, 1, 1)) .. string.lower(utfSub(a, 2, #a))
            fullName = fullName .. a
        else
            break
        end
    end

    if utfSub(fullName, #fullName, #fullName) == "_" then
        fullName = utfSub(fullName, 1, #fullName - 1)
    end


    if count < 3 then
        exports.cr_infobox:addBox("error", "İkiden fazla isim kullanamazsınız.")
        return
    end

    if name ~= findSwear(name) then
        exports.cr_infobox:addBox("error", "İsminizde yasaklı kelimeler kullanılıyor.")
        return
    end

    if lastClickTick + 1000 > getTickCount() then
        return
    end
    lastClickTick = getTickCount()

    details["neme"] = cSelected
	details["gender"] = gender
    details["age"] = age
    --local time = getBornTime(age)
    --details["born"] = time
    details["height"] = height
    details["weight"] = weight
	
    local b = fullName
    --outputChatBox(b)
	
	triggerServerEvent("account.checkCharacterName", localPlayer, localPlayer, b)
	
    --start = false
    --startTick = getTickCount()
end


function startTheSex()

    name = details["name"]
	height = details["height"]
    weight = details["weight"]
	age = details["age"]
	gender = details["gender"]
	skin = details["skin"]
	
	characterDescription = "Karakter bilgileri doldurun"
	
	race = 1

	
	languageselected = 1
	
	month = 1
	
	day = 1
	
	local locations = {
					-- x, 			y,					 z, 			rot    		int, 	dim 	Location Name
		["default"] = { 1685.0703125, -2240.076171875, 13.546875, 90.119445800781,            0,         0,         "A bus stop next to IGS"},
		["bus"] = {1749.509765625, -1860.5087890625, 13.578649520874, 359.0744, 	0, 		0, 		"Unity Bus Station"},
		["metro"] = {808.88671875, -1354.6513671875, -0.5078125, 139.5092, 			0, 		0,		"Metro Station"},
		["air"] = {1691.6455078125, -2334.001953125, 13.546875, 0.10711, 			0, 		0,		"Los Santos International Airport"},
		["boat"] = {2809.66015625, -2436.7236328125, 13.628322601318, 90.8995, 		0, 		0,		"Santa Maria Dock"},
	}
	
    triggerServerEvent("account.newCharacter", localPlayer, name, characterDescription, race, gender, skin, height, weight, age, languageselected, month, day, locations.default)
	stopLoadingScreen()
end

function newCharacter_response(statusID, statusSubID)
	if (statusID == 1) then
		LoginScreen_showWarningMessage("HATA VERIORUM, something went wrong. Try again\nor contact an administrator.\nError ACC" .. tostring(statusSubID))
	elseif (statusID == 2) then
		if (statusSubID == 1) then
			LoginScreen_showWarningMessage("Böyle Bir İsim Zaten Kullanılmaktadır.\nuse, sorry :(!")
		else
			LoginScreen_showWarningMessage("BİLEMEDİM NE Kİ BU, something went wrong. Try again\nor contact an administrator.\nError ACD" .. tostring(statusSubID))
		end
	elseif (statusID == 3) then
		triggerServerEvent("accounts:characters:spawn", localPlayer, statusSubID)
		return
	end
end
addEventHandler("account.newCharacter", root, newCharacter_response)

addEvent("account.receiveCharacterName", true)
addEventHandler("account.receiveCharacterName", root,
    function(a, b)
        if a then
            start = false
			details["name"] = b
            startTick = getTickCount()
        else
            exports.cr_infobox:addBox("error", "Böyle bir karakter bulunuyor.")
            return
        end
    end
)

function drawnCharRegPanel()
    local alpha
    local nowTick = getTickCount()
    if start then
        local elapsedTime = nowTick - startTick
        local duration = (startTick + startAnimationTime) - startTick
        local progress = elapsedTime / duration
        local alph = interpolateBetween(
            0, 0, 0,
            255, 0, 0,
            progress, startAnimation
       )

        alpha = alph
    else

        local elapsedTime = nowTick - startTick
        local duration = (startTick + startAnimationTime) - startTick
        local progress = elapsedTime / duration
        local alph = interpolateBetween(
            255, 0, 0,
            0, 0, 0,
            progress, startAnimation
       )

        alpha = alph

        if progress >= 1 then
            stopCharacterRegistration()
            alpha = 0
            return
        end
    end

    --local h = 74

    local w, h = 14, 30
    local x, y = 80 , 191*2
    cHover = nil
    if exports.cr_ui:inArea(x,y,w,h) or cSelected == 2 then
        if exports.cr_ui:inArea(x,y,w,h) then
            cHover = "woman"
        end
        
        local r,g,b = 210,49,49
        dxDrawImage(x,y,w,h, "public/images/female.png", 0,0,0, tocolor(r, g, b, alpha))
    else
        dxDrawImage(x,y,w,h, "public/images/female.png", 0,0,0, tocolor(255, 255, 255, alpha))
    end
    
    local w, h = 14, 30
    local x, y = 210 , 191*2
    if exports.cr_ui:inArea(x,y,w,h) or cSelected == 1 then
        if exports.cr_ui:inArea(x,y,w,h) then
            cHover = "man"
        end
        
        local r,g,b = 61,122,188
        dxDrawImage(x,y,w,h, "public/images/male.png", 0,0,0, tocolor(r, g, b, alpha))
    else
        dxDrawImage(x,y,w,h, "public/images/male.png", 0,0,0, tocolor(255, 255, 255, alpha))
    end

    local font = exports['cr_fonts']:getFont("UbuntuRegular", 10)
    local between = 5
    local h = 74

    local yuksek = 900
    local yanalum = 150
    if exports.cr_ui:inArea(sx/2 - tWidth/2 - between - 25, sy - yuksek/2 - 25/2, 25, 25) then
        cHover = "arrowLeft"
        dxDrawImage(sx/2 - tWidth/2 - between - 25, sy - yuksek/2 - 25/2, 25, 25, "public/images/arrowLeft.png", 0,0,0, exports.cr_ui:getServerColor(1, alpha))
    else
        dxDrawImage(sx/2 - tWidth/2 - between - 25, sy - yuksek/2 - 25/2, 25, 25, "public/images/arrowLeft.png", 0,0,0, tocolor(255, 255, 255, alpha))
    end

    if exports.cr_ui:inArea(sx/2 + tWidth/2 + between + yanalum, sy - yuksek/2 - 25/2, 25, 25) then
        cHover = "arrowRight"
        dxDrawImage(sx/2 + tWidth/2 + between + yanalum, sy - yuksek/2 - 25/2, 25, 25, "public/images/arrowRight.png", 0,0,0, exports.cr_ui:getServerColor(1, alpha))
    else
        dxDrawImage(sx/2 + tWidth/2 + between + yanalum, sy - yuksek/2 - 25/2, 25, 25, "public/images/arrowRight.png", 0,0,0, tocolor(255, 255, 255, alpha))
    end

    local _w, _h = w, h
    local w, h = 280, 28
    local x, y = 10, 445
    dxDrawRectangle(x,y,w,h,tocolor(0, 0, 0, 80))
    dxDrawRectangle(x+2,y+2,w-4,h-4,tocolor(22, 22, 22, 100))
    dxDrawText(heighticon .. "",x+6,y+5,w,h, tocolor (255,255,255, 255), 1.1, awesome)
    local bName = "Char-Reg.Height"
    UpdatePos(bName, {x,y,w,h})
    UpdateAlpha(bName, tocolor(255, 255, 255, alpha))

    local w, h = 280, 28
    local x, y = 10, 350
    dxDrawRectangle(x,y,w,h,tocolor(0, 0, 0, 80))
    dxDrawRectangle(x+2,y+2,w-4,h-4,tocolor(22, 22, 22, 100))
    dxDrawText(liveIcon .. "",x+6,y+5,w,h, tocolor (255,255,255, 255), 1.1, awesome)
    local bName = "Char-Reg.Name"
    UpdatePos(bName, {x,y,w,h})
    UpdateAlpha(bName, tocolor(255, 255, 255, alpha))

    local w, h = 280, 28
    local x, y = 10 , 415
    dxDrawRectangle(x,y,w,h,tocolor(0, 0, 0, 80))
    dxDrawRectangle(x+2,y+2,w-4,h-4,tocolor(22, 22, 22, 100))
    dxDrawText(ageIcon .. "",x+6,y+3,w,h, tocolor (255,255,255, 255), 1.1, awesome)
    local bName = "Char-Reg.Age"
    UpdatePos(bName, {x,y,w,h})
    UpdateAlpha(bName, tocolor(255, 255, 255, alpha))

    local w, h = 280, 28
    local x, y = 10, 475
    dxDrawRectangle(x,y,w,h,tocolor(0, 0, 0, 80))
    dxDrawRectangle(x+2,y+2,w-4,h-4,tocolor(22, 22, 22, 100))
    dxDrawText(heighticon .. "",x+6,y+5,w,h, tocolor (255,255,255, 255), 1.1, awesome)
    local bName = "Char-Reg.Weight"
    UpdatePos(bName, {x,y,w,h})
    UpdateAlpha(bName, tocolor(255, 255, 255, alpha))

    local w, h = 200, 200
    local x, y = 50, 297*2
    dxDrawText("Erkek", x+100,y,w,h, tocolor(255, 255, 255, alpha), 1, font, "center", "center")
    dxDrawText("Kadın", x,y,w,h, tocolor(255, 255, 255, alpha), 1, font, "center", "center")

    local w, h = 160, 160
    local x, y = 70, 180
    dxDrawImage(x, y, w, h, ":cr_ui/public/images/logos/solid.png", 0, 0, 0, exports.cr_ui:getServerColor(1, alpha))

    local w, h = _w, _h
    if startedCharCreate then
        local multipler

        local elapsedTime = nowTick - createTick
        local duration = (createTick + 1000) - createTick
        local progress = elapsedTime / duration
        local alph = interpolateBetween(
            0, 0, 0,
            255, 0, 0,
            progress, startAnimation
       )

        multipler = alph / 255

        if progress >= 1 then
            startedCharCreate = nil
            stopCharRegPanel()
        end
        
        dxDrawText("İlerlemek için basılı tut.", sx - 20 - 177, sy - h/2 - 27/2, sx - 20, sy - h/2 + 27/2, tocolor(100, 100, 100, alpha), 1, font, "center", "center")
        dxDrawRectangle(sx - 20 - 177, sy - h/2 - 27/2, 177, 2, tocolor(100, 100, 100, alpha))
        dxDrawRectangle(sx - 20 - 177, sy - h/2 + 27/2 - 2, 177, 2, tocolor(100, 100, 100, alpha))

        local w = 177 * math.max(multipler - 0.03, 0)
        local tWidth = dxGetTextWidth("İlerlemek için basılı tut.", 1, font, true)
        dxDrawText("İlerlemek için basılı tut.", sx - 20 - 177/2 - tWidth/2, sy - h/2 - 27/2, sx - 20 - 177/2 - tWidth/2 + w, sy - h/2 + 27/2, exports.cr_ui:getServerColor(1, alpha), 1, font, _, "center", true)
        local w = (177 * multipler)
        dxDrawRectangle(sx - 20 - 177, sy - h/2 - 27/2, w, 2, exports.cr_ui:getServerColor(1, alpha))
        dxDrawRectangle(sx - 20 - 177, sy - h/2 + 27/2 - 2, w, 2, exports.cr_ui:getServerColor(1, alpha))
    elseif exports.cr_ui:inArea(sx - 20 - 177, sy - h/2 - 27/2, 177, 27) then
        cHover = "StartCharCreate"
        dxDrawText("İlerlemek için basılı tut.", sx - 20 - 177, sy - h/2 - 27/2, sx - 20, sy - h/2 + 27/2, exports.cr_ui:getServerColor(1, alpha), 1, font, "center", "center")
        dxDrawRectangle(sx - 20 - 177, sy - h/2 - 27/2, 177, 2, exports.cr_ui:getServerColor(1, alpha))
        dxDrawRectangle(sx - 20 - 177, sy - h/2 + 27/2 - 2, 177, 2, exports.cr_ui:getServerColor(1, alpha))
    else
        dxDrawText("İlerlemek için basılı tut.", sx - 20 - 177, sy - h/2 - 27/2, sx - 20, sy - h/2 + 27/2, tocolor(100, 100, 100, alpha), 1, font, "center", "center")
        dxDrawRectangle(sx - 20 - 177, sy - h/2 - 27/2, 177, 2, tocolor(100, 100, 100, alpha))
        dxDrawRectangle(sx - 20 - 177, sy - h/2 + 27/2 - 2, 177, 2, tocolor(100, 100, 100, alpha))
    end
end

function LeftSkinC()
    if id - 1 >= 1 then
        id = id - 1
        local skin = pSkins[1][cSelected][id]
        skinPed:setModel(skin)
    end
end

function RightSkinC()
    if id + 1 <= #pSkins[1][cSelected] then
        id = id + 1
        local skin = pSkins[1][cSelected][id]
        skinPed:setModel(skin)
    end
end

addEventHandler("onClientClick", root,
    function(b,s)
        if page == "CharReg" then
            if iState == "Char-Reg>Panel" then
                if b == "left" and s == "up" then
                    if startedCharCreate then
                        startedCharCreate = nil
                        createTick = nil
                    end
                elseif b == "left" and s == "down" then
                    if cHover == "woman" then
                        cSelected = 2
						gender = 1
						
                        local newSkin = pSkins[1][cSelected][id]
                        if not newSkin then
                            id = 1
                            newSkin = pSkins[1][cSelected][id]
                        end
                        skinPed:setModel(newSkin)
                    elseif cHover == "man" then
                        cSelected = 1
						gender = 0
                        local newSkin = pSkins[1][cSelected][id]
                        if not newSkin then
                            id = 1
                            newSkin = pSkins[1][cSelected][id]
                        end
                        skinPed:setModel(newSkin)
                    elseif cHover == "arrowRight" then
                        if id + 1 <= #pSkins[1][cSelected] then
                            id = id + 1
                            local skin = pSkins[1][cSelected][id]
                            skinPed:setModel(skin)
                        end
                    elseif cHover == "arrowLeft" then
                        if id - 1 >= 1 then
                            id = id - 1
                            local skin = pSkins[1][cSelected][id]
                            skinPed:setModel(skin)
                        end
                    elseif cHover == "StartCharCreate" then
                        startedCharCreate = true
                        createTick = getTickCount()
                    end
                end
            end
        end
    end
)

local state, cache = false, {}

function exist(e)
    for k,v in pairs(cache) do
        if v[1] == e then
            return true
        end
    end

    return false
end

function loadPlayer(e)
    if exist(e) then
        return
    end

    local start = getTickCount()
    table.insert(cache, {e, start, start + 7500})
    setElementAlpha(e, 50)

    if not state then
        state = true
        addEventHandler("onClientRender", root, loadPlayers, true, "low-5")
    end
end

function loadPlayers()
    if #cache == 0 then
        state = false
        removeEventHandler("onClientRender", root, loadPlayers)
    end

    local now = getTickCount()
    for k,v in pairs(cache) do
        local e, startTime, endTime= unpack(v)
        if isElement(e) then
            local elapsedTime = now - startTime
            local duration = endTime - startTime
            local progress = elapsedTime / duration

            local a = interpolateBetween(
                50, 0, 0,
                255, 0, 0,
                progress, "Linear"
           )

            setElementAlpha(e, a)

            if progress >= 1 then
                if e == localPlayer then
                    setElementData(e, "loading", false)
                    triggerServerEvent("playerAlpha", localPlayer, localPlayer)
                end
                table.remove(cache, k)
            end
        else
            table.remove(cache, k)
        end
    end
end

addEventHandler("onClientElementDataChange", root,
    function(dName, oValue, nValue)
        if dName == "loading" then
            if nValue then
                if isElementStreamedIn(source) then
                    loadPlayer(source)
                end
            end
        end
    end
)


local sx, sy = guiGetScreenSize()

local plane_id = 577
local plane_pos = {
	[1] = {-1336.296875, -221.44393920898, 14.1484375, 0, 0, 315},
	[2] = {-1336.296875, -221.44393920898, 14.1484375, 0, 0, 315},
	[3] = {-1656.5775146484, -163.86363220215, 14.1484375, 0, 0, 315},
	[4] = {1649.3438720703, -2593.2211914063, 13.546875, 0, 0, 270},
	[5] = {1901.3, -2390.6, 13.5546875, 0, 0, 90},
}
local cam_pos = {
	[1] = {-1301.7354736328, -214.44549560547, 17.390600204468, -1302.6909179688, -214.49052429199, 17.09881401062},
	[2] = {-1283.9250488281, -197.25160217285, 27.339399337769, -1284.7592773438, -197.56370544434, 26.884841918945},
	[3] = {-1635.8018798828, -112.89260101318, 23.571699142456, -1634.9552001953, -112.385597229, 23.409914016724},
	[4] = {1676.7258300781, -2635.9384765625, 28.377700805664, 1677.3839111328, -2635.2727050781, 28.026012420654},
	[5] = {1892.8656005859, -2409.7883300781, 17.065799713135, 1892.3504638672, -2408.9731445313, 16.801027297974},
}

local ped_pos = {
	-- skinid , x, y, z, rot
	{61, -1314.7160644531, -212.28829956055, 14.1484375, 180, "COP_AMBIENT", "Coplook_think"},
	{76, -1313.3597412109, -212.09132385254, 14.1484375, 160, "COP_AMBIENT", "Coplook_loop"},
	{91, -1312.2592773438, -212.82049560547, 14.1484375, 100, "COP_AMBIENT", "Coplook_loop"},
	{16, -1329.1708984375, -231.74711608887, 14.1484375, 20, "LOWRIDER", "RAP_B_Loop"},
}

local baggages = {
	-- id, x, y, z, rot
	{606, -1319.2740478516, -224.43322753906, 14.1484375, 160},
	{606, -1320.8917236328, -227.95037841797, 14.1484375, 140},
	{606, -1323.9517822266, -230.29293823242, 14.1484375, 125},
	{583, -1327, -232.62112426758, 14.1484375, 130},
}
local ped = {}
local vehs_bag = {}

local alpha, multipler, start, startTick, onEndFunc
local function drawnText()
    local alpha
    local nowTick = getTickCount()
    if start then
        local elapsedTime = nowTick - startTick
        local duration = (startTick + startAnimationTime) - startTick
        local progress = elapsedTime / duration
        local alph = interpolateBetween(
            0, 0, 0,
            255, 0, 0,
            progress, startAnimation
       )
        
        alpha = alph
    else
        
        local elapsedTime = nowTick - startTick
        local duration = (startTick + startAnimationTime) - startTick
        local progress = elapsedTime / duration
        local alph = interpolateBetween(
            255, 0, 0,
            0, 0, 0,
            progress, startAnimation
       )
        
        alpha = alph
        
        if progress >= 1 then
            onEndFunc()
            return
        end
    end
    local font = exports.cr_fonts:getFont("UbuntuRegular",13)
    dxDrawText(text, sx/2, sy/2, sx/2, sy/2, tocolor(255,255,255,alpha), 1, font, "center", "center")
end

function startVideo(cmd)
    fadeCamera(false)
    text = "Sunucumuza hoşgeldin, iyi eğlenceler!"
    start = true
    startTick = getTickCount()
    addEventHandler("onClientRender", root, drawnText, true, "low-5") 
    setTimer(function() 
        text = "Crown Deathplay - discord.gg/crowndp"
        start = true
        startTick = getTickCount()
            setTimer(function() 
                start = false
                startTick = getTickCount()
                onEndFunc = function()
                    removeEventHandler("onClientRender", root, drawnText)
                    sixth_position()			
                end
            end, 1000*5, 1)			
    end, 1000*5, 1)
end

--[[
function third_position()
	setTimer(function() fadeCamera(true) end, 1000*2, 1)
	-- setCameraTarget(localPlayer)
	setCameraMatrix(cam_pos[3][1], cam_pos[3][2], cam_pos[3][3], cam_pos[3][4], cam_pos[3][5], cam_pos[3][6]) 
	setElementFrozen(plane,true)
	setElementPosition(plane, plane_pos[3][1], plane_pos[3][2], plane_pos[3][3])
	setElementRotation(plane, plane_pos[3][4], plane_pos[3][5], plane_pos[3][6])
	setTimer(function() setElementFrozen(plane,false) end, 1000*2.5, 1)
	
	
	
	-- Go to Next Situation
	setTimer(function()
		fadeCamera(false)
	    text = "Három órával később..."
        alpha = 0
        multipler = 1
        addEventHandler("onClientRender", root, drawnText, true, "low-5") 			
		setTimer(function() 
            removeEventHandler("onClientRender", root, drawnText)
            alpha = 0
            multipler = 1			
			fourth_position()
		end, 1000*4, 1)
	end, 1000*12, 1)	
end]]



function sixth_position()
	startLoadingScreen("Char-Reg", 2)
end

local global = {
    --[[
    {"Név", {cameraMatrix(6 pos)}, "Leírás", lines, multipler, time},
   ]]
    {"Benzinlik", {1917.5059814453, -1751.4389648438, 24.140399932861, 1918.1678466797, -1752.0614013672, 23.722612380981}, "İdlewood Gas Station\nBurada aracının yakıt ikmalini yapabilir, kendine güzel bir donut alabilirsin.", 2, 0.2, 15000},
    {"Belediye Binası", {1480.6335449219 , -1712.9239501953 , 21.746000289917 , 1480.6358642578 , -1713.9143066406 , 21.607625961304 , 0 , 70}, "Los Santos City Hall\nBurada kağıt işlerinizi çözebilirsiniz. Vergi olayından bahsetmeyeyim, biraz yorucu bir iş .. ", 2, 0.2, 15000},
    --{"Pláza", {1163.2646484375 , -1639.6114501953 , 31.360300064087 , 1162.3751220703 , -1639.2794189453 , 31.046407699585 , 0 , 70 }, "Ez a pláza.\nItt különböző boltokat találhatsz, ahol tudsz vásárolni.\nPéldául ruhát venni vagy éppen elektronikai eszközt tudsz vásárolni itt.", 3, 0.2, 15000},
    {"Hastane", {1223.6270751953 , -1286.3737792969 , 32.342098236084 , 1222.8918457031 , -1286.9771728516 , 32.033401489258 , 0 , 70 }, "Los Santos Medical Department\nOlası bir sağlık sorununuzda burası, size muhtemelen yardımcı olacak şehrin en iyi bölgesidir. Hemşireler için giden bile oluyor.. Fena.", 2, 0.2, 15000}
}

function startTour()
    _dim = getElementDimension(localPlayer)
    setElementDimension(localPlayer, 0)
    fadeCamera(true)
    now = 1
    name, matrix, text, lines, multipler, time = unpack(global[now])
    startTime = getTickCount()
    endTime = startTime + time
    
    setCameraMatrix(unpack(matrix))
    --exports['cr_ax_custom-chat']:showChat(false)
    showChat(false)
    --toggleAllControls(false, false)
    setElementData(localPlayer, "hudVisible", false)
    setElementData(localPlayer, "keysDenied", true)
    page = "Tour"
    o = 1
    addEventHandler("onClientRender", root, drawnTour, true, "low-5")
    setTimer(change, global[now][6], 1)
end

local i = 5000
function change()
    if global[now + 1] then
        now = now + 1
        name, matrix, text, lines, multipler, time = unpack(global[now])
        local x1, y1, z1, x2, y2, z2 = unpack(global[now - 1][2])
        local x3, y3, z3, x4, y4, z4 = unpack(matrix)
        smoothMoveCamera(x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4, i)
        removeEventHandler("onClientRender", root, drawnTour)
        setTimer(
            function()
                o = 1
                startTime = getTickCount()
                endTime = startTime + time
                addEventHandler("onClientRender", root, drawnTour, true, "low-5")
                setTimer(
                    function()
                        change()
                    end, global[now][6], 1
               )
            end, i, 1
       )
    else
        -- Vége
        stopTour()
    end
end

local loadingGlobal = {
    --[[
    [type] = {
        {Szöveg, Multipler},
    },
   ]]
    ["Login"] = {
        {"Karakter adatok összegyűjtése", 7},
        {"Karakter adatok betöltése", 9},
        {"Karakter spawnolása", 15},
    },
    ["Char-Reg"] = {
        {"Veriler yükleniyor...", 3},
        {"Karakterin oluşturuluyor...", 8},
        {"Son kontroller...", 13},
    },
}

local now

function startLoadingScreen(id, id2)
    logginEd = false
    now = 1
    showCursor(false)
    animX = 0
    alpha = 255
    multipler = 1
    textID = id or 1
    funcID = id2 or 1
    startTick = getTickCount()
    page = "LoadingScreen"
    addEventHandler("onClientRender", root, drawnLoadingScreen, true, "low-5")
    toggleAllControls(false, false)
end

function linedRectangle(x,y,w,h,color,color2,size)
    if not color then
        color = tocolor(0,0,0,180)
    end
    if not color2 then
        color2 = color
    end
    if not size then
        size = 3
    end
	dxDrawRectangle(x, y, w, h, color) -- Háttér
	dxDrawRectangle(x - size, y - size, w + (size * 2), size, color2) -- felső
	dxDrawRectangle(x - size, y + h, w + (size * 2), size, color2) -- alsó
	dxDrawRectangle(x - size, y, size, h, color2) -- bal
	dxDrawRectangle(x + w, y, size, h, color2) -- jobb
end

function stopLoadingScreen()
    removeEventHandler("onClientRender", root, drawnLoadingScreen)
end


function drawnLoadingScreen()
    local font = exports['cr_fonts']:getFont("UbuntuRegular", 8)
    local font2 = exports['cr_fonts']:getFont("UbuntuRegular", 8)
    
    dxDrawRectangle(0,0,sx,sy, tocolor(0,0,0,255))
    dxDrawRectangle(20,sy - 24,sx - 40,4, tocolor(13,13,13,255))
    --linedRectangle(20, sy - 30, sx - 40, 10, tocolor(255, 255, 255, 100), tocolor(10, 10, 10, 255), 3)
    
    local text, multipler = unpack(loadingGlobal[textID][now])
    
    --local startTick = playerDetails[k .. "AnimationTick"]
    --local endTick = startTick + 250

    local nowTick = getTickCount()
    local elapsedTime = nowTick - startTick
    local duration = (startTick + (multipler * 200)) - startTick
    local progress = elapsedTime / duration
    local alph = interpolateBetween(
        0, 0, 0,
        sx - 40, 0, 0,
        progress, "InOutQuad"
   )
    animX = alph
    --multipler = alph / 100
    if progress >= 1 then
        if loadingGlobal[textID][now + 1] then
            startTick = getTickCount()
            now = now + 1
            animX = 0
        else
            if not logginEd then
                logginEd = true
                
                fadeCamera(false, 0)
                startTheSex()
               
            end
        end
    end
    dxDrawText("#cccccc" .. text .. " " .. (math.floor((animX / (sx - 40)) * 100)) .. "%", sx/2, sy - 40, sx/2, sy - 40, tocolor(255,255,255,255), 1, font, "center", "center", false, false, false, true)
    dxDrawRectangle(20, sy - 24, animX, 4, tocolor(57, 123, 199, 255))
end

function drawnTour()    
    local now = getTickCount()
	local elapsedTime = now - startTime
	local duration = endTime - startTime
	local progress = elapsedTime / duration
    
    local font = exports['cr_fonts']:getFont("UbuntuRegular", 8)
    local font2 = exports['cr_fonts']:getFont("UbuntuRegular", 8)
    o = o + multipler
    local name = "#c14948" .. name
    --local text = "" .. text
    local nameW = dxGetTextWidth(name, 1, font, true) + 40
    dxDrawRectangle(0,sy - lines * 22 - 60,nameW,40, tocolor(33,33,33,255))
    dxDrawText(name, 10, sy - lines * 22 - 60, 10 + nameW, sy - lines * 22 - 60 + 40, tocolor(255,255,255,255), 1, font, "center", "center", false, false, false, true)
    
    dxDrawRectangle(0,sy - lines * 22,sx,lines * 22, tocolor(33,33,33,255))
    dxDrawText(utfSub(text, 1, math.floor(o)), 10, sy - lines * 22 + 5, sx, sy, tocolor(204,204,204,255), 1, font2, "left", "center", false, false, false, true)
    
    
    local w2, h2 = 400, 18
    local x, y = sx - w2 - 10, sy - (lines * 22) / 2 - h2/2
    local percent = 1 * progress
    dxDrawRectangle(x, y, w2, 18, tocolor(44,44,44,255)) -- háttér
    local w3 = w2 - 4
    dxDrawRectangle(x + 2, y + 2, w3 * percent, 14, tocolor(89,133,39,255 * 0.35)) -- belső
    
    local x1, y1 = x + 2, y + 2
    dxDrawText("#cccccc" .. math.floor(percent * 100) .. "%", x1, y1, x1 + w2, y1 + 14, tocolor(255,255,255,255), 1, font2, "center", "center", false, false, false, true)
end

function newCharacterResponse(statusID, statusSubID)
	if (statusID == 1) then
		exports.cr_infobox:addBox("error", "Bir sorun oluştu.")
	elseif (statusID == 2) then
		if (statusSubID == 1) then
			exports.cr_infobox:addBox("error", "Böyle bir isim zaten kullanılmaktadır.")
		else
			exports.cr_infobox:addBox("error", "Bir sorun oluştu.")
		end
	elseif (statusID == 3) then
		triggerServerEvent("account.spawnCharacter", localPlayer, statusSubID)
		return
	end
end
addEvent("account.newCharacter", true)
addEventHandler("account.newCharacter", root, newCharacterResponse)