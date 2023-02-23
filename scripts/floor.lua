-- Floor script
-- Needs murtle to work

local arg = {...}
if arg == nil then
	print("Usage: floor <z-size> <x-size> <side(1-place down(default) 2-place up)>")
	return 2
end

z = tonumber (arg[1])
x = tonumber (arg[2])
side = tonumber(arg[3])

path=shell.resolveProgram("murtle")
if path==nil or not os.loadAPI(path) then
  print("Cant load library: murtle")
  return 1
end

function place() 
	if side == nil or side == 1 then
		murtle.placedown()
	elseif side == 2 then
		murtle.placeup()
	end
end

if murtle.checkeven(x) then
	repet = x/2
	prop = 0
else
	repet = (x-1)/2
	prop = 1
end

for i=1, repet do
	place()
	for f=1, z-1 do
		murtle.fwd()
		place()
	end
	murtle.turnright()
	place()
	for f=1, z-1 do
		murtle.fwd()
		place()
	end
	murtle.turnleft()
end

for a=1, prop do
	place()
	for i=1, z-1 do
		murtle.fwd()
		place()
	end
end