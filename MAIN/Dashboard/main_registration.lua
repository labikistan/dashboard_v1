local ui = require "ui"
vers = "V0.1"
local net = require "net"
local dash = ui.Window("Register | "..vers, "fixed", 391, 350)
local file = sys.File("userdata.txt")
local email = sys.File("email.txt")





local registertext = ui.Label(dash, "Registration", 196, 0)
registertext.font = "Javanese Text"
registertext.fontsize = 24
registertext.x = 115

 
local already = ui.Label(dash, "Berreits Registriert? Clicke Hier!", 115, 335)
function already:onClick(x, y)
	ui.remove(dash)
	local login = require("main_login")
end


local username = ui.Entry(dash, "", 130, 110)
username.width = 130
local typeusrnmde = ui.Label(dash, "Benutzername", 155, 90)


local password = ui.Entry(dash, "", 130, 170)
password.width = 130
password.masked = true
local typepassw = ui.Label(dash, "Passwort", 170, 150)

local showpwd = ui.Button(dash, "👀", 260, 169)

function showpwd:onClick()
	if password.masked == true then
		password.masked = false
	else
		password.masked = true
	end
end

local mail = ui.Entry(dash, "", 130, 230)
mail.width = 130
local typemail = ui.Label(dash, "E-Mail:", 175, 210)

local submit = ui.Button(dash, "submit", 165, 270)

function submit:onClick()
	if username.text == "" or password.text == "" then
		ui.error("Gebe bitte deine Daten ein!", "Fehler")
		return
	end
	file:open("write")
	email:open("write")
	file:write(username.text.."@"..password.text)
	email:write(mail.text..":"..username.text)
	file:close()
	email:close()
	file:open("read")
	if file:read() == "" then
		ui.error("Fehler beim Datenspeichern")
	else
		ui.msg("Erfolgreich Registriert!","Registration")
		local login = require("main_login")
	end
	ui.remove(dash)
end




dash:show()
dash:center()
repeat
	ui.update()
until not dash.visible