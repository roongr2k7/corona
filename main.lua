-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
print("hello world")
display.setStatusBar(display.HiddenStatusBar)

function changeHelloWorldColor() 
	myText:setFillColor(math.random(255)/255,math.random(255)/255,math.random(255)/255)
end

myText = display.newText("Hello World!", 100, 200, native.systemFont, 16)
myText:setFillColor(1,0,0)
myText:addEventListener("tap", changeHelloWorldColor)

local myCircle = display.newCircle(100,100, 40)
myCircle:setFillColor(0.5)
myCircle:addEventListener("touch", function(event)
	if event.phase == "began" then
		print("Touch started")
		changeHelloWorldColor()
	elseif event.phase == "moved" then
		event.target.x = event.x
		event.target.y = event.y
	end	
end)

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

chick:addEventListener("tap", function()
	if chick.sequence == "idle" then
		chick:setSequence("run")
	elseif chick.sequence == "run" then
		chick:setSequence("idle")
	end
	chick:play()
end)
