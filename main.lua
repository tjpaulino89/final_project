function love.load()
    Object = require "classic"
    require "cow"
    cow = Cow()

    score = 0

    myFont = love.graphics.newFont(40)
end

function love.update(dt)
    cow:update(dt)

end

function love.draw()
    love.graphics.setColor(255, 255, 255)
    cow:draw()

    love.graphics.setFont(myFont)
    love.graphics.setColor(255, 0, 255)
    love.graphics.print(score)
end

function love.mousepressed( x, y, button, istouch )
    if button == 1 then
        local mouseToTarget = distanceBetween(x, y, cow.x, cow.y)
        if mouseToTarget < cow.radius then
        score = score + 1
        cow.x = math.random(cow.radius, love.graphics.getWidth() - cow.radius)
        cow.y = math.random(cow.radius, love.graphics.getHeight() - cow.radius)
        end
    end
end

function distanceBetween(x1, y1, x2, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end