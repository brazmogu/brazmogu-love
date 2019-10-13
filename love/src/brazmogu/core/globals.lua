-- Global functions and variables, as well as redefinition of some Lua globals

-- Original lua values for some redefined functions
Lua = {
    require = require,
    print = print
}

-- Redefinition of require
-- Perform a pcall and avoid abrupt failure in case the module is not found
function require(module, ...)
    local ok, mod = pcall(Lua.require, module, ...)
    if ok then
        return mod
    else
        INFO(string.format("Module '%s' could not be loaded - not found or in error.", module))
        return nil
    end
end

-- Global components and access points
Global = {
    legacy = Lua,
    screenStack = require("brazmogu/screenStack")
}

return Global