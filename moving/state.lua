local Player = require("player")
local Screen = require("screen")

---@class State
---@field player Player
---@field screen Screen
---@field desacceleration number
local State = {}

---
---@param player Player
---@param screen Screen
---@return table
function State.new(player, screen, desaceleration)
    return setmetatable(
        {
            screen = screen,
            player = player,
            desacceleration = desaceleration
        },
        State
    )
end

---
---@return State
function State.default()
    local screen = Screen.current()
    local player = Player.default(screen)
    local desacceleration = (screen.width + screen.height) / 2 * 1 / 64;

    return State.new(player, screen, desacceleration)
end

---
---@param dt number
---@param inputs {x: number, y: number}
function State:update(dt, inputs)
    self.player:desaccelerate(dt * self.desacceleration, dt * self.desacceleration)
    self.player:accelerate(dt * inputs.x, dt * inputs.y)
    self.player:move()
end

function State:__index(key)
    if self ~= State then
        return State[key]
    end
end

return State
