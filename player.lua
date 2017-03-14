Player = {}

function Player:loard() -- dois pontos : na função define um metodo u ponto . é euma função
  --Define o "objeto" player
    Player.img    = love.graphics.newImage("img/player.png")
    ------ definir a altura e largura da imagem
    Player.w      = Player.img:getWidth()
    Player.h      = Player.img:getHeight()
      -------
    Player.x      = width / 2 -- onde a imagem vai aparecer na tela ex: se for x=0 y=0 ela vai aparecer lá em cima
    Player.y      = height / 2
    -------- ox oy é quanto você quer mover a origem da imagem quando for igual a 0 fica lá em cima no topo da tela
    Player.ox     = Player.w / 2 -- movendo pro centro a origem da imagem
    Player.oy     = Player.h / 2 -- esta dividindo por dois
    ------ sx sy estica a imagem ele multipla a largura e a altura da imagem
    Player.sx     = 1 -- quanto mais almenta mais ela estica
    Player.sy     = 1 -- se quiser diminuir é só colocar 0,5
    Player.r      = 0 -- r é a rotação
    Player.speed  = 300
    Player.xvel   = Player.speed * math.cos(math.pi / 4) -- pi de 4 é igual à 45
    Player.yvel   = Player.speed * math.sin(math.pi / 4) -- Player.speed é um vetor que aponta pra diagonal
    --Auto = {} --Auto pra ele se mover automatico
    --Auto.x = 0
    --Auto.y = 0
    --Auto.r = 5
    --Auto.speed = 50

    -- saquinho de balas
    Player.bullets = {}
    Player.cd      = 0.5 --ele só pode atirar depois de 0,5 segundo
    Player.canfire = 0
end

function Player:update(dt)-- dt é a fração de tempo. Essa função vai retornar verdeiro ou falso caso seja apetadas as telas a,w,s,d
    --Player.r = Player.r + dt -- é a rotação da iamagem

  if love.keyboard.isDown("w") and love.keyboard.isDown("a") then --se a tela W estiver apertada o jogador vai pra sima
    Player.y = Player.y - Player.yvel * dt
    Player.x = Player.x - Player.xvel * dt

  elseif love.keyboard.isDown("a") and love.keyboard.isDown ("s") then
    Player.y = Player.y + Player.yvel * dt
    Player.x = Player.x - Player.xvel * dt

  elseif love.keyboard.isDown("s") and love.keyboard.isDown ("d") then
    Player.y = Player.y + Player.yvel * dt
    Player.x = Player.x + Player.xvel * dt

  elseif love.keyboard.isDown("d") and love.keyboard.isDown("w") then
    Player.y = Player.y - Player.yvel * dt
    Player.x = Player.x + Player.speed * dt

  elseif love.keyboard.isDown("w") then
    Player.y = Player.y - Player.speed * dt

  elseif love.keyboard.isDown("a") then
    Player.x = Player.x - Player.speed * dt

  elseif love.keyboard.isDown("s") then
    Player.y = Player.y + Player.speed * dt

  elseif love.keyboard.isDown("d") then
    Player.x = Player.x + Player.speed * dt

  end
--Auto.x = Auto.x + Auto.speed * dt
--Auto.y = Auto.y + Auto.speed * dt

--impede que o play saia da tela essas condiçãoe de agora
if Player.y < Player.h / 2 then
  Player.y = Player.h / 2 -- y impede que saia pra cima
  end

if Player.x < Player.h /2 then
  Player.x = Player.w / 2-- x lado esquerdo
  end

if Player.y > height - Player.h /2 then
  Player.y = height - Player.h / 2
    end
if Player.x > width - Player.h /2 then
  Player.x = width - Player.w / 2
    end

-- Atira com o botão esquerdo do mouse 1 com o direito 2
--- Atira quando estiver no cooldown
Player.canfire = Player.canfire - dt -- você só vai conceguir atirar depois de 0,5 e acada 0,5 depois
if love.mouse.isDown(1) and Player.canfire <= 0 then
  Player.canfire = Player.cd
  self:fire()
    end
end

function Player:draw()
love.graphics.draw(Player.img, Player.x, Player.y, Player.r, Player.sx, Player.sy, Player.ox, Player.oy) --kx e ky é pra fazer um corte na imagem
-----------------------------------aqui é quando era com circulo
--love.graphics.circle("line", Player.x, Player.y, Player.r)
--love.graphics.circle("fill", Auto.x, Auto.y, Auto.r)
end

function Player:fire() -- vai fazer com que o player atire
  table.insert(Player.bullets, Bullet:create())
end
