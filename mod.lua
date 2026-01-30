function Mod:init()
    print("Loaded " .. self.info.name .. "!")

    MUSIC_PITCHES["cybercity"] = 0.97
end

function Mod:onMapMusic(map, music)
    if music == "cafe" then
        if Game:getFlag("cafe_style", "castletown") == "castletown" then
            return "castletown"
        end
    end
end