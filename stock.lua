local component = require("component")
local sides = require("sides")
local s = (function(l) return l.serialize end)(require("serialization"))

local xnet = component.xnet

for i,b in ipairs(xnet.getConnectedBlocks()) do
  if(b.name == "tconstruct:smeltery_io") then
    for i,x in ipairs(xnet.getFluids(b.pos)) do
      local name = {}
      for str in string.gmatch(x.content.label, "%s") do
        table.insert(name, str)
      end

      if name[1] == "Molten" then
        table.remove(name, 1)
      end

      local name_str = table.concat(name, "%s")

      print("> " .. name_str .. " " .. x.content.amount .. "mb")
    end
  end
end