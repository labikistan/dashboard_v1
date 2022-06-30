local ui = require "ui"

-- create a simple window 
local win = ui.Window("Label.tooltip sample", 320, 200)
local label = ui.Label(win, "Hover me !", 100, 80)

label.font = "Corbel"
label.fontsize = 18

-- set the Label tooltip
label.tooltip = "I'm a tooltip"

win:show()

-- update the user interface until the user closes the Window
repeat
	ui.update()
until not win.visible 