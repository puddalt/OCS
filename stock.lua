local component = require("component")
local sides = require("sides")
local s = (function(l) return l.serialize end)(require("serialization"))

local xnet = component.xnet

for i,b in ipairs(xnet.getConnectedBlocks()) do
  if(b.name == "tconstruct:smeltery_io") then
    for i,x in ipairs(xnet.getFluids(b.pos)) do
      print("> " .. x.content.label .. " " .. x.content.amount .. "mb")
    end
  end
end