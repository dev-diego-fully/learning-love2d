local utils = require("utils")

---Class Player
---@class Player
---@field x number
---@field y number
---@field width number
---@field height number
---@field accel_x number
---@field accel_y number
---@field max_x_speed number
---@field max_y_speed number
---@field speed_x number
---@field speed_y number
local Player = {}

---
---@param screen Screen
---@return Player
function Player.default(screen)
    local player_size = (screen.width + screen.height) * (1 / 2) * (1 / 16)

    return setmetatable(
        {
            x = screen.width / 2,
            y = screen.height / 2,
            speed_x = 0,
            speed_y = 0,
            max_x_speed = screen.width / 16,
            max_y_speed = screen.height / 16,
            accel_x = screen.width / 32,
            accel_y = screen.height / 32,
            width = player_size,
            height = player_size
        },
        Player
    )
end

---
---@param x number
---@param y number
function Player:accelerate(x, y)
    self.speed_x = utils.clamp(
        self.speed_x + self.accel_x * x,
        -self.max_x_speed, self.max_x_speed
    )
    self.speed_y = utils.clamp(
        self.speed_y + self.accel_y * y,
        -self.max_y_speed, self.max_y_speed
    )
end

---
---@param x number
---@param y number
function Player:desaccelerate(x, y)
    if self.speed_x > 0 then
        self.speed_x = math.max(self.speed_x - x, 0)
    elseif self.speed_x < 0 then
        self.speed_x = math.min(self.speed_x + x, 0)
    end
    if self.speed_y > 0 then
        self.speed_y = math.max(self.speed_y - y, 0)
    elseif self.speed_y < 0 then
        self.speed_y = math.min(self.speed_y + y, 0)
    end
end

function Player:move()
    self.x = self.x + self.speed_x
    self.y = self.y + self.speed_y
end

function Player:__index(key)
    if self ~= Player then
        return Player[key]
    end
end

return Player
