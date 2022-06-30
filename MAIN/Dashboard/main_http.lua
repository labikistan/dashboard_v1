local ui = require "ui"
local vers = "V0.1"
local net = require "net"
local console = require "console"
local notknown = false
-- -- local username = sys.Buffer(console.readln("Dein Nutzername: ")):encode("base64")

-- console.color = "white"
-- console.title = "HTML Config | Output "..vers
-- local typed = sys.Buffer(console.readln("\n» ")):encode("utf8")
-- if typed == "info" then
--     console.writecolor("white", "Made by Labikistan in Lua using LuaRT.")
-- elseif typed == "connect" then
--     local url = sys.Buffer(console.readln("Type hostname to connect: ")):encode("base64")
--     httpclient = net.Http(url) 
-- elseif typed == "status" then
--     console.write("Http status = "..httpclient.status.."| Connected site = "..httpclient.hostname)
--     if httpclient == nil then
--         console.writecolor("red", "error at httpclient.")
--     end
-- else
--     console.writecolor("red", "not found.")
-- end


console.writecolor("lightcyan","D")
console.writecolor("lightred","A")
console.writecolor("lightyellow","S")
console.writecolor("lightcyan","H")
console.writecolor("lightgreen","B")
console.writecolor("lightpurple", "O")
console.writecolor("red", "A")
console.writecolor("blue", "R")
console.writecolor("yellow", "D")
console.writecolor("white", " | HTML-Config Output\n")

-- local url = sys.Buffer(console.readln("Type hostname to connect: ")):encode("base64")
-- local httpclient = net.Http(url) 
local url = sys.Buffer(console.readln("\nHostname » ")):encode("utf8")  -- mit http/https://
repeat
console.color = "white"
console.title = "HTML Config | Output "..vers
local typed = sys.Buffer(console.readln("\n» ")):encode("utf8")

local client = net.Http(url)
client:get("/") 

 

if typed == "info" then
    console.write("Made by Labikistan in Lua using LuaRT framework.")
elseif typed == "status" then
    console.writecolor("yellow", client.status)   
    console.write(" » "..url)
    -- elseif typed == "status" then
--     console.write("Http status: "..client.status.." | Connected to "..url)
elseif typed == "exit" then
    notknown = true
elseif typed == "debug" then
    console.write("status "..client.status.."| url: "..url)
else
    console.writecolor("red", "not found.")
end


until(notknown == true)