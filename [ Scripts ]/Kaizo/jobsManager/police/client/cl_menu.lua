Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

servicepolice = false

-- MenuFouille

local Items = {}      
local Armes = {}    
local ArgentSale = {} 

local PlayerData = {}

local function MarquerJoueur()
	local ped = GetPlayerPed(ESX.Game.GetClosestPlayer())
	local pos = GetEntityCoords(ped)
	local target, distance = ESX.Game.GetClosestPlayer()
	if distance <= 4.0 then
	DrawMarker(2, pos.x, pos.y, pos.z+1.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 170, 0, 1, 2, 1, nil, nil, 0)
end
end

local function getPlayerInv(player)
	Items = {}
	Armes = {}
	ArgentSale = {}
	
	ESX.TriggerServerCallback('police:getOtherPlayerData', function(data)
		for i=1, #data.accounts, 1 do
			if data.accounts[i].name == 'dirtycash' and data.accounts[i].money > 0 then
				table.insert(ArgentSale, {
					label    = ESX.Math.Round(data.accounts[i].money),
					value    = 'dirtycash',
					itemType = 'item_account',
					amount   = data.accounts[i].money
				})
	
				break
			end
		end
	
		for i=1, #data.weapons, 1 do
			table.insert(Armes, {
				label    = ESX.GetWeaponLabel(data.weapons[i].name),
				value    = data.weapons[i].name,
				right    = data.weapons[i].ammo,
				itemType = 'item_weapon',
				amount   = data.weapons[i].ammo
			})
		end
	
		for i=1, #data.inventory, 1 do
			if data.inventory[i].count > 0 then
				table.insert(Items, {
					label    = data.inventory[i].label,
					right    = data.inventory[i].count,
					value    = data.inventory[i].name,
					itemType = 'item_standard',
					amount   = data.inventory[i].count
				})
			end
		end
	end, GetPlayerServerId(player))
	end

RegisterNetEvent("police:OutVehicle")
AddEventHandler("police:OutVehicle", function()
    TaskLeaveAnyVehicle(PlayerPedId(), 0, 0)
end)


