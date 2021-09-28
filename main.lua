

function love.load()
  x = 0
  y = 0
  move = false
end

function love.update(dt)
  if love.keyboard.isDown("right") then
      x = x+300*dt
    end
  
    if love.keyboard.isDown("left") then
      x = x-300*dt
    end
    
    if love.keyboard.isDown("down") then
      y = y+300*dt
    end
    
    if love.keyboard.isDown("up") then
      y = y-300*dt
    end
  
  if x >900 then
    x = 0
  end
  
    
end

function love.draw()
    love.graphics.print("Hello World!", 100, 100)
    love.graphics.rectangle("line", x, y, 50, 80)
end

