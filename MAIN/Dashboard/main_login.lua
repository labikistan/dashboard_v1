local ui = require "ui"
vers = "V0.1"
local net = require "net"
local login = ui.Window("Login | "..vers, "fixed", 391, 350)
local file = sys.File("userdata.txt")
local admin = sys.File("admin.txt")

local registertext = ui.Label(login, "Login", 150, 0)
registertext.font = "Javanese Text"
registertext.fontsize = 24
registertext.x = 150

local already = ui.Label(login, "Noch kein Account? Clicke Hier!", 38, 335)
function already:onClick(x, y)
	ui.remove(login)
	local login = require("main_registration")
end

local forgot = ui.Label(login, "Passwort vergessen? Clicke Hier!", 205, 335)
function forgot:onClick(x, y)
	ui.remove(login)
	local pw = require("main_password_forgot")
end

local username = ui.Entry(login, "", 130, 110)
username.width = 130



local typeusrnmde = ui.Label(login, "Benutzername", 155, 90)


local password = ui.Entry(login, "", 130, 170)
password.width = 130
password.masked = true

local showpwd = ui.Button(login, "👀", 260, 169)

function showpwd:onClick()
	if password.masked == true then
		password.masked = false
	else
		password.masked = true
	end
end

local typepassw = ui.Label(login, "Passwort", 170, 150)

local submit = ui.Button(login, "submit", 165, 220)

-- Login Check function
function submit:onClick()
	file:open("read")
	admin:open("read")
    local data = file:read()
	local aacc = admin:read()
	if aacc == username.text.."@"..password.text then
		ui.msg("Angemeldet mit Admin account.", "Login | Erfolgreich")
		local dashboard = require("main_dashboard")
	elseif data == username.text.."@"..password.text then
		ui.msg("Erfolgreich Angemeldet!", "Login | Erfolgreich")
		local dashboard = require("main_dashboard")
	else
		ui.error("Benutzername oder Passwort stimmen nicht überein.")
    end 
end
-- function submit:onClick()
--     if username.text == "labikistan" and password.text == "geheim" then
--         ui.msg("Erfolgreich Angemeldet!", "System")
--         local dashboard = require("main_dashboard")
--         ui.remove("login")
-- 	else
-- 		ui.error("Benutzername oder Passwort inkorrekt.")
--     end
-- end
-- Login Check function

login:show()
login:center()
repeat
	ui.update()
until not login.visible