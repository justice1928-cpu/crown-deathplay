screenX, screenY = guiGetScreenSize()

-- the efect settings
--local colorizePed = {255 / 255, 255 / 0, 255 / 0, 255} -- rgba colors 
local colorizePed = {255 / 255, 212 / 255, 59 / 255} -- rgba colors 
local specularPower = 1.3
local effectMaxDistance = 10
local isPostAura = true

-- don't touch
local scx, scy = guiGetScreenSize ()
local effectOn = nil
local myRT = nil
local myShader = nil
local isMRTEnabled = false
local outlineEffect = {}
local PWTimerUpdate = 110

-----------------------------------------------------------------------------------
-- enable/disable
-----------------------------------------------------------------------------------
function enableOutline(isMRT)
	if isMRT and isPostAura then 
		myRT = dxCreateRenderTarget(scx, scy, true)
		myShader = dxCreateShader("fx/edge.fx")
		if not myRT or not myShader then 
			--outputChatBox('Outline: Out of memory!',255,0,0)
			isMRTEnabled = false
			return
		else
			--outputDebugString('Outline: Enabled MRT variant')
			dxSetShaderValue(myShader, "sTex0", myRT)
			dxSetShaderValue(myShader, "sRes", scx, scy)
			isMRTEnabled = true
		end
	else
		--outputDebugString('Outline: Enabled non MRT variant')
		isMRTEnabled = false
	end
	pwEffectEnabled = true
	--enableOutlineTimer(isMRTEnabled)
	--outputChatBox('Outline turned on',255,128,0)
	--outputChatBox('Press ' .. actKey .. ' for x-ray vision',255,128,0)
end

function disableOutline()
	if isElement(myRT) then
		destroyElement(myRT)
	end
    if isElement(myShader) then
        destroyElement(myShader)
    end

    myRT = nil
    myShader = nil
end


-----------------------------------------------------------------------------------
-- create/destroy per player
-----------------------------------------------------------------------------------
function createElementOutlineEffect(element, isMRT)
    if not myRT or not myShader then
        enableOutline(isMRT)
    end

    effectOn = true
    if not outlineEffect[element] then
		if isMRT then 
			outlineEffect[element] = dxCreateShader("fx/wall.fx", 1, 0, true, "all")
		else
			outlineEffect[element] = dxCreateShader("fx/wall.fx", 1, 0, true, "all")
		end
		if not outlineEffect[element] then return false
		else
			if myRT then
				dxSetShaderValue (outlineEffect[element], "secondRT", myRT)
			end
			dxSetShaderValue(outlineEffect[element], "sColorizePed",colorizePed)
			dxSetShaderValue(outlineEffect[element], "sSpecularPower",specularPower)
			engineApplyShaderToWorldTexture (outlineEffect[element], "*" , element)
			engineRemoveShaderFromWorldTexture(outlineEffect[element],"muzzle_texture*", element)
			if not isMRT then
				if getElementAlpha(element)==255 then setElementAlpha(element, 254) end
			end
		return true
		end
    end
end

function destroyElementOutlineEffect(element)
    if outlineEffect[element] then
		--engineRemoveShaderFromWorldTexture(outlineEffect[element], "*", element)
		destroyElement(outlineEffect[element])
		outlineEffect[element] = nil
        disableOutline()
	end
end

addCommandHandler("out", function()
    --for k, v in pairs(getElementsByType("player"))
    createElementOutlineEffect(localPlayer, true)
end)

-----------------------------------------------------------------------------------
-- onClientPreRender
-----------------------------------------------------------------------------------
addEventHandler("onClientPreRender", root,
    function()
		if not pwEffectEnabled or not isMRTEnabled or not effectOn then return end
		-- Clear secondary render target
		dxSetRenderTarget(myRT, true)
		dxSetRenderTarget()
    end
, true, "high")


