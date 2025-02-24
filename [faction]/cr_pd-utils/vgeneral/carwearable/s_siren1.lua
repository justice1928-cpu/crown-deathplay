function vehicleBlown()
	setElementData(source, "lspd:siren1", false)
	setVehicleSirensOn (source , false)
end
addEventHandler("onVehicleRespawn", root, vehicleBlown)

function setsiren1State()
	if exports.cr_global:hasItem(source, 85) then
		setElementData(source, "lspd:siren3", false)
		setElementData(source, "lspd:siren2", false)
		setElementData(source, "lspd:datdat", false)
		local curState = getElementData(source, "lspd:siren1")
		setElementData(source, "lspd:siren1", not curState)
		setVehicleSirensOn(source , not curState)
	end
end
addEvent("lspd:setsiren1State", true)
addEventHandler("lspd:setsiren1State", root, setsiren1State)

function addSirens (player, seat)
    if player and (seat==0) then
		if (getVehicleName(source) == "Police LV") or (getVehicleName(source) == "Police SF") or (getVehicleName(source) == "Police Ranger") or (getVehicleName(source) == "Police LS") or (getVehicleName(source) == "Intruder") or (getVehicleName(source) == "Solair") or (getVehicleName(source) == "Huntley") then
	        addVehicleSirens(source,8,2, false, true, true, true)
			--vehicle, sirenPoint, x, y, z, r, g, b, alpha, minAlpha
			setVehicleSirens(source, 1, 0.5, -0.3, 1, 0, 0, 255, 255, 255)
			setVehicleSirens(source, 2, 0, -0.3, 1, 255, 255, 255, 255, 255)
			setVehicleSirens(source, 3, -0.5, -0.3, 1, 255, 0, 0, 255, 255)
			setVehicleSirens(source, 4, -0.3, -1.9, 0.4, 255, 0, 0, 255, 255)
			setVehicleSirens(source, 5, 0.3, -1.9, 0.4, 0, 0, 255, 255, 255)
			setVehicleSirens(source, 6, 0.0, -2.95, -0.1, 255, 215, 0, 100, 100)
			setVehicleSirens(source, 7, -0.3, 2.7, 0.0, 255, 0, 0, 255, 255)
			setVehicleSirens(source, 8, 0.3, 2.7, 0.0, 0, 0, 255, 255, 255)
		elseif(getVehicleName(source) == "Ambulance") then
			addVehicleSirens(source,7,2, false, true, true, true)
			--vehicle, sirenPoint, x, y, z, r, g, b, alpha, minAlpha
			--lightbar
			setVehicleSirens(source, 1, 0.5, 0.9, 1.3, 255, 0, 0, 255, 255)
			setVehicleSirens(source, 2, 0, 0.9, 1.3, 255, 255, 255, 255, 255)
			setVehicleSirens(source, 3, -0.5, 0.9, 1.3, 255, 0, 0, 255, 255)
			--right side
			setVehicleSirens(source, 4, 1.3, 0.2, 1.5, 255, 0, 0, 255, 255)
			setVehicleSirens(source, 5, 1.3, -3.3, 1.5, 255, 0, 0, 255, 255)
			--left side
			setVehicleSirens(source, 6, -1.3, 0.2, 1.5, 255, 0, 0, 255, 255)
			setVehicleSirens(source, 7, -1.3, -3.3, 1.5, 255, 0, 0, 255, 255)
		elseif(getVehicleName(source) == "Fire Truck") then
			addVehicleSirens(source,7,2, false, true, true, true)
			--lightbar
			setVehicleSirens(source, 1, 0.6, 3.2, 1.4, 255, 0, 0, 255, 255)
			setVehicleSirens(source, 2, 0, 3.2, 1.4, 255, 255, 255, 255, 255)
			setVehicleSirens(source, 3, -0.6, 3.2, 1.4, 255, 0, 0, 255, 255)
			--rear
			setVehicleSirens(source, 4, 0.4, -3.7, 0.4, 255, 0, 0, 255, 255)
			setVehicleSirens(source, 5, -0.4, -3.7, 0.4, 255, 0, 0, 255, 255)
			--grill
			setVehicleSirens(source, 6, 0.6, 4.2, 0.1, 255, 0, 0, 255, 255)
			setVehicleSirens(source, 7, -0.6, 4.2, 0.1, 255, 0, 0, 255, 255)
		elseif(getVehicleName(source) == "Fire Truck Ladder") then	
			--not working (vehicle is probably one of the few models that does not support sirens)		
		elseif(getVehicleName(source) == "Towtruck") then
			addVehicleSirens(source, 3, 4, true, true, true, true)
			setVehicleSirens(source, 1, -0.7, -0.35, 1.5250904560089, 255, 0, 0, 255, 0)
			setVehicleSirens(source, 2, 0, -0.35, 1.5250904560089, 255, 198, 10, 255, 0)
			setVehicleSirens(source, 3, 0.7, -0.35, 1.5250904560089, 255, 0, 0, 255, 0)
		end
	end
end
addEventHandler("onVehicleEnter", root, addSirens)