local Ingredient, super = Class(Object)

function Ingredient:init()
    super.init(self)
    self.name = "Test Ingredient"
    self.cost = 0
end

function Ingredient:update()
    super.update(self)
end

return Ingredient