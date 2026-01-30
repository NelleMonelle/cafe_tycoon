local Recipe, super = Class(Object)

function Recipe:init()
    super.init(self)
    self.name = "Test Recipe"
    self.cost = 0
    self.ingredients = {}
end

function Recipe:update()
    super.update(self)
end

return Recipe