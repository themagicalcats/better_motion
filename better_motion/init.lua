-- This mod is designed to somewhat replicate what Minecraft feels like to ease players into Luanti (Minetest) whilst also being different.
minetest.register_on_joinplayer(function(player, last_login)
player:set_physics_override ({
    speed   = 1.00,     -- 4.00 * 1.10
    gravity = 1.60,     -- 9.81 * 1.50
    jump    = 1.40,     -- 6.50 * 1.30
    acceleration_air = 0.77,
    liquid_fluidity = 0,
    liquid_sink = 2.0,
})

player:set_fov(0.00, true, 1.0)
minetest.register_globalstep(function(dtime)
    for _, player in next, minetest.get_connected_players() do
        local keypress = player:get_player_control()
        local fov = -1.12
        local speed = 1.00

        if keypress.jump and keypress.aux1 then
            fov = 1.12
            speed = 1.66
        elseif keypress.aux1 then
            fov = 1.12
            speed = 1.50
        end

        player:set_fov(fov, true, 0.15)
        player:set_physics_override({speed = speed,})

        end
    end)
end)
