--- @meta
--- @class RValue
--- Class representing a value coming from the game maker engine.
--- @field type RValueType
--- @field value any
--- @field tostring string
RValue = ...

--- @param value boolean
--- @return RValue
function RValue:new(value) end

--- @param value number
--- @return RValue
function RValue:new(value) end

--- @param value string
--- @return RValue
function RValue:new(value) end
