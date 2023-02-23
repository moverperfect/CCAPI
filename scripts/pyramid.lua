-- Pyramid script
-- Needs murtle to work

local slot = 1
turtle.select(1)
local p = 0

-- Functionality to ensure that correct slot is selected, is not currently used, will be implemented later
-- function add()
--	p=p+1
--	if p == "64" then
--		turtle.select(slot+1)
--		slot = slot + 1
--	end
--end

-- Check that user has entered the correct parameters
local arg = {...}
if arg == nil then
	print("Usage: pyramid <radius>")
	return 2
end

-- Saving a variable to the value that the user entered
radius = tonumber (arg[1])

-- Checking that murtle hsa been installed and is loaded
path=shell.resolveProgram("murtle")
if path==nil or not os.loadAPI(path) then
  print("Cant load library: murtle")
  return 1
end


-- Travelling to the top left corner of the pyramid to start the building
turtle.select(1)
murtle.up()
-- Placing a block in the middle as a reference(You can delete if you need)
murtle.placedown()
add()
murtle.fwd(radius-1)
murtle.left()
murtle.fwd(radius-1)
murtle.left()

-- Setting a length vaule of the pyramid for future reference
local diameter = 2*radius-2

-- Starting the for loops, first one repeates the levels going up
for x=1,radius - 1 do

	-- Second for loops does the four sides of the pyramid
	for y=1,4 do 
		-- Radi determines how long the length of each level will be
		radi = ((0-x)*2)+diameter+2
		-- Third loop deals with the forward and placing the length of the side
		for z=1,radi do
			murtle.fwd()
			murtle.placedown()
			add()
		end
		-- Turning left to prepare for the next side
		murtle.left()
	end
	-- After finishing all four sides of the level, it goes up one more level and gets ready to repeat
	murtle.up()
	murtle.left()
	murtle.fwd()
	murtle.right()
	murtle.fwd()
end

-- The turtle actually finishes without placing the top block so we do this at the end after the loops
murtle.placedown()
add()