local ui = require "ui"
local vers = "V0.1"
local net = require "net" 
local typednum = 0
local showing = true
--nums
local one = 1

local calc = ui.Window("calcboard | "..vers, "fixed", 323, 502)
-- all numbers (1 - 9)
local one = ui.Button(calc, "1", 45, 419)
-- local two = 
-- local three = 
-- local four = 
-- local five = 
-- local six = 
-- local seven = 
-- local eight = 
-- local nine = 
-- local zero = 

function one:onClick()
    typednum = typednum + 1
end



local num = ui.Label(calc, typednum, 130, 80)
calc:show()
calc:center()
repeat
	ui.update()
until not calc.visible or showing == false