-----------------------------------------------------------------------------------
-- onClientHUDRender
-----------------------------------------------------------------------------------
addEventHandler("onClientHUDRender", root,
    function()
		if not pwEffectEnabled or not isMRTEnabled or not effectOn or not myShader then return end
		-- Show contents of secondary render target
		dxDrawImage(0, 0, scx, scy, myShader)
    end
)
--[[]]
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()),
	function()
		local isMRT = false
		if dxGetStatus().VideoCardNumRenderTargets > 1 then 
			isMRT = true 
			--outputDebugString('pedWall: MRT in shaders enabled') 
		end
		--triggerEvent("switchOutline", resourceRoot, true, isMRT) -- default on
	end
)

--------------------------------
-- Switch effect on or off
--------------------------------
function switchOutline(pwOn, isMRT)
	--outputDebugString("switchOutline: " .. tostring(pwOn) .. ' MRT: ' .. tostring(isMRT))
	if pwOn then
		enableOutline(isMRT)
	else
		disableOutline()
	end
end

addEvent("switchOutline", true)
addEventHandler("switchOutline", resourceRoot, switchOutline)

buttons = {}
activeButton = false

function cursorInBox(x, y, w, h)
	if x and y and w and h then
		if isCursorShowing() then
			if not isMTAWindowActive() then
				local cursorX, cursorY = getCursorPosition()
				
				cursorX, cursorY = cursorX * screenX, cursorY * screenY
				
				if cursorX >= x and cursorX <= x + w and cursorY >= y and cursorY <= y + h then
					return true
				end
			end
		end
	end
	
	return false
end

function dxDrawMetroBox(x, y, w, h, color, imagePath, imageW, imageH, imageColor, imageAlign, titleText, titleTextColor, titleTextFont, titleTextAlign, downText, downTextColor, downTextFont, downTextAlign, bg)   
    local fadeAmount = tabPanelAlphas[activePage]

    dxDrawRectangle(x, y, w, h, color)

    if bg then 
        --outputDebugString("bg")
        dxDrawRectangle(x, y, bg, h, tocolor(241, 238, 0, 255 * fadeAmount))
    end

    if imagePath then
        imageW = imageW or respc(100)
        imageH = imageH or respc(100)
        imageColor = imageColor or tocolor(255, 255, 255, 255 * fadeAmount)
        imageAlign = imageAlign or "center"

        if imageAlign == "center" then
            local imgX, imgY = x + (w - imageW) * 0.5, y + (h - imageH) * 0.5
            dxDrawImage(imgX, imgY, imageW, imageH, imagePath, 0, 0, 0, imageColor)
        elseif imageAlign == "left" then
            local imgX, imgY = x + respc(10), y + (h - imageH) * 0.5
            dxDrawImage(imgX, imgY, imageW, imageH, imagePath, 0, 0, 0, imageColor)
        elseif imageAlign == "right" then
            local imgX, imgY = x + w - imageW - respc(10), y + (h - imageH) * 0.5
            dxDrawImage(imgX, imgY, imageW, imageH, imagePath, 0, 0, 0, imageColor)
        end
    end

    if titleText then
        titleTextColor = titleTextColor or tocolor(255, 255, 255, 255 * fadeAmount)
        titleTextAlign = titleTextAlign or "left"
        titleTextFont = titleTextFont or fonts.Roboto11

        dxDrawText(titleText, x + respc(10), y + respc(10), x + w, y + w, titleTextColor, 1, titleTextFont, titleTextAlign)
    end

    if downText then
        downTextColor = downTextColor or tocolor(255, 255, 255, 255 * fadeAmount)
        downTextAlign = downTextAlign or "right"
        downTextFont = downTextFont or fonts.Roboto11
        local fontHeight = dxGetFontHeight(1, downTextFont)

        dxDrawText(downText, x - respc(10), y + h - fontHeight - respc(10), (x + w) - respc(10), y + w, downTextColor, 1, downTextFont, downTextAlign)
    end
end

