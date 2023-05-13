isInInventory = false
local open = false
ESX = nil
currentMenu = 'item'
IncludeWeapons = true
IncludeCash = true
local BlockInventory = false
CloseUiItems = {
    "radio"
}
local fastWeapons = {
	[1] = nil,
	[2] = nil,
	[3] = nil
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        DisableControlAction(0, 37, true) -- weapon wheel
    end
end)

function AddLongString(txt)
	local maxLen = 100
	for i = 0, string.len(txt), maxLen do
		local sub = string.sub(txt, i, math.min(i + maxLen, string.len(txt)))
		AddTextComponentString(sub)
	end
end

function ShowAboveRadarMessage(message, back)
	if back then ThefeedNextPostBackgroundColor(back) end
	SetNotificationTextEntry("jamyfafi")
	AddLongString(message)
	return DrawNotification(0, 1)
end

Citizen.CreateThread(function() 
    while ESX == nil do 
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end) 
        Citizen.Wait(0) 
    end 
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterCommand('invbug', function()
    SetNuiFocus(true, true)
end, false)

function openInventory()
    loadPlayerInventory(currentMenu)
    isInInventory = true
    open = true
    SendNUIMessage({action = "display", type = "normal"})
    SetNuiFocus(true, true)
    SetKeepInputMode(true)
end

function closeInventory()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local vehicle = nil

    if IsPedInAnyVehicle(playerPed, false) then
        vehicle = GetVehiclePedIsIn(playerPed, false)
    else
        vehicle = getVehicleInDirection(3.0)

        if not DoesEntityExist(vehicle) then
            vehicle = GetClosestVehicle(coords, 3.0, 0, 70)
        end
    end
    SetVehicleDoorShut(vehicle, 5, false)
    isInInventory = false
    open = false
    SendNUIMessage({action = "hide"})
    if not BlockInventory then
        DisplayRadar(true)
    end
    SetNuiFocus(false, false)
    SetKeepInputMode(false)
end

RegisterNUICallback('escape', function(data, cb)
    closeInventory()
    SetKeepInputMode(false)
end)

RegisterNUICallback("NUIFocusOff",function()
    closeInventory()
    SetKeepInputMode(false)
end)

RegisterNUICallback("GetNearPlayers", function(data, cb)
    local playerPed = PlayerPedId()
    local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
    local foundPlayers = false
    local elements = {}



    local closestPly = GetNearbyPlayer(false, true)
    if closestPly ~= nil then
        foundPlayers = true 
    end 


    if not foundPlayers then
        ESX.ShowNotification('~r~Personne à proximité.')
    else
   
        SendNUIMessage({action = "nearPlayers", foundAny = foundPlayers, players = GetPlayerServerId(closestPly), item = data.item})
    end

    cb("ok")
end)

function KeyboardInput(TextEntry, ExampleText, MaxStringLength)
	AddTextEntry("FMMC_KEY_TIP1", TextEntry)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
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

RegisterNUICallback("dsqds", function(data, cb)
    if currentMenu ~= data.type then 
        currentMenu = data.type
        loadPlayerInventory(data.type)
    end
end)


RegisterNUICallback("InformationItem", function(data, cb)
    ESX.ShowNotification('~b~Type : ~s~'..data.item.type..'\n~b~Nombre : ~s~'..data.item.count..'\n~b~Nom : ~s~'..data.item.label..'')
end)


local notifItem = false

RegisterNUICallback("UseItem", function(data, cb)
  
    if data.item.type == "item_standard" then 
        TriggerServerEvent("esx:useItem", data.item.name)

            save()
    end 
    if shouldCloseInventory(data.item.name) then
        closeInventory()
    else
        Citizen.Wait(250)
        loadPlayerInventory(currentMenu)
    end
    cb("ok")
end)

RegisterNUICallback("DropItem", function(data, cb)
    if IsPedSittingInAnyVehicle(playerPed) then
        return
    end
    if currentMenu ~= 'clothe' then 
        if type(data.number) == "number" and math.floor(data.number) == data.number then
            if data.item.label == "Argent" then
                data.item.name = "cash"
            end
            if data.item.label == "Argent sale" then
                data.item.name = "dirtycash"
            end
            if data.item.type == "item_weapon" then
                SetCurrentPedWeapon(PlayerPedId(),"WEAPON_UNARMED", true)
                ResetWeaponSlots()
            end
            TriggerServerEvent('esx:dropInventoryItem', data.item.type, data.item.name, data.number)
        end
    end

    Wait(250)
    loadPlayerInventory(currentMenu)

    cb("ok")
end)

