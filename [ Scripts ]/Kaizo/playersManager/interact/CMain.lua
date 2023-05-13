
ESX = nil

local PersonalMenu = {
	BillData = nil,
}

local open = false

local mostrar = true

---@type table
local SettingsButton = {
    Rectangle = { Y = 0, Width = 431, Height = 38 },
    Text = { X = 8, Y = 3, Scale = 0.33 },
}

local extraList = {"n°1","n°2","n°3","n°4","n°5","n°6","n°7","n°8","n°9","n°10","n°11","n°12","n°13","n°14","n°15"}
local extraIndex = 1
local extraCooldown = false
local extraStateIndex = 1

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    ESX.PlayerData = ESX.GetPlayerData()

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job2 == nil do
        Citizen.Wait(0)
    end

    SetTimecycleModifier('tunnel')

    menu.WeaponData = ESX.GetWeaponList()

	for i = 1, #menu.WeaponData, 1 do
		if menu.WeaponData[i].name == 'WEAPON_UNARMED' then
			menu.WeaponData[i] = nil
		else
			menu.WeaponData[i].hash = GetHashKey(menu.WeaponData[i].name)
		end
    end



RMenu.Add('inventory', 'mainf5', KaizoUI.CreateMenu("Inventaire", "", 0,0))

RMenu.Add('inventory', 'inventory', KaizoUI.CreateSubMenu(RMenu:Get('inventory', 'mainf5'), "Choix", " "))
RMenu.Add('inventory', 'portefeuille', KaizoUI.CreateSubMenu(RMenu:Get('inventory', 'mainf5'), "Portefeuille", " "))
RMenu.Add('inventory', 'portefeuille_work', KaizoUI.CreateSubMenu(RMenu:Get('inventory', 'portefeuille'), "Emplois", " "))
RMenu.Add('inventory', 'portefeuille_orga', KaizoUI.CreateSubMenu(RMenu:Get('inventory', 'portefeuille'), "Organisation", " "))
RMenu.Add('inventory', 'divers', KaizoUI.CreateSubMenu(RMenu:Get('inventory', 'mainf5'), "Divers", " "))
RMenu.Add('inventory', 'visual', KaizoUI.CreateSubMenu(RMenu:Get('inventory', 'mainf5'), "Visuel", " "))
RMenu.Add('inventory', 'papers', KaizoUI.CreateSubMenu(RMenu:Get('inventory', 'portefeuille'), "Papiers", " "))
RMenu.Add('inventory', 'voiture', KaizoUI.CreateSubMenu(RMenu:Get('inventory', 'mainf5'), "Gestion Véhicule", " "))
RMenu.Add('inventory', 'portefeuille_money', KaizoUI.CreateSubMenu(RMenu:Get('inventory', 'portefeuille'), "Portefeuille", " "))

RMenu:Get('inventory', 'mainf5'):SetSubtitle(" ")
RMenu:Get('inventory', 'mainf5').EnableMouse = false
RMenu:Get('inventory', 'mainf5').TitleFont = 1
RMenu:Get('inventory', 'mainf5').Closed = function()
    open = not open
end


end)

local KaizoMenu = {
    engineActionList = {
        "~g~Allumer~s~",
        "~r~Éteindre~s~",
    },
    maxSpeedList = {
        "50",
        "80",
        "120",
        "130",
        "~r~Retirer~s~",
    },
    maxSpeedListIndex = 1,
    engineActionIndex = 1,
}


function isAllowedToManageVehicle()
    if IsPedInAnyVehicle(PlayerPedId(),false) then
        local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
        if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
            return true
        end
        return false
    end
    return false
end

function vehicleIsDamaged()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
    return GetVehicleEngineHealth(vehicle) < 1000
end

function ShowAboveRadarMessage(msg, flash, saveToBrief, hudColorIndex)
    ESX.ShowAdvancedNotification("NewLand", "Informations", msg, "CHAR_CALIFORNIA", 7, false, false, false)
end

function CheckQuantity(number)
  number = tonumber(number)

  if type(number) == 'number' then
    number = ESX.Math.Round(number)

    if number > 0 then
      return true, number
    end
  end

  return false, number
end

noobitogglueuif5 = true

function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
    AddTextEntry(entryTitle, textEntry)
    DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength)
  
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
      Citizen.Wait(0)
    end
  
    if UpdateOnscreenKeyboard() ~= 2 then
      local result = GetOnscreenKeyboardResult()
      Citizen.Wait(500)
      return result
    else
      Citizen.Wait(500)
      return nil
    end
  end

