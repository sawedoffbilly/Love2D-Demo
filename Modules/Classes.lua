local Dialogue = require("/Modules/Dialogue")
local Anim8 = require("/Libraries/anim8")

local Module = {}

Module.Player = function()
    local Player = {}

    Player.X = 400
    Player.Y = 200

    -- Player speeds, etc

    Player.MovementSpeed = 5
    Player.JumpHeight = 7
    Player.RollSpeed = 2

    -- Basic sprite grids, etc:

    Player.SpriteSheet = love.graphics.newImage("/Assets/Sprites/player-sheet.png")
    Player.Grid = Anim8.newGrid(12, 18, Player.SpriteSheet:getWidth(), Player.SpriteSheet:getHeight())

    -- Create Primary Animations for the player:

    Player.Animations = {}
    Player.Animations.Up = Anim8.newAnimation(Player.Grid("1-4", 4), 0.2)
    Player.Animations.Down = Anim8.newAnimation(Player.Grid("1-4", 1), 0.2)
    Player.Animations.Left = Anim8.newAnimation(Player.Grid("1-4", 2), 0.2)
    Player.Animations.Right = Anim8.newAnimation(Player.Grid("1-4", 3), 0.2)
    Player.CurrentAnimation = Player.Animations.Left
    
    Player.Inventory = {}

    return Player
end

Module.FogOverlay = function()

end

Module.DialogueContainer = function()
    -- why did i even put this here am i dumb?
end

Module.CreateClass = function(...)
    local Parameters = {...}

    if Module[Parameters[1]] then
        return Module[Parameters[1]]()    
    end
end

return Module