RegisterNUICallback("GiveItem", function(data, cb)
    local playerPed = PlayerPedId()
    local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
    local foundPlayer = false
    for i = 1, #players, 1 do
        if players[i] ~= PlayerId() then
            if GetPlayerServerId(players[i]) == data.player then
                foundPlayer = true
            end
        end
    end
 
    if foundPlayer then
        
        local count = tonumber(data.number)

        if data.item.type == "item_weapon" then
            count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
            SetCurrentPedWeapon(PlayerPedId(),"WEAPON_UNARMED", true)
            ResetWeaponSlots()

            if data.item.label == "Argent" then
                data.item.name = "cash"
            end
            if data.item.label == "Argent sale" then
                data.item.name = "dirtycash"
            end
            TriggerServerEvent("esx:giveInventoryItem", data.player, data.item.type, data.item.name, count)
            Wait(250)
            loadPlayerInventory(currentMenu)
        end
    else
        ESX.ShowNotification('Personne à proximité.')
    end
    cb("ok")
end)

function shouldCloseInventory(itemName)
    for index, value in ipairs(CloseUiItems) do
        if value == itemName then
            return true
        end
    end

    return false
end

function save()
	TriggerEvent('skinchanger:getSkin', function(skin)
		TriggerServerEvent('esx_skin:save', skin)
	end)
end

RegisterNUICallback("weightHelp", function(data, cb)
    ESX.ShowNotification("Pour avoir plus d'espace, vous pouvez toujours obtenir un diable")
end)

function GetCurrentWeight()
    
    TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end) 

    local currentWeight = 0
    for i = 1, #ESX.PlayerData.inventory, 1 do
        if ESX.PlayerData.inventory[i].count > 0 then
            currentWeight = currentWeight + (ESX.PlayerData.inventory[i].weight * ESX.PlayerData.inventory[i].count)
        end
    end
    return currentWeight
end



local tenue,chaussures,masque,pantalon,tshirt,lunettes,modifitems,chapeau,sac,chaine,calque,montre,torse = {},{},{},{},{},{},{},{},{},{},{},{},{}

