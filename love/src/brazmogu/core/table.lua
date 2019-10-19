--- Table Utilities
-- Table and Array functions

local Table = {}

--- Creates a copy of a table, including references to other tables
-- @treturn table
function Table.copy(T)
    local copy = {}
    for key, value in pairs(T) do
        copy[key] = value
    end

    return copy
end

--- Creates a copy of a table, also copying tables referenced within
-- @treturn table
function Table.deepCopy(T)
    local copy = {}
    for key, value in pairs(T) do
        if type(value) == "table" then
            copy[key] = Table.deepCopy(value)
        else
            copy[key] = value
        end
    end

    return copy
end

--- Creates a copy of a table, with the same metatable
-- @treturn table
function Table.copy(T)
    local copy = {}
    for key, value in pairs(T) do
        copy[key] = value
    end
    setmetatable(copy, getmetatable(T))

    return copy
end

return Table
