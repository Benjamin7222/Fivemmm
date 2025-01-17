ESX = nil
local PlayerData = {}
local PlayerInventory, GangInventoryItem, GangInventoryWeapon, PlayerWeapon = {}, {}, {}, {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job2 == nil do
		Citizen.Wait(10)
    end
	
	ESX.PlayerData = ESX.GetPlayerData()
	
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
  PlayerData.job2 = job2
end)

-- Initialisation de différentes informations...
local colorVar = "~b~"
local PlyID = PlayerPedId()
local Items = {}      -- Item que le joueur possède (se remplit lors d'une fouille)
local Armes = {}    -- Armes que le joueur possède (se remplit lors d'une fouille)
local ArgentSale = {}  -- Argent sale que le joueur possède (se remplit lors d'une fouille)
local IsHandcuffed, DragStatus = false, {}
DragStatus.IsDragged          = false

local function getPlayerInv(player)
    Items = {}
    Armes = {}
    ArgentSale = {}

    ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)
        for i=1, #data.accounts, 1 do
            if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then
                table.insert(ArgentSale, {
                    label    = ESX.Math.Round(data.accounts[i].money),
                    value    = 'black_money',
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

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)  
	PlayerData.job = job  
	Citizen.Wait(5000) 
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

 Citizen.CreateThread(function()
    while true do 
       Citizen.Wait(500)
       if VarColor == "~b~" then VarColor = "~s~" else VarColor = "~b~" end 
   end 
end)

function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
    AddTextEntry(entryTitle, textEntry)
    DisplayOnscreenKeyboard(1, entryTitle, "", inputText, "", "", "", maxLength)
	blockinput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
		blockinput = false
        return result
    else
        Citizen.Wait(500)
		blockinput = false
        return nil
    end
end


local function MarquerJoueur()
	local ped = GetPlayerPed(ESX.Game.GetClosestPlayer())
	local pos = GetEntityCoords(ped)
	local target, distance = ESX.Game.GetClosestPlayer()
	if distance <= 4.0 then
	DrawMarker(2, pos.x, pos.y, pos.z+1.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 170, 0, 1, 2, 1, nil, nil, 0)
end
end
 

 -- MENU
 local mainMenu = menu.CreateMenu("", "Intération") 
 local MenuCitoyens = menu.CreateSubMenu(mainMenu, "", "Intération") 
 local fouillemenu = menu.CreateSubMenu(MenuCitoyens, "", "Intération")
 local informationmenu = menu.CreateSubMenu(MenuCitoyens, "", "Intération")

 local open = false
 
 mainMenu.X = 0 
 mainMenu.Y = 0
 
 mainMenu.Closed = function() 
     open = false 
 end 
 
 function menuballas()
     if open then 
         open = false 
             menu.Visible(MenuCitoyens, false) 
         return 
     else 
         open = true 
             menu.Visible(MenuCitoyens, true)
         Citizen.CreateThread(function()
             while open do 
					   menu.IsVisible(MenuCitoyens, function()

						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

						   menu.Button("Fouiller une personne", "Fouille la personne en face de vous", {RightLabel = "→→"}, closestPlayer ~= -1 and closestDistance <= 3.0, {
							onSelected = function()
									getPlayerInv(closestPlayer)
                                    ESX.ShowNotification("Vous être entrain de fouiller une personne...")
						end
						}, fouillemenu)


						if ConfigMenu.menuinformation == true then
                        menu.Button("Papiers de la personne", "Information divers", {RightLabel = "→→"}, true , {
							onSelected = function()
							end
						}, informationmenu)
					end
            end)

			menu.IsVisible(informationmenu, function()
				ESX.PlayerData = ESX.GetPlayerData()
				ESX.GetPlayerData()
				menu.Separator("↓ ~b~Information Gang~s~↓")
				menu.Separator("Gang : "..VarColor..""..ESX.PlayerData.job2.label)
				menu.Separator("Grade : "..VarColor..""..ESX.PlayerData.job2.grade_label)
				menu.Separator("↓ ~b~Information Joueur~s~↓")
				menu.Separator("Votre Pseudo : "..VarColor.."".. GetPlayerName(PlayerId()))
				menu.Separator("Votre ID : "..VarColor..""..GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))))
	end)
			 
			    menu.IsVisible(fouillemenu, function()
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                menu.Separator("↓"..VarColor.."Argent Sale ~s~↓")
                for k,v  in pairs(ArgentSale) do
                    menu.Button("Argent sale :"..v.label.."$", nil, {RightLabel = ""}, true, {
                        onSelected = function()
                            local combien = KeyboardInput("Combien ?", '' , '', 2000)
                            if tonumber(combien) > v.amount then
                                ESX.ShowNotification('~b~Quantité invalide')
                            else
                                TriggerServerEvent('kaizogang:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                            end
                            menu.GoBack()
                        end	
				})
            end
				menu.Separator("↓"..VarColor.."Objets ~s~↓")
                for k,v  in pairs(Items) do
                    menu.Button(v.label, nil, {RightLabel = "~b~x"..v.right}, true, {
						onSelected = function()
                            local combien = KeyboardInput("Combien ?", '' , '', 2000)
                            if tonumber(combien) > v.amount then
                                ESX.ShowNotification('~b~Quantité invalide')
                            else
                                TriggerServerEvent('kaizogang:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
                            end
							menu.GoBack()
					 end
					})
                end
				menu.Separator("↓"..VarColor.."Armes ~s~↓")

				for k,v  in pairs(Armes) do
					menu.Button(v.label, nil, {RightLabel = "~b~x"..v.right}, true, {
						onSelected = function()
							local combien = KeyboardInput("Combien ?", '' , '', 2000)
							if tonumber(combien) > v.amount then
								ESX.ShowNotification('~b~Quantité invalide')
							else
								TriggerServerEvent('kaizogang:confiscatePlayerItem', GetPlayerServerId(closestPlayer), v.itemType, v.value, tonumber(combien))
							end
							menu.GoBack()
					end
					})
			    end
                end)
             Wait(0)
             end
         end)
     end
 end
 
 -- MARKERS
 
 Keys.Register('F7', 'GANG', 'Ouvrir le menu GANG', function()
    ESX.PlayerData = ESX.GetPlayerData()
    for k,v in pairs(ConfigMenu.job) do
	if ESX.PlayerData.job2 and ESX.PlayerData.job2.name == v.job2 then
        menuballas()
		ESX.GetPlayerData()
	end
  end
end)


-- Différents events : escorter, menotter... avec les animations.

RegisterNetEvent('policejob:mettreM')
AddEventHandler('policejob:mettreM', function(playerheading, playercoords, playerlocation)
	playerPed = GetPlayerPed(-1)
	SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
	SetPedCanPlayGestureAnims(playerPed, false)
	DisablePlayerFiring(playerPed, true)
	DisplayRadar(false)
	local x, y, z   = table.unpack(playercoords + playerlocation * 1.0)
	Wait(500)
	SetEntityCoords(GetPlayerPed(-1), x, y, z)
	SetEntityHeading(GetPlayerPed(-1), playerheading)
	Wait(250)
	LoadAnimDict('mp_arrest_paired')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'crook_p2_back_right', 8.0, -8, 3750 , 2, 0, 0, 0, 0)
	Wait(3760)
	IsHandcuffed = true
	LoadAnimDict('mp_arresting')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
end)

-- DEPLACER JOUEUR
RegisterNetEvent('policejob:drag1')
AddEventHandler('policejob:drag1', function(copID)
	if not IsHandcuffed then
		return
	end
	DragStatus.IsDragged = not DragStatus.IsDragged
	DragStatus.CopId     = tonumber(copID)
end)

Citizen.CreateThread(function()
	local playerPed
	local targetPed

	while true do
		Wait(7)

        if IsHandcuffed then
            playerPed = PlayerPedId()
            
			DisableControlAction(0, 1, true) -- Disable pan
			DisableControlAction(0, 2, true) -- Disable tilt
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			DisableControlAction(0, 45, true) -- Reload
			DisableControlAction(0, 22, true) -- Jump
			DisableControlAction(0, 44, true) -- Cover
			DisableControlAction(0, 37, true) -- Select Weapon
			DisableControlAction(0, 23, true) -- Also 'enter'?
			DisableControlAction(0, 288,  true) -- Disable phone
			DisableControlAction(0, 289, true) -- Inventory
			DisableControlAction(0, 170, true) -- Animations
			DisableControlAction(0, 167, true) -- Job
			DisableControlAction(0, 0, true) -- Disable changing view
			DisableControlAction(0, 26, true) -- Disable looking behind
			DisableControlAction(0, 73, true) -- Disable clearing animation
			DisableControlAction(2, 199, true) -- Disable pause screen
			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle
			DisableControlAction(2, 36, true) -- Disable going stealth
			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle
            
			if DragStatus.IsDragged then
				targetPed = GetPlayerPed(GetPlayerFromServerId(DragStatus.CopId))
				-- undrag if target is in an vehicle
				if not IsPedSittingInAnyVehicle(targetPed) then
					AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
				else
					DragStatus.IsDragged = false
					DetachEntity(playerPed, true, false)
				end
			else
				DetachEntity(playerPed, true, false)
			end
		else
			Wait(500)
		end
	end
end)

RegisterNetEvent('policejob:enleverM')
AddEventHandler('policejob:enleverM', function(playerheading, playercoords, playerlocation)
	local x, y, z   = table.unpack(playercoords + playerlocation)
	SetEntityCoords(GetPlayerPed(-1), x, y, z)
	FreezeEntityPosition(playerPed, false)
	SetEntityHeading(GetPlayerPed(-1), playerheading)
	SetPedCanPlayGestureAnims(playerPed, true)
	DisablePlayerFiring(playerPed, false)
	DisplayRadar(true)
	Wait(250)
	LoadAnimDict('mp_arresting')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'b_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	Wait(5500)
	IsHandcuffed = false
	ClearPedTasks(GetPlayerPed(-1))
end)

RegisterNetEvent('animation')
AddEventHandler('animation', function()
  local pid = PlayerPedId()
  RequestAnimDict("amb@prop_human_bum_bin@idle_b")
  while (not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b")) do Citizen.Wait(0) end
        TaskPlayAnim(pid,"amb@prop_human_bum_bin@idle_b","idle_d",-1, -1, -1, 120, 1, 0, 0, 0)
end)

RegisterNetEvent('esx_policejob:putInVehicle')
AddEventHandler('esx_policejob:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	if not IsHandcuffed then
		return
	end
	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
		if DoesEntityExist(vehicle) then
			local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
			local freeSeat = nil
			for i=maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end
			if freeSeat ~= nil then
				TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
				DragStatus.IsDragged = false
			end
		end
	end
end)

RegisterNetEvent('esx_policejob:OutVehicle')
AddEventHandler('esx_policejob:OutVehicle', function()
	local playerPed = PlayerPedId()

	if not IsPedSittingInAnyVehicle(playerPed) then
		return
	end

	local vehicle = GetVehiclePedIsIn(playerPed, false)
	TaskLeaveVehicle(playerPed, vehicle, 16)
end)

function LoadAnimDict(dictname)
	if not HasAnimDictLoaded(dictname) then
		RequestAnimDict(dictname) 
		while not HasAnimDictLoaded(dictname) do 
			Citizen.Wait(1)
		end
	end
end

RegisterNetEvent('policejob:mettreMnofreeze')
AddEventHandler('policejob:mettreMnofreeze', function(playerheading, playercoords, playerlocation)
	playerPed = GetPlayerPed(-1)
	SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
	SetPedCanPlayGestureAnims(playerPed, false)
	DisablePlayerFiring(playerPed, true)
	DisplayRadar(false)
	local x, y, z   = table.unpack(playercoords + playerlocation)
	Wait(500)
	SetEntityCoords(GetPlayerPed(-1), x, y, z)
	SetEntityHeading(GetPlayerPed(-1), playerheading)
	Wait(250)
	LoadAnimDict('mp_arrest_paired')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'crook_p2_back_right', 8.0, -8, 3750 , 2, 0, 0, 0, 0)
	Wait(3760)
	IsHandcuffed = true
	LoadAnimDict('mp_arresting')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
    FreezeEntityPosition(playerPed, true)
end)

RegisterNetEvent('message:gang')
AddEventHandler('message:gang', function(message, nom)
		ESX.ShowAdvancedNotification('Notification Gang', '~g~Message', '~s~De: ~b~'..nom..'\n~w~Message: ~y~'..message..'', 'CHAR_BLANK_ENTRY', 1)
end)