function loadPlayerInventory(result)
  
    local weight = {currentWeight = GetCurrentWeight(), maxWeight = ESX.PlayerData.maxWeight..".0"}
 
    if result == 'item' then 
        ESX.TriggerServerCallback("esx_inventoryhud:getPlayerInventory", function(data)
            print(json.encode(data))
            items = {}
            fastItems = {}
            inventory = data.inventory
            dirtycash = data.dirtycash
            money = data.money
            weapons = data.weapons

            if IncludeCash and money ~= nil and money > 0 then
                moneyData = {
                    label = "Argent",
                    name = "money",
                    type = "item_account",
                    count = money,
                    usable = false,
                    rename = false,
                    rare = false,
                    information = true, 
                    weight = -1,
                    canRemove = true
                }

                table.insert(items, moneyData)
            end
            
            if dirtycash ~= nil and dirtycash > 0 then
                dirtycashData = {
                    label = "Argent sale",
                    name = "dirtycash",
                    type = "item_account",
                    count = dirtycash,
                    usable = false,
                    rename = false,
                    rare = false,
                    information = true, 
                    weight = -1,
                    canRemove = true
                }

                table.insert(items, dirtycashData)
            end

            if inventory ~= nil then
                for key, value in pairs(inventory) do
            if inventory[key].count <= 0 then
                        inventory[key] = nil
                    
                    else
                        for k, v in pairs(modifitems) do
                            if v.item == inventory[key].name then 
                                if v.name ~= nil then 
                                    inventory[key].label = v.name
                                end
                            end 
                        end
                        inventory[key].type = "item_standard"
                        information = true
                        
                        table.insert(items, inventory[key])
                    end
                end
            end

         
        SendNUIMessage({ action = "setItems", itemList = items, fastItems = fastItems, text = texts, crMenu = currentMenu, weight = weight})
        end, GetPlayerServerId(PlayerId()))
    elseif result == 'weapon' then 
        ESX.TriggerServerCallback("esx_inventoryhud:getPlayerInventory", function(data)
            items = {}
            fastItems = {}
            inventory = data.inventory
            accounts = data.accounts
            money = data.money
            weapons = data.weapons
            
            

            if weapons ~= nil then
                for key, value in pairs(weapons) do
                    local weaponHash = GetHashKey(weapons[key].name)
                    local playerPed = PlayerPedId()
                    if HasPedGotWeapon(playerPed, weaponHash, false) and weapons[key].name ~= "WEAPON_UNARMED" then
                            local found = false
                            for slot, weapon in pairs(fastWeapons) do
                                if weapon == weapons[key].name then
                                    local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
                                    table.insert(
                                        fastItems,
                                        {
                                            label = weapons[key].label,
                                            count = ammo,
                                            limit = -1,
                                            type = "item_weapon",
                                            name = weapons[key].name,
                                            usable = false,
                                            rare = false,
                                            information = false, 
                                            rename = false,
                                            canRemove = true,
                                            slot = slot
                                        }
                                    )
                                    found = true
                                    break
                                end
                            end
                            if found == false then
                                local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
                                table.insert(
                                    items,
                                    {
                                        label = weapons[key].label,
                                        count = ammo,
                                        limit = -1,
                                        type = "item_weapon",
                                        name = weapons[key].name,
                                        usable = false,
                                        rare = false,
                                        information = true, 
                                        rename = false,
                                        canRemove = true
                                    }
                                )
                            end
                    end
                end
            end
        SendNUIMessage({ action = "setItems", itemList = items, fastItems = fastItems, text = texts, crMenu = currentMenu, weight = weight})
        end, GetPlayerServerId(PlayerId()))
    elseif result == 'clothe' then 
        items = {}
    end
end

--FAST ITEMS
RegisterNUICallback("PutIntoFast", function(data, cb)
	if data.item.slot ~= nil then
		fastWeapons[data.item.slot] = nil
	end
	fastWeapons[data.slot] = data.item.name
	loadPlayerInventory(currentMenu)
	cb("ok")
end)

RegisterNUICallback("TakeFromFast", function(data, cb)
	fastWeapons[data.item.slot] = nil
	loadPlayerInventory(currentMenu)
	cb("ok")
end)


RegisterKeyMapping('ouvririnventaire', 'Ouvrir votre inventaire', 'keyboard', 'TAB')
RegisterKeyMapping('keybind1', 'Slot d\'arme 1', 'keyboard', '1')
RegisterKeyMapping('keybind2', 'Slot d\'arme 2', 'keyboard', '2')
RegisterKeyMapping('keybind3', 'Slot d\'arme 3', 'keyboard', '3')

local AnimBlacklist = {"WORLD_HUMAN_MUSICIAN", "WORLD_HUMAN_CLIPBOARD"}
local AnimFemale = {
	["WORLD_HUMAN_BUM_WASH"] = {"amb@world_human_bum_wash@male@high@idle_a", "idle_a"},
	["WORLD_HUMAN_SIT_UPS"] = {"amb@world_human_sit_ups@male@idle_a", "idle_a"},
	["WORLD_HUMAN_PUSH_UPS"] = {"amb@world_human_push_ups@male@base", "base"},
	["WORLD_HUMAN_BUM_FREEWAY"] = {"amb@world_human_bum_freeway@male@base", "base"},
	["WORLD_HUMAN_CLIPBOARD"] = {"amb@world_human_clipboard@male@base", "base"},
	["WORLD_HUMAN_VEHICLE_MECHANIC"] = {"amb@world_human_vehicle_mechanic@male@base", "base"},
}

