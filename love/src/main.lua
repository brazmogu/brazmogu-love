--- BrazMogu LÖVE's main code
-- Initializes the globals and includes all the necessary utils

-- Global Requires and Modules
require("brazmogu/core/debug")
require("brazmogu/core/globals")

-- Game Config File
local gameConfig = require("game_config")
if gameConfig then
else
    DEBUG("Game Configuration should be defined in 'game_config.lua' in the project source root. Game will proceed with engine default values.")
    gameConfig = {
        main = "game"
    }
end

-- LÖVE2D Callback definitions

--- Load: pre-load stuff and instantiate the starting scene
function love.load(args)
    INFO(package.path)
    print(TABLE(args))

    local Game = require(gameConfig.main)
    if not Game then
        ERROR("No Game module was found in the game package. Nothing to do, then!")
        return
    end

    -- Load the game
    Game.load()
end

--- Update: update everything in the game
-- BrazMogu LÖVE's update cycle also handles input callbacks an other events in the game components
function love.update(dt)
    Global.screenStack:invoke("update", dt)
end

--- Draw: render stuff on the screen
function love.draw()
    Global.screenStack:draw("draw")
end

--- Run: game loop
--[[ TODO: define a custom game loop someday
function love.run()
end
]]--

--- Quit: unload stuff
function love.quit()
end

-- Input Callbacks: set input state tables to deal with input in the main loop
--- Key Pressed
function love.keypressed(key, scancode, isrepeat)
end

--- Key Released
function love.keyreleased(key, scancode)
end

--- Mouse/Touch Movement
function love.mousemoved(x, y, dx, dy, touch)
end

--- Mouse/Touch Press
function love.mousepressed(x, y, button, touch, presses)
end

--- Mouse/Touch Release
function love.mousereleased(x, y, button, touch, presses)
end

--- Mouse Wheel
function love.wheelmoved(x, y)
end