local EnTrainEscorter = false
local PolicierEscorte = nil
RegisterNetEvent("police:drag")
AddEventHandler("police:drag", function(player)
    EnTrainEscorter = not EnTrainEscorter
    print(EnTrainEscorter)
    PolicierEscorte = tonumber(player)
    if EnTrainEscorter then
		Citizen.CreateThread(function()
			local pPed = PlayerPedId()
			while EnTrainEscorter do
				Wait(1)
				pPed = PlayerPedId()
				local targetPed = GetPlayerPed(GetPlayerFromServerId(PolicierEscorte))
	
				if not IsPedSittingInAnyVehicle(targetPed) then
					AttachEntityToEntity(pPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
				else
					EnTrainEscorter = false
					DetachEntity(pPed, true, false)
				end
	
				if IsPedDeadOrDying(targetPed, true) then
					EnTrainEscorter = false
					DetachEntity(pPed, true, false)
				end
			end
			DetachEntity(pPed, true, false)
		end)
    end
end)

-- MENU FUNCTION --

local open = false 
local mainMenu8 = RageUI.CreateMenu('', 'LSPD')
local subMenu8 = RageUI.CreateSubMenu(mainMenu8, "", "LSPD")
local subMenu10 = RageUI.CreateSubMenu(mainMenu8, "", "LSPD")
local subMenu11 = RageUI.CreateSubMenu(mainMenu8, "", "LSPD")
local subMenu12 = RageUI.CreateSubMenu(mainMenu8, " citoyens", "LSPD")
local subMenu13 = RageUI.CreateSubMenu(mainMenu8, "", "LSPD")
local subMenu14 = RageUI.CreateSubMenu(mainMenu8, "", "LSPD")
local subMenu15 = RageUI.CreateSubMenu(mainMenu8, "", "LSPD")
local subMenu16 = RageUI.CreateSubMenu(mainMenu8, "", "LSPD")
local subMenu17 = RageUI.CreateSubMenu(subMenu12, "", "LSPD")
mainMenu8.Display.Header = true 
mainMenu8.Closed = function()
  open = false
end

function OpenMenuPolice()
	if open then 
		open = false
		RageUI.Visible(mainMenu8, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu8, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(mainMenu8,function()

			RageUI.Button("Demande de renforts", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, subMenu8)

			
			RageUI.Separator('Intération')

			RageUI.Button("Gerés les license", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
		   }, subMenu16)

			RageUI.Button("Interaction sur une personne", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, subMenu10)

			
			RageUI.Button("Interaction intervention", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, subMenu12)

			RageUI.Button("Interaction sur un véhicule", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, subMenu11)

		    --end
			end)

			RageUI.IsVisible(subMenu8,function() 

				RageUI.Button("Petite demande", nil, {RightLabel = "→"}, not codesCooldown1 , {
					onSelected = function()
						codesCooldown1 = true 
						local raison = 'code2lspd'
						local elements  = {}
						local playerPed = PlayerPedId()
						local coords  = GetEntityCoords(playerPed)
						local name = GetPlayerName(PlayerId())
					TriggerServerEvent('renfort', coords, raison)
					Citizen.SetTimeout(10000, function() codesCooldown1 = false end)
				end
			})
		
			RageUI.Button("Moyenne demande", nil, {RightLabel = "→"}, not codesCooldown2 , {
				onSelected = function()
					codesCooldown2 = true 
					local raison = 'code3lspd'
					local elements  = {}
					local playerPed = PlayerPedId()
					local coords  = GetEntityCoords(playerPed)
					local name = GetPlayerName(PlayerId())
				TriggerServerEvent('renfort', coords, raison)
				Citizen.SetTimeout(10000, function() codesCooldown2 = false end)
			end
		})
		
		RageUI.Button("Grosse demande", nil, {RightLabel = "→"}, not codesCooldown3 , {
			onSelected = function()
				codesCooldown3 = true 
				local raison = 'code99lspd'
				local elements  = {}
				local playerPed = PlayerPedId()
				local coords  = GetEntityCoords(playerPed)
				local name = GetPlayerName(PlayerId())
			TriggerServerEvent('renfort', coords, raison)
			Citizen.SetTimeout(10000, function() codesCooldown3 = false end)
		end
	})

		   end)

		RageUI.IsVisible(subMenu10,function() 

			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

			if closestDistance <= 3.0 then 
				RageUI.Button("Fouiller", nil, {RightLabel = "→"}, true, {
					onActive = function()
						if closestPlayer ~= -1 then
							MarquerJoueur()
						end
					end,
					onSelected = function() 
						if closestDistance <= 5.0 then 
							getPlayerInv(closestPlayer)
							ExecuteCommand("me fouille l'individu")	
						end
					end,
				}, subMenu13)
			else
				RageUI.Button("Fouiller", "Personnes aux Alentours !", {RightLabel = ">"}, false, {
					onSelected = function() 
					end
				})
			end


	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	RageUI.Button("Escorter", nil, {RightLabel = "→"}, true, {
		onSelected = function() 
			if closestDistance <= 5.0 then 
			TriggerServerEvent('police:drag', GetPlayerServerId(closestPlayer))
		else
			ESX.ShowNotification('Aucun joueurs à proximité')
		end
	end
})

      local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
      RageUI.Button("Mettre dans un véhicule", nil, {RightLabel = "→"}, true, {
	       onSelected = function() 
		if closestDistance <= 5.0 then 
		TriggerServerEvent('police:putInVehicle', GetPlayerServerId(closestPlayer))
	else
		ESX.ShowNotification('Aucun joueurs à proximité')
	end
end
})

      local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
      RageUI.Button("Sortir du véhicule", nil, {RightLabel = "→"}, true, {
	     onSelected = function() 
		 if closestDistance <= 5.0 then 
		 TriggerServerEvent('police:OutVehicle', GetPlayerServerId(closestPlayer))
	 else
		 ESX.ShowNotification('Aucun joueurs à proximité')
	 end
  end
  })

end)

RageUI.IsVisible(subMenu11,function() 

	RageUI.Button("Rechercher une plaque", nil, {RightLabel = "→"}, true , {
		onSelected = function()
			local numplaque = KeyboardInput('', '','', 100)
			local length = string.len(numplaque)
			if not numplaque or length < 2 or length > 8 then
				ESX.ShowNotification("Ce n'est pas un numéro enregistrement dans les fichier de police")
			else
				Rechercherplaquevoiture(numplaque)
				RageUI.CloseAll()
			end
		end,})

	RageUI.Button("Mettre véhicule en fourriere", nil, {RightLabel = "→"}, true , {
		onSelected = function()
			local veh,dist4 = ESX.Game.GetClosestVehicle(playerCoords)
			local playerPed = PlayerPedId()
			if dist4 < 5 then
				TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
				Citizen.Wait(7500)
				DeleteEntity(veh)
				ClearPedTasksImmediately(playerPed)
				ESX.ShowNotification("Véhicule en fourrière ")
			end
		end,})

	RageUI.Button("Ouvrir / fermer de force", nil, {RightLabel = "→"}, true , {
		onSelected = function()
			local playerPed = PlayerPedId()
			local vehicle = ESX.Game.GetVehicleInDirection()
			local coords = GetEntityCoords(playerPed)

			if IsPedSittingInAnyVehicle(playerPed) then
				ESX.ShowNotification('Action impossible')
				return
			end

			if DoesEntityExist(vehicle) then
				isBusy = true
				TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
				Citizen.CreateThread(function()
					Citizen.Wait(10000)

					SetVehicleDoorsLocked(vehicle, 1)
					SetVehicleDoorsLockedForAllPlayers(vehicle, false)
					ClearPedTasksImmediately(playerPed)

					ESX.ShowNotification('Véhicule dévérouiller')
					isBusy = false
				end)
			else
				ESX.ShowNotification('Pas de véhicules à proximité')
			end
	end,})

    end)

	RageUI.IsVisible(subMenu12, function()

        RageUI.Checkbox("Sortir/Rentrer un Bouclier", nil, bouclier, {}, {
            onChecked = function(index, items)
                bouclier = true
                EnableShield()
            end,
            onUnChecked = function(index, items)
				bouclier = false
                DisableShield()
            end
        })

		RageUI.Button("Props", nil, {RightLabel = "→"}, true , {
			onSelected = function()
			end
		}, subMenu17)

	end)

	RageUI.IsVisible(subMenu17, function()

		RageUI.Button("Activer/désactiver props editor", nil, {RightLabel = "→"}, true , {
			onSelected = function()
				inPropsEditor = not inPropsEditor
				StartPropsEditor()
			end
		})

		for k,v in pairs(cfg_police.props) do
			RageUI.Button(v.label, nil, {RightLabel = "→"}, true , {
				onSelected = function()
					TriggerEvent("core:PlaceObject", v.prop)
				end
			})
		end
	end)

			RageUI.IsVisible(subMenu13,function()


			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    
			RageUI.Separator("↓ ~b~Argent(s) sale(s) ~s~↓")
			for k,v  in pairs(ArgentSale) do
				RageUI.Button("Argent sale :", nil, {RightLabel = "~b~"..v.label.."$"}, true, {
					onSelected = function() 
						local combien = KeyboardInput("Combien ?", '' , '', 8)
						if tonumber(combien) > v.amount then
							RageUI.Popup({message = "quantité invalide"})
						else
							TriggerServerEvent('police:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
						end
						RageUI.GoBack()
					end
				})
			end
	
			RageUI.Separator("↓ ~b~Objet(s) ~s~↓")
			for k,v  in pairs(Items) do
				RageUI.Button(v.label, nil, {RightLabel = "~b~x"..v.right}, true, {
					onSelected = function() 
						local combien = KeyboardInput("Combien ?", '' , '', 8)
						if tonumber(combien) > v.amount then
							RageUI.Popup({message = "quantité invalide"})
						else
							TriggerServerEvent('police:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
						end
						RageUI.GoBack()
					end
				})
			end

			RageUI.Separator("↓ ~b~Arme(s) ~s~↓")

			for k,v  in pairs(Armes) do
				RageUI.Button(v.label, nil, {RightLabel = "~b~"..v.right.. " ~s~munitions"}, true, {
					onSelected = function() 
						local combien = KeyboardInput("Combien ?", '' , '', 8)
						if tonumber(combien) > v.amount then
							RageUI.Popup({message = "Quantité invalide"})
						else
							TriggerServerEvent('police:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
						end
						RageUI.GoBack()
					end
				})
			end
	
			end)

			RageUI.IsVisible(subMenu14,function()

				for k,v in pairs(cfg_police.amende) do
				for _,i in pairs(v) do
				RageUI.Button(i.label, nil, {RightLabel = "~b~"..i.price.."$"}, true , {
					onSelected = function() 
						local player, distance = ESX.Game.GetClosestPlayer()
						local sID = GetPlayerServerId(player)

						if player ~= -1 and distance <= 3.0 then
							TriggerServerEvent("police:SendFacture", sID, i.price)
							RageUI.CloseAll()
							open = false
						else
							TriggerEvent("esx:showNotification", "Aucun joueur proche", 3000, "warning") 
						end
					end
				})

			end
			end
			end)


			RageUI.IsVisible(subMenu16, function()

  RageUI.Button('Saisir le permis de conduire (Voiture)', nil, {RightLabel = "→"}, true , {
	  onHovered = function()
		  DisplayClosetPlayer()
	  end,
	  onSelected = function()
		  local player, dst = GetClosestPlayer()
		  if dst ~= nil and dst < 2 then
			  local sID = GetPlayerServerId(player)
			  TriggerServerEvent("esx_license:removeLicense", sID, "drive")
			  ESX.ShowNotification("Vous avez retiré le permis de la personne.")
		  end
	  end,
  })

  RageUI.Button('Saisir le permis de conduire (Poids lourd)', nil, {RightLabel = "→"}, true , {
	  onHovered = function()
		  DisplayClosetPlayer()
	  end,
	  onSelected = function()
		  local player, dst = GetClosestPlayer()
		  if dst ~= nil and dst < 2 then
			  local sID = GetPlayerServerId(player)
			  TriggerServerEvent("esx_license:removeLicense", sID, "drive_truck")
			  ESX.ShowNotification("Vous avez retiré le permis de la personne.")
		  end
	  end,
  })

  RageUI.Button('Saisir le permis de conduire (Moto)', nil, {RightLabel = "→"}, true , {
	  onHovered = function()
		  DisplayClosetPlayer()
	  end,
	  onSelected = function()
		  local player, dst = GetClosestPlayer()
		  if dst ~= nil and dst < 2 then
			  local sID = GetPlayerServerId(player)
			  TriggerServerEvent("esx_license:removeLicense", sID, "drive_bike")
			  ESX.ShowNotification("Vous avez retiré le permis de la personne.")
		  end
	  end,
  })

  RageUI.Separator("License d'arme")

  RageUI.Button("Permis d'arme", nil, {RightLabel = "~g~2500$"}, true , {
	  onSelected = function()
		  local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
		  if closestPlayer ~= -1 and closestDistance <= 3.0 then
			  TriggerServerEvent('esx_license:addLicense', GetPlayerServerId(closestPlayer), 'weapon')
			  ESX.ShowNotification('Permis d\'arme attribuer avec suces.')
		  else
			  ESX.ShowNotification('Aucun joueurs à proximité')
		  end
	  end
	  })

	  RageUI.Button('Saisir le permis d\'arme', nil, {RightLabel = "→"}, true , {
		  onHovered = function()
			  DisplayClosetPlayer()
		  end,
		  onSelected = function()
			  local player, dst = GetClosestPlayer()
			  if dst ~= nil and dst < 2 then
				  local sID = GetPlayerServerId(player)
				  TriggerServerEvent("esx_license:removeLicense", sID, "weapon")
				  ESX.ShowNotification("Vous avez retiré le permis de la personne.")
			  end
		  end,
	  })

			
			
			end)

		 Wait(0)
		end
	 end)
  end
end

-- OUVERTURE DU MENU --

Keys.Register('F6', 'police', 'Ouvrir le menu police', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
		servicepolice = true
		if servicepolice then
			OpenMenuPolice()
		else
			ESX.ShowNotification('Vous n\'êtes pas en service')
		end
	end
end)

-- Infos Police
	RegisterNetEvent('police:InfoService')
	AddEventHandler('police:InfoService', function(service, nom)
		if service == 'pause' then
			PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
			ESX.ShowAdvancedNotification('LSPD INFORMATIONS', 'Pause de service', 'Agent: '..nom..'\nCode: 10-6\nInformation: Pause de service.', 'CHAR_ABIGAIL', 8)
			Wait(1000)
			PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		elseif service == 'standby' then
			PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
			ESX.ShowAdvancedNotification('LSPD INFORMATIONS', 'Mise en standby', 'Agent: '..nom..'\nCode: 10-12\nInformation: Standby, en attente de dispatch.', 'CHAR_ABIGAIL', 8)
			Wait(1000)
			PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		elseif service == 'control' then
			PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
			ESX.ShowAdvancedNotification('LSPD INFORMATIONS', 'Control routier', 'Agent: '..nom..'\nCode: 10-48\nInformation: Control routier en cours.', 'CHAR_ABIGAIL', 8)
			Wait(1000)
			PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		end
	end)

-- Renfort
	RegisterNetEvent('renfort:setBlip')
	AddEventHandler('renfort:setBlip', function(coords, raison)
		if raison == 'code2lspd' then
			PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
			PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
			ESX.ShowAdvancedNotification('LSPD INFORMATIONS', 'Code-2', 'Demande de renfort demandé.\nRéponse: CODE-2\nImportance: Légère.', 'CHAR_ABIGAIL', 8)
			Wait(1000)
			PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
			color = 2
		elseif raison == 'code3lspd' then
			PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
			PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
			ESX.ShowAdvancedNotification('LSPD INFORMATIONS', 'Code-3', 'Demande de renfort demandé.\nRéponse: CODE-3\nImportance: Importante.', 'CHAR_ABIGAIL', 8)
			Wait(1000)
			PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
			color = 47
		elseif raison == 'code99lspd' then
			PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
			PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
			PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
			ESX.ShowAdvancedNotification('LSPD INFORMATIONS', 'Code-99', 'Demande de renfort demandé.\nRéponse: CODE-99\nImportance: URGENTE !\nDANGER IMPORTANT', 'CHAR_ABIGAIL', 8)
			Wait(1000)
			PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
			PlaySoundFrontend(-1, "FocusOut", "HintCamSounds", 1)
			color = 1
		end
		local blipId = AddBlipForCoord(coords)
		SetBlipSprite(blipId, 161)
		SetBlipScale(blipId, 0.8)
		SetBlipColour(blipId, color)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Demande de renforts')
		EndTextCommandSetBlipName(blipId)
		Wait(80 * 1000)
		RemoveBlip(blipId)
	end)
-------------------------- Intéraction 

RegisterNetEvent('police:putInVehiclee')
AddEventHandler('police:putInVehiclee', function(target)
  local playerPed = PlayerPedId()
  local coords    = GetEntityCoords(playerPed)

print(target)

  if IsAnyVehicleNearPoint(coords, 5.0) then

    local vehicle = GetClosestVehicle(coords,  5.0,  0,  71)

    if DoesEntityExist(vehicle) then

      local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
      local freeSeat = nil

      for i=maxSeats - 1, 0, -1 do
        if IsVehicleSeatFree(vehicle,  i) then
          freeSeat = i
          break
        end
      end

      if freeSeat ~= nil then
        TaskWarpPedIntoVehicle(playerPed,  vehicle,  freeSeat)
      end

    end

  end

end)


RegisterNetEvent("police:OutVehicle")
AddEventHandler("police:OutVehicle", function()
    TaskLeaveAnyVehicle(PlayerPedId(), 0, 0)
end)

dragStatus = {}
dragStatus.isDragged = false

RegisterNetEvent('policejob:drag')
AddEventHandler('policejob:drag', function(draggerId)
	DragStatus.isDragged = not DragStatus.isDragged
	DragStatus.dragger = tonumber(draggerId)

	if not DragStatus.isDragged then
		DetachEntity(PlayerPedId(), true, false)
	end
end)

function GetClosestPlayer()
	local pPed = PlayerPedId()
	local players = GetActivePlayers()
	local coords = GetEntityCoords(pPed)
	local pCloset = nil
	local pClosetPos = nil
	local pClosetDst = nil
	for k,v in pairs(players) do
		if GetPlayerPed(v) ~= pPed then
			local oPed = GetPlayerPed(v)
			local oCoords = GetEntityCoords(oPed)
			local dst = GetDistanceBetweenCoords(oCoords, coords, true)
			if pCloset == nil then
				pCloset = v
				pClosetPos = oCoords
				pClosetDst = dst
			else
				if dst < pClosetDst then
					pCloset = v
					pClosetPos = oCoords
					pClosetDst = dst
				end
			end
		end
	end

	return pCloset, pClosetDst
end


function Rechercherplaquevoiture(plaquerechercher)
    local PlaqueMenu = RageUI.CreateMenu("plaque d'immatriculation", "Informations")
    ESX.TriggerServerCallback('police:getVehicleInfos', function(retrivedInfo)
    RageUI.Visible(PlaqueMenu, not RageUI.Visible(PlaqueMenu))
        while PlaqueMenu do
            Citizen.Wait(0)
					RageUI.IsVisible(PlaqueMenu,function()
                            RageUI.Button("Numéro de plaque : ", nil, {RightLabel = retrivedInfo.plate}, true, {
                                	onSelected = function()
                                    end
                                })
						
                            if not retrivedInfo.owner then
                                RageUI.Button("Propriétaire : ", nil, {RightLabel = "Inconnu"}, true, {
                                    	onSelected = function()
                                		end
                                    })
                            else
                                RageUI.Button("Propriétaire : ", nil, {RightLabel = retrivedInfo.owner}, true, {
                                    	onSelected = function()
										end
                                    })

								local hashvoiture = retrivedInfo.vehicle.model
								local nomvoituremodele = GetDisplayNameFromVehicleModel(hashvoiture)
								local nomvoituretexte  = GetLabelText(nomvoituremodele)

                                RageUI.Button("Modèle du véhicule : ", nil, {RightLabel = nomvoituretexte}, true, {
                                    	onSelected = function()
										end
                                    })
                            end
                end, function()
                end)
            if not RageUI.Visible(PlaqueMenu) then
            PlaqueMenu = RMenu:DeleteType("plaque d'immatriculation", true)
        end
    end
end, plaquerechercher)
end

loadDict = function(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
end

-- ANIM
local animDict = "combat@gestures@gang@pistol_1h@beckon"
local animName = "0"

local prop = "prop_ballistic_shield"

function EnableShield()
    shieldActive = true
    local ped = PlayerPedId()
    local pedPos = GetEntityCoords(ped, false)
    
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(250)
    end

    TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, -1, (2 + 16 + 32), 0.0, 0, 0, 0)

    RequestModel(GetHashKey(prop))
    while not HasModelLoaded(GetHashKey(prop)) do
        Citizen.Wait(250)
    end

    local shield = CreateObject(GetHashKey(prop), pedPos.x, pedPos.y, pedPos.z, 1, 1, 1)
    shieldEntity = shield
    AttachEntityToEntity(shieldEntity, ped, GetEntityBoneIndexByName(ped, "IK_L_Hand"), 0.0, -0.05, -0.10, -30.0, 180.0, 40.0, 0, 0, 1, 0, 0, 1)
    SetWeaponAnimationOverride(ped, GetHashKey("Gang1H"))
    SetEnableHandcuffs(ped, true)
end

function DisableShield()
    local ped = PlayerPedId()
    DeleteEntity(shieldEntity)
    ClearPedTasksImmediately(ped)
    SetWeaponAnimationOverride(ped, GetHashKey("Default"))
    SetEnableHandcuffs(ped, false)
    shieldActive = false
end

Citizen.CreateThread(function()
    while true do
        if shieldActive then
            local ped = PlayerPedId()
            if not IsEntityPlayingAnim(ped, animDict, animName, 1) then
                RequestAnimDict(animDict)
                while not HasAnimDictLoaded(animDict) do
                    Citizen.Wait(100)
                end
            
                TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, -1, (2 + 16 + 32), 0.0, 0, 0, 0)
            end
        end
        Citizen.Wait(500)
    end
end)
