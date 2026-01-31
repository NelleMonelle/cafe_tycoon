function Mod:init()
    print("Loaded " .. self.info.name .. "!")

    MUSIC_PITCHES["cybercity"] = 0.97
end

function Mod:postInit(new_file)
    if new_file then
        local unlockedIngredients = {
            "bread",
            "burger",
            "lettuce",
            "catsup",
            "cheese"
        }
        local unlockedRecipes = {
            "darkburger"
        }
        Game:setFlag("unlockedIngredients", unlockedIngredients)
        Game:setFlag("unlockedRecipes", unlockedRecipes)

        if not Game.supplies then
            Game.supplies = {
                bread = 10,
                burger = 10,
                lettuce = 10,
                catsup = 10,
                cheese = 10
            }
        end
    end
end

function Mod:onRegistered()
    self.ingredients = {}

    for _,path,ingredient in Registry.iterScripts("data/ingredients") do
        assert(ingredient ~= nil, '"data/ingredients' .. path .. '.lua" does not return a value')
        ingredient.id = ingredient.id or path
        self.ingredients[ingredient.id] = ingredient
    end

    self.recipes = {}

    for _,path,recipe in Registry.iterScripts("data/recipes") do
        assert(recipe ~= nil, '"data/recipes' .. path .. '.lua" does not return a value')
        recipe.id = recipe.id or path
        self.recipes[recipe.id] = recipe
    end
end

function Mod:createIngredient(id, ...)
    if self.ingredients[id] then
        return self.ingredients[id](...)
    else
        error("Attempt to create ingredient \"" .. tostring(id) .. "\"")
    end
end

function Mod:createRecipe(id, ...)
    if self.recipes[id] then
        return self.recipes[id](...)
    else
        error("Attempt to create recipe \"" .. tostring(id) .. "\"")
    end
end

function Mod:onMapMusic(map, music)
    if music == "cafe" then
        if Game:getFlag("cafe_style", "castletown") == "castletown" then
            return "castletown"
        end
    end
end

function Mod:addSupply(supply, value)
    if Game.supplies[supply] then
        Game.supplies[supply] = Game.supplies[supply] + value
        if Game.supplies[supply] < 0 then
            Game.supples[supply] = 0
        end
    else
        table.insert(Game.supplies, supply, value)
        if Game.supplies[supply] < 0 then
            Game.supples[supply] = 0
        end
    end
end

function Mod:setSupply(supply, value)
    if value < 0 then
        value = 0
    end
    if Game.supplies[supply] then
        Game.supplies[supply] = value
    else
        table.insert(Game.supplies, supply, value)
    end
end