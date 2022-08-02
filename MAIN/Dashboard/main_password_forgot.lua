local ui = require "ui"
vers = "V0.1"
local net = require "net"
local pw = ui.Window("Password Forgot | "..vers, "fixed", 391, 350)

local label = ui.Label(pw, "Passwort vergessen", 90, 30)
label.fontsize = 20
label.font = "Javanese Text"

local emaillabel = ui.Label(pw, "E-Mail:", 178, 100)

local email = ui.Entry(pw, "", 130, 120)
email.width = 130

local newpasswordlabel = ui.Label(pw, "Neues Passwort:", 160, 195)

local neupassword = ui.Entry(pw, "", 130, 215)
neupassword.width = 130

local submit = ui.Button(pw, "submit", 165, 270)
function submit:onClick()
    ui.error("Dieses Feature ist noch nicht vorhanden.", "Fehler")
    ui.remove(pw)
end
pw:show()
pw:center()
repeat
	ui.update()
until not pw.visible