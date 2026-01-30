local Lettuce, super = Class(Ingredient)

function Lettuce:init()
    super.init(self, "lettuce")

    self.name = "Lettuce"
    self.cost = 25
end

return Lettuce