function TaskAnimForce(animName, flag, args) -- Faire forcer une anim a un ped (joueur)
	flag, args = flag and tonumber(flag) or false, args or {}
	local ped, time, clearTasks, animPos, animRot, animTime = args.ped or GetPlayerPed(-1), args.time, args.clearTasks, args.pos, args.ang

	if IsPedInAnyVehicle(ped) and (not flag or flag < 40) then return end

	if not clearTasks then ClearPedTasks(ped) end

	if not animName[2] and AnimFemale[animName[1]] and GetEntityModel(ped) == -1667301416 then
		animName = AnimFemale[animName[1]]
	end

	if animName[2] and not HasAnimDictLoaded(animName[1]) then
		if not DoesAnimDictExist(animName[1]) then return end
		RequestAnimDict(animName[1])
		while not HasAnimDictLoaded(animName[1]) do
			Citizen.Wait(10)
		end
	end

	if not animName[2] then
		ClearAreaOfObjects(GetEntityCoords(ped), 1.0)
		TaskStartScenarioInPlace(ped, animName[1], -1, not TableGetValue(AnimBlacklist, animName[1]))
	else
        if not animPos then
            TaskPlayAnim(ped, animName[1], animName[2], 8.0, -8.0, -1, flag or 44, 1, 0, 0, 0, 0)
		else
			TaskPlayAnimAdvanced(ped, animName[1], animName[2], animPos.x, animPos.y, animPos.z, animRot.x, animRot.y, animRot.z, 8.0, -8.0, -1, 1, 1, 0, 0, 0)
		end
	end

	if time and type(time) == "number" then
		Citizen.Wait(time)
		ClearPedTasks(ped)
	end

	if not args.dict then RemoveAnimDict(animName[1]) end
end

RegisterCommand('ouvririnventaire', function()
    if open then 
        openInventory()
        if not BlockInventory then
            DisplayRadar(false)
        end
    else
        closeInventory()
        if not BlockInventory then
            DisplayRadar(true)
        end
    end
    open = not open
end)

WeaponsHolster = {
    "WEAPON_STUNGUN",
    "WEAPON_COMBATPISTOL",
}

function CheckWeaponsHolster()
    pPed = PlayerPedId()
    for i = 1, #WeaponsHolster do 
        if GetHashKey(WeaponsHolster[i]) == GetSelectedPedWeapon(pPed) then
            return true
        else
            return false
        end
    end
end


local bool1 = false
function StartDisableControlForWeaponAnim(bool)
    Citizen.CreateThread(function()
        while bool do
            Wait(0)
            if bool1 then 
                local playerPed = GetPlayerPed(-1)
                PedSkipNextReloading(playerPed)
                DisableControlAction(0, 24, true)
                DisableControlAction(0, 25, true)
                DisableControlAction(2, 237, true)
                DisableControlAction(2, 238, true)
                DisablePlayerFiring(playerPed, true)
            end
        end
    end)
end
function StartAnimsWeapons(weapons)
    local playerPed = GetPlayerPed(-1)
    SetPedCurrentWeaponVisible(playerPed, false)
    StartDisableControlForWeaponAnim(true)
    bool1 = true
    TaskAnimForce({"reaction@intimidation@1h", "intro"}, 49)

    local hash = GetHashKey(weapons)
    GiveWeaponToPed(playerPed, hash, 0, false, true)
    SetPedCurrentWeaponVisible(playerPed)
    Citizen.SetTimeout(1000, function()
        SetPedCurrentWeaponVisible(playerPed, true)
    end)
    Citizen.Wait(2700)
    StartDisableControlForWeaponAnim(false)
    bool1 = false
    SetPedCurrentWeaponVisible(playerPed, true)
    ClearPedTasks(playerPed)
end

