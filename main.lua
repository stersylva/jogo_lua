function love.load()
  Player       = {}
  Player.x     = 0
  Player.y     = 0
  Player.r     = 20
  Player.speed = 300

  Auto = {} --Auto pra ele se mover automatico
  Auto.x = 0
  Auto.y = 0
  Auto.r = 5
  Auto.speed = 50

end

function love.update(dt)-- dt é a fração de tempo. Essa função vai retornar verdeiro ou falso caso seja apetadas as telas a,w,s,d
  if love.keyboard.isDown("w") then --se a tela W estiver apertada o jogador vai pra sima
    Player.y = Player.y - Player.speed * dt
  end
  if love.keyboard.isDown("a") then
    Player.x = Player.x - Player.speed * dt
  end
  if love.keyboard.isDown("s") then
    Player.y = Player.y + Player.speed * dt
  end
  if love.keyboard.isDown("d") then
    Player.x = Player.x + Player.speed * dt
  end

Auto.x = Auto.x + Auto.speed * dt
Auto.y = Auto.y + Auto.speed * dt

end

function love.draw()
  love.graphics.circle("line", Player.x, Player.y, Player.r)
  love.graphics.circle("fill", Auto.x, Auto.y, Auto.r)


end
