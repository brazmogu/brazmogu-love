--- Debug utilities

--- Logs debug info; to be turned off on release builds
function DEBUG(...)
    print("[DEBUG]", ...)
end

--- Logs general information; included in release builds
function INFO(...)
    print("[INFO]", ...)
end

--- Logs warnings; included in release builds
function WARNING(...)
    print("[WARNING]", ...)
end

--- Logs errors and crashes (in development, it only halts)
function ERROR(...)
    print("[ERROR]", ...)
end

--- Formats table data as a string
function TABLE(T, indent, visited)
    indent = indent or 0
    visited = visited or {}

    if visited[T] then
        return string.format("%s [...]", T)
    end

    visited[T] = true
    local header = string.format("%s {", T)

    local innerData = {}
    for k,v in pairs(T) do
        local index = string.format("[%s]", tostring(k))
        if type(v) == "table" then
            table.insert(innerData, string.format("%s: %s", index, TABLE(v, indent+1, visited)))
        else
            table.insert(innerData, string.format("%s: %s", index, tostring(v)))
        end
    end

    return table.concat({header, "   " .. table.concat(innerData, "\n   "), "}"}, "\n")
end