function dxDrawMetroTileWithEffect(key, label, x, y, w, h, activeColor, imagePath, imageW, imageH, imageColor, imageAlign, titleText, titleTextColor, titleTextFont, titleTextAlign, downText, downTextColor, downTextFont, downTextAlign, centerText, centerTextColor, centerTextFont, centerTextAlign)
	local buttonColor

	if activeButton == key then -- !!!
		buttonColor = {processColorSwitchEffect(key, {activeColor[1], activeColor[2], activeColor[3], 175})}
	else
		buttonColor = {processColorSwitchEffect(key, {activeColor[1], activeColor[2], activeColor[3], 125})}
	end

	local alphaDifference = 175 - buttonColor[4]
	local fadeAmount = tabPanelAlphas[activePage]

	dxDrawRectangle(x, y, w, h, tocolor(buttonColor[1], buttonColor[2], buttonColor[3], (175 - alphaDifference) * fadeAmount))
	dxDrawInnerBorder(2, x, y, w, h, tocolor(buttonColor[1], buttonColor[2], buttonColor[3], (125 + alphaDifference) * fadeAmount))

	--labelFont = labelFont or RobotoL14 -- írd át az alapértelmezett szöveg fontra | respc(14)-es legyen
	--labelScale = labelScale or 1

	if imagePath then
        imageW = imageW or respc(100)
        imageH = imageH or respc(100)
        if imageColor then
            imageColor = tocolor(imageColor[1], imageColor[2], imageColor[3], imageColor[4] * fadeAmount) or tocolor(255, 255, 255, 255 * fadeAmount)
        else
            imageColor = tocolor(255, 255, 255, 255 * fadeAmount)
        end
        imageAlign = imageAlign or "center"

        if imageAlign == "center" then
            local imgX, imgY = x + (w - imageW) * 0.5, y + (h - imageH) * 0.5
            dxDrawImage(imgX, imgY, imageW, imageH, imagePath, 0, 0, 0, imageColor)
        elseif imageAlign == "left" then
            local imgX, imgY = x + respc(10), y + (h - imageH) * 0.5
            dxDrawImage(imgX, imgY, imageW, imageH, imagePath, 0, 0, 0, imageColor)
        elseif imageAlign == "right" then
            local imgX, imgY = x + w - imageW - respc(10), y + (h - imageH) * 0.5
            dxDrawImage(imgX, imgY, imageW, imageH, imagePath, 0, 0, 0, imageColor)
        end
    end

    if titleText then
        titleTextColor = titleTextColor or tocolor(255, 255, 255, 255 * fadeAmount)
        titleTextAlign = titleTextAlign or "left"
        titleTextFont = titleTextFont or fonts.Roboto11

        dxDrawText(titleText, x + respc(10), y + respc(10), x + w, y + w, titleTextColor, 1, titleTextFont, titleTextAlign)
    end

    if downText then
        downTextColor = downTextColor or tocolor(255, 255, 255, 255 * fadeAmount)
        downTextAlign = downTextAlign or "right"
        downTextFont = downTextFont or fonts.Roboto11
        local fontHeight = dxGetFontHeight(1, downTextFont)

        dxDrawText(downText, x - respc(10), y + h - fontHeight - respc(10), (x + w) - respc(10), y + w, downTextColor, 1, downTextFont, downTextAlign)
    end

    if centerText then
        centerTextColor = centerTextColor or tocolor(255, 255, 255, 255 * fadeAmount)
        centerTextAlign = centerTextAlign or "left"
        centerTextFont = centerTextFont or fonts.Roboto11
        local fontHeight = dxGetFontHeight(1, centerTextFont)

        local textX = x + respc(10)
        if imagePath then
            if imageAlign == "left" then
                textX = textX + imageW + respc(5)
            end
        end
        dxDrawText(centerText, textX, y, x + w, y + h, centerTextColor, 1, centerTextFont, centerTextAlign, "center")
    end
	
	buttons[key] = {x, y, w, h} -- !!!
end

