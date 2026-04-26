local component = require("component")
local event = require("event")
local term = require("term")

local modem = component.modem
local port = 400
local timeout = 5

modem.open(port)

print("Enter command to send to remote machine:")
local command = term.read():gsub("\n", "")

if command ~= "" then
  print("Sending: " .. command)
  modem.broadcast(port, command)
  
  print("Waiting for response...")
  local _, _, sender, p, _, response = event.pull(timeout, "modem_message", nil, nil, port)
  
  if response then
    print("\n--- Remote Output ---")
    print(response)
    print("---------------------")
  else
    print("Error: Request timed out. No response from remote machine.")
  end
else
  print("Cancelled.")
end