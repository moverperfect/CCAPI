-- Floor script
-- Requires Murtle library

-- Get command line arguments
local args = {...}

-- Check number of arguments
if #args < 2 or #args > 3 then
  print("Usage: floor <z-size> <x-size> [<side(1-place down, 2-place up)>]")
  return 2
end

-- Parse arguments
local z = tonumber(args[1])
local x = tonumber(args[2])
local side = tonumber(args[3]) or 1

-- Resolve Murtle API
local path = shell.resolveProgram("murtle")
if path == nil or not os.loadAPI(path) then
  print("Can't load library: murtle")
  return 1
end

-- Function to place a block depending on the side
local function placeBlock()
  if side == nil or side == 1 then
    murtle.placedown()
  elseif side == 2 then
    murtle.placeup()
  end
end

-- Function to build a row of blocks
local function buildRow(length)
  placeBlock()
  for i = 1, length - 1 do
    murtle.fwd()
    placeBlock()
  end
end

-- Function to build the floor
local function buildFloor()
  -- Determine if the width is even or odd
  local isWidthEven = x % 2 == 0
  -- Determine how many iterations are needed to build a floor
  local widthIterations = isWidthEven and x / 2 or math.floor((x - 1) / 2)
  -- Determine if an additional row is needed to cover the remaining space
  local widthOffset = isWidthEven and 0 or 1

  -- Build each row of blocks, alternating directions
  for i = 1, widthIterations do
      buildRow(z)
      murtle.turnright()
      buildRow(z)
      murtle.turnleft()
  end

  -- Build an additional row if necessary
  if widthOffset == 1 then
      buildRow(z)
  end
end

-- Call the buildFloor function to build the floor
buildFloor()
