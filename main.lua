require("rom/apis/turtle/turtle")
require("nav")

function filter(blocks, needle)
  output = {}
  for i,v in pairs(blocks) do
    if v.name:find(needle) then
      output[#output+1] = v
    end
  end
  return output  
end
  
  
function main(needle)
  needle = needle or "ore"
  while turtle.getFuelLevel() < 100 do
    print("needs more fuel, retrying in 30 seconds")
    sleep(30)
  end
  turtle.select(16)
  turtle.digDown()
  turtle.placeDown()
  sleep(3)
  
  local scanner = peripheral.wrap("bottom")
  if not scanner then
    error("peripheral wrap bottom failed")
  end
  
  local blocks = scanner.scan(8)
  if not blocks then
    error("scanner failed to scan")
  end
  
  turtle.select(16)
  turtle.digDown()
  
  local ores = filter(blocks, needle)
  
  for i,block in pairs(ores) do
    digTo(block.x, block.y-1, block.z)
  end
end

main(...)
    