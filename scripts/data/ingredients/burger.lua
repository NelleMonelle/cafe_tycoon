local Burger, super = Class(Ingredient)

function Burger:init()
    super.init(self, "burger")

    self.name = "Burger"
    self.cost = 25
end

return Burger