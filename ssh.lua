local component = require("component")
local event = require("event")
local term = require("term")

local modem = component.modem
local port = 400
local timeout = 5

modem.open(port)

modem.broadcast(port, "ls -la")

print("--- SNIFFER ACTIVE (Port 400) ---")
print("Press Ctrl+C to stop.")

while true do
  -- Pull ANY event, not just modem_message, to see if anything is happening
  local e = {event.pull(10)} -- 10 second timeout per loop
  
  if e[1] == "modem_message" then
    print("\n[PACKET RECEIVED]")
    print("1. Event Name: " .. tostring(e[1]))
    print("2. Local Addr: " .. tostring(e[2]):sub(1,8) .. "...")
    print("3. Remote Addr: " .. tostring(e[3]):sub(1,8) .. "...")
    print("4. Port:        " .. tostring(e[4]))
    print("5. Distance:    " .. tostring(e[5]))
    print("6. Data/Msg:    " .. (tostring(e[6]) or "NIL"))
  elseif e[1] == nil then
    print("... still waiting (no packets) ...")
  else
    print("Ignored event: " .. tostring(e[1]))
  end
end

-- print("Enter command to send to remote machine:")
-- local command = term.read():gsub("\n", "")

-- if command ~= "" then
--   print("Sending: " .. command)
--   modem.broadcast(port, command)
  
--   print("Waiting for response...")
--   local _, _, sender, p, _, response = event.pull(timeout, "modem_message", nil, nil, port)
  
--   if response then
--     print("\n--- Remote Output ---")
--     print(response)
--     print("---------------------")
--   else
--     print("Error: Request timed out. No response from remote machine.")
--   end
-- else
--   print("Cancelled.")
-- end