function dxDrawMetroTileWithoutBorder(key, label, x, y, w, h, activeColor, imagePath, imageW, imageH, imageColor, imageAlign, titleText, titleTextColor, titleTextFont, titleTextAlign, downText, downTextColor, downTextFont, downTextAlign, centerText, centerTextColor, centerTextFont, centerTextAlign)
	local buttonColor

	if activeButton == key then -- !!!
		buttonColor = {processColorSwitchEffect(key, {activeColor[1], activeColor[2], activeColor[3], 175})}
	else
		buttonColor = {processColorSwitchEffect(key, {activeColor[1], activeColor[2], activeColor[3], 125})}
	end

	local alphaDifference = 175 - buttonColor[4]
	local fadeAmount = tabPanelAlphas[activePage]

	dxDrawRectangle(x, y, w, h, tocolor(buttonColor[1], buttonColor[2], buttonColor[3], (175 - alphaDifference) * fadeAmount))
	--dxDrawInnerBorder(2, x, y, w, h, tocolor(buttonColor[1], buttonColor[2], buttonColor[3], (125 + alphaDifference) * fadeAmount))

	--labelFont = labelFont or RobotoL14 -- írd át az alapértelmezett szöveg fontra | respc(14)-es legyen
	--labelScale = labelScale or 1

	if imagePath then
        imageW = imageW or respc(100)
        imageH = imageH or respc(100)
        if imageColor then
            imageColor = tocolor(imageColor[1], imageColor[2], imageColor[3], imageColor[4] * fadeAmount) or tocolor(255, 255, 255, 255 * fadeAmount)
        else
            imageColor = tocolor(255, 255, 255, 255 * fadeAmount)
        end
        imageAlign = imageAlign or "center"

        if imageAlign == "center" then
            local imgX, imgY = x + (w - imageW) * 0.5, y + (h - imageH) * 0.5
            dxDrawImage(imgX, imgY, imageW, imageH, imagePath, 0, 0, 0, imageColor)
        elseif imageAlign == "left" then
            local imgX, imgY = x + respc(10), y + (h - imageH) * 0.5
            dxDrawImage(imgX, imgY, imageW, imageH, imagePath, 0, 0, 0, imageColor)
        elseif imageAlign == "right" then
            local imgX, imgY = x + w - imageW - respc(10), y + (h - imageH) * 0.5
            dxDrawImage(imgX, imgY, imageW, imageH, imagePath, 0, 0, 0, imageColor)
        end
    end

    if titleText then
        titleTextColor = titleTextColor or tocolor(255, 255, 255, 255 * fadeAmount)
        titleTextAlign = titleTextAlign or "left"
        titleTextFont = titleTextFont or fonts.Roboto11

        dxDrawText(titleText, x + respc(10), y + respc(10), x + w, y + w, titleTextColor, 1, titleTextFont, titleTextAlign)
    end

    if downText then
        downTextColor = downTextColor or tocolor(255, 255, 255, 255 * fadeAmount)
        downTextAlign = downTextAlign or "right"
        downTextFont = downTextFont or fonts.Roboto11
        local fontHeight = dxGetFontHeight(1, downTextFont)

        dxDrawText(downText, x - respc(10), y + h - fontHeight - respc(10), (x + w) - respc(10), y + w, downTextColor, 1, downTextFont, downTextAlign)
    end

    if centerText then
        centerTextColor = centerTextColor or tocolor(255, 255, 255, 255 * fadeAmount)
        centerTextAlign = centerTextAlign or "left"
        centerTextFont = centerTextFont or fonts.Roboto11
        local fontHeight = dxGetFontHeight(1, centerTextFont)

        local textX = x + respc(10)
        if imagePath then
            if imageAlign == "left" then
                textX = textX + imageW + respc(5)
            end
        end
        dxDrawText(centerText, textX, y, x + w, y + h, centerTextColor, 1, centerTextFont, centerTextAlign, "center")
    end
	
	buttons[key] = {x, y, w, h} -- !!!
end

local activeDirectX = false
local lastActiveDirectX = false

