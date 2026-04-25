local component = require("component")
local sides = require("sides")
local gpu = component.gpu
local s = (function(l) return l.serialize end)(require("serialization"))

local xnet = component.xnet

for i,b in ipairs(xnet.getConnectedBlocks()) do
  if(b.name == "tconstruct:smeltery_io") then
    for i,x in ipairs(xnet.getFluids(b.pos)) do
      io.write("> " .. x.content.name .. " " )
      gpu.setForeground(0x008080)
      io.write(x.content.amount .. "mb \n")
    end
  end
end