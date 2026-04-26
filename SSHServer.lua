function start()
    local thread = require("thread")
    local component = require("component")
    local shell = require("shell")
    local event = require("event")
    local modem = component.modem
    

    thread.create(function ()
        modem.open(400)
        while true do
            local _, receiverAddress, senderAddress, port, distance, message = event.pull("modem_message")
            if message then
                shell.execute(tostring(message))
            end
        end
    end):detach()
end