local net = require "net"
local console = require "console"
local ui = require "ui"

console.clear()

console.writecolor("lightcyan","D")
console.writecolor("lightred","A")
console.writecolor("lightyellow","S")
console.writecolor("lightcyan","H")
console.writecolor("lightgreen","B")
console.writecolor("lightpurple", "O")
console.writecolor("red", "A")
console.writecolor("blue", "R")
console.writecolor("yellow", "D")
console.writecolor("white", " | Alpha Console\n")
console.color = "white"
-- local username = sys.Buffer(console.readln("Dein Nutzername: ")):encode("base64")
-- console.echo = '*'
-- local password = sys.Buffer(console.readln("Dein Passwort: ")):encode("base64")
-- console.echo = true

-- if username ~= "labikistan" and password ~= "testing" then
--     ui.info("Angemeldet.")
-- else
--     ui.info("Falsches Passwort oder Benutzername.")
-- end
console.title = "Console | ALPHA V0.1"
repeat
    local typed = sys.Buffer(console.readln("» ")):encode("utf8")
    if typed == "info" then
         console.write("Coded in Lua by labikistan\n")
    elseif typed == "qr" then
        console.write("QR Code Generator | BETA\n")
        local qr = ui.Window("Erstelle einen QRCode", 490, 240)
        local img = ui.Picture(qr, "", 170, 60)
        local label = ui.Label(qr, "Gebe die Website an: ")
        local entry = ui.Entry(qr, "https://www.luart.org", label.x + label.width + 4, label.y - 4, 200, 22)
        local button = ui.Button(qr, "Generiere", entry.x + entry.width + 6, entry.y - 1)
    
        function button:onClick()
        -- Generate a QR Code with the free REST API https://goqr.me/, trademark of DENSO WAVE INCORPORATED
        local qrcode = net.Http("https://api.qrserver.com/v1/create-qr-code/?size=200x200&data="..entry.text)
        img:load(qrcode)
        end
        qr:show()
        repeat -- console src
             ui.update()
        until qr.visible == false
    elseif typed == "admin aus" then
        console.write("Du bist kein Administrator mehr.\n")
        console.title = "Console | ALPHA V0.1"
        adminmode = false
    elseif typed == "admin" then
        console.write("Admin-Modus aktiviert!\n")
        console.title = "Console | ALPHA V0.1 | » ADMINISTRATOR"
        adminmode = true
    elseif typed == "dev" then
        console.write("Developer-Modus aktiviert!\n")
        console.title = "Console | ALPHA V0.1 | » DEVMODE"
        devmode = true
    elseif typed == "adminpanel" and adminmode == true then
        console.write("Panel wird ausgeführt.\n")
        apanel = require("adminpanel")
        local typed = sys.Buffer(console.readln("» ")):encode("utf8")
    elseif typed == "help" then
        console.write("~-~ help ~-~")
        console.write("\n")
        console.write("\nqr | QR-Code Generator.")
        console.write("\ndashboard | Öffnet das Dashboard.")
        console.write("\nalex | Wer ist Alex?")
        console.write("\nexit | Tip: Alt F4.")
        console.write("\nclear | Leere dein Commandfeld.")
        console.write("\ninfo | Ersteller des Skripts.")
        console.write("\nadmin | Damit werden höhere Berechtigungen erhalten.")
        console.write("\n")
        console.write("\nCoded by labikistan")
        console.write("\n~-~ help ~-~")
        console.write("\n")
    elseif typed == "devhelp" and devmode == true then
        console.writecolor("lightblue", "~-~ dev cmds ~-~")
        console.write("\n")
        console.writecolor("lightblue", "\ndebug | Debugs application")
        console.writecolor("lightblue", "\ndevmenu | Developer menu for scripts")
        console.write("\n")
        console.writecolor("lightblue", "\nCoded by labikistan")
        console.writecolor("lightblue", "\n~-~ dev cmds ~-~")
        console.write("\n")
    elseif typed == "dashboard" then       --Coded by labikistan
        console.write("Comming soon...\n")
    elseif typed == "exit" then
        notknown = true
        
    elseif typed == "alex" then
        console.write("Alex ist Python Developer.\n")
    elseif typed == "ip" then
        console.write(net.ip.."\n")
    elseif typed == "devmenu" and devmode == true then
        console.write("Devmenu wird ausgeführt.\n")
        local devmenu = require("devmenu")
    elseif typed == "dev aus" then
        console.write("Developer-Modus deaktiviert!\n")
        console.title = "Console | ALPHA V0.1"
        devmode = false
    elseif typed == "clear" then 
        console.clear()
    else
        console.writecolor("red", "Befehl nicht gefunden. Versuche help.\n")
end
until(notknown == true) -- console src end
