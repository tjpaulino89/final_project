Cow = Object:extend()

function Cow:new()
    self.image = love.graphics.newImage("cow.png")
    self.x = 300
    self.y = 300
    self.speed = 100
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.rotation = 0
    self.counter = 0
    self.radius = 65
end

function Cow:update(dt)
    self.counter = self.counter + 1
     if self.counter > 100 then
        self.counter = 0
     end

    local speed = 50
    if self.counter < speed then
        self.rotation = 0
    elseif self.counter > speed then
        self.rotation = .20
    end


    self.x = self.x + self.speed * dt

    local window_width = love.graphics.getWidth()

    if self.x < self.radius then
        self.x = self.radius
        self.speed = -self.speed
    elseif self.x > window_width - self.radius then
        self.x = window_width - self.radius
        self.speed = -self.speed
    end
end

function Cow:draw()
    --local angle  = love.timer.getTime() * 2*math.pi / 2.5
    love.graphics.draw(self.image, self.x, self.y, self.rotation, .1, .1, self.width/2, self.height/2)
end