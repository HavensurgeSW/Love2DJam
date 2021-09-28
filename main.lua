

function love.load()
  x = 0
end

function love.update(dt)
  x = x+300*dt
  if x >900 then
    x = 0
    end
    
end

function love.draw()
    love.graphics.print("Hello World!", 100, 100)
    love.graphics.rectangle("line", x, 300, 50, 80)
end

