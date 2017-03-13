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

end

function Bullet:draw()

end
