function love.load()

  mode = "fill"
  die = false
  size = 5
  speed = 100
  score = 0

  maxBodyPieces = 100

  listOfRect = {}
 

  createRect(size)
  

  playerX = 0
  playerY = 0
  move = false
  
  song = love.audio.newSource("GameplayMusic.ogg", "stream")
  
end

function love.update(dt)
  love.audio.play(song)
  --Inputs del usuario
  if love.keyboard.isDown("right") then
      playerX = 1
      playerY = 0
      move = true
    end
  
    if love.keyboard.isDown("left") then
      playerX = -1
      playerY = 0
      move = true
    end
    
    if love.keyboard.isDown("down") then
      playerX = 0
      playerY = 1
      move = true
    end
    
    if love.keyboard.isDown("up") then
      playerX = 0
      playerY = -1
      move = true
    end
  
    -- Actualizo las posiciones de cada parte del cuerpo
    if die == false then
  for i = maxBodyPieces, 1, -1 do
    listOfRect[i].x = listOfRect[i-1].x
    listOfRect[i].y = listOfRect[i-1].y
  end
  end
  --Al movimiento le agrego las dimensiones del cuadrado para que no collisionen apenas se mueve, pero si o si hay que dejar un espacio.
  listOfRect[0].x = (playerX * (listOfRect[0].width * 0.7) * speed * dt) + listOfRect[0].x
  listOfRect[0].y = (playerY * (listOfRect[0].height * 0.7) * speed * dt) + listOfRect[0].y

  --Checkeo de colisiones
  for i = 1, maxBodyPieces,1 do
    if checkCollision(listOfRect[0], listOfRect[i]) and move == true then
        die = true
    end
  end
  
  if listOfRect[0].x>=800 or listOfRect[0].x< 0 then
    die = true
  end
  
  
  if listOfRect[0].y>=600 or listOfRect[0].y<0 then
    die = true
  end
  

end


function love.draw()
  for i = 0, maxBodyPieces,1 do
    love.graphics.rectangle(mode, listOfRect[i].x, listOfRect[i].y, listOfRect[i].width, listOfRect[i].height)
  end
  
  love.graphics.rectangle("outline", food.x, food.y, food.width, food.height)

  if die == true then
    love.graphics.print("YOU LOSE!", 100,100)
  end
end

--Creo el cuerpo del snake
function createRect(size)
  
  for i = 0, maxBodyPieces,1 do

    rect = {}
    rect.x = 0
    rect.y = 0
    rect.width = size
    rect.height = size

    listOfRect[i] = rect;
  end

end

--Checkea las colisiones
function checkCollision(a, b)
   --With locals it's common usage to use underscores instead of camelCasing
   local a_left = a.x
   local a_right = a.x + a.width
   local a_top = a.y
   local a_bottom = a.y + a.height

   local b_left = b.x
   local b_right = b.x + b.width
   local b_top = b.y
   local b_bottom = b.y + b.height

   --Directly return this boolean value without using if-statement
   return  a_right > b_left
       and a_left < b_right
       and a_bottom > b_top
       and a_top < b_bottom
end