function dxDrawInteractionButton(key, label, x, y, w, h, buttonColor, activeColor, textColor, font, textAlign1, textAlign2, imagePath, imageW, imageH, imageColor)
	lastActiveDirectX = activeDirectX
    activeDirectX = activeButton

    --local buttonColor
    local imageColorEx = imageColor

	if activeButton == key then -- !!!
		buttonColor = {processColorSwitchEffect(key, {activeColor[1], activeColor[2], activeColor[3], activeColor[4]})}
        imageColorEx = {processColorSwitchEffect(key .. "_img", {255, 255, 255, 255})}
	else
		buttonColor = {processColorSwitchEffect(key, {buttonColor[1], buttonColor[2], buttonColor[3], buttonColor[4]})}
        imageColorEx = {processColorSwitchEffect(key .. "_img", {imageColor[1], imageColor[2], imageColor[3], 255})}
	end

	local alphaDifference = 175 - buttonColor[4]
	local fadeAmount = 1

	dxDrawRectangle(x + 10, y, w - 20, h-5, exports.cr_ui:inArea(x + 10, y, w - 20, h - 5) and tocolor(16, 16, 16, 255) or tocolor(32, 32, 32, 255))

    textAlign1 = textAlign1 or "center"
    textAlign2 = textAlign2 or "center"
    local font2 = exports.cr_fonts:getFont('sf-regular', 10)

    if imagePath then
        dxDrawText(label, x, y - 5, x + w, y + h, tocolor(255, 255, 255, 255), 1, font2, "center", "center")
    else
        dxDrawText(label, x + respc(25), y, x + w, y + h, tocolor(255, 255, 255, 255 * fadeAmount), 1, font2, textAlign1, textAlign2)
    end
   
    --dxDrawImage(rowX + respc(5), rowY + respc(5), iconW - respc(10), iconH - respc(10), interaction[2], 0, 0, 0, tocolor(interaction[3][1], interaction[3][2], interaction[3][3], 255))
    --dxDrawText(interaction[1], actionTextX, rowY, actionTextX, rowY + rowH, tocolor(255, 255, 255, 255), 1, fonts.Roboto11, "left", "center")
    
	buttons[key] = {x, y, w, h} -- !!!
end

function dxDrawMetroTilePanel(key, label, x, y, w, h, activeColor, imagePath, imageW, imageH, imageColor, imageAlign, titleText, titleTextColor, titleTextFont, titleTextAlign, downText, downTextColor, downTextFont, downTextAlign, centerText, centerTextColor, centerTextFont, centerTextAlign)
	local buttonColor

	--if activeButton == key then -- !!!
	--	buttonColor = {processColorSwitchEffect(key, {activeColor[1], activeColor[2], activeColor[3], 175})}
	--else
		buttonColor = {processColorSwitchEffect(key, {activeColor[1], activeColor[2], activeColor[3], activeColor[4]})}
	--end

	local alphaDifference = 175 - buttonColor[4]
	local fadeAmount = tabPanelAlphas[activePage]

	dxDrawRectangle(x, y, w, h, tocolor(buttonColor[1], buttonColor[2], buttonColor[3], (175 - alphaDifference) * fadeAmount))
	--dxDrawInnerBorder(2, x, y, w, h, tocolor(buttonColor[1], buttonColor[2], buttonColor[3], (125 + alphaDifference) * fadeAmount))

	--labelFont = labelFont or RobotoL14 -- írd át az alapértelmezett szöveg fontra | respc(14)-es legyen
	--labelScale = labelScale or 1

	if imagePath then
        imageW = imageW or respc(100)
        imageH = imageH or respc(100)
        if imageColor then
            imageColor = tocolor(imageColor[1], imageColor[2], imageColor[3], imageColor[4] * fadeAmount) or tocolor(255, 255, 255, 255 * fadeAmount)
        else
            imageColor = tocolor(255, 255, 255, 255 * fadeAmount)
        end
        imageAlign = imageAlign or "center"

        if imageAlign == "center" then
            local imgX, imgY = x + (w - imageW) * 0.5, y + (h - imageH) * 0.5
            dxDrawImage(imgX, imgY, imageW, imageH, imagePath, 0, 0, 0, imageColor)
        elseif imageAlign == "left" then
            local imgX, imgY = x + respc(10), y + (h - imageH) * 0.5
            dxDrawImage(imgX, imgY, imageW, imageH, imagePath, 0, 0, 0, imageColor)
        elseif imageAlign == "right" then
            local imgX, imgY = x + w - imageW - respc(10), y + (h - imageH) * 0.5
            dxDrawImage(imgX, imgY, imageW, imageH, imagePath, 0, 0, 0, imageColor)
        end
    end

    
	
	--buttons[key] = {x, y, w, h} -- !!!
