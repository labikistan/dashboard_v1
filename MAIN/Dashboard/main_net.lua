local ui = require "ui"
local vers = "V0.1"
local net = require "net"
local console = require "console"
local notknown = false

console.title = ".NET Constructor | "..vers
console.writecolor("lightcyan","D")
console.writecolor("lightred","A")
console.writecolor("lightyellow","S")
console.writecolor("lightcyan","H")
console.writecolor("lightgreen","B")
console.writecolor("lightpurple", "O")
console.writecolor("red", "A")
console.writecolor("blue", "R")
console.writecolor("yellow", "D")
console.writecolor("white", " | .NET Constructor\n")
 
repeat
local typed = sys.Buffer(console.readln("» ")):encode("utf8")
if typed == "info" then
    console.writecolor("green", "Made by labikistan\n")
elseif typed == "exit" then
    notknown = true
elseif typed == "connect" then
    local web = sys.Buffer(console.readln("Hostname (ex. www.google.com) » ")):encode("utf8")
    sock = net.Socket(web, 443)
    if not sock.ipv4 then
        console.writecolor("red", web.." ist keine IP!")
    end
    sock:connect()
    if sock:starttls() then
        console.writecolor("green", "Connected.\n")
        local file = sys.Buffer(console.readln("File to get (ex. humans.txt)» ")):encode("utf8")
        request = "GET /"..file.." HTTP/1.1\r\nHost: "..web.."\r\n\r\n"
        sock:sendall(request)
        console.writecolor("yellow", "Auf Antwort warten...")
        response = tostring(sock:recv())
        if not response then
            console.writecolor("red", "Keine Antwort bekommen.")
        else
            console.writecolor("green", "\nAntwort erhalten.")
            local size = tonumber(response:match('Content%-Length: (%d+)\r\n'))
            response = response:match("\r\n\r\n(.*)")
			while(#response < size) do
				response = response..tostring(sock:recv())
			end
			console.writecolor("cyan", "\n"..web.." , "..file.."\n")
			console.writecolor("yellow", "\n"..response)
			sock:close()
		end
    end
else
    console.writecolor("red", "Command not found.\n")
end   

until notknown == true