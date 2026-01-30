local Darkburger, super = Class(Recipe)

function Darkburger:init()
    super.init(self, "darkburger")

    self.name = "Darkburger"
    self.cost = 50

    self.ingredients = {
        bread = 1,
        burger = 1,
        lettuce = 1,
        catsup = 1,
        cheese = 1
    }
end

return Darkburger