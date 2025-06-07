local accel = 25
local max_speed = 50
local slowing = 15
local speed_x = 0
local speed_y = 0
local position_x = 400
local position_y = 400
local width = 50
local height = 50
local screen_width = love.graphics.getWidth()
local screen_height = love.graphics.getHeight()

local function clamp(val, min, max)
    return math.min(max, math.max(val, min))
end


function love.load()

end

function love.update(dt)
    if speed_x > 0 then
        speed_x = speed_x - slowing * dt
    elseif speed_x < 0 then
        speed_x = speed_x + slowing * dt
    end

    if speed_y > 0 then
        speed_y = speed_y - slowing * dt
    elseif speed_y < 0 then
        speed_y = speed_y + slowing * dt
    end

    if love.keyboard.isDown("d") then
        speed_x = math.min(speed_x + accel * dt, max_speed)
    end

    if love.keyboard.isDown("s") then
        speed_y = math.min(speed_y + accel * dt, max_speed)
    end

    if love.keyboard.isDown("w") then
        speed_y = math.max(speed_y - accel * dt, -max_speed)
    end

    if love.keyboard.isDown("a") then
        speed_x = math.max(speed_x - accel * dt, -max_speed)
    end

    position_x = clamp(position_x + speed_x, 0, screen_width - width)
    position_y = clamp(position_y + speed_y, 0, screen_height - height)
end

function love.draw()
    love.graphics.rectangle("fill", position_x, position_y, width, height)
end
