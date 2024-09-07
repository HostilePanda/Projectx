if arg[2] == "debug" then
    require("lldebugger").start()
end
local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end

print("Hello World")



function love.load()
    screen_width = 900
    screen_height = 900
    love.window.setTitle("ReverseGameJam")
    love.window.setMode(screen_width, screen_height)
    Object = require "classic"
    require "entity"
    require "wall"
    require "player"



    gameFont = love.graphics.newFont(30)
    wall = Wall
    player = Player(427, 700)


    listOfBullets = {}

    walls = {
        Wall(1, 5), Wall(2, 5), Wall(3, 5), Wall(4, 5), Wall(5, 5), Wall(6, 5), Wall(7, 5), Wall(8, 5), Wall(9, 5), Wall(
        10, 5),
        Wall(11, 5), Wall(12, 5), Wall(13, 5), Wall(14, 5), Wall(15, 5), Wall(16, 5), Wall(17, 5), Wall(18, 5), Wall(19,
        5), Wall(20, 5),
        Wall(21, 5), Wall(22, 5), Wall(23, 5), Wall(24, 5), Wall(25, 5), Wall(26, 5), Wall(27, 5), Wall(28, 5), Wall(29,
        5), Wall(30, 5),
        Wall(31, 5), Wall(32, 5),

        Wall(1, 33), Wall(2, 33), Wall(3, 33), Wall(4, 33), Wall(5, 33), Wall(6, 33), Wall(7, 33), Wall(8, 33), Wall(9,
        33), Wall(10, 33),
        Wall(11, 33), Wall(12, 33), Wall(13, 33), Wall(14, 33), Wall(15, 33), Wall(16, 33), Wall(17, 33), Wall(18, 33),
        Wall(19, 33), Wall(20, 33),
        Wall(21, 33), Wall(22, 33), Wall(23, 33), Wall(24, 33), Wall(25, 33), Wall(26, 33), Wall(27, 33), Wall(28, 33),
        Wall(29, 33), Wall(30, 33),
        Wall(31, 33), Wall(32, 33),

        Wall(1, 5), Wall(1, 6), Wall(1, 7), Wall(1, 8), Wall(1, 9), Wall(1, 10), Wall(1, 11), Wall(1, 12), Wall(1, 13),
        Wall(1, 14),
        Wall(1, 15), Wall(1, 16), Wall(1, 17), Wall(1, 18), Wall(1, 22), Wall(1, 23), Wall(1, 24),
        Wall(1, 25), Wall(1, 26), Wall(1, 27), Wall(1, 28), Wall(1, 29), Wall(1, 30), Wall(1, 31), Wall(1, 32), Wall(1,
        33),

        Wall(33, 5), Wall(34, 6), Wall(34, 7), Wall(34, 8), Wall(34, 9), Wall(34, 10), Wall(34, 11), Wall(34, 12), Wall(
        34, 13),
        Wall(34, 14), Wall(34, 15), Wall(34, 16), Wall(34, 17), Wall(34, 18),
        Wall(34, 22), Wall(34, 23), Wall(34, 24), Wall(34, 25), Wall(34, 26), Wall(34, 27), Wall(34, 28), Wall(34, 29),
        Wall(34, 30), Wall(34, 31), Wall(34, 32), Wall(34, 33),

        Wall(4, 8), Wall(5, 8), Wall(3, 8), Wall(7, 8), Wall(8, 8), Wall(9, 8)
    }

    objects = {}
    table.insert(objects, player)
    table.insert(objects, enemy)


    for _, wall in ipairs(walls) do
        table.insert(objects, wall)
    end
end

function love.keypressed(key)
    if key == 'p' then
        isPaused = not isPaused
    end
end

function love.update(dt)
    if not isPaused then
        for i, v in ipairs(objects) do
            v:update(dt)
        end
        for k, x in ipairs(listOfBullets) do
            x:update(dt)
            x:checkCollision(player)

            for i, v in ipairs(objects) do
                if v == enemy then
                    goto continue
                end

                x:checkCollision(v)
                ::continue::
            end

            if x.dead then
                table.remove(listOfBullets, k)
            end
        end
        local loop = true
        local limit = 0

        while loop do
            loop = false
            limit = limit + 1
            if limit > 100 then
                break
            end

            for i = 1, #objects - 1 do
                for j = i + 1, #objects do
                    local collision = objects[i]:resolveCollision(objects[j])
                    if collision then
                        loop = true
                    end
                end
            end
        end
    end
end

function love.draw()
    for i, v in ipairs(objects) do
        v:draw()
    end
    for k, x in ipairs(listOfBullets) do
        x:draw()
    end
end

function checkCollision(a, b)
    return a.x < b.x + b.image:getWidth() and
        b.x < a.x + a.width and
        a.y < b.y + b.image:getHeight() and
        b.y < a.y + a.height
end