RegisterNetEvent('es:activateMoney')
AddEventHandler('es:activateMoney', function(money)
	  ESX.PlayerData.money = money
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
	for i=1, #ESX.PlayerData.accounts, 1 do
		if ESX.PlayerData.accounts[i].name == account.name then
			ESX.PlayerData.accounts[i] = account
			break
		end
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  ESX.PlayerData = xPlayer
end)

RegisterNetEvent('VMLife:Weapon_addAmmoToPedC')
AddEventHandler('VMLife:Weapon_addAmmoToPedC', function(value, quantity)
  local weaponHash = GetHashKey(value)

    if HasPedGotWeapon(PlayerPed, weaponHash, false) and value ~= 'WEAPON_UNARMED' then
        AddAmmoToPed(PlayerPed, value, quantity)
    end
end)

------------------------------------ Color Menu ------------------------------------------



local AllMenuToChange = nil
function ReloadColor()
    Citizen.CreateThread(function()
        if AllMenuToChange == nil then
            AllMenuToChange = {}
            for Name, Menu in pairs(RMenu['inventory']) do
                if Menu.Menu.Sprite.Dictionary == "commonmenu" then
                    table.insert(AllMenuToChange, Name)
                end
            end
        end
        for k,v in pairs(AllMenuToChange) do
            RMenu:Get('inventory', v):SetRectangleBanner(33,32,49)
            for name, menu in pairs(RMenu['inventory']) do
              RMenu:Get('inventory', name).TitleFont = 4
          end
        end
    end)
end

----------------------------------------------------------------------------------

menu = {
    ItemSelected = {},
    ItemSelected2 = {},
    WeaponData = {},
    Menu = false,
    Ped = PlayerPedId(),
    bank = nil,
    sale = nil,
    map = true,
    billing = {},
    visual = false,
    visual2 = false,
    visual3 = false,
    visual5 = false,
    visual6 = false,
    visual7 = false,
    visual8 = false,
    list2 = 1,
}


menu.V = {
    VehPed = GetVehiclePedIsIn(Ped, false),
    Get = GetVehiclePedIsUsing(Ped),
    agauche = false,
    argauche = false,
    adroite = false,
    ardroite = false,
    capot = false,
    test = false
}

-- local currentWeighte = 0
-- Citizen.CreateThread(function()
--     while true do 
--         local playerPed = PlayerPedId()
--         currentWeighte = 0s
--         if ESX.GetPlayerData() ~= nil then 
--             for k,v in ipairs(ESX.GetPlayerData().inventory) do
--                 if v.count > 0 then
--                     currentWeighte = currentWeighte + (v.weight * v.count)
--                 end
--             end
--         end

--         Citizen.Wait(2000)
--     end
-- end)

