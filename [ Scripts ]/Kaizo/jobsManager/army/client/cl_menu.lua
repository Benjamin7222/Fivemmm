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

servicearmee = false

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
	
	ESX.TriggerServerCallback('lsarmy:getOtherPlayerData', function(data)
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

RegisterNetEvent("lsarmy:OutVehicle")
AddEventHandler("lsarmy:OutVehicle", function()
    TaskLeaveAnyVehicle(PlayerPedId(), 0, 0)
end)


local EnTrainEscorter = false
local ArmeeEscorte = nil
RegisterNetEvent("lsarmy:drage")
AddEventHandler("lsarmy:drage", function(player)
    EnTrainEscorter = not EnTrainEscorter
    print(EnTrainEscorter)
    ArmeeEscorte = tonumber(player)
    if EnTrainEscorter then
		Citizen.CreateThread(function()
			local pPed = PlayerPedId()
			while EnTrainEscorter do
				Wait(1)
				pPed = PlayerPedId()
				local targetPed = GetPlayerPed(GetPlayerFromServerId(ArmeeEscorte))
	
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
local mainMenu8 = RageUI.CreateMenu('', 'LS Army')
local subMenu9 = RageUI.CreateSubMenu(mainMenu8, "", "LS Army")
local subMenu10 = RageUI.CreateSubMenu(mainMenu8, "", "LS Army")
local subMenu12 = RageUI.CreateSubMenu(mainMenu8, "", "LS Army")
local subMenu13 = RageUI.CreateSubMenu(mainMenu8, "", "LS Army")
local subMenu14 = RageUI.CreateSubMenu(mainMenu8, "", "LS Army")
local subMenu15 = RageUI.CreateSubMenu(mainMenu8, "", "LS Army")
local subMenu16 = RageUI.CreateSubMenu(mainMenu8, "", "LS Army")
local subMenu17 = RageUI.CreateSubMenu(mainMenu8, "", "LS Army")
mainMenu8.Display.Header = true 
mainMenu8.Closed = function()
  open = false
end

function OpenMenuArmee()
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

			RageUI.Button("Service", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, subMenu9)
			
			RageUI.Separator('Intération')

			RageUI.Button("Interaction sur une personne", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, subMenu10)

			
			RageUI.Button("Props", nil, {RightLabel = "→"}, true , {
				onSelected = function()
				end
			}, subMenu17)

		    --end
			end)

		   RageUI.IsVisible(subMenu9,function() 


			RageUI.Button("Pause de service", nil, {RightLabel = "→"}, not codesCooldown4 , {
				onSelected = function()
					codesCooldown4 = true 
					local info = 'pause'
					TriggerServerEvent('lsarmy:PriseEtFinservice', info)
					Citizen.SetTimeout(10000, function() codesCooldown4 = false end)
					end
	})
			RageUI.Button("Standby", nil, {RightLabel = "→"}, not codesCooldown5 , {
				onSelected = function()
					codesCooldown5 = true 
					local info = 'standby'
					TriggerServerEvent('lsarmy:PriseEtFinservice', info)
					Citizen.SetTimeout(10000, function() codesCooldown5 = false end)
					end
	})
			RageUI.Button("Control en cours", nil, {RightLabel = "→"}, not codesCooldown6 , {
				onSelected = function()
					codesCooldown6 = true 
					local info = 'control'
					TriggerServerEvent('lsarmy:PriseEtFinservice', info)
					Citizen.SetTimeout(10000, function() codesCooldown6 = false end)
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

end)

	RageUI.IsVisible(subMenu17, function()

		RageUI.Button("Activer/désactiver props editor", nil, {RightLabel = "→"}, true , {
			onSelected = function()
				inPropsEditor = not inPropsEditor
				StartPropsEditor()
			end
		})

		for k,v in pairs(cfg_armee.props) do
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
							RageUI.Popup({message = "~b~quantité invalide"})
						else
							TriggerServerEvent('lsarmy:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
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
							RageUI.Popup({message = "~b~quantité invalide"})
						else
							TriggerServerEvent('lsarmy:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
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
							RageUI.Popup({message = "~b~Quantité invalide"})
						else
							TriggerServerEvent('lsarmy:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
						end
						RageUI.GoBack()
					end
				})
			end
	
			end)

			RageUI.IsVisible(subMenu14,function()

				for k,v in pairs(cfg_armee.amende) do
				for _,i in pairs(v) do
				RageUI.Button(i.label, nil, {RightLabel = "~b~"..i.price.."$"}, true , {
					onSelected = function() 
						local player, distance = ESX.Game.GetClosestPlayer()
						local sID = GetPlayerServerId(player)

						if player ~= -1 and distance <= 3.0 then
							TriggerServerEvent("lsarmy:SendFacture", sID, i.price)
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

		 Wait(0)
		end
	 end)
  end
end

-- OUVERTURE DU MENU --

Keys.Register('F6', 'lsarmy', 'Ouvrir le menu armée', function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'lsarmy' then
		servicearmee = true
		if servicearmee then
			OpenMenuArmee()
		else
			ESX.ShowNotification('Vous n\'êtes pas en service')
		end
	end
end)

-- Infos Armée
	RegisterNetEvent('lsarmy:InfoService')
	AddEventHandler('lsarmy:InfoService', function(service, nom)
		if service == 'prise' then
			PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
			ESX.ShowAdvancedNotification('LSPD INFORMATIONS', 'Prise de service', 'Agent: '..nom..'\nCode: 10-8\nInformation: Prise de service.', 'CHAR_ABIGAIL', 8)
			Wait(1000)
			PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		elseif service == 'fin' then
			PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
			ESX.ShowAdvancedNotification('LSPD INFORMATIONS', 'Fin de service', 'Agent: '..nom..'\nCode: 10-10\nInformation: Fin de service.', 'CHAR_ABIGAIL', 8)
			Wait(1000)
			PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
		elseif service == 'pause' then
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
		if raison == 'petit' then
			PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
			PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
			ESX.ShowAdvancedNotification('LSPD INFORMATIONS', 'Demande de renfort', 'Demande de renfort demandé.\nRéponse: CODE-2\nImportance: Légère.', 'CHAR_ABIGAIL', 8)
			Wait(1000)
			PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
			color = 2
		elseif raison == 'importante' then
			PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
			PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
			ESX.ShowAdvancedNotification('LSPD INFORMATIONS', 'Demande de renfort', 'Demande de renfort demandé.\nRéponse: CODE-3\nImportance: Importante.', 'CHAR_ABIGAIL', 8)
			Wait(1000)
			PlaySoundFrontend(-1, "End_Squelch", "CB_RADIO_SFX", 1)
			color = 47
		elseif raison == 'omgad' then
			PlaySoundFrontend(-1, "Start_Squelch", "CB_RADIO_SFX", 1)
			PlaySoundFrontend(-1, "OOB_Start", "GTAO_FM_Events_Soundset", 1)
			PlaySoundFrontend(-1, "FocusIn", "HintCamSounds", 1)
			ESX.ShowAdvancedNotification('LSPD INFORMATIONS', 'Demande de renfort', 'Demande de renfort demandé.\nRéponse: CODE-99\nImportance: URGENTE !\nDANGER IMPORTANT', 'CHAR_ABIGAIL', 8)
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

RegisterNetEvent('lsarmy:putInVehiclee')
AddEventHandler('lsarmy:putInVehiclee', function(target)
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


RegisterNetEvent("lsarmy:OutVehicle")
AddEventHandler("lsarmy:OutVehicle", function()
    TaskLeaveAnyVehicle(PlayerPedId(), 0, 0)
end)

dragStatus = {}
dragStatus.isDragged = false

RegisterNetEvent('armeejob:drag')
AddEventHandler('armeejob:drag', function(draggerId)
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
    ESX.TriggerServerCallback('lsarmy:getVehicleInfos', function(retrivedInfo)
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
