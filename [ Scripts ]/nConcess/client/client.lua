
ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

local societycarshopmoney = nil

carshop             = {}
carshop.DrawDistance = 100
carshop.Size         = {x = 0.8, y = 0.8, z = 0.8}
carshop.Color        = {r = 255, g = 237, b = 7}
carshop.Type         = 6

h4ci_conc = {
	catevehi = {},
	listecatevehi = {},
}

local derniervoituresorti = {}
local sortirvoitureacheter = {}

--travail carshop

local markerjob = {-- -53.0294, 71.5580, 71.9290, 235.6776
        {x = 126.83, y = -142.16, z = 54.85}, --point vente
}  

Citizen.CreateThread(function()
    
    while true do
        Citizen.Wait(0)
        local coords, letSleep = GetEntityCoords(PlayerPedId()), true

        for k in pairs(markerjob) do
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'carshop' then 
            if (carshop.Type ~= -1 and GetDistanceBetweenCoords(coords, markerjob[k].x, markerjob[k].y, markerjob[k].z, true) < carshop.DrawDistance) then
                DrawMarker(carshop.Type, markerjob[k].x, markerjob[k].y, markerjob[k].z-0.98, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, carshop.Size.x, carshop.Size.y, carshop.Size.z, carshop.Color.r, carshop.Color.g, carshop.Color.b, 180, false, true, 2, false, false, false, false)
                letSleep = false
            end
        end
        end

        if letSleep then
            Citizen.Wait(500)
        end
    
end
end)

--point vente
local carshoppointvente = false
RMenu.Add('carshopvente', 'main', RageUI.CreateMenu("Menu carshop", "Pour vendre des véhicules"))
RMenu.Add('carshopvente', 'listevehicule', RageUI.CreateSubMenu(RMenu:Get('carshopvente', 'main'), "Catalogue", "Pour acheter un véhicule"))
RMenu.Add('carshopvente', 'categorievehicule', RageUI.CreateSubMenu(RMenu:Get('carshopvente', 'listevehicule'), "Véhicules", "Pour acheter un véhicule"))
RMenu.Add('carshopvente', 'achatvehicule', RageUI.CreateSubMenu(RMenu:Get('carshopvente', 'categorievehicule'), "Véhicules", "Pour acheter un véhicule"))
RMenu.Add('carshopvente', 'annonces', RageUI.CreateSubMenu(RMenu:Get('carshopvente', 'main'), "Annonces", "Annonces de la ville"))
RMenu:Get('carshopvente', 'main').Closed = function()
    carshoppointvente = false
end
RMenu:Get('carshopvente', 'categorievehicule').Closed = function()
    supprimervehiculecarshop()
end

