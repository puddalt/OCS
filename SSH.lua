local input = ""
local component = require("component")
local modem = component.modem

repeat
    input = io.read()
    if not input == "exit" then
        modem.broadcast(400, input)
    end
until input == "exit"