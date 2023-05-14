
Map = {
        {name="Salon de Tatouage",color=1, id=75,ZoneBlip = false, Position = vector3(-1153.9765625,-1425.6508789063,4.9544591903687)},
        {name="Salon de Tatouage",color=1, id=75,ZoneBlip = false, Position = vector3(1322.9339599609,-1651.7247314453,52.275100708008)},
        {name="Salon de Tatouage",color=1, id=75,ZoneBlip = false, Position = vector3(322.47463989258,181.18678283691,103.5865020752)},
        {name="Salon de Tatouage",color=1, id=75,ZoneBlip = false, Position = vector3(-3170.6804199219,1075.3693847656,20.829183578491)},
        {name="Salon de Tatouage",color=1, id=75,ZoneBlip = false, Position = vector3(1864.1744384766,3748.1657714844,33.031852722168)},
        {name="Salon de Tatouage",color=1, id=75,ZoneBlip = false, Position = vector3(-294.1257019043,6199.6538085938,31.488185882568)},

        {name="Papiers d'identité",color=5, id=793,ZoneBlip = false, Position = vector3(-1033.18, -2734.99, 20.17)},
        {name="Bijouterie",color=18, id=617,ZoneBlip = false, Position = vector3(-629.713, -236.528, 38.057)},

        {name="~b~Entreprise ~s~| Concessionnaire",color=3, id=523,ZoneBlip = false, Position = vector3(126.2, -145.09, 66.12)},
        {name="~b~Entreprise ~s~| Dynasty8",color=0, id=476,ZoneBlip = false, Position = vector3(-716.5101, 259.9947, 84.1378)},
        {name="~b~Entreprise ~s~| Bahamas",color=7, id=93,ZoneBlip = false, Position = vector3(-1391.3, -583.31, 30.23)},
        {name="~b~Entreprise ~s~| Taxi",color=5, id=198,ZoneBlip = false, Position = vector3(899.3667, -159.4734, 74.14725)},
        {name="~b~Entreprise ~s~| Vanilla Unicorn",color=8, id=121,ZoneBlip = false, Position = vector3(133.4, -1306.14, 29.15)},
        {name="~b~Entreprise ~s~| Vigneron",color=19, id=85,ZoneBlip = false, Position = vector3(-1912.21, 2073.41, 140.39)},
        {name="~b~Entreprise ~s~| RedLine Performance",color=47, id=446,ZoneBlip = false, Position = vector3(-559.16, -924.4, 23.87)},
        {name="~b~Entreprise ~s~| BurgerShot",color=1, id=536,ZoneBlip = false, Position = vector3(-1191.99, -889.81, 302.66)},
        {name="~b~Entreprise ~s~| Ocean Hospital",color=3, id=61,ZoneBlip = false, Position = vector3(-1867.28, -352.62, 58.03)},
        {name="~b~Entreprise ~s~| Gouvernement",color=31, id=304,ZoneBlip = false, Position = vector3(-546.73553, -202.9565, 47.41)},
        {name="~b~Entreprise ~s~| Police",color=29, id=60,ZoneBlip = false, Position = vector3(438.79, -981.99, 30.69)},
    }
    
    Citizen.CreateThread(function()
        for k,v in pairs(Map) do
            local blip = AddBlipForCoord(v.Position) 
            SetBlipSprite (blip, v.id)
            SetBlipDisplay(blip, 6)
            SetBlipScale  (blip, 0.7)
            SetBlipColour (blip, v.color)
            SetBlipAsShortRange(blip, true)
              BeginTextCommandSetBlipName("STRING") 
              AddTextComponentString(v.name)
            EndTextCommandSetBlipName(blip)
            if v.ZoneBlip then
                if v.name == "~r~Zone dangeureuse" then
                    local zoneblip = AddBlipForRadius(v.Position, 12000.0)
                    SetBlipSprite(zoneblip,1)
                    SetBlipColour(zoneblip, v.color)
                    SetBlipAlpha(zoneblip,100)
                    SetBlipScale  (blip, 0.8)
                else 
                    local zoneblip = AddBlipForRadius(v.Position, 800.0)
                    SetBlipSprite(zoneblip,1)
                    SetBlipColour(zoneblip, v.color)
                    SetBlipAlpha(zoneblip,100)
                end
            end
        end
    end)