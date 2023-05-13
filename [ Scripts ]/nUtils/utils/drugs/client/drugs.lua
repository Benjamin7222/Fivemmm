
inLaboratories = false 

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
    DrugsHandler.Functions.GetUser()
    DrugsHandler.Functions.GetLabos()
    DrugsHandler.Functions.OwnedBlips()
end)

InteractDrugMenu = menu.CreateMenu("", "Intéractions disponibles")
InteractListDrugMenu = menu.CreateSubMenu(InteractDrugMenu, "", "Laboratoires disponibles")
InteractDrugMenu.Closed = function()  
    menu.Visible(InteractDrugMenu, false) 
    menu.Visible(InteractListDrugMenu, false) 
    DrugsHandler.MenuIsOpen = false
    FreezeEntityPosition(PlayerPedId(), false)
end 

local enteringCooldown = false 

RegisterNetEvent("Laboratories:OpenInteractMenu")
AddEventHandler("Laboratories:OpenInteractMenu", function(drugsData, identifier)
    DrugsHandler.LaboData = drugsData
    if DrugsHandler.MenuIsOpen then 
        DrugsHandler.MenuIsOpen = false 
        menu.Visible(InteractDrugMenu,false)
    else
        DrugsHandler.MenuIsOpen = true 
        menu.Visible(InteractDrugMenu, true)
        CreateThread(function()
            while DrugsHandler.MenuIsOpen do 
                FreezeEntityPosition(PlayerPedId(), true)
                menu.IsVisible(InteractDrugMenu, function()
                    local pCoords = GetEntityCoords(PlayerPedId())
                    for i = 1, #DrugsHandler.LaboData do 
                        if DrugsHandler.LaboData[i].owner == identifier then 
                            DrugsHandler.LaboData[i].exiting = pCoords
                            menu.Separator("↓ ~g~Laboratoire de "..string.lower(DrugsHandler.LaboData[i].type).." n°"..DrugsHandler.LaboData[i].id.."~s~ ↓")
                            menu.Button("Entrer dans votre laboratoire", false, {RightLabel = "→"}, true, {
                                onSelected = function()
                                    if not enteringCooldown then 
                                        enteringCooldown = true 
                                        TriggerServerEvent("Laboratories:EnteringLaboratories", DrugsHandler.LaboData[i].id, DrugsHandler.LaboData[i].type, DrugsHandler.LaboData[i].value)
                                        SetTimeout(450, function()
                                            enteringCooldown = false
                                        end)
                                    end
                                end
                            })
                        end
                    end   
                    menu.Button("Liste des laboratoires", false, {RightLabel = "→"}, true, {}, InteractListDrugMenu)         
                end)
                menu.IsVisible(InteractListDrugMenu, function()
                    menu.Separator("↓ ~g~Liste des laboratoire(s)~s~ ↓")
                    for i = 1, #DrugsHandler.LaboData do 
                        if DrugsHandler.LaboData[i].owner ~= identifier then 
                            DrugsHandler.LaboData[i].exiting = pCoords
                            menu.Button("Entrer dans le laboratoire "..DrugsHandler.LaboData[i].id, false, {RightLabel = "→"}, true, {
                                onSelected = function()
                                    local password = DrugsHandler.Functions.Input("Password", "Mot de passe :", "", 20)
                                    password = tonumber(password)
                                    if password == DrugsHandler.LaboData[i].password then 
                                        if not enteringCooldown then 
                                            enteringCooldown = true 
                                            TriggerServerEvent("Laboratories:EnteringIntoOtherLaboratories", DrugsHandler.LaboData[i].id, DrugsHandler.LaboData[i].type, DrugsHandler.LaboData[i].value)
                                            SetTimeout(450, function()
                                                enteringCooldown = false
                                            end)
                                        end
                                    else
                                        ESX.ShowNotification("Mot de passe invalide.")
                                    end 
                                end
                            })
                        end
                    end   
                end)
                Wait(1)
            end
        end)
    end
end)

local currentUsing = nil
local WaitingForUpgrade = false 
local laboId = nil 

