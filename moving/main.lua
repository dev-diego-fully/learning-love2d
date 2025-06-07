local State = require("state")

local game_state

local function get_input_maps()
    local x = 0
    local y = 0

    if love.keyboard.isDown("w") then
        y = y - 1
    end
    if love.keyboard.isDown("s") then
        y = y + 1
    end
    if love.keyboard.isDown("a") then
        x = x - 1
    end
    if love.keyboard.isDown("d") then
        x = x + 1
    end

    return { x = x, y = y }
end

function love.load()
    game_state = State.default()
end

function love.update(dt)
    game_state:update(dt, get_input_maps())
end

function love.draw()
    love.graphics.rectangle(
        "fill",
        game_state.player.x, game_state.player.y,
        game_state.player.width, game_state.player.height
    )
end
