Coin = Entity:extend()

function Coin:new(x, y)
    Coin.super.new(self, x * 25, y * 25, "images/coin.png")


    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end

function Coin:update(dt)
    Coin.super.update(self, dt)
end

function Coin:checkCollision(player)
    local self_left = self.x
    local self_right = self.x + self.width
    local self_top = self.y
    local self_bottom = self.y + self.height

    local obj_left = player.x - player.width / 2
    local obj_right = player.x + player.width / 2
    local obj_top = player.y - player.width / 2
    local obj_bottom = player.y + player.height / 2

    if self_right > obj_left
        and self_left < obj_right
        and self_bottom > obj_top
        and self_top < obj_bottom then
        self.dead = true
    end
end