ComputerMenu = menu.CreateMenu("", "Intéractions disponibles")
ComputerBuySuppliesMenu = menu.CreateSubMenu(ComputerMenu, "", "Matières disponibles")
ComputerUpgradeMenu = menu.CreateSubMenu(ComputerMenu, "", "Améliorations disponibles")
ComputerGestionMenu = menu.CreateSubMenu(ComputerMenu, "", "Intéractions disponibles")
ComputerStorageMenu = menu.CreateSubMenu(ComputerMenu, "", "Intéractions disponibles")
ComputerDepositMenu = menu.CreateSubMenu(ComputerStorageMenu, "", "Objets disponibles")
ComputerWithdrawMenu = menu.CreateSubMenu(ComputerStorageMenu, "", "Objets disponibles")
ComputerUpgradeSubMenu = menu.CreateSubMenu(ComputerUpgradeMenu, "", "Améliorations disponibles")
ComputerMenu.Closed = function()  
    menu.Visible(ComputerMenu, false)
    menu.Visible(ComputerUpgradeMenu, false) 
    menu.Visible(ComputerGestionMenu, false) 
    menu.Visible(ComputerUpgradeSubMenu, false)  
    DrugsHandler.MenuIsOpen = false
    FreezeEntityPosition(PlayerPedId(), false)
    currentUsing, WaitingForUpgrade, laboId = nil, false, nil
end 
ComputerUpgradeSubMenu.Closed = function()
    currentUsing, WaitingForUpgrade, laboId = nil, false, nil
end


