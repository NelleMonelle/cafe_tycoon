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