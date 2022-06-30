local ui = require "ui"
local vers = "V0.1"
local net = require "net"

local panel = ui.Window("Adminpanel | "..vers, 656, 328) -- adminpanel src:

-- pretty empty :(

local can_exit = false
panel:show() 
panel:center()
repeat
	ui.update()
until can_exit

