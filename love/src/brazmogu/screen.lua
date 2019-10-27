--- The Screen Class
-- A screen is a generic abstraction for a game's environment. It may be a scene, a level, a menu...
-- anything that contains logic and actors that the game is running.
-- Scenes are instanced and handled in the Screen Stack, and may contain actors and components.

local Screen = {}

Screen._meta = {
    __index = Screen
}

--- Creates a new screen
-- @tparam table args Argument table
-- @tparam boolean args.transparent Transparency flag (default: false)
-- @return A new Screen instance
function Screen.new(args)
    -- Initialize instance data
    local screen = {
        actors = {}, -- Actor list
        components = {}, -- Component list,
        transparent = args.transparent or false -- Transparency flag
    }

    setmetatable(screen, Screen._meta)

    return screen
end

--- Add an actor of given type to the Screen
-- @param actorType Table describing the Actor type (see Actor)
-- @param data Instance data
function Screen:addActor(actorType, data)
    local newActor = Actor.new(actorType, data)

    table.insert(self.actors, newActor)
end

--- Add a component of given type to the Screen
-- @param componentType Table describing the Component type (see Component)
-- @param data Instance data
function Screen:addComponent(componentType, data)
    local newComponent = Component.new(componentType, data)

    table.insert(self.components, newComponent)
end

--- Invoke a callback on this screen and every actor and component contained in the screen
-- @param callback Callback name
function Screen:invoke(callback, ...)
    if self[callback] then
        self:callback(...)
    end

    for _, actor in ipairs(actors) do
        if actor[callback] then
            actor:callback(...)
        end
    end

    for _, component in iapirs(components) do
        if component[callback] then
            component:callback(...)
        end
    ends
end

--- @section Callbacks

--- Update
-- Runs a single tick
-- @function update
-- @tparam float dt Time elapsed in this tick

--- Draw
-- Draws on the screen
-- @function draw

return Screen