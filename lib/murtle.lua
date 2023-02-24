-- Murtle API
-- By moverperfect

-- Forward function
function fwd(n)
  n = n or 1 -- Use a shorthand to set a default value for n
  for i = 1, n do
    while not turtle.forward() do
      turtle.dig()
    end
  end
end

-- Down function
function down(n)
  n = n or 1
  for i = 1, n do
    while not turtle.down() do
      turtle.digDown()
    end
  end
end

-- Up function
function up(n)
  n = n or 1
  for i = 1, n do
    while not turtle.up() do
      turtle.digUp()
    end
  end
end

-- Back function
function back(n)
  n = n or 1
  for i = 1, n do
    turtle.back()
  end
end

-- Turn left function
function left(n)
  n = n or 1
  for i = 1, n do
    turtle.turnLeft()
  end
end

-- Turn right function
function right(n)
  n = n or 1
  for i = 1, n do
    turtle.turnRight()
  end
end

-- Turn right function
function turnright()
  turtle.turnRight()
  fwd()
  turtle.turnRight()
end

-- Turn left function
function turnleft()
  turtle.turnLeft()
  fwd()
  turtle.turnLeft()
end

-- Place block below function
function placedown(s)
  if s then turtle.select(s) end
  turtle.placeDown()
end

-- Place block above function
function placeup(s)
  if s then turtle.select(s) end
  turtle.placeUp()
end

-- Check even function
function checkeven(n)
  return n % 2 == 0
end
