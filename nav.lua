require("cc/turtle")

local rightTurnsFromTo = {
  north = {north=0, east=1, south=2, west=3},
  east = {north=3, east=0,  south=1, west=2},
  south = {north=2, east=3, south=0, west=1},
  west = {north=1, east=2, south=3, west=0},
}

local rightTurnResult = {
  north = "east",
  east = "south",
  south = "west",
  west = "north",
}

local facing

local function turnRight(num)
  for i=1,num do
    turtle.turnRight()
    facing = rightTurnResult[facing]
  end
end

local function digToXZ(dT, dirIfGt0, dirIfLt0)
  rightTurns = 0
  if dT > 0 then
    rightTurns = rightTurnsFromTo[facing][dirIfGt0]
  elseif dT < 0 then
    rightTurns = rightTurnsFromTo[facing][dirIfLt0]
  end
  
  turnRight(rightTurns)
  
  for i=1,math.abs(dT) do
    turtle.dig()
    turtle.forward()
  end
end
  
local function digToY(dy)
  if dy > 0 then
    for i=1,dy do
      turtle.up()
    end
  elseif dy < 0 then
    for i=1,math.abs(dy) do
      turtle.down()
    end
  end
end

local function calibrate()
  local xi,yi,zi = gps.locate()
  turtle.dig()
  turtle.forward()
  local xf,yf,zf = gps.locate()
  dx = xf-xi
  dz = zf-zi
  if dx > 0 and dz == 0 then
    facing = "east"
  elseif dx < 0 and dz == 0 then
    facing = "west"
  elseif dz > 0 and dx == 0 then
    facing = "south"
  elseif dz < 0 and dx == 0 then
    facing = "north"
  end
  turtle.back()
end
  
function digTo(dx,dy,dz)
  calibrate()
  if not facing then
    error("could not calibrate using gps")
  end
  digToXZ(dx, "east", "west")
  digToXZ(dz, "south", "north")
  digToY(dy)
end