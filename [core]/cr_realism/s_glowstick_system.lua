tags = {1524, 1525, 1526, 1527, 1528, 1529, 1530, 1531 }

function makeGlowStick(x, y, z)
	local marker = createMarker(x, y, z, "corona", 1, 0, 255, 0, 150)
	exports.cr_pool:allocateElement(marker)
	exports.cr_global:sendLocalMeAction(source, "drops a glowstick on the ground.")
	setTimer(destroyGlowStick, 600000, 1, marker)
end
addEvent("createGlowStick", true)
addEventHandler("createGlowStick", root, makeGlowStick)

function destroyGlowStick(marker)
	destroyElement(marker)
end