local composer = require("composer")
local scene = composer.newScene()

function scene:create(event)

	local options = { width = 256, height = 256, numFrames = 48 }
	local sheet = graphics.newImageSheet("img/chick.png", options)
	local sequence = {
		{name="run", start=31, count=8, time=350},
		{name="idle", start=40, count=9, time=800}
	}
	local chick = display.newSprite(sheet, sequence)

	chick.x = display.contentCenterX
	chick.y = display.contentCenterY
	chick:setSequence("idle")
	chick:play()
	chick.loopCount = 0

	chick:addEventListener("tap", function()
		if chick.sequence == "idle" then
			chick:setSequence("run")
		elseif chick.sequence == "run" then
			chick:setSequence("idle")
		end
		chick:play()
	end)

	chick:addEventListener("sprite", function(event)
		if chick.loopCount == 2 then
			chick.loopCount = 0
			chick:setSequence("idle")
			chick:play()
		end
		if event.phase == "loop" then
			chick.loopCount = chick.loopCount + 1
		end
	end)
end

scene:addEventListener("create", scene)
return scene
