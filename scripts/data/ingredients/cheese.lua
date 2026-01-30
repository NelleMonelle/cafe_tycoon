local Cheese, super = Class(Ingredient)

function Cheese:init()
    super.init(self, "cheese")

    self.name = "Cheese"
    self.cost = 25
end

return Cheese