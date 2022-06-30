local ui = require "ui"
local vers = "V0.1"
local net = require "net"


local dash = ui.Window("Dashboard | "..vers, 1350, 720)
local dashtext = ui.Label(dash, "🏠 | Dashboard", 330, 0)
dashtext.fontsize = 22

local login = ui.Button(dash, "Login", 1300, 0)
function login:onClick()
local login = ui.Window("Login | "..vers, "fixed", 391, 350)
local file = sys.File("userdata.txt")

local registertext = ui.Label(login, "Login", 150, 0)
registertext.font = "Javanese Text"
registertext.fontsize = 24
registertext.x = 150


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
-- function submit:onClick()
-- 	file:open("read")
--     local data = file:read()
--     if data == username.text.."@"..password.text then
--         ui.msg("Erfolgreich Angemeldet!", "Login | Erfolgreich")

--     else
--         ui.error("Benutzername oder Passwort stimmen nicht überein.")
--     end
-- end
function submit:onClick()
    if username.text == "labikistan" and password.text == "geheim" then
        dashtext.enabled = false
		local dashtext = ui.Label(dash,  "🏠 | Dashboard - ADMIN", 330, 0)
		dashtext.fontsize = 22
	end
end
-- Login Check function

login:show()
login:center()
repeat
	ui.update()
until not login.visible
end




dash:show()
dash:center()
repeat
	ui.update()
until not dash.visible