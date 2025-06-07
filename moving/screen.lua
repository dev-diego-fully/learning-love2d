---@class Screen
---@field width number
---@field height number
---@field default fun():Screen
local Screen = {}

---comment
---@return Screen
function Screen.current()
    return setmetatable(
        {
            width = love.graphics.getWidth(),
            height = love.graphics.getHeight()
        },
        Screen
    )
end

return Screen