function loadAnimDict(dict)
	while ( not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(0)
	end
end

function StartsPoliceAnimsWeapons(weapons)
    loadAnimDict("rcmjosh4")
    loadAnimDict("reaction@intimidation@cop@unarmed")
    local playerPed = GetPlayerPed(-1)
    local hash = GetHashKey(weapons)
    GiveWeaponToPed(playerPed, hash, 0, false, true)
    StartDisableControlForWeaponAnim(true)
    SetPedCurrentWeaponVisible(playerPed, 0, 1, 1, 1)
    TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "intro", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
    SetPedCurrentWeaponVisible(playerPed, 1, 1, 1, 1)
    TaskPlayAnim(playerPed, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
    Citizen.Wait(400)
    ClearPedTasks(playerPed)
end
local notifWeapon1 = false

RegisterCommand('keybind1', function()
    if not IsPedSittingInAnyVehicle(PlayerPedId()) then
        if fastWeapons[1] ~= nil then
            print(fastWeapons[1])
            if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(fastWeapons[1]) then
                SetCurrentPedWeapon(GetPlayerPed(-1), "WEAPON_UNARMED",true)
            else
                if fastWeapons[1] == "WEAPON_STUNGUN" or fastWeapons[1] == "WEAPON_COMBATPISTOL" then
                    StartsPoliceAnimsWeapons(fastWeapons[1])
                else
                    StartAnimsWeapons(fastWeapons[1],true)
                end
                if notifWeapon1 then 
                    RemoveNotification(notifWeapon1) 
                end
                --notifWeapon1 = ShowAboveRadarMessage('Vous avez équipé votre ~g~'..ESX.GetWeaponLabel(fastWeapons[1])..'.')
                ESX.ShowNotification('Vous avez équipé votre '..ESX.GetWeaponLabel(fastWeapons[1])..'.')
            end
        end
    end
end)
local notifWeapon2 = false

RegisterCommand('keybind2', function()
    if not IsPedSittingInAnyVehicle(PlayerPedId()) then
        if fastWeapons[2] ~= nil then
            if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(fastWeapons[2]) then
                SetCurrentPedWeapon(GetPlayerPed(-1), "WEAPON_UNARMED",true)
            else
                if fastWeapons[2] == "WEAPON_STUNGUN" or fastWeapons[2] == "WEAPON_COMBATPISTOL" then
                    StartsPoliceAnimsWeapons(fastWeapons[2])
                else
                    StartAnimsWeapons(fastWeapons[2],true)
                end
                if notifWeapon2 then 
                    RemoveNotification(notifWeapon2) 
                end
                --notifWeapon2 = ShowAboveRadarMessage('Vous avez équipé votre ~g~'..ESX.GetWeaponLabel(fastWeapons[2])..'.')
                ESX.ShowNotification('Vous avez équipé votre '..ESX.GetWeaponLabel(fastWeapons[2])..'.')
            end
        end
    end
end)

local notifWeapon3 = false

RegisterCommand('keybind3', function()
    if not IsPedSittingInAnyVehicle(PlayerPedId()) then
        if fastWeapons[3] ~= nil then
            if GetSelectedPedWeapon(GetPlayerPed(-1)) == GetHashKey(fastWeapons[3]) then
                SetCurrentPedWeapon(GetPlayerPed(-1), "WEAPON_UNARMED",true)
            else
                if fastWeapons[3] == "WEAPON_STUNGUN" or fastWeapons[3] == "WEAPON_COMBATPISTOL" then
                    StartsPoliceAnimsWeapons(fastWeapons[3])
                else
                    StartAnimsWeapons(fastWeapons[3],true)
                end
                if notifWeapon3 then 
                    RemoveNotification(notifWeapon3) 
                end
                --notifWeapon3 = ShowAboveRadarMessage('Vous avez équipé votre ~g~'..ESX.GetWeaponLabel(fastWeapons[3])..'.')
                ESX.ShowNotification('Vous avez équipé votre '..ESX.GetWeaponLabel(fastWeapons[3])..'.')
            end
        end
    end
end)

function GetFastWeaponsChasse()
    if fastWeapons[1]~= "WEAPON_MUSKET" and fastWeapons[2] ~= "WEAPON_MUSKET" and fastWeapons[3] ~= "WEAPON_MUSKET" then
        return false
    else
        return true
    end
end

function ResetWeaponSlots()
    fastWeapons = {
        [1] = nil,
        [2] = nil,
        [3] = nil
    }
end


KEEP_FOCUS = false
local threadCreated = false
local controlDisabled = {1, 2, 3, 4, 5, 6, 18, 24, 25, 37, 44, 45, 52, 68, 69, 70, 80, 85, 91, 92, 106, 111, 114, 117, 118, 122, 135, 138, 140, 141, 142, 143, 144, 152, 176, 177, 182, 199, 200, 205, 222, 223, 225, 229, 237, 238, 250, 257, 263, 264, 310, 329, 330, 331, 346, 347}

function SetKeepInputMode(bool)
    if SetNuiFocusKeepInput then
        SetNuiFocusKeepInput(bool)
    end

    KEEP_FOCUS = bool

    if not threadCreated and bool then
        threadCreated = true

        Citizen.CreateThread(function()
            while KEEP_FOCUS do
                Wait(0)
                for _,v in pairs(controlDisabled) do
                    DisableControlAction(0, v, true)
                end
            end

            threadCreated = false
        end)
    end
end

function GetStateInventory()
    return isInInventory
end


function AddLongString(txt)
	local maxLen = 100
	for i = 0, string.len(txt), maxLen do
		local sub = string.sub(txt, i, math.min(i + maxLen, string.len(txt)))
		AddTextComponentString(sub)
	end
end

function ShowAdvancedAboveRadarMessage(sender, subject, msg, textureDict, iconType, flash, saveToBrief, hudColorIndex)
	if saveToBrief == nil then saveToBrief = true end
	AddTextEntry('jamyfafis', msg)
	BeginTextCommandThefeedPost('jamyfafis')
	if hudColorIndex then ThefeedNextPostBackgroundColor(hudColorIndex) end
	EndTextCommandThefeedPostMessagetext(textureDict, textureDict, false, iconType, sender, subject)
	EndTextCommandThefeedPostTicker(flash or false, saveToBrief)
end

function ShowAboveRadarMessage(message, back)
	if back then ThefeedNextPostBackgroundColor(back) end
	SetNotificationTextEntry("jamyfafi")
	AddLongString(message)
	return DrawNotification(0, 1)
end

function GetPlayers() -- Get Les joueurs
	local players = {}

	for _,player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)

		if DoesEntityExist(ped) then
			table.insert(players, player)
		end
	end

	return players
end


function GetNearbyPlayers(distance)
	local ped = GetPlayerPed(-1)
	local playerPos = GetEntityCoords(ped)
	local nearbyPlayers = {}

	for _,v in pairs(GetPlayers()) do
		local otherPed = GetPlayerPed(v)
		local otherPedPos = otherPed ~= ped and IsEntityVisible(otherPed) and GetEntityCoords(otherPed)

		if otherPedPos and GetDistanceBetweenCoords(otherPedPos, playerPos) <= (distance or max) then
			nearbyPlayers[#nearbyPlayers + 1] = v
		end
	end
	return nearbyPlayers
end

local cWait = false;
local xWait = false
function GetNearbyPlayer(solo, other)
    if cWait then
        xWait = true
        while cWait do
            Citizen.Wait(5)
        end
    end
    xWait = false
    local cTimer = GetGameTimer() + 10000;
    local oPlayer = GetNearbyPlayers(2)
    if solo then
        oPlayer[#oPlayer + 1] = PlayerId()
    end
    if #oPlayer == 0 then
        ShowAboveRadarMessage("Rapprochez-vous.")
        return false
    end
    if #oPlayer == 1 and other then
        return oPlayer[1]
    end
    ShowAboveRadarMessage("Appuyer sur E pour valider.Appuyer sur A pour changer de cible.Appuyer sur X pour annuler.")
    Citizen.Wait(100)
    local cBase = 1
    cWait = true
    while GetGameTimer() <= cTimer and not xWait do
        Citizen.Wait(0)
        DisableControlAction(0, 38, true)
        DisableControlAction(0, 73, true)
        DisableControlAction(0, 44, true)
        if IsDisabledControlJustPressed(0, 38) then
            cWait = false
            return oPlayer[cBase]
        elseif IsDisabledControlJustPressed(0, 73) then
            ShowAboveRadarMessage("Vous avez annulé.")
            break
        elseif IsDisabledControlJustPressed(0, 44) then
            cBase = (cBase == #oPlayer) and 1 or (cBase + 1)
        end
        local cPed = GetPlayerPed(oPlayer[cBase])
        local cCoords = GetEntityCoords(cPed)
        DrawMarker(0, cCoords.x, cCoords.y, cCoords.z + 1.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, 0.1, 0.1, 0.1, 0, 243, 255, 30, 1, 1, 0, 0, 0, 0, 0)
    end
    cWait = false
    return false
end
