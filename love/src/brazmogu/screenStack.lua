--- The Screen Stack Class
-- The screen stack is the way that screens are organized in BrazMogu LÖVE, with each scene being
-- instanced on the top of the stack.
-- By manipulating properties of the screen, the game may know how to handle updating and rendering the
-- elements contained in said screens.

local ScreenStack = {
    screens = {},
    top = nil
}

--- Adds a scren to the top of the stack.
-- If the screen is already in the stack, nothing is done.
-- @return The screen at the top of the stack.
function ScreenStack:push(screen)
    -- TODO: check the screen is not added yet
    table.insert(self.screens, screen)
    self.top = self.screens[#self.screens]
    
    return self.top
end

--- Remove the screen from the top of the stack.
-- @return The screen that was removed from the stack.
function ScreenStack:pop()
    if #self.screens == 0 then
        WARNING("Screen Stack is empty and cannot be popped.")
        return nil
    end

    local popped = table.remove(self.screens)
    self.top = self.screens[#self.screens]

    return popped
end

--- Invoke callbacks for the screens at the top of the stack.
-- The invoke is stopped at the first non-transparent screen.
-- @param callback Callback function name
function ScreenStack:invoke(callback, args)
    for i = #self.screens,1,-1 do
        local screen = self.screens[i]
        screen:invoke(callback, args)

        if not screen.transparent then
            break
        end
    end
end

return ScreenStack