end

function dxDrawInnerBorder(thickness, x, y, w, h, color)
	thickness = thickness or 2

	dxDrawLine(x, y, x + w, y, color, thickness)
	dxDrawLine(x, y + h, x + w, y + h, color, thickness)
	dxDrawLine(x, y, x, y + h, color, thickness)
	dxDrawLine(x + w, y, x + w, y + h, color, thickness)
end

local colorSwitch = {}

colorSwitch.storedColors = {}
colorSwitch.lastColors = {}
colorSwitch.startInterpolation = {}
colorSwitch.lastColorConcat = {}

function processColorSwitchEffect(key, color, duration, type)
	if not colorSwitch.storedColors[key] then
		if not color[4] then
			color[4] = 255
		end

		colorSwitch.storedColors[key] = color
		colorSwitch.lastColors[key] = color

		colorSwitch.lastColorConcat[key] = table.concat(color)
	end

	duration = duration or 500
	type = type or "Linear"

	if colorSwitch.lastColorConcat[key] ~= table.concat(color) then
		colorSwitch.lastColorConcat[key] = table.concat(color)
		colorSwitch.lastColors[key] = color
		colorSwitch.startInterpolation[key] = getTickCount()
	end

	if colorSwitch.startInterpolation[key] then
		local progress = (getTickCount() - colorSwitch.startInterpolation[key]) / duration

		local r, g, b = interpolateBetween(
			colorSwitch.storedColors[key][1], colorSwitch.storedColors[key][2], colorSwitch.storedColors[key][3],
			color[1], color[2], color[3],
			progress, type
		)

		local a = interpolateBetween(colorSwitch.storedColors[key][4], 0, 0, color[4], 0, 0, progress, type)

		colorSwitch.storedColors[key][1] = r
		colorSwitch.storedColors[key][2] = g
		colorSwitch.storedColors[key][3] = b
		colorSwitch.storedColors[key][4] = a

		if progress >= 1 then
			colorSwitch.startInterpolation[key] = false
		end
	end

	return colorSwitch.storedColors[key][1], colorSwitch.storedColors[key][2], colorSwitch.storedColors[key][3], colorSwitch.storedColors[key][4]
end

function activeButtonChecker()
	local cx, cy = getCursorPosition() -- lekérjük a relatív kurzor pozíciót

	if tonumber(cx) and tonumber(cy) then -- ha számot kapunk, tehát a kurzor elő van hozva
		cx, cy = cx * screenX, cy * screenY -- átalakítjuk abszolút értékekre
		cursorX, cursorY = cx, cy -- eltároljuk a változóba a kurzor abszolút pozícióit

		activeButton = false -- ha nem találna szarságot akkor nincs kijelölve semmi, tehát false

		for k, v in pairs(buttons) do -- végigmegyünk a létrehozott gombokon
			if cx >= v[1] and cy >= v[2] and cx <= v[1] + v[3] and cy <= v[2] + v[4] then -- benne van-e a boxban
				activeButton = k -- eltároljuk az aktív kijelölt gombot
				break -- megállítjuk a loopot
			end
		end
	else -- ha nincs előhozva a kurzor
		activeButton = false -- nincs kijelölve semmi
		cursorX, cursorY = -10, -10 -- kurzor a képernyőn kívülre, hogy a render ne érzékelje
	end
