Player = {}

function Player:loard() -- dois pontos : na função define um metodo u ponto . é euma função
  --Define o "objeto" player
    self.img    = love.graphics.newImage("img/player.png")
    ------ definir a altura e largura da imagem
    self.w      = self.img:getWidth()
    self.h      = self.img:getHeight()
      -------
    self.x      = width / 2 -- onde a imagem vai aparecer na tela ex: se for x=0 y=0 ela vai aparecer lá em cima
    self.y      = height / 2
    -------- ox oy é quanto você quer mover a origem da imagem quando for igual a 0 fica lá em cima no topo da tela
    self.ox     = self.w / 2 -- movendo pro centro a origem da imagem
    self.oy     = self.h / 2 -- esta dividindo por dois
    ------ sx sy estica a imagem ele multipla a largura e a altura da imagem
    self.sx     = 1 -- quanto mais almenta mais ela estica
    self.sy     = 1 -- se quiser diminuir é só colocar 0,5
    self.r      = 0 -- r é a rotação
    self.speed  = 300
    self.xvel   = self.speed * math.cos(math.pi / 4) -- pi de 4 é igual à 45
    self.yvel   = self.speed * math.sin(math.pi / 4) -- player.speed é um vetor que aponta pra diagonal
    --Auto = {} --Auto pra ele se mover automatico
    --Auto.x = 0
    --Auto.y = 0
    --Auto.r = 5
    --Auto.speed = 50

    -- saquinho de balas
    self.bullets = {}
    self.cd      = 0.5 --ele só pode atirar depois de 0,5 segundo
    self.canfire = 0
end

function Player:update(dt)-- dt é a fração de tempo. Essa função vai retornar verdeiro ou falso caso seja apetadas as telas a,w,s,d
    --self.r = self.r + dt -- é a rotação da iamagem

  if love.keyboard.isDown("w") and love.keyboard.isDown("a") then --se a tela W estiver apertada o jogador vai pra sima
    self.y = self.y - self.yvel * dt
    self.x = self.x - self.xvel * dt

  elseif love.keyboard.isDown("a") and love.keyboard.isDown ("s") then
    self.y = self.y + self.yvel * dt
    self.x = self.x - self.xvel * dt

  elseif love.keyboard.isDown("s") and love.keyboard.isDown ("d") then
    self.y = self.y + self.yvel * dt
    self.x = self.x + self.xvel * dt

  elseif love.keyboard.isDown("d") and love.keyboard.isDown("w") then
    self.y = self.y - self.yvel * dt
    self.x = self.x + self.speed * dt

  elseif love.keyboard.isDown("w") then
    self.y = self.y - self.speed * dt

  elseif love.keyboard.isDown("a") then
    self.x = self.x - self.speed * dt

  elseif love.keyboard.isDown("s") then
    self.y = self.y + self.speed * dt

  elseif love.keyboard.isDown("d") then
    self.x = self.x + self.speed * dt

  end
--Auto.x = Auto.x + Auto.speed * dt
--Auto.y = Auto.y + Auto.speed * dt

--impede que o play saia da tela essas condiçãoe de agora
if self.y < self.h / 2 then
  self.y = self.h / 2 -- y impede que saia pra cima
  end

if self.x < self.h /2 then
  self.x = self.w / 2-- x lado esquerdo
  end

if self.y > height - self.h /2 then
  self.y = height - self.h / 2
    end
if self.x > width - self.h /2 then
  self.x = width - self.w / 2
    end

-- Atira com o botão esquerdo do mouse 1 com o direito 2
--- Atira quando estiver no cooldown
self.canfire = self.canfire - dt -- você só vai conceguir atirar depois de 0,5 e acada 0,5 depois
if love.mouse.isDown(1) and self.canfire <= 0 then
  self.canfire = self.cd
  self:fire()
    end
end

function Player:draw()
love.graphics.draw(self.img, self.x, self.y, self.r, self.sx, self.sy, self.ox, self.oy) --kx e ky é pra fazer um corte na imagem
-----------------------------------aqui é quando era com circulo
--love.graphics.circle("line", self.x, self.y, self.r)
--love.graphics.circle("fill", Auto.x, Auto.y, Auto.r)
end

function Player:fire() -- vai fazer com que o player atire
  table.insert(self.bullets, Bullet:create())
end
