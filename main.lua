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
    require "enemy"
    require "coin"



    gameFont = love.graphics.newFont(30)
    wall = Wall
    player = Player(400, 225)
    enemy = Enemy(400, 400)
    coin = Coin

    coins = { Coin(2, 2) }

    -- listOfBullets = {}

    walls = {
        Wall(1, 1), Wall(2, 1), Wall(3, 1), Wall(4, 1), Wall(5, 1), Wall(6, 1), Wall(7, 1), Wall(8, 1), Wall(9, 1), Wall(
        10, 1), Wall(11, 1), Wall(12, 1), Wall(13, 1), Wall(14, 1), Wall(15, 1), Wall(16, 1), Wall(17, 1), Wall(18, 1),
        Wall(
            19, 1), Wall(20, 1), Wall(21, 1), Wall(22, 1), Wall(23, 1), Wall(24, 1), Wall(25, 1), Wall(26, 1), Wall(27, 1),
        Wall(
            28, 1),
        Wall(1, 2), Wall(28, 2), Wall(1, 3), Wall(28, 3), Wall(3, 3), Wall(4, 3), Wall(6, 3), Wall(7, 3), Wall(8, 3),
        Wall(9, 3), Wall(11, 3), Wall(12, 3), Wall(13, 3), Wall(14, 3), Wall(15, 3), Wall(16, 3), Wall(17, 3), Wall(18, 3),
        Wall(20, 3), Wall(21, 3), Wall(22, 3), Wall(23, 3), Wall(25, 3), Wall(26, 3),
        Wall(28, 4), Wall(3, 4), Wall(4, 4), Wall(6, 4), Wall(7, 4), Wall(8, 4),
        Wall(9, 4), Wall(11, 4), Wall(12, 4), Wall(13, 4), Wall(14, 4), Wall(15, 4), Wall(16, 4), Wall(17, 4), Wall(18, 4),
        Wall(20, 4), Wall(21, 4), Wall(22, 4), Wall(23, 4), Wall(25, 4), Wall(26, 4), Wall(1, 4),

        Wall(1, 5), Wall(28, 5), Wall(3, 5), Wall(4, 5), Wall(8, 5), Wall(9, 5), Wall(14, 5), Wall(15, 5), Wall(20, 5),
        Wall(21, 5), Wall(25, 5), Wall(26, 5),

        Wall(1, 6), Wall(28, 6), Wall(3, 6), Wall(4, 6), Wall(5, 6), Wall(6, 6), Wall(8, 6), Wall(9, 6), Wall(11, 6),
        Wall(12, 6), Wall(14, 6), Wall(15, 6), Wall(17, 6), Wall(18, 6), Wall(20, 6), Wall(21, 6), Wall(24, 6), Wall(23,
        6), Wall(25, 6), Wall(26, 6),

        Wall(1, 7), Wall(28, 7), Wall(3, 7), Wall(4, 7), Wall(5, 7), Wall(6, 7), Wall(8, 7), Wall(9, 7), Wall(11, 7),
        Wall(12, 7), Wall(14, 7), Wall(15, 7), Wall(17, 7), Wall(18, 7), Wall(20, 7), Wall(21, 7), Wall(24, 7), Wall(23,
        7), Wall(25, 7), Wall(26, 7),

        Wall(11, 8), Wall(12, 8), Wall(14, 8), Wall(15, 8), Wall(17, 8), Wall(18, 8),

        Wall(1, 9), Wall(28, 9), Wall(3, 9), Wall(4, 9), Wall(6, 9), Wall(7, 9), Wall(8, 9), Wall(9, 9), Wall(11, 9)
    , Wall(12, 9), Wall(17, 9), Wall(18, 9), Wall(20, 9), Wall(21, 9), Wall(22, 9), Wall(23, 9), Wall(25, 9), Wall(26, 9),
        Wall(1, 10), Wall(28, 10), Wall(3, 10), Wall(4, 10), Wall(6, 10), Wall(7, 10), Wall(8, 10), Wall(9, 10), Wall(11,
        10)
    , Wall(12, 10), Wall(17, 10), Wall(18, 10), Wall(20, 10), Wall(21, 10), Wall(22, 10), Wall(23, 10), Wall(25, 10),
        Wall(26, 10), Wall(13, 10), Wall(14, 10), Wall(15, 10), Wall(16, 10),

        Wall(12, 11), Wall(17, 11), Wall(18, 11), Wall(20, 11), Wall(21, 11), Wall(22, 11), Wall(23, 11), Wall(25, 11),
        Wall(26, 11), Wall(13, 11), Wall(14, 11), Wall(15, 11), Wall(16, 11), Wall(1, 11), Wall(28, 11), Wall(3, 11),
        Wall(4, 11), Wall(6, 11), Wall(7, 11), Wall(8, 11), Wall(9, 11), Wall(11,
        11),
        Wall(1, 12), Wall(28, 12), Wall(3, 12), Wall(4, 12), Wall(25, 12), Wall(26, 12),

        Wall(1, 13), Wall(28, 13), Wall(3, 13), Wall(4, 13), Wall(5, 13), Wall(6, 13), Wall(8, 13), Wall(9, 13), Wall(11,
        13), Wall(12, 13), Wall(13, 13), Wall(16, 13), Wall(17, 13), Wall(18, 13), Wall(20, 13), Wall(21, 13), Wall(23,
        13), Wall(24, 13), Wall(25, 13), Wall(26, 13),

        Wall(1, 14), Wall(28, 14), Wall(3, 14), Wall(4, 14), Wall(5, 14), Wall(6, 14), Wall(8, 14), Wall(9, 14), Wall(11,
        14), Wall(18, 14), Wall(20, 14), Wall(21, 14), Wall(23, 14), Wall(24, 14), Wall(25, 14), Wall(26, 14),

        Wall(1, 15), Wall(28, 15), Wall(3, 15), Wall(4, 15), Wall(9, 15), Wall(8, 15), Wall(11, 15), Wall(18, 15), Wall(
        20, 15), Wall(21, 15), Wall(25, 15), Wall(26, 15),

        Wall(1, 16), Wall(28, 16), Wall(3, 16), Wall(4, 16), Wall(6, 16), Wall(7, 16), Wall(8, 16), Wall(9, 16), Wall(11,
        16), Wall(18, 16), Wall(20, 16), Wall(21, 16), Wall(22, 16), Wall(23, 16), Wall(25, 16), Wall(26, 16),

        Wall(1, 17), Wall(28, 17), Wall(3, 17), Wall(4, 17), Wall(6, 17), Wall(7, 17), Wall(8, 17), Wall(9, 17), Wall(11,
        17), Wall(18, 17), Wall(20, 17), Wall(21, 17), Wall(22, 17), Wall(23, 17), Wall(25, 17), Wall(26, 17), Wall(12,
        17), Wall(13, 17), Wall(14, 17), Wall(15, 17), Wall(16, 17), Wall(17, 17),

        Wall(1, 18), Wall(28, 18),

        Wall(1, 19), Wall(28, 19), Wall(2, 19), Wall(3, 19), Wall(4, 19), Wall(6, 19), Wall(7, 19), Wall(8, 19), Wall(9,
        19), Wall(11, 19), Wall(12, 19), Wall(13, 19), Wall(14, 19), Wall(15, 19), Wall(16, 19), Wall(17, 19), Wall(18,
        19), Wall(21, 19), Wall(22, 19), Wall(23, 19), Wall(20, 19), Wall(25, 19), Wall(26, 19), Wall(27, 19),

        Wall(1, 20), Wall(28, 20), Wall(2, 20), Wall(3, 20), Wall(4, 20), Wall(6, 20), Wall(7, 20), Wall(8, 20), Wall(9,
        20), Wall(11, 20), Wall(12, 20), Wall(13, 20), Wall(14, 20), Wall(15, 20), Wall(16, 20), Wall(17, 20), Wall(18,
        20), Wall(21, 20), Wall(22, 20), Wall(23, 20), Wall(20, 20), Wall(25, 20), Wall(26, 20), Wall(27, 20),

        Wall(14, 21), Wall(15, 21),

        Wall(1, 22), Wall(28, 22), Wall(2, 22), Wall(3, 22), Wall(4, 22), Wall(6, 22), Wall(7, 22), Wall(8, 22), Wall(9,
        22), Wall(10, 22), Wall(11, 22), Wall(12, 22),
        Wall(14, 22), Wall(15, 22), Wall(17, 22), Wall(18, 22), Wall(19, 22), Wall(20, 22), Wall(21, 22), Wall(22, 22),
        Wall(23, 22), Wall(25, 22), Wall(26, 22), Wall(27, 22),

        Wall(1, 23), Wall(28, 23), Wall(2, 23), Wall(3, 23), Wall(4, 23), Wall(6, 23), Wall(7, 23), Wall(8, 23), Wall(9,
        23), Wall(10, 23), Wall(11, 23), Wall(12, 23),
        Wall(14, 23), Wall(15, 23), Wall(17, 23), Wall(18, 23), Wall(19, 23), Wall(20, 23), Wall(21, 23), Wall(22, 23),
        Wall(23, 23), Wall(25, 23), Wall(26, 23), Wall(27, 23),

        Wall(1, 24), Wall(28, 24), Wall(6, 24), Wall(7, 24), Wall(22, 24), Wall(23, 24),

        Wall(1, 25), Wall(28, 25), Wall(6, 25), Wall(7, 25), Wall(22, 25), Wall(23, 25), Wall(3, 25), Wall(4, 25), Wall(
        9, 25), Wall(10, 25), Wall(11, 25), Wall(12, 25), Wall(14, 25), Wall(15, 25), Wall(17, 25), Wall(18, 25), Wall(
        19, 25), Wall(20, 25), Wall(25, 25), Wall(26, 25),


        Wall(1, 26), Wall(28, 26), Wall(6, 26), Wall(7, 26), Wall(22, 26), Wall(23, 26), Wall(3, 26), Wall(4, 26), Wall(
        9, 26), Wall(10, 26), Wall(11, 26), Wall(12, 26), Wall(14, 26), Wall(15, 26), Wall(17, 26), Wall(18, 26), Wall(
        19, 26), Wall(20, 26), Wall(25, 26), Wall(26, 26),

        Wall(1, 27), Wall(28, 27), Wall(3, 27), Wall(4, 27), Wall(14, 27), Wall(15, 27), Wall(25, 27), Wall(26, 27),

        Wall(1, 28), Wall(28, 28), Wall(3, 28), Wall(4, 28), Wall(5, 28), Wall(6, 28), Wall(7, 28), Wall(9, 28), Wall(10,
        28), Wall(12, 28), Wall(13, 28), Wall(14, 28), Wall(15, 28), Wall(16, 28), Wall(17, 28), Wall(19, 28), Wall(20,
        28), Wall(22, 28), Wall(23, 28), Wall(24, 28), Wall(25, 28), Wall(25, 28),

        Wall(1, 29), Wall(28, 29), Wall(3, 29), Wall(4, 29), Wall(5, 29), Wall(6, 29), Wall(7, 29), Wall(9, 29), Wall(10,
        29), Wall(12, 29), Wall(13, 29), Wall(14, 29), Wall(15, 29), Wall(16, 29), Wall(17, 29), Wall(19, 29), Wall(20,
        29), Wall(22, 29), Wall(23, 29), Wall(24, 29), Wall(25, 29), Wall(25, 29),

        Wall(1, 30), Wall(28, 30), Wall(9, 30), Wall(10, 30), Wall(19, 30), Wall(20, 30),

        Wall(1, 31), Wall(2, 31), Wall(3, 31), Wall(4, 31), Wall(5, 31), Wall(6, 31), Wall(7, 31), Wall(8, 31), Wall(9,
        31), Wall(
        10, 31), Wall(11, 31), Wall(12, 31), Wall(13, 31), Wall(14, 31), Wall(15, 31), Wall(16, 31), Wall(17, 31), Wall(
        18, 31),
        Wall(
            19, 31), Wall(20, 31), Wall(21, 31), Wall(22, 31), Wall(23, 31), Wall(24, 31), Wall(25, 31), Wall(26, 31),
        Wall(27, 31),
        Wall(
            28, 31),








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
    for w, coin in ipairs(coins) do
        table.insert(objects, coin)
    end
    if not isPaused then
        for i, v in ipairs(objects) do
            v:update(dt)
        end
        for w, coin in ipairs(coins) do
            -- coins:update(dt)
            coin:checkCollision(player)

            for i, v in ipairs(objects) do
                if v == player then
                    coin:checkCollision(v)
                end
            end

            if coin.dead then
                table.remove(coins, w)
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
    -- for k, x in ipairs(listOfBullets) do
    --     x:draw()
    -- end
end

function checkCollision(a, b)
    return a.x < b.x + b.image:getWidth() and
        b.x < a.x + a.width and
        a.y < b.y + b.image:getHeight() and
        b.y < a.y + a.height
end
