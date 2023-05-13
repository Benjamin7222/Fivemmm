ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5000)
	end
end)

function Parachute(TPPos)
    local mainMenu = menu.CreateMenu("Parachute", "Activité")
    local parachute = false
    mainMenu.Closed = function() parachute = false end
	if not parachute then parachute = true menu.Visible(mainMenu, true)
		CreateThread(function()
		    while parachute do 
		        menu.IsVisible(mainMenu, function() 
                    menu.Button("Faire un saut en parachute", nil, {RightLabel = "~g~"..kaizo_parachute.Price.."$ ~s~→"}, true, {
                        onSelected = function()
                            ESX.TriggerServerCallback('kaizo_parachute:buy', function(cb) 
                                if cb then
                                    ESX.Game.Teleport(PlayerPedId(), vector3(TPPos.x, TPPos.y, TPPos.z), function()
                                        xParachute = true
                                        SetEntityHeading(PlayerPedId(), TPPos.h)
                                        parachute = false
                                        while xParachute do
                                            Citizen.Wait(0)
                                            if IsPedInParachuteFreeFall(PlayerPedId()) then
                                                ForcePedToOpenParachute(PlayerPedId())
                                                xParachute = false
                                            end
                                        end                                     
                                    end)
                                end
                            end, kaizo_parachute.Price)
                        end                    
                    })
		        end)                   
		    Wait(0)
		    end
	    end)
    end
end

Citizen.CreateThread(function()
    while true do
        local wait = 900
        for k,v in pairs(kaizo_parachute.Localisation) do 
            local coords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(coords.x, coords.y, coords.z, v.Pos.x, v.Pos.y, v.Pos.z)
            if dist <= 2.0 then
                wait = 0
                DrawMarker(kaizo_parachute.Marker.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, kaizo_parachute.Marker.ScaleX, kaizo_parachute.Marker.ScaleY, kaizo_parachute.Marker.ScaleZ, kaizo_parachute.Marker.R, kaizo_parachute.Marker.V, kaizo_parachute.Marker.B, 255, false, false, p19, false) 
                if dist <= 2.0 then
                    wait = 0
                    ESX.ShowHelpNotification("E", "pour acheter un parachute")
                    if IsControlJustPressed(1,51) then
                        Parachute(v.TPPos)
                    end
                end
            end
        end
    Citizen.Wait(wait)    
    end
end)

Citizen.CreateThread(function()
    for _, info in pairs(kaizo_parachute.Localisation) do
        info.blip = AddBlipForCoord(info.Pos.x, info.Pos.y, info.Pos.z)
        SetBlipSprite(info.blip, kaizo_parachute.Blip.Sprite)
        SetBlipDisplay(info.blip, kaizo_parachute.Blip.Display)
        SetBlipScale(info.blip, kaizo_parachute.Blip.Scale)
        SetBlipColour(info.blip, kaizo_parachute.Blip.Colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(kaizo_parachute.Blip.Title)
        EndTextCommandSetBlipName(info.blip)
    end
end)