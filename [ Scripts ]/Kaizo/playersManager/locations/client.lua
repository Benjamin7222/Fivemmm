local Couldown = false

local LocationVehicleStart = {
    {Label = 'Club', Name = 'club', Price = 500},
    {Label = 'Coccinelle', Name = 'weevil', Price = 800},
    {Label = 'Michelli', Name = 'michelli', Price = 1000}
}

LocationVehicle = { 
    {Label = 'Bicyclette du bled', Name = 'bike', Price = 100}, 
    {Label = 'Club', Name = 'club', Price = 500},
    {Label = 'Coccinelle', Name = 'weevil', Price = 800},
    {Label = 'Michelli', Name = 'michelli', Price = 1000}
}

local LocationVehicleJetski = {
    {Label = 'Jetski', Name = 'seashark', Price = 1000}, 
    {Label = 'Jetski 2', Name = 'seashark2', Price = 1000}, 
    {Label = 'Jetski 3', Name = 'seashark3', Price = 1000}, 
    {Label = 'Petit Bateau', Name = 'suntrap', Price = 2500},
    {Label = 'Bateau Rapide', Name = 'dinghy2', Price = 3000},
}

local LocationVelo = {
    {Label = 'BMX', Name = 'bmx', Price = 75}, 
    {Label = 'Cruiser', Name = 'cruiser', Price = 100}, 
    {Label = 'Fixter', Name = 'fixter', Price = 200}, 
    {Label = 'Scorcher', Name = 'scorcher', Price = 100},
}

local LocationVehicleTravaille = {
    {Label = 'Burrito', Name = 'burrito', Price = 150},
}

