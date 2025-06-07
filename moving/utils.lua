---comment
---@param value number
---@param min number
---@param max number
---@return number
local function clamp(value, min, max)
    return math.max(
        math.min(value, max),
        min
    )
end

local function tern(cond, true_case, false_case)
    if cond then
        return true_case
    else
        return false_case
    end
end

return {
    clamp = clamp,
    tern = tern
}
