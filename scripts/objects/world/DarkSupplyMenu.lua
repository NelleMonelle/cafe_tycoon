---@class DarkSupplyMenu : Object
---@overload fun(...) : DarkSupplyMenu
local DarkSupplyMenu, super = Class(Object)

function DarkSupplyMenu:init()
    super.init(self, 92, 112, 457, 227)

    self.draw_children_below = 0

    self.font = Assets.getFont("main")

    self.ui_move = Assets.newSound("ui_move")
    self.ui_select = Assets.newSound("ui_select")
    self.ui_cant_select = Assets.newSound("ui_cant_select")
    self.ui_cancel_small = Assets.newSound("ui_cancel_small")

    self.heart_sprite = Assets.getTexture("player/heart")

    self.bg = UIBox(0, 0, self.width, self.height)
    self.bg.layer = -1
    self.bg.debug_select = false
    self:addChild(self.bg)
end

function DarkSupplyMenu:update(item, party)
    if Input.pressed("cancel") then
        self.ui_cancel_small:stop()
        self.ui_cancel_small:play()
        Game.world:closeMenu()
        return
    end

    super.update(self)
end

function DarkSupplyMenu:draw()
    love.graphics.setFont(self.font)

    for i, v in pairs(Game.supplies) do
        if v == 0 then
            love.graphics.setColor{1,0,0,1}
        else
            love.graphics.setColor{1,1,1,1}
        end
        if i == "bread" then
            love.graphics.print("Bread", 0, 0)
            love.graphics.print("x"..v, 112, 0)
        elseif i == "burger" then
            love.graphics.print("Burger", 0, 25)
            love.graphics.print("x"..v, 112, 25)
        elseif i == "lettuce" then
            love.graphics.print("Lettuce", 0, 50)
            love.graphics.print("x"..v, 112, 50)
        elseif i == "catsup" then
            love.graphics.print("Catsup", 0, 75)
            love.graphics.print("x"..v, 112, 75)
        elseif i == "cheese" then
            love.graphics.print("Cheese", 0, 100)
            love.graphics.print("x"..v, 112, 100)
        end
    end

    super.draw(self)
end

function DarkSupplyMenu:close()
    Game.world.menu = nil
    self:remove()
end

return DarkSupplyMenu
