Player = Entity:extend()

function Player:new(x, y)
    Player.super.new(self, x, y, "images/cat.png")

    self.speed = 300
end

function Player:update(dt)
    Player.super.update(self, dt)
    if love.keyboard.isDown("a") then
        self.x = self.x - self.speed * dt
    elseif love.keyboard.isDown("d") then
        self.x = self.x + self.speed * dt
    elseif love.keyboard.isDown("w") then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
    end
    if self.x < -12.5 then
        self.x = 700
    elseif self.x > 700 then
        self.x = -12.5
    end
end