RegisterNetEvent("Laboratories:OpenComputerMenu")
AddEventHandler("Laboratories:OpenComputerMenu", function(yourIdentifier)
    local isLocked = false 
    if DrugsHandler.MenuIsOpen then 
        DrugsHandler.MenuIsOpen = false 
        menu.Visible(ComputerMenu,false)
    else
        DrugsHandler.MenuIsOpen = true 
        menu.Visible(ComputerMenu, true)
        refreshInventory()
        getData()
        CreateThread(function()
            while DrugsHandler.MenuIsOpen do 
                FreezeEntityPosition(PlayerPedId(), true)
                menu.IsVisible(ComputerMenu, function()
                    menu.Button("Achat de matières premières", false, {RightLabel = "→"}, true, {}, ComputerBuySuppliesMenu)
                    menu.Button("Améliorations du laboratoire", "Vous permez d'ajoutés des exclusivités à votre laboratoire.", {RightLabel = "→"}, true, {},ComputerUpgradeMenu)
                    menu.Button("Gestion du laboratoire", "Vous permez différentes actions sur votre laboratoire.", {RightLabel = "→"}, true, {},ComputerGestionMenu)
                    menu.Button("Stockage du laboratoire", "Vous permez de déposer des objets en sécurité, hors de votre inventaire.", {RightLabel = "→"}, true, {},ComputerStorageMenu)
                end)
                menu.IsVisible(ComputerBuySuppliesMenu, function()
                    for i = 1, #DrugsHandler.LaboData do 
                        local labo = DrugsHandler.LaboData[i]
                        local production = labo.production
                        for t = 1, #production do 
                            if production[t] ~= 1 then 
                                isLocked = true 
                            end
                        end
                        for k,v in pairs(DrugsHandler.Supplies[labo.type]) do
                            if isLocked == false then 
                                menu.Button(v.name, v.desc, {RightLabel = ("Prix : ~g~%s$"):format(v.price)}, true, {
                                    onSelected = function()
                                        TriggerServerEvent("Laboratories:BuySupplies", labo.id, labo.type, v.price, production, labo.data)
                                    end
                                })
                            else
                                menu.Button("Matière premières", "Certains de vos terrains sont encore occupés.", {}, false, {})
                            end
                        end
                    end
                end)
                menu.IsVisible(ComputerUpgradeMenu, function()
                    menu.Separator("↓ ~g~Améliorations~s~ ↓")
                    for i = 1, #DrugsHandler.LaboData do 
                        local labo = DrugsHandler.LaboData[i]
                        for k,v in pairs(DrugsHandler.Upgrades[labo.type]) do 
                            menu.Button(catName(k), false, {RightLabel = "→"}, true, {
                                onSelected = function()
                                    currentUsing = k
                                    Wait(180)
                                    ComputerUpgradeSubMenu:SetTitle(catName(k))
                                    WaitingForUpgrade = true
                                end
                            },ComputerUpgradeSubMenu)
                        end
                    end
                end)
                menu.IsVisible(ComputerUpgradeSubMenu, function()
                    if WaitingForUpgrade == true then 
                        for i = 1, #DrugsHandler.LaboData do 
                            local labo = DrugsHandler.LaboData[i]
                            local int = labo.data.interiorStatus
                            for k,v in pairs(DrugsHandler.Upgrades[labo.type][currentUsing]) do 
                                if currentUsing ~= "details" then 
                                    if int == v.value then 
                                        menu.Button(v.name, "Vous possèdez déjà ceci.", {RightLabel = "→"}, false, {})
                                    else
                                        menu.Button(v.name, v.desc, {RightLabel = ("Prix : %s.0 ~g~$"):format(v.price)}, true, {
                                            onSelected = function()
                                                TriggerServerEvent("Laboratories:UpgradeLaboratories", currentUsing, v.value, v.price, labo.type, labo.id, labo.data)
                                            end
                                        })
                                    end
                                else
                                    menu.Button(v.name, v.desc, {RightLabel = ("Prix : %s.0 ~g~$"):format(v.price)}, true, {
                                        onSelected = function()
                                            TriggerServerEvent("Laboratories:UpgradeLaboratories", currentUsing, v.value, v.price, labo.type, labo.id, labo.data)
                                        end
                                    }) 
                                end
                            end
                        end
                    end
                end)
                menu.IsVisible(ComputerGestionMenu, function()
                    menu.Separator("↓ ~o~Gestion du laboratoire~s~ ↓")
                    for i = 1, #DrugsHandler.LaboData do 
                        local data = DrugsHandler.LaboData[i]
                        menu.Button(("État du laboratoire ( %s )"):format(labName(data.data.interiorStatus)), false, {}, true, {})
                        menu.Button(("Code du laboratoire - ~B~%s~s~"):format(data.password), false, {}, true, {})
                        if data.owner == yourIdentifier then 
                            menu.Button("Changer le code du laboratoire", false, {}, true, {
                                onSelected = function()
                                    local newPassword = DrugsHandler.Functions.Input("newPassword", "Veuillez indiquer le nouveau mot de passe", "", 4)
                                    if newPassword ~= "" or newPassword ~= nil then 
                                        newPassword = tonumber(newPassword)
                                        if type(newPassword) == "number" then 
                                            TriggerServerEvent("Laboratories:changePassword", data.id, newPassword)
                                        end
                                    end
                                end
                            })
                            menu.Button("~B~Révoquer votre laboratoire~s~", "Attention cette action est irréversible.", {RightBadge = menu.BadgeStyle.Alert}, true, {
                                onSelected = function()
                                    TriggerServerEvent("Laboratories:DeleteLaboratories", data.id, data.type, data.value)
                                    ComputerMenu.Closed()
                                end
                            })
                        end
                    end
                end)
                menu.IsVisible(ComputerStorageMenu, function()
                    menu.Button("Déposer dans le stockage", false, {RightLabel = "→"}, true, {
                        onSelected = function()
                            getData()
                        end
                    },ComputerDepositMenu)
                    menu.Button("Retirer du stockage", false, {RightLabel = "→"}, true, {
                        onSelected = function()
                            getData()
                        end
                    },ComputerWithdrawMenu)
                end)
                menu.IsVisible(ComputerDepositMenu, function()
                    for _, item in pairs(ESX.PlayerData.inventory) do
                        if item.count > 0 then
                            menu.Button(("%s - [~B~%s~s~]"):format(item.label, item.count), false , {RightLabel = "~B~Déposer~s~ →"}, true, {
                                onSelected = function()
                                    local DepositAmount = DrugsHandler.Functions.Input("DepositAmount", "Combien souhaitez-vous déposer ?", "", 3)
                                    if DepositAmount ~= "" or DepositAmount ~= nil then 
                                        DepositAmount = tonumber(DepositAmount)
                                        if type(DepositAmount) == "number" then 
                                            TriggerServerEvent("Laboratories:DepositItems", laboId, DataStorage, item.name, DepositAmount)
                                            Wait(250)
                                            getData()
                                            refreshInventory()
                                        end
                                    end
                                end
                            })
                        end
                    end
                end)
                menu.IsVisible(ComputerWithdrawMenu, function()
                    for k,v in pairs (DrugsHandler.LaboData) do 
                        for t,b in pairs (v.storage) do 
                            menu.Button(("%s - [~B~%s~s~]"):format(b.label, b.count), false , {RightLabel = "~B~Retirer~s~ →"}, true, {
                                onSelected = function()
                                    local WithdrawAmount = DrugsHandler.Functions.Input("WithdrawAmount", "Combien souhaitez-vous retirer ?", "", 3)
                                    if WithdrawAmount ~= "" or WithdrawAmount ~= nil then 
                                        WithdrawAmount = tonumber(WithdrawAmount)
                                        if type(WithdrawAmount) == "number" then 
                                            TriggerServerEvent("Laboratories:WithdrawItems", v.id, v.storage, t, WithdrawAmount)
                                            Wait(250)
                                            getData()
                                            refreshInventory()
                                        end
                                    end
                                end
                            })
                        end
                    end
                end)
                Wait(1)
            end
        end)
    end
end)

getData = function()
    DataStorage = {}
    for i = 1, #DrugsHandler.LaboData do 
        laboId = DrugsHandler.LaboData[i].id
        DataStorage = DrugsHandler.LaboData[i].storage
    end
end