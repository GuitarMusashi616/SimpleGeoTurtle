turtle = {}

function turtle.forward() 
  print("forward")
end

function turtle.turnLeft() 
  print("turnLeft")
end
function turtle.turnRight() 
  print("turnRight")
end
function turtle.back() 
  print("back")
end
function turtle.up() 
  print("up")
end
function turtle.down() 
  print("down")
end
function turtle.placeDown() 
  print("placeDown")
end
function turtle.dig() 
  print("dig")
end
function turtle.digDown() 
  print("digDown")
end

function turtle.select(num) 
  print("select", num)
end

function turtle.getFuelLevel() 
  print("getFuelLevel: 1000")
  return 1000
end

peripheral = {}

function peripheral.getNames() 
  print("getNames")
  return {"peripheral", "names"}
end

function peripheral.getMethods(side) 
  print("getMethods", side)
  return {"peripheral", "methods"}
end

function peripheral.wrap(side) 
  print("wrap", side)
  return {scan = function(n) output={} for i=1,n do output[#output+1] = {name="dirt", x=5, y=5, z=5} end return output end}
end

gps = {}

function gps.locate()
  return math.random()*5, math.random()*5, math.random()*5
end

sleep = function(num)
  print("sleep", num)
end