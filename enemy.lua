Enemy = Entity:extend()

function Enemy:new(x, y)
    Enemy.super.new(self, x, y, "images/dog.png")

    self.speed = 150
end

function Enemy:update(dt)
    Enemy.super.update(self, dt)
    angle = math.atan2(player.y - enemy.y, player.x - enemy.x)
    self.angle = angle
    xDistance = enemy.x - player.x
    yDistance = enemy.y - player.y

    if xDistance < 0 then
        xDistance = xDistance * -1
    end
    if yDistance < 0 then
        yDistance = yDistance * -1
    end


    cos = math.cos(angle)
    sin = math.sin(angle)

    self.x = self.x + self.speed * cos * dt
    self.y = self.y + self.speed * sin * dt
end