function openLocation(id)
    local location = RageUI.CreateMenu("", "Location")
	RageUI.Visible(location, not RageUI.Visible(location))

	while location do
        Citizen.Wait(0)
        RageUI.IsVisible(location, function()
            if id == 1 then 
                if not Couldown then
                    for k,v in pairs(LocationVehicleStart) do
                        RageUI.Button(v.Label, nil, {RightLabel = "~g~"..v.Price.."$"}, true, {
                            onSelected = function() 
                                local playerPed = PlayerPedId()
                                local coords    = GetEntityCoords(PlayerPedId())
                                ESX.Game.SpawnVehicle(v.Name, coords, 200.0, function(vehicle)
                                    TaskWarpPedIntoVehicle(playerPed, vehicle, -1) 
                                    SetVehicleNumberPlateText(vehicle, 'LOCATION') 
                                end)
                                TriggerServerEvent('Location:Buy', v.Name, v.Price)
                                location = RMenu:DeleteType('location', true)
                                TriggerEvent('couldownlocation')
                            end
                        });
                    end
                else
                    RageUI.Separator('~g~')
                    RageUI.Separator('~g~Vous devez attendre 1 minute')
                    RageUI.Separator('~g~')
                end
            elseif id == 2 then
                if not Couldown then
                    for k,v in pairs(LocationVehicleJetski) do
                        RageUI.Button(v.Label, nil, {RightLabel = "~g~"..v.Price.."$"}, true, {
                            onSelected = function() 
                                local playerPed = PlayerPedId()
                                local coords = GetEntityCoords(PlayerPedId())
                                ESX.Game.SpawnVehicle(v.Name, coords, 200.0, function(vehicle)
                                    TaskWarpPedIntoVehicle(playerPed, vehicle, -1) 
                                    SetVehicleNumberPlateText(vehicle, 'LOCATION') 
                                end)
                                TriggerServerEvent('Location:Buy', v.Name, v.Price)
                                location = RMenu:DeleteType('location', true)
                                TriggerEvent('couldownlocation')
                            end
                        });
                    end
                else
                    RageUI.Separator('~g~')
                    RageUI.Separator('~g~Vous devez attendre 1 minute')
                    RageUI.Separator('~g~')
                end
            elseif id == 3 then 
                if not Couldown then
                    for k,v in pairs(LocationVelo) do 
                        RageUI.Button(v.Label, nil, {RightLabel = "~g~"..v.Price.."$"}, true, {
                            onSelected = function() 
                                local playerPed = PlayerPedId()
                                local coords = GetEntityCoords(PlayerPedId())
                                ESX.Game.SpawnVehicle(v.Name, coords, 200.0, function(vehicle)
                                    TaskWarpPedIntoVehicle(playerPed, vehicle, -1) 
                                    SetVehicleNumberPlateText(vehicle, 'LOCATION') 
                                end)
                                TriggerServerEvent('Location:Buy', v.Name, v.Price)
                                location = RMenu:DeleteType('location', true)
                                TriggerEvent('couldownlocation')
                            end
                        });
                    end
                else
                    RageUI.Separator('~g~')
                    RageUI.Separator('~g~Vous devez attendre 1 minute')
                    RageUI.Separator('~g~')
                end
            elseif id == 4 then
                if not Couldown then
                    for k,v in pairs(LocationVehicleJetski) do
                        RageUI.Button(v.Label, nil, {RightLabel = "~g~"..v.Price.."$"}, true, {
                            onSelected = function() 
                                local playerPed = PlayerPedId()
                                local coords = vector3(-1528.039, 1504.714, 109.257)
                                ESX.Game.SpawnVehicle(v.Name, coords, 200.0, function(vehicle)
                                    TaskWarpPedIntoVehicle(playerPed, vehicle, -1) 
                                    SetVehicleNumberPlateText(vehicle, 'LOCATION') 
                                end)
                                TriggerServerEvent('Location:Buy', v.Name, v.Price)
                                location = RMenu:DeleteType('location', true)
                                TriggerEvent('couldownlocation')
                            end
                        });
                    end
                else
                    RageUI.Separator('~g~')
                    RageUI.Separator('~g~Vous devez attendre 1 minute')
                    RageUI.Separator('~g~')
                end
            elseif id == 44 then
                if not Couldown then
                    for k,v in pairs(LocationVehicleJetski) do
                        RageUI.Button(v.Label, nil, {RightLabel = "~g~"..v.Price.."$"}, true, {
                            onSelected = function() 
                                local playerPed = GetPlayerPed(-1)
                                local coords = vector3(1256.07, -2747.94, 0.3)
                                ESX.Game.SpawnVehicle(v.Name, coords, 200.0, function(vehicle)
                                    TaskWarpPedIntoVehicle(playerPed, vehicle, -1) 
                                    SetVehicleNumberPlateText(vehicle, 'LOCATION') 
                                end)
                                TriggerServerEvent('Location:Buy', v.Name, v.Price)
                                location = RMenu:DeleteType('location', true)
                                TriggerEvent('couldownlocation')
                            end
                        });
                    end
                else
                    RageUI.Separator('~g~')
                    RageUI.Separator('~g~Vous devez attendre 1 minute')
                    RageUI.Separator('~g~')
                end
            elseif id == 45 then
                if not Couldown then
                    for k,v in pairs(LocationVehicleJetski) do
                        RageUI.Button(v.Label, nil, {RightLabel = "~g~"..v.Price.."$"}, true, {
                            onSelected = function() 
                                local playerPed = GetPlayerPed(-1)
                                local coords = vector3(1728.8782958984, 3985.4438476563, 29.644256591797)
                                ESX.Game.SpawnVehicle(v.Name, coords, 200.0, function(vehicle)
                                    TaskWarpPedIntoVehicle(playerPed, vehicle, -1) 
                                    SetVehicleNumberPlateText(vehicle, 'LOCATION') 
                                end)
                                TriggerServerEvent('Location:Buy', v.Name, v.Price)
                                location = RMenu:DeleteType('location', true)
                                TriggerEvent('couldownlocation')
                            end
                        });
                    end
                else
                    RageUI.Separator('~g~')
                    RageUI.Separator('~g~Vous devez attendre 1 minute')
                    RageUI.Separator('~g~')
                end
            elseif id == 444 then
                if not Couldown then
                    for k,v in pairs(LocationVehicleJetski) do
                        RageUI.Button(v.Label, nil, {RightLabel = "~g~"..v.Price.."$"}, true, {
                            onSelected = function() 
                                local playerPed = GetPlayerPed(-1)
                                local coords = vector3(3942.99, -4604.4, 0.0)
                                ESX.Game.SpawnVehicle(v.Name, coords, 20.0, function(vehicle)
                                    TaskWarpPedIntoVehicle(playerPed, vehicle, -1) 
                                    SetVehicleNumberPlateText(vehicle, 'LOCATION') 
                                end)
                                TriggerServerEvent('Location:Buy', v.Name, v.Price)
                                location = RMenu:DeleteType('location', true)
                                TriggerEvent('couldownlocation')
                            end
                        });
                    end
                else
                    RageUI.Separator('~g~')
                    RageUI.Separator('~g~Vous devez attendre 1 minute')
                    RageUI.Separator('~g~')
                end
            elseif id == 5 then
                if not Couldown then
                    for k,v in pairs(LocationVehicleTravaille) do
                        RageUI.Button(v.Label, nil, {RightLabel = "~g~"..v.Price.."$"}, true, {
                            onSelected = function()
                                local plate = string.upper(GetRandomLetter(3) .. ' ' .. GetRandomNumber(3))
                                local playerPed = PlayerPedId()
                                local coords = GetEntityCoords(PlayerPedId())
                                ESX.Game.SpawnVehicle(v.Name, coords, 200.0, function(vehicle)
                                    TaskWarpPedIntoVehicle(playerPed, vehicle, -1) 
                                    SetVehicleNumberPlateText(vehicle, 'LOCATION') 
                                end)
                                TriggerServerEvent('Location:Buy', v.Name, v.Price)
                                location = RMenu:DeleteType('location', true)
                                TriggerEvent('couldownlocation')
                            end
                        });
                    end
                else
                    RageUI.Separator('~g~')
                    RageUI.Separator('~g~Vous devez attendre 1 minute')
                    RageUI.Separator('~g~')
                end
            elseif id == 6 then 
                if not Couldown then
                    for k,v in pairs(LocationVehicle) do 
                        RageUI.Button(v.Label, nil, {RightLabel = "~g~"..v.Price.."$"}, true, {
                            onSelected = function()
                                local plate = 'LOCATION'
                                local playerPed = PlayerPedId()
                                local coords = GetEntityCoords(PlayerPedId())
                                ESX.Game.SpawnVehicle(v.Name, coords, 200.0, function(vehicle)
                                    TaskWarpPedIntoVehicle(playerPed, vehicle, -1) 
                                    SetVehicleNumberPlateText(vehicle, 'LOCATION') 
                                end)
                                TriggerServerEvent('Location:Buy', v.Name, v.Price)
                                location = RMenu:DeleteType('location', true)
                                TriggerEvent('couldownlocation')
                            end
                        });
                    end
                else
                    RageUI.Separator('~g~')
                    RageUI.Separator('~g~Vous devez attendre 1 minute')
                    RageUI.Separator('~g~')
                end
            end
        end)
        
		if not RageUI.Visible(location) then
			location = RMenu:DeleteType('location', true)
		end
	end
end

RegisterNetEvent('couldownlocation')
AddEventHandler('couldownlocation', function()
    Couldown = true 
    Wait(60000)
    Couldown = false
end)

