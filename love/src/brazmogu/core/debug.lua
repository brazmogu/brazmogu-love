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
