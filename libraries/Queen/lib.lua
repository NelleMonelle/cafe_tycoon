local lib = {}

function lib:init()
    self.voice_timer = 0
end

function lib:preUpdate(dt)
    self.voice_timer = Utils.approach(self.voice_timer, 0, DTMULT)
end

function lib:onTextSound(sound, node)
    if sound == "gerson" then
        if self.voice_timer == 0 then
            local snd = Assets.playSound("voice/gerson")
            snd:setPitch(1 - MathUtils.random(0.2))
            self.voice_timer = 3
        end
        return true
    end
end

return lib