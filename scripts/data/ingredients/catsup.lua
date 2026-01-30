local Catsup, super = Class(Ingredient)

function Catsup:init()
    super.init(self, "catsup")

    self.name = "Catsup"
    self.cost = 25
end

return Catsup