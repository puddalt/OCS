local event = require("event")
local shell = require("shell")
local component = require("component")

local function handleMessage(_, _, sender, port, _, message)
    if port == 400 and message then
        local handle = io.popen(tostring(message) .. " 2>&1")
        local result = handle:read("*a")
        handle:close()

        if not result or result == "" then
            result = "[Command executed with no output]"
        end

        print("\n--- Remote Command Received ---")
        print("From: " .. sender)
        print("Cmd:  " .. tostring(message))
        print("Output:\n" .. result)
        print("-------------------------------")
      
      component.modem.send(sender, 400, result)
    end
  end

function start()
  if component.isAvailable("modem") then
    component.modem.open(400)
    event.listen("modem_message", handleMessage)
  else
    io.stderr:write("Error: No modem found!\n")
  end
end

function stop()
  event.ignore("modem_message", handleMessage)
end