function ouvrirpointventeconc()
    if not carshoppointvente then
        carshoppointvente = true
        RageUI.Visible(RMenu:Get('carshopvente', 'main'), true)
    while carshoppointvente do

        RageUI.IsVisible(RMenu:Get('carshopvente', 'main'), true, true, true, function()
           
            RageUI.ButtonWithStyle("Catalogue des véhicules", nil, {RightLabel = "→"},true, function()
           end, RMenu:Get('carshopvente', 'listevehicule'))
           
            RageUI.ButtonWithStyle("Annonces", nil, {RightLabel = "→"},true, function()
            end, RMenu:Get('carshopvente', 'annonces'))
    
            end, function()
            end)

        RageUI.IsVisible(RMenu:Get('carshopvente', 'listevehicule'), true, true, true, function()
        	for i = 1, #h4ci_conc.catevehi, 1 do
            RageUI.ButtonWithStyle("Catégorie - "..h4ci_conc.catevehi[i].label, nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
            if (Selected) then
            		nomcategorie = h4ci_conc.catevehi[i].label
                    categorievehi = h4ci_conc.catevehi[i].name
                    ESX.TriggerServerCallback('h4ci_carshop:recupererlistevehicule', function(listevehi)
                            h4ci_conc.listecatevehi = listevehi
                    end, categorievehi)
                end
            end, RMenu:Get('carshopvente', 'categorievehicule'))
        	end
            end, function()
            end)

        RageUI.IsVisible(RMenu:Get('carshopvente', 'categorievehicule'), true, true, true, function()
        	RageUI.Separator("Catégorie : ~b~"..nomcategorie.."~s~", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
            if (Selected) then   
            end
            end)

        	for i2 = 1, #h4ci_conc.listecatevehi, 1 do
            RageUI.ButtonWithStyle(h4ci_conc.listecatevehi[i2].name, "Pour acheter ce véhicule", {RightLabel = h4ci_conc.listecatevehi[i2].price.."$"},true, function(Hovered, Active, Selected)
            if (Selected) then
            		nomvoiture = h4ci_conc.listecatevehi[i2].name
            		prixvoiture = h4ci_conc.listecatevehi[i2].price
            		modelevoiture = h4ci_conc.listecatevehi[i2].model
            		supprimervehiculecarshop()
					chargementvoiture(modelevoiture)

                    -- -58.2820, 77.7904, 71.7402, 67.0130
					ESX.Game.SpawnVehicle(modelevoiture, {x = 125.84, y = -151.13, z = 54.8}, 67.0130, function (vehicle)
                        table.insert(derniervoituresorti, vehicle)
                        FreezeEntityPosition(vehicle, true)
						SetVehicleDoorsLocked(vehicle, true)
                        TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                        SetModelAsNoLongerNeeded(modelevoiture)
					end)
                end
            end, RMenu:Get('carshopvente', 'achatvehicule'))

        	end
            end, function()
            end)

        RageUI.IsVisible(RMenu:Get('carshopvente', 'achatvehicule'), true, true, true, function()
        	RageUI.ButtonWithStyle("Nom du modèle : ~b~"..nomvoiture, nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
            if (Selected) then   
            end
            end)
            RageUI.ButtonWithStyle("Prix du véhicule : ~g~"..prixvoiture.."$", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
            if (Selected) then   
            end
            end)

            RageUI.Separator(" Vente ")
            RageUI.ButtonWithStyle("Vendre au client", "Attribue le véhicule au client le plus proche (paiement avec argent entreprise)", {RightLabel = "→"}, true, function(Hovered, Active, Selected)
            if (Selected) then   
            	ESX.TriggerServerCallback('h4ci_carshop:verifsouscarshop', function(suffisantsous)
                if suffisantsous then

				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if closestPlayer == -1 or closestDistance > 3.0 then
				ESX.ShowNotification('Personne autour')
				else
				supprimervehiculecarshop()
				chargementvoiture(modelevoiture)

				ESX.Game.SpawnVehicle(modelevoiture, {x =  125.84, y = -151.13, z = 54.8}, 67.0130, function (vehicle)
				table.insert(sortirvoitureacheter, vehicle)
				FreezeEntityPosition(vehicle, true)
				TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
				SetModelAsNoLongerNeeded(modelevoiture)
				local plaque     = GeneratePlate()
                local vehicleProps = ESX.Game.GetVehicleProperties(sortirvoitureacheter[#sortirvoitureacheter])
                vehicleProps.plate = plaque
                SetVehicleNumberPlateText(sortirvoitureacheter[#sortirvoitureacheter], plaque)
                FreezeEntityPosition(sortirvoitureacheter[#sortirvoitureacheter], false)

				TriggerServerEvent('h4ci_carshop:vendrevoiturejoueur', GetPlayerServerId(closestPlayer), vehicleProps, prixvoiture, nomvoiture, GetPlayerName(closestPlayer), GetPlayerName(PlayerPedId()))
				ESX.ShowNotification('Le véhicule '..GetDisplayNameFromVehicleModel(vehicleProps.model)..' avec la plaque '..vehicleProps.plate..' a été vendu à '..GetPlayerName(closestPlayer))
                TriggerServerEvent('esx_vehiclelock:registerkey', vehicleProps.plate, GetPlayerServerId(closestPlayer))
				end)
				end
                else
                    ESX.ShowNotification('La société n\'as pas assez d\'argent pour ce véhicule!')
                end

            end, prixvoiture)
                end
            end)

            RageUI.ButtonWithStyle("Acheter le véhicule", "Attribue le véhicule à vous même ( argent de societé )", {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                if (Selected) then   
                    ESX.TriggerServerCallback('h4ci_carshop:verifsouscarshop', function(suffisantsous)
                    if suffisantsous then
                    supprimervehiculecarshop()
                    chargementvoiture(modelevoiture)
                    ESX.Game.SpawnVehicle(modelevoiture, {x =  125.84, y = -151.13, z = 54.8}, 67.0130, function (vehicle)
                    table.insert(sortirvoitureacheter, vehicle)
                    FreezeEntityPosition(vehicle, true)
                    TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
                    SetModelAsNoLongerNeeded(modelevoiture)
                    local plaque     = GeneratePlate()
                    local vehicleProps = ESX.Game.GetVehicleProperties(sortirvoitureacheter[#sortirvoitureacheter])
                    vehicleProps.plate = plaque
                    SetVehicleNumberPlateText(sortirvoitureacheter[#sortirvoitureacheter], plaque)
                    FreezeEntityPosition(sortirvoitureacheter[#sortirvoitureacheter], false)

                    TriggerServerEvent('shop:vehicule', vehicleProps, prixvoiture, GetPlayerName(PlayerId()), GetDisplayNameFromVehicleModel(vehicleProps.model))
                    ESX.ShowNotification('Le véhicule '..GetDisplayNameFromVehicleModel(vehicleProps.model)..' avec la plaque '..vehicleProps.plate..' a été vendu à '..GetPlayerName(PlayerId()))
                    TriggerServerEvent('esx_vehiclelock:registerkey', vehicleProps.plate, GetPlayerServerId(closestPlayer))
                    end)

                    else
                        ESX.ShowNotification('La société n\'as pas assez d\'argent pour ce véhicule!')
                    end
    
                end, prixvoiture)
                    end
                end)

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('carshopvente', 'annonces'), true, true, true, function()
                
                RageUI.ButtonWithStyle("Annonce", nil, {RightLabel = "~g~Ouvert~w~"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('Open:Ads')
                    end
                end)

                RageUI.ButtonWithStyle("Annonce", nil, {RightLabel = "~r~Fermer~w~"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('Close:Ads')
                    end
                end)

                RageUI.ButtonWithStyle("Publicité", nil, {RightLabel = "~o~Personnalisé~w~"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        local msg = KeyboardInputConcess("Message", "", 100)
                        TriggerServerEvent('Perso:Ads', msg)
                    end
                end)

                end, function()
                end)

            Citizen.Wait(0)
        end
    else
        carshoppointvente = false
    end
end

Citizen.CreateThread(function()
    local inZone = false
    local enteredZone = false
    while true do 
        inZone = false
            Citizen.Wait(0)
                local plycrdjob = GetEntityCoords(PlayerPedId(), false)
                local jobdist = Vdist(plycrdjob.x, plycrdjob.y, plycrdjob.z, 126.83, -142.16, 54.85)
            if jobdist <= 1.0 then
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'carshop' then  
                ESX.ShowHelpNotification("E", "pour intéragir")
                    if IsControlJustPressed(1,51) then
                    	ESX.TriggerServerCallback('h4ci_carshop:recuperercategorievehicule', function(catevehi)
                            h4ci_conc.catevehi = catevehi
                        end)
                        carshoppointvente = false
                        ouvrirpointventeconc()
                    end   
                end
               end 
            end
end)

function supprimervehiculecarshop()
	while #derniervoituresorti > 0 do
		local vehicle = derniervoituresorti[1]

		ESX.Game.DeleteVehicle(vehicle)
		table.remove(derniervoituresorti, 1)
	end
end

function chargementvoiture(modelHash)
	modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))

	if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)

		BeginTextCommandBusyString('STRING')
		AddTextComponentSubstringPlayerName('shop_awaiting_model')
		EndTextCommandBusyString(4)

		while not HasModelLoaded(modelHash) do
			Citizen.Wait(1)
			DisableAllControlActions(0)
		end

		RemoveLoadingPrompt()
	end
end

function KeyboardInputConcess(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    blockinput = true
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Wait(0)
    end 
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        blockinput = false
        return result
    else
        Wait(500)
        blockinput = false
        return nil
    end
end

------------