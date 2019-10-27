--- The Actor Class
-- Actors represent objects and systems in the game. Each actor has independent behavior and is able
-- to communicate with the game systems, the screen and other actors by means of messaging.
-- Actors are made of Components that define the actor's behavior, as well as modify/define basic
-- callbacks for said actors.

local Actor = {
    _meta = {
        types = {}
    }
}

-- Actor Constructor
-- Creates an actor table that instantiates actors with the same blueprint
-- @tparam string name Actor type name
-- @tparam table blueprint Actor's blueprint
function Actor._meta.__call__(name, blueprint)
    local actorType = {}
    setmetatable(
        actorType,
        {
            __index__ = Actor
        }
    )

    -- Name check
    if Actor._meta.types[name] ~= nil then
        ERROR("Actor Type '%s' already exists!", name)
    end

    Actor._meta.types[name] = actorType

    -- Component check
    actorType.components = {}
    for name, spec in ipairs(blueprint.components) do
        if actorType.components[name] ~= nil then
            ERROR("Component name must be unique in the actor blueprint ('%s' already defined)", name)
        end

        actorType.components[name] = {
            blueprint = spec.module,
            data = spec.data
        }
    end

    --TODO: Continue parsing the blueprint

    return actorTypt
end

return Actor
