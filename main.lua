HC = require ("HC")-- essa bibliteca de fisica
-- O HC vai retornar tudo o que tem na pasta
require ("player") -- require serve pra chamar o outro arquivo se tivesse em outra pasta seria require("nome da pasta/nome do arquivo")
require ("bullet")

width = love.graphics.getWidth()
height = love.graphics.getHeight()

function love.load()
--Define cor de fundo
  love.graphics.setBackgroundColor(255, 0, 255) -- a é transparencia

  Player:loard() --- Carrega Player

  debugMode = false -- para exibir as variaveis de controle

end
-- function love.update recebe e controla
function love.update(dt)

  Player:update(dt) -- Atualiza Player

  Bullet:update(dt)
end

function love.draw()

  Bullet:draw() -- desenhar as bullets
  ---- o desenho do bullets pra ficar antes do player
  Player:draw() -- desenha Player


-- Varáveis de controle
  love.graphics.print("Bullets: "..#Player.bullets) --# acessa o número de elementos que está dentro da bullets
                      -- pra colocar uma string e concatenar com o valor tem que colocar .. dois pontos
end
