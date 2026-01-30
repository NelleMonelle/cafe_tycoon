return {
    ---@param cutscene WorldCutscene
    queen = function(cutscene, event)
        cutscene:text("* Hello Kris Check This Out", "smile", "queen")
        Game.world.music:fade(0, 0.5)
        local wait = 1
        local white = Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
        white:setParallax(0, 0)
        white.layer = WORLD_LAYERS["above_ui"] + 10
        white.color = {1, 1, 1}
        white.alpha = 0
        Game.world:addChild(white)
        for i = 1, 50 do
            cutscene:wait(wait)
            local boom = Explosion(Game.world.camera.x-SCREEN_WIDTH/2+MathUtils.randomInt(SCREEN_WIDTH), Game.world.camera.y-SCREEN_HEIGHT/2+MathUtils.randomInt(SCREEN_HEIGHT))
            boom.layer = WORLD_LAYERS["above_ui"]
            Game.world:addChild(boom)
            Assets.stopAndPlaySound("badexplosion", 0.5)
            if wait > 0.1 then
                wait = wait - 0.05
            end
            if wait <= 0.2 then
                white.alpha = white.alpha + 0.05
            end
        end
        cutscene:wait(1)
        Game.world:getEvent("style_controller").style = "cybercity"
        white:fadeOutAndRemove(1)
        cutscene:wait(1)
        Game.world.music:play("cybercity", 1)
        cutscene:text("* Congratulations On Upgrading Your Cafe To Cyber City", "big_smile", "queen")
    end
}
