function love.load()
  --Object = require "classic"
  --require "circle"
  --circle1 = Circle(200,200,5,300)

  maxBodyPieces = 10

  listOfCircle = {}

  createCircle(5)

  playerX = 0
  playerY = 0
  move = false
end

function love.update(dt)
  if love.keyboard.isDown("right") then
      playerX = 300
      playerY = 0
    end
  
    if love.keyboard.isDown("left") then
      playerX = -300
      playerY = 0
    end
    
    if love.keyboard.isDown("down") then
      playerX = 0
      playerY = 300
    end
    
    if love.keyboard.isDown("up") then
      playerX = 0
      playerY = -300
    end
  
  for i = maxBodyPieces-1, 1, -1 do
    listOfCircle[i].x = listOfCircle[i-1].x
    listOfCircle[i].y = listOfCircle[i-1].y
  end

  listOfCircle[0].x = (playerX * dt) + listOfCircle[0].x
  listOfCircle[0].y = (playerY * dt) + listOfCircle[0].y
end

function love.draw()
  for i = 0, maxBodyPieces,1 do
    love.graphics.circle("line", listOfCircle[i].x, listOfCircle[i].y, listOfCircle[i].radius, 18)
  end
    -- for index, value in ipairs(listOfCircle) do
    --   love.graphics.circle("line", value.x, value.y, value.radius, 18)
    -- end

    
end

function createCircle(radius)
  
  for i = 0, maxBodyPieces,1 do

    circle = {}
    circle.x = 0
    circle.y = 0
    circle.radius = radius

    listOfCircle[i] = circle;
  end
  
end