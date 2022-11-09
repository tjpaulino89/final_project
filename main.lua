function love.load()
    Object = require "classic"
    require "cow"

    cow1 = Cow()
    cow2 = Cow()
    cow3 = Cow()
    cows = {cow1, cow2, cow3}


    score = 0

    myFont = love.graphics.newFont(40)
end

function love.update(dt)
    cow1:update(dt)
    cow2:update(dt)
    cow3:update(dt)

end

function love.draw()
    love.graphics.setColor(255, 255, 255)
    cow1:draw()
    cow2:draw()
    cow3:draw()

    love.graphics.setFont(myFont)
    love.graphics.setColor(255, 0, 255)
    love.graphics.print(score)
end

function love.mousepressed( x, y, button, istouch )
    if button == 1 then
        for i = 1, 3 do
            
            local mouseToTarget = distanceBetween(x, y, cows[i].x, cows[i].y)
            if mouseToTarget < cows[i].radius then
            score = score + 1
            cows[i].x = math.random(cows[i].radius, love.graphics.getWidth() - cows[i].radius)
            cows[i].y = math.random(cows[i].radius, love.graphics.getHeight() - cows[i].radius)
            end
            
        end
    end
end

function distanceBetween(x1, y1, x2, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end