end

function table.empty (self)
    for _, _ in pairs(self) do
        return false
    end
    return true
end

function reMap(value, low1, high1, low2, high2)
    return (value - low1) * (high2 - low2) / (high1 - low1) + low2
end

scrollData = {}
scrollData.draggingGrips = {}
scrollData.gripPoses = {}
local lastScrollByArrowBtn = 0

function drawScrollbar(key, x, y, w, h, visibleItems, currentItems)
    local fadeAmount = 1

    local trackY = y + w
    local trackHeight = h - (w * 2)

    local gripHeight = (trackHeight / currentItems) * visibleItems
    local gripColor

    if not scrollData[key .. "Offset"] then
        scrollData[key .. "Offset"] = 0
    end

    if scrollData.draggingGrips[key] then
        gripColor = {174, 174, 174, 255}

        scrollData.gripPoses[key] = cursorY - scrollData.draggingGrips[key]

        if scrollData.gripPoses[key] < trackY then
            scrollData.gripPoses[key] = trackY
        elseif scrollData.gripPoses[key] > trackY + trackHeight - gripHeight then
            scrollData.gripPoses[key] = trackY + trackHeight - gripHeight
        end

        scrollData[key .. "Offset"] = math.floor(reMap(scrollData.gripPoses[key], trackY, trackY + trackHeight - gripHeight, 0, 1) * (currentItems - visibleItems))
    elseif activeButton == "scrollbarGrip:" .. key then
        if getKeyState("mouse1") then
            gripColor = {174, 174, 174, 255}
        else
            gripColor = {134, 134, 134, 255}
        end
    else
        gripColor = {93, 93, 93, 255}
    end

    local gripY = trackY + (trackHeight / currentItems) * math.min(scrollData[key .. "Offset"], currentItems - visibleItems)

    if gripY < trackY then
        gripY = trackY
    elseif gripY > trackY + trackHeight - gripHeight then
        gripY = trackY + trackHeight - gripHeight
    end

    scrollData.gripPoses[key] = gripY

    rounded(x, trackY, w, trackHeight,1, tocolor(53, 53, 53, 255 * fadeAmount))
    rounded(x, gripY, w, gripHeight,1, tocolor(gripColor[1], gripColor[2], gripColor[3], gripColor[4] * fadeAmount))
    buttons["scrollbarGrip:" .. key] = {x, gripY, w, gripHeight}

    local colorOfUp = tocolor(50, 50, 48, 255 * fadeAmount)
    local colorOfArrow = tocolor(210, 210, 210, 255 * fadeAmount)

    if activeButton == "scrollUp:" .. key then
        if getKeyState("mouse1") then
            colorOfUp = tocolor(173, 173, 173, 255 * fadeAmount)
            colorOfArrow = tocolor(83, 83, 83, 255 * fadeAmount)

            if lastScrollByArrowBtn == 0 then
                scrollData[key .. "Offset"] = scrollData[key .. "Offset"] - 1
                lastScrollByArrowBtn = getTickCount()
            end

            if getTickCount() - lastScrollByArrowBtn >= 125 then
                scrollData[key .. "Offset"] = scrollData[key .. "Offset"] - 1
                lastScrollByArrowBtn = getTickCount()
            end

            if scrollData[key .. "Offset"] < 0 then
                scrollData[key .. "Offset"] = 0
            end
        else
            lastScrollByArrowBtn = 0
            colorOfUp = tocolor(73, 73, 72)
        end
    end

    rounded(x, trackY - w, w, w,1, colorOfUp)
    buttons["scrollUp:" .. key] = {x, trackY - w, w, w}

    local colorOfDown = tocolor(50, 50, 48, 255 * fadeAmount)
    local colorOfArrow = tocolor(210, 210, 210, 255 * fadeAmount)

    if activeButton == "scrollDown:" .. key then
        if getKeyState("mouse1") then
            colorOfDown = tocolor(173, 173, 173, 255 * fadeAmount)
            colorOfArrow = tocolor(83, 83, 83, 255 * fadeAmount)

            if lastScrollByArrowBtn == 0 then
                scrollData[key .. "Offset"] = scrollData[key .. "Offset"] + 1
                lastScrollByArrowBtn = getTickCount()
            end

            if getTickCount() - lastScrollByArrowBtn >= 125 then
                scrollData[key .. "Offset"] = scrollData[key .. "Offset"] + 1
                lastScrollByArrowBtn = getTickCount()
            end

            if scrollData[key .. "Offset"] > currentItems - visibleItems then
                scrollData[key .. "Offset"] = currentItems - visibleItems
            end
        else
            lastScrollByArrowBtn = 0
            colorOfDown = tocolor(73, 73, 72)
        end
    end

    rounded(x, trackY + trackHeight, w, w,2, colorOfDown)
    buttons["scrollDown:" .. key] = {x, trackY + trackHeight, w, w}
