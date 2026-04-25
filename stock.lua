local component = require("component")
local sides = require("sides")
local term = require("term")
local colours = require("colors")
local s = (function(l) return l.serialize end)(require("serialization"))

local xnet = component.xnet

for i,b in ipairs(xnet.getConnectedBlocks()) do
  if(b.name == "tconstruct:smeltery_io") then
    for i,x in ipairs(xnet.getFluids(b.pos)) do
      io.write("> " .. x.content.name .. " " )
      term.setTextColor(colours.blue)
      term.setBackgroundColor(colours.blue)
      io.write(x.content.amount .. "mb \n")
      term.setTextColor(colours.white)
      term.setBackgroundColor(colours.black)
    end
  end
end