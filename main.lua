require ("player") -- require serve pra chamar o outro arquivo se tivesse em outra pasta seria require("nome da pasta/ nome do arquivo")
require ("bullet")

width = love.graphics.getWidth()
height = love.graphics.getHeight()

function love.load()
--Define cor de fundo
  love.graphics.setBackgroundColor(5, 70, 110) -- a é transparencia

  Player:loard() --- Carrega Player

end
-- function love.update recebe e controla
function love.update(dt)

  Player:update(dt) -- Atualiza Player

end

function love.draw()

  Player:draw() -- desenha Player

end
