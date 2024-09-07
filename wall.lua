Wall = Entity:extend()

function Wall:new(x, y)
    Wall.super.new(self, x * 25, y * 25, "images/wall1.png")
end
