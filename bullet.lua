Bullet = {}
Bullet.img = love.graphics.newImage("img/bullet.png") -- carrega uma vez só a imagem

function Bullet:create() -- sempre que ele clicar ele vai carrega essa função
  local bullet = {}
  bullet.img = Bullet.img -- ao inves de toda vez carregar ele só vai fazer uma copia
  bullet.w     = bullet.img:getWidth()
  bullet.h     = bullet.img:getHeight()
  bullet.x     = Player.x
  bullet.y     = Player.y
  bullet.ox    = bullet.w / 2
  bullet.oy    = bullet.h / 2
  bullet.sx    = 1
  bullet.sy    = 1
  bullet.r     = 0
  bullet.speed = 1000

  return bullet
end

function Bullet:update(dt)
  for i, b in ipairs(Player.bullets) do
    b.x = b.x + b.speed * dt
  end
end

function Bullet:draw()
    for i, b in ipairs(Player.bullets) do --para esse par de indice i e nome b
      -- indice é o número do elemento ex: a partir de 5 balas eu vou ter a bala 1 a bala 2 a bala 3
      love.graphics.draw(b.img, b.x, b.y, b.r, b.sx, b.sy, b.ox, b.oy)
    end
end
