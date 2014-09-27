local composer = require("composer")
local scene = composer.newScene()
local myCircle
function scene:create(event)

	function changeHelloWorldColor() 
		myText:setFillColor(math.random(255)/255,math.random(255)/255,math.random(255)/255)
	end

	myText = display.newText("Hello World!", 100, 200, native.systemFont, 16)
	myText:setFillColor(1,0,0)
	myText:addEventListener("tap", changeHelloWorldColor)

	myCircle = display.newCircle(100,100, 40)
	myCircle:setFillColor(0.5)
	myCircle:addEventListener("touch", function(event)
		composer.gotoScene("chick", {effect="fromLeft", time=800})
	end)
end

function scene:hide()
	myText:removeSelf()
	myCircle:removeSelf()

end

scene:addEventListener("create", scene)
scene:addEventListener("hide", scene)
return scene