end

local buttonSlider = {}
buttonSlider.offsets = {}
buttonSlider.interpolationStart = {}
buttonSlider.states = {}

function drawButtonSlider(key, state, x, y, h, offColor, onColor)
    local fadeAmount = tabPanelAlphas[activePage]

    if not buttonSlider.offsets[key] then
        buttonSlider.offsets[key] = 0
        buttonSlider.states[key] = state
    end

    local buttonColor
    if state then
        buttonColor = {processColorSwitchEffect(key, {onColor[1], onColor[2], onColor[3], 0})}
    else
        buttonColor = {processColorSwitchEffect(key, {offColor[1], offColor[2], offColor[3], 255})}
    end

    if buttonSlider.states[key] ~= state then
        buttonSlider.states[key] = state
        buttonSlider.interpolationStart[key] = {getTickCount(), state}
    end

    if buttonSlider.interpolationStart[key] then
        local progress = (getTickCount() - buttonSlider.interpolationStart[key][1]) / 500

        if  buttonSlider.interpolationStart[key][2] then
            buttonSlider.offsets[key] = interpolateBetween(buttonSlider.offsets[key], 0, 0, 32, 0, 0, progress, "Linear")
        else
            buttonSlider.offsets[key] = interpolateBetween(buttonSlider.offsets[key], 0, 0, 0, 0, 0, progress, "Linear")
        end

        if progress >= 1 then
            buttonSlider.interpolationStart[key] = false
        end
    end

    local alphaDifference = 255 - buttonColor[4]

    buttons[key] = {x, y, 64, 32}

    y = y + (h - 32) / 2

end

addEventHandler("onClientClick", root,
    function (button, state)
        if button == "left" and state == "down" then
            if activeButton then
                local selected = split(activeButton, ":")

                if selected[1] == "scrollbarGrip" then
                    local key = selected[2]

                    scrollData.draggingGrips[key] = cursorY - scrollData.gripPoses[key]
                end
            end
        elseif button == "left" and state == "up" then
            scrollData.draggingGrips = {}
        end
    end
)


rounded = function(x, y, width, height, radius, color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+radius, y+radius, width-(radius*2), height-(radius*2), color, postGUI, subPixelPositioning)
    dxDrawCircle(x+radius, y+radius, radius, 180, 270, color, color, 16, 1, postGUI)
    dxDrawCircle(x+radius, (y+height)-radius, radius, 90, 180, color, color, 16, 1, postGUI)
    dxDrawCircle((x+width)-radius, (y+height)-radius, radius, 0, 90, color, color, 16, 1, postGUI)
    dxDrawCircle((x+width)-radius, y+radius, radius, 270, 360, color, color, 16, 1, postGUI)
    dxDrawRectangle(x, y+radius, radius, height-(radius*2), color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+radius, y+height-radius, width-(radius*2), radius, color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+width-radius, y+radius, radius, height-(radius*2), color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+radius, y, width-(radius*2), radius, color, postGUI, subPixelPositioning)
end