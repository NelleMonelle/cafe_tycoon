local Bread, super = Class(Ingredient)

function Bread:init()
    super.init(self, "bread")

    self.name = "Bread"
    self.cost = 25
end

return Bread