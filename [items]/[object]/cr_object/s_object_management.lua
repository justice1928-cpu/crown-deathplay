mysql = exports.cr_mysql
objects = { }

function loadDimension(dimension, demotable)
	if dimension then
		objects[dimension] = { }
		
		local tableselect = "objects"
		
		if demotable then
			tableselect = "tempobjects"
		end
		
		local result = mysql:query("SELECT * FROM `" ..  tableselect  .. "` WHERE dimension = " .. tostring(dimension))
		if (result) then
			while true do
				local row = mysql:fetch_assoc(result)
				if not row then	break end
				
				for key, value in pairs(row) do
					row[key] = tonumber(value)
				end
				
				table.insert(objects[dimension], { row.model, row.posX, row.posY, row.posZ, row.rotX, row.rotY, row.rotZ, row.interior, row.solid == 1, row.doublesided == 1, tostring(row.id), row.scale, row.breakable == 1, tonumber(row.alpha) or 255 })
			end
			mysql:free_result(result)
		end

		syncDimension(theDimension)
		return #objects[dimension]
	end
	return 0
end

function reloadDimension(thePlayer, commandName, dimensionID)
	if exports.cr_integration:isPlayerTrialAdmin(thePlayer) then
		if dimensionID then
			triggerClientEvent(root, "object:clear", root, dimensionID)
			local count = loadDimension(tonumber(dimensionID))
			if (count > 0) then
				outputChatBox("Reloaded " .. count .. " items in interior " ..  dimensionID, thePlayer, 0, 255, 0)
			end
		end
	end
end
addCommandHandler("reloadinterior", reloadDimension, false, false)

function reloadInteriorObjects(theDimension)
	if (theDimension) then
		triggerClientEvent(root, "object:clear", root, dimensionID)
		loadDimension(tonumber(dimensionID))
	end
end

function removeInteriorObjects(theDimension)
	if (theDimension) and (tonumber(theDimension) >= 0) then
		mysql:query_free("DELETE FROM `objects` WHERE `dimension`='" ..  mysql:escape_string(theDimension) .. "'")
		triggerClientEvent(root, "object:clear", root, theDimension)
		loadDimension(tonumber(theDimension))
	end
end

function startObjectSystem(res)
	local result = mysql:query("SELECT distinct(`dimension`) FROM `objects` ORDER BY `dimension` ASC")
	if (result) then
		while true do
			row = mysql:fetch_assoc(result)
			if not row then break end

			local co = coroutine.create(loadDimension)
			coroutine.resume(co, tonumber(row.dimension), false)
		end
	end
	mysql:free_result(result)
end
addEventHandler("onResourceStart", getResourceRootElement(), startObjectSystem)