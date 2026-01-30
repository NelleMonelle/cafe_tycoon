local CustomFloor, super = Class(Event)

function CustomFloor:init(x, y, w, h)
    super.init(self, x, y, w, h)

    -- styles:
    -- Chapter 1
    -- bakerysale, cardcastle
    -- Chapter 2
    -- castletown, cyberfield, cybercity, mansion
    -- Chapter 3
    -- greenroom, tvworld
    -- Chapter 4
    -- darksanctuary, oldmansstudy, secondsanctuary, thirdsanctuary
    self.style = Game:getFlag("cafe_style", "castletown")

    self.tiles_x = Game.world.map.width
    self.tiles_y = Game.world.map.height
end

function CustomFloor:draw()

    if self.style == "castletown" then
        for i = 1, self.tiles_x do
            for j = 1, self.tiles_y-3 do
                Draw.draw(Assets.getTexture("world/events/cafe_floor/castletown"), (i - 1) * 40, 40*3 + (j - 1) * 40, 0, 1, 1)
            end
        end
    elseif self.style == "cybercity" then
        for i = 1, math.ceil((self.tiles_x*40)/404) do
            Draw.draw(Assets.getTexture("world/events/cafe_style_stuff/cybercity_loop"), (i - 1) * 404, 0, 0, 2, 2)
        end
    end

    super.init(self)
end

return CustomFloor
