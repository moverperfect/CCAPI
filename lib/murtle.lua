-- Murtle API
-- By moverperfect

-- for more visit
-- 

function fwd(n)
	if n == nil then
		n=1
	end
	for i=1, n do
		while not turtle.forward() do
			turtle.dig()
		end
	end
end

function down(n)
	if n == nil then
		n=1
	end
	for i=1, n do
		while not turtle.down() do
			turtle.digDown()
		end
	end
end

function up(n)
	if n == nil then
		n=1
	end
	for i=1, n do
		while not turtle.up() do
			turtle.digUp()
		end
	end
end

function back(n)
	if n == nil then
		n=1
	end
	for i=1,n do
		turtle.back()
	end
end

function left(n)
	if n == nil then
		n = 1
	end
	for i=1, n do
		turtle.turnLeft()
	end
end

function right(n)
	if n == nil then
		n = 1
	end
	for i=1,n do
		turtle.turnRight()
	end
end

function turnright()
	turtle.turnRight()
	fwd()
	turtle.turnRight()
end

function turnleft()
	turtle.turnLeft()
	fwd()
	turtle.turnLeft()
end

function placedown(s)
	if s == nil then
		turtle.placeDown()
	else
		turtle.select(s)
		turtle.placeDown()
	end
end

function placeup(s)
	if s == nil then
		turtle.placeUp()
	else
		turtle.select(s)
		turtle.placeUp()
	end
end

function checkeven(n)
	if n % 2 == 0 then
		return true
	else
		return false
	end
end
