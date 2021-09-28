function love.load()
  Object = require "classic"
  require "circle"

  circle1 = Circle()

  print(circle1.test)

  playerX = 0
  playerY = 0
  move = false
end

function love.update(dt)
  if love.keyboard.isDown("right") then
      playerX = playerX+300*dt
    end
  
    if love.keyboard.isDown("left") then
      playerX = playerX-300*dt
    end
    
    if love.keyboard.isDown("down") then
      playerY = playerY+300*dt
    end
    
    if love.keyboard.isDown("up") then
      playerY = playerY-300*dt
    end
  
  if playerX >900 then
    playerX = 0
  end
  
    
end

function love.draw()
    love.graphics.rectangle("line", playerX, playerY, 50, 80)
end