Citizen.CreateThread(function()
    while true do 
        local Ped = PlayerPedId()
        -- if ESX.GetPlayerData() ~= nil then 
        --     if currentWeighte >= ESX.GetPlayerData().maxWeight then 
        --         DisableControlAction(0,21,true)
        --         DisableControlAction(0,22,true)
        --         SetTextFont(0)
        --         SetTextProportional(1)
        --         SetTextScale(0.0, 0.3)
        --         SetTextColour(255, 0, 0, 255)
        --         SetTextDropshadow(0, 0, 0, 0, 255)
        --         SetTextEdge(1, 0, 0, 0, 255)
        --         SetTextDropShadow()
        --         SetTextOutline()
        --         SetTextEntry("STRING")
        --         AddTextComponentString("Vous êtes trop lourd vous ne pouvez pas courir")
        --         DrawText(0.36, 0.9)
        --     end    
        -- end

        KaizoUI.IsVisible(RMenu:Get('inventory', 'mainf5'), true, true, true, function() 


            KaizoUI.ButtonWithStyle("Portefeuille", nil, {RightLabel = "→→→"}, true, function(Hovered,Active,Selected)
            end, RMenu:Get('inventory', 'portefeuille'))
            
        if IsPedSittingInAnyVehicle(Ped) then
            KaizoUI.ButtonWithStyle("Gestion du véhicule", nil, {RightLabel = "→→→"}, true, function(Hovered,Active,Selected)
            end, RMenu:Get('inventory', 'voiture'))                       
            else
            KaizoUI.ButtonWithStyle('Gestion du véhicule', nil, {RightBadge = KaizoUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                    if (Selected) then
                        end 
                    end)
                end
                
            KaizoUI.ButtonWithStyle("Options", nil, {RightLabel = "→→→"}, true, function(Hovered,Active,Selected)
            end, RMenu:Get('inventory', 'divers'))

            KaizoUI.ButtonWithStyle("Visual", nil, {RightLabel = "→→→"}, true, function(Hovered, Active,Selected)
                end, RMenu:Get('inventory', 'visual'))

        end, function()
        end)

    ----------------------------------------------------------------------------------

    KaizoUI.IsVisible(RMenu:Get('inventory', 'portefeuille_money'), true, true, true, function()

        KaizoUI.ButtonWithStyle("Donner", nil, {RightBadge = KaizoUI.BadgeStyle.Lock}, true, function(Hovered,Active,Selected)--
            if Selected then
                for i = 1, #ESX.PlayerData.accounts, 1 do
                    if ESX.PlayerData.accounts[i].name == 'cash' then
                        local black, quantity = CheckQuantity(KeyboardInput("Somme d'argent que vous voulez donner", '', '', 1000))
                    if black then
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                    if closestDistance ~= -1 and closestDistance <= 3 then
                        local closestPed = GetPlayerPed(closestPlayer)
                        
                        if not IsPedSittingInAnyVehicle(closestPed) then
                            TriggerServerEvent('esx:giveInventoryItem', GetPlayerServerId(closestPlayer), 'item_account', ESX.PlayerData.accounts[i].name, quantity)
                            --KaizoUI.CloseAll()
                        else
                        ShowAboveRadarMessage(_U('Vous ne pouvez pas donner ', 'de l\'argent dans un véhicles'))
                        end
                    else
                    ESX.ShowAdvancedNotification("Moderny", "~y~Erreur", "~w~Aucun joueur proche de vous.", "CHAR_CALIFORNIA", 7, false, false, false)
                    end
                else
                ShowAboveRadarMessage('Somme invalid')
                end
                    end
                end
                
            end
        end)

            end)

    KaizoUI.IsVisible(RMenu:Get('inventory', 'voiture'), true, true, true, function()

        Ped = PlayerPedId()
        GetSourcevehicle = GetVehiclePedIsIn(Ped, false)

            KaizoUI.List("Action moteur", KaizoMenu.engineActionList, KaizoMenu.engineActionIndex, nil, {}, not engineCoolDown, function(h,a,s, Index)
                if s then        
                    if Index == 1 then
                        SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId(),false),true,true,false)
                    else
                        SetVehicleEngineOn(GetVehiclePedIsIn(PlayerPedId(),false),false,true,true)
                    end
                    engineCoolDown = true
                    Citizen.SetTimeout(1000, function()
                        engineCoolDown = false
                    end)
                end
    
                KaizoMenu.engineActionIndex = Index
            end)

            KaizoUI.List("Limiteur de vitesse", KaizoMenu.maxSpeedList, KaizoMenu.maxSpeedListIndex, nil, {}, true, function(h,a,s, Index)
                if s then        
                    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                    if Index == 1 then
                        SetVehicleMaxSpeed(vehicle, 13.7)
                    elseif Index == 2 then
                        SetVehicleMaxSpeed(vehicle, 22.0)
                    elseif Index == 3 then
                        SetVehicleMaxSpeed(vehicle, 33.0)
                    elseif Index == 4 then
                        SetVehicleMaxSpeed(vehicle, 36.0)
                    elseif Index == 5 then
                        SetVehicleMaxSpeed(vehicle, 0.0)
                    end
                end
    
                KaizoMenu.maxSpeedListIndex = Index
            end)

            KaizoUI.Separator("Extras")

                KaizoUI.List("Extra du véhicule", extraList, extraIndex, nil, {}, true, function(h,a,s, Index)
                    if s then
                        if isAllowedToManageVehicle() then
                            local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
                            if not vehicleIsDamaged() then
                                if Index == 1 then
                                    SetVehicleExtra(vehicle,1)
                                    ESX.Game.SetVehicleProperties(vehicle, {
                                        modFender = 0
                                    })
                                elseif Index == 2 then
                                    SetVehicleExtra(vehicle,2)
                                elseif Index == 3 then
                                    SetVehicleExtra(vehicle,3)
                                elseif Index == 4 then
                                    SetVehicleExtra(vehicle,4)
                                elseif Index == 5 then
                                    SetVehicleExtra(vehicle,5)
                                elseif Index == 6 then
                                    SetVehicleExtra(vehicle,6)
                                elseif Index == 7 then
                                    SetVehicleExtra(vehicle,7)
                                elseif Index == 8 then
                                    SetVehicleExtra(vehicle,8)
                                elseif Index == 9 then
                                    SetVehicleExtra(vehicle,9)
                                elseif Index == 10 then
                                    SetVehicleExtra(vehicle,10)
                                elseif Index == 11 then
                                    SetVehicleExtra(vehicle,11)
                                elseif Index == 12 then
                                    SetVehicleExtra(vehicle,12)
                                elseif Index == 13 then
                                    SetVehicleExtra(vehicle,13)
                                elseif Index == 14 then
                                    SetVehicleExtra(vehicle,14)
                                elseif Index == 15 then
                                    SetVehicleExtra(vehicle,15)
                                end
                            end
                        end
                    end
                    extraIndex = Index
                end)

                KaizoUI.ButtonWithStyle("Extra ~g~ON", nil, {}, not extraCooldown, function(_,_,s)
                    if s then
                        if isAllowedToManageVehicle() then
                            local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
                            if not vehicleIsDamaged() then
                                SetVehicleExtra(vehicle,extraIndex,0)
                                ESX.Game.SetVehicleProperties(vehicle, {
                                    modFender = 0
                                })
                                extraCooldown = true
                                Citizen.SetTimeout(150, function()
                                    extraCooldown = false
                                end)
                            else
                                ESX.ShowNotification("Ton véhicule est trop endommagé pour pouvoir y apporter des modificiations.")
                            end
                        end  
                    end
                end)

                KaizoUI.ButtonWithStyle("Extra ~r~OFF", nil, {}, not extraCooldown, function(_,_,s)
                    if s then
                        if isAllowedToManageVehicle() then
                            local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
                            if not vehicleIsDamaged() then
                                SetVehicleExtra(vehicle,extraIndex,1)
                                ESX.Game.SetVehicleProperties(vehicle, {
                                    modFender = 1
                                })
                                extraCooldown = true
                                Citizen.SetTimeout(150, function()
                                    extraCooldown = false
                                end)
                            else
                                ESX.ShowNotification("Ton véhicule est trop endommagé pour pouvoir y apporter des modificiations.")
                            end
                        end  
                    end
                end)

                KaizoUI.List("Tous les extras", {"~g~Activer~s~","~r~Désactiver~s~"}, extraStateIndex, nil, {}, not extraCooldown, function(h,a,s, Index)
                    if s then
                        if isAllowedToManageVehicle() then
                            local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
                            if not vehicleIsDamaged() then
                                if Index == 1 then
                                    for index,_ in pairs(extraList) do
                                        SetVehicleExtra(vehicle,index,0)
                                    end
                                else
                                    for index,_ in pairs(extraList) do
                                        SetVehicleExtra(vehicle,index,1)
                                    end
                                end
                                extraCooldown = true
                                Citizen.SetTimeout(150, function()
                                    extraCooldown = false
                                end)
                            else
                                ESX.ShowNotification("Ton véhicule est trop endommagé pour pouvoir y apporter des modificiations.")
                            end
                        end
                    end
                    extraStateIndex = Index
                end)

                KaizoUI.Separator("Portes")

            KaizoUI.ButtonWithStyle("Ouvrir/Fermer Avant Gauche", nil, {RightLabel = "→"}, true, function(Hovered,Active,Selected)
                if Selected then
                        SetVehicleDoorOpen(GetVehiclePedIsIn(Ped, false), 0, menu.V.agauche)
                            menu.V.agauche = not menu.V.agauche
                        end
                    end)
    
            KaizoUI.ButtonWithStyle("Ouvrir/Fermer Avant Droite", nil, {RightLabel = "→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    if not menu.V.adroite then
                        menu.V.adroite = true
                        SetVehicleDoorOpen(GetVehiclePedIsIn(Ped, false), 1, false, false)
                    elseif menu.V.adroite then
                        menu.V.adroite = false
                        SetVehicleDoorShut(GetVehiclePedIsIn(Ped, false), 1, false, false)
                        end
                    end
                end)
    
            KaizoUI.ButtonWithStyle("Ouvrir/Fermer Arrière Gauche", nil, {RightLabel = "→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    if not menu.V.argauche then
                        menu.V.argauche = true
                        SetVehicleDoorOpen(GetVehiclePedIsIn(Ped, false), 2, false, false)
                    elseif menu.V.argauche then
                        menu.V.argauche = false
                        SetVehicleDoorShut(GetVehiclePedIsIn(Ped, false), 2, false, false)
                        end
                    end
                end)
    
            KaizoUI.ButtonWithStyle("Ouvrir/Fermer Arrière Droite", nil, {RightLabel = "→"}, true, function(Hovered,Active,Selected)
                if Selected then
                    if not menu.V.ardroite then
                        menu.V.ardroite = true
                        SetVehicleDoorOpen(GetVehiclePedIsIn(Ped, false), 3, false, false)
                    elseif menu.V.ardroite then
                        menu.V.ardroite = false
                        SetVehicleDoorShut(GetVehiclePedIsIn(Ped, false), 3, false, false)
                        end
                    end
                end)
    
                KaizoUI.ButtonWithStyle("Ouvrir/Fermer Capot", nil, {RightLabel = "→"}, true, function(Hovered,Active,Selected) 
                    if Selected then
                        if not menu.V.capot then
                            menu.V.capot = true
                            SetVehicleDoorOpen(GetVehiclePedIsIn(Ped, false), 4, false, false)
                        elseif menu.V.capot then
                            menu.V.capot = false
                            SetVehicleDoorShut(GetVehiclePedIsIn(Ped, false), 4, false, false)
                            end
                        end
                    end)
    
                    KaizoUI.ButtonWithStyle("Ouvrir/Fermer Coffre", nil, {RightLabel = "→"}, true, function(Hovered,Active,Selected) 
                        if Selected then
                            if not menu.V.capot then
                                menu.V.capot = true
                                SetVehicleDoorOpen(GetVehiclePedIsIn(Ped, false), 5, false, false)
                            elseif menu.V.capot then
                                menu.V.capot = false
                                SetVehicleDoorShut(GetVehiclePedIsIn(Ped, false), 5, false, false)
                                end
                            end
                        end)                  
        end,function()
    end)

    ----------------------------------------------------------------------------------

    KaizoUI.IsVisible(RMenu:Get('inventory', 'portefeuille'), true, true, true, function()

        KaizoUI.Separator("Emploi ~c~→ ~b~" .. ESX.PlayerData.job.label .. "~s~ - ~b~" .. ESX.PlayerData.job.grade_label)
        KaizoUI.Separator("Gang/Orga ~c~→ ~b~" .. ESX.PlayerData.job2.label .. "~s~ - ~b~" .. ESX.PlayerData.job2.grade_label)


        for i = 1, #ESX.PlayerData.accounts, 1 do
            if ESX.PlayerData.accounts[i].name == 'cash' then
                KaizoUI.ButtonWithStyle('Liquide', description, {RightLabel = "~g~$"..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.."~s~ →")}, true, function(Hovered, Active, Selected) 
                    if (Selected) then 
                        end 
                    end, RMenu:Get('inventory', 'portefeuille_money'))
            end
        end

    for i = 1, #ESX.PlayerData.accounts, 1 do
        if ESX.PlayerData.accounts[i].name == 'bank'  then
            menu.bank = KaizoUI.ButtonWithStyle('Banque', description, {RightLabel = "~g~$"..ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money.."~s~")}, true, function(Hovered, Active, Selected) 
                if (Selected) then 
                        end 
                    end)

            end
        end
    end)

    -- ----------------------------------------------------------------------------------

    KaizoUI.IsVisible(RMenu:Get('inventory', 'divers'), true, true, true, function()

        KaizoUI.ButtonWithStyle('Personnage ID :', nil, {RightLabel = GetPlayerServerId(PlayerId())}, true, function() end)
    

        local ragdolling = false
        KaizoUI.ButtonWithStyle('Tomber / se relever', description, {RightLabel = "→"}, true, function(Hovered, Active, Selected) 
            if (Selected) then
                ragdolling = not ragdolling
                while ragdolling do
                 Wait(0)
                local myPed = PlayerPedId()
                SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
                ResetPedRagdollTimer(myPed)
                AddTextEntry(GetCurrentResourceName(), ('Appuyez sur ~INPUT_JUMP~ pour vous relever'))
                DisplayHelpTextThisFrame(GetCurrentResourceName(), false)
                ResetPedRagdollTimer(myPed)
                if IsControlJustPressed(0, 22) then 
                break
            end
        end
    end
end)

    end)

        KaizoUI.IsVisible(RMenu:Get('inventory', 'visual'), true, true, true, function()

            KaizoUI.Checkbox("Vue & lumières améliorées", description, menu.visual, {}, function(Hovered, Selected, Active, Checked) 
                if Selected then 
                    menu.visual = Checked
                    if not Checked then
                        SetTimecycleModifier('tunnel')
                    else
                        SetTimecycleModifier('')
                    end
                end 
            end)
    
            KaizoUI.Checkbox("Vue lumineux", description, menu.visual7, {}, function(Hovered, Selected, Active, Checked) 
                if Selected then 
                    menu.visual7 = Checked
                    if Checked then
                        SetTimecycleModifier('rply_vignette_neg')
                    else
                        SetTimecycleModifier('')
                    end
                end 
            end)
    
            KaizoUI.Checkbox("Couleurs amplifiées", description, menu.visual2, {}, function(Hovered, Selected, Active, Checked) 
                if Selected then 
                    menu.visual2 = Checked
                    if Checked then
                        SetTimecycleModifier('rply_saturation')
                    else
                        SetTimecycleModifier('')
                    end
                end 
            end)
    
            KaizoUI.Checkbox("Noir & blancs", description, menu.visual3, {}, function(Hovered, Selected, Active, Checked) 
                if Selected then 
                    menu.visual3 = Checked
                    if Checked then
                        SetTimecycleModifier('rply_saturation_neg')
                    else
                        SetTimecycleModifier('')
                    end
                end 
            end)
    
            KaizoUI.Checkbox("Visual 1", description, menu.visual5, {}, function(Hovered, Selected, Active, Checked) 
                if Selected then 
                    menu.visual5 = Checked
                    if Checked then
                        SetTimecycleModifier('yell_tunnel_nodirect')
                    else
                        SetTimecycleModifier('')
                    end
                end 
            end)
    
            KaizoUI.Checkbox("Blanc", description, menu.visual6, {}, function(Hovered, Selected, Active, Checked) 
                if Selected then 
                    menu.visual6 = Checked
                    if Checked then
                        SetTimecycleModifier('rply_contrast_neg')
                    else
                        SetTimecycleModifier('')
                    end
                end 
            end)
    
            KaizoUI.Checkbox("Dégats", description, menu.visual8, {}, function(Hovered, Selected, Active, Checked) 
                if Selected then 
                    menu.visual8 = Checked
                    if Checked then
                        SetTimecycleModifier('rply_vignette')
                    else
                        SetTimecycleModifier('')
                    end
                end 
            end)
        end,function()
        end)

        KaizoUI.IsVisible(RMenu:Get('inventory', 'papers'), true, true, true, function()
            KaizoUI.ButtonWithStyle(('~b~Montrer ~s~sa carte d\'identité'), nil, {}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                    if closestDistance ~= -1 and closestDistance <= 3.0 then
                        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer))
                    else
                        ESX.ShowNotification(('Aucun joueur à proximité'))
                    end
                end
            end)

            KaizoUI.ButtonWithStyle(('~b~Regarder ~s~sa carte d\'identité'), nil, {}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
                end
            end)

            KaizoUI.ButtonWithStyle(('~b~Montrer ~s~son permis de conduire'), nil, {}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                    if closestDistance ~= -1 and closestDistance <= 3.0 then
                        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'driver')
                    else
                        ESX.ShowNotification(('Aucun joueur à proximité'))
                    end
                end
            end)

            KaizoUI.ButtonWithStyle(('~b~Regarder ~s~son permis de conduire'), nil, {}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
                end
            end)

            KaizoUI.ButtonWithStyle(('~b~Montrer ~s~son PPA'), nil, {}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                    if closestDistance ~= -1 and closestDistance <= 3.0 then
                        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'weapon')
                    else
                        ESX.ShowNotification(('Aucun joueur à proximité'))
                    end
                end
            end)

            KaizoUI.ButtonWithStyle(('~b~Regarder ~s~son PPA'), nil, {}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                    if closestDistance ~= -1 and closestDistance <= 3.0 then
                        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
                    end
                end
            end)
            end,function()
            end)
                Wait(0)
    end
                    
end)

------------------------------------------- Ouverture du menu ---------------------------------------------------------

Keys.Register('F5', 'menuf5', 'Ouvrir le menu F5', function()
    if not open then
        KaizoUI.Visible(RMenu:Get('inventory', 'mainf5'), not KaizoUI.Visible(RMenu:Get('inventory', 'mainf5')))
    else
        KaizoUI.CloseAll()
    end

    open = not open
end)