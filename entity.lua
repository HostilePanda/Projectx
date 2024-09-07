Entity = Object:extend()

function Entity:new(x, y, image_path)
    self.x = x
    self.y = y
    self.image = love.graphics.newImage(image_path)
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    self.last = {}
    self.last.x = self.x
    self.last.y = self.y

    self.strength = 0
    self.tempStrength = 0
    self.angle = 0
    self.orgin_x = self.width / 2
    self.orgin_y = self.height / 2
end

function Entity:update()
    self.last.x       = self.x
    self.last.y       = self.y
    self.tempStrength = self.strength
end

function Entity:wasVerticallyAlligned(e)
    return (self.last.y - self.orgin_y) < (e.last.y - e.orgin_y) + e.height and
        (self.last.y - self.orgin_y) + self.height > (e.last.y - e.orgin_y)
end

function Entity:wasHorizontallyAlligned(e)
    return (self.last.x - self.orgin_x) < (e.last.x - e.orgin_x) + e.width and
        (self.last.x - self.orgin_x) + self.width > (e.last.x - e.orgin_x)
end

function Entity:resolveCollision(e)
    if self.tempStrength > e.tempStrength then
        return e:resolveCollision(self)
    end

    if self:checkCollision(e) then
        self.tempStrength = e.tempStrength

        if self:wasVerticallyAlligned(e) then
            if (self.x - self.orgin_x) + self.width / 2 < (e.x - e.orgin_x) + e.width / 2 then
                local pushback = (self.x - self.orgin_x) + self.width - (e.x - e.orgin_x)
                self.x = self.x - pushback
            else
                local pushback = (e.x - e.orgin_x) + e.width - (self.x - self.orgin_x)
                self.x = self.x + pushback
            end
        elseif self:wasHorizontallyAlligned(e) then
            if (self.y - self.orgin_y) + self.height / 2 < (e.y - e.orgin_y) + e.height / 2 then
                local pushback = (self.y - self.orgin_y) + self.height - (e.y - e.orgin_y)
                self.y = self.y - pushback
            else
                local pushback = (e.y - e.orgin_y) + e.height - (self.y - self.orgin_y)
                self.y = self.y + pushback
            end
        end
        return true
    end
    return false
end

function Entity:draw()
    love.graphics.draw(self.image, self.x, self.y, self.angle, 1, 1, self.orgin_x, self.orgin_y)
end

function Entity:checkCollision(otherEntity)
    return (self.x - self.orgin_x) < (otherEntity.x - otherEntity.orgin_x) + otherEntity.width and
        (self.x - self.orgin_x) + self.width > (otherEntity.x - otherEntity.orgin_x) and
        (self.y - self.orgin_y) < (otherEntity.y - otherEntity.orgin_y) + otherEntity.height and
        (self.y - self.orgin_y) + self.height > (otherEntity.y - otherEntity.orgin_y)
end
