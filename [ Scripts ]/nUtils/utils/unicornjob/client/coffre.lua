ESX = nil

    TriggerEvent(Config.InitESX, function(obj) ESX = obj end)

local CoffreUni = false

all_items = {}

local trunk = menu.CreateMenu('', 'Coffre du Unicorn', 10, 10, 'commonmenu', 'interaction_bgd')
local stockplayer = menu.CreateSubMenu(trunk, "", "Voici votre ~y~inventaire", 10, 10, 'commonmenu', 'interaction_bgd')
local stockunicorn = menu.CreateSubMenu(trunk, "", "Voici ~y~l'inventaire~s~ du Unicorn", 10, 10, 'commonmenu', 'interaction_bgd')
trunk.Closed = function() 
    CoffreUni = false 
end

function OpenMenuTrunkUnicorn()
    if CoffreUni then
        CoffreUni = false
    else
        CoffreUni = true

        menu.Visible(trunk, true)
            CreateThread(function()
                while CoffreUni do 
                    Wait(1)
                    menu.IsVisible(trunk, function()

                        menu.Separator('↓ ~p~Déposer~s~ ↓')
                        menu.Button(" Déposer Objets !", nil, {RightLabel = ""}, true, {}, stockplayer)
                        menu.Separator('↓ ~p~Prendre~s~ ↓')
                        menu.Button(" Prendre Objets !", nil, {RightLabel = ""}, true, {
                            onSelected = function()
                                getStockUni()
                            end
                        }, stockunicorn)

                end)

                menu.IsVisible(stockplayer, function()
                    ESX.PlayerData = ESX.GetPlayerData()
                    for k, v in pairs(ESX.PlayerData.inventory) do
                        if v.count >= 1 then
                                    menu.Button("~o~→~s~ "..v.label, nil, {RightLabel = v.count}, true, {
                                        onSelected = function()
                                                local cbDeposer = KeyboardInput("Combien ?", '' , 15)
                                                TriggerServerEvent('barwoz:putStockItems', v.name, tonumber(cbDeposer), societe)
                                        end
                                    })
                        end
                    end
                end)

                menu.IsVisible(stockunicorn, function()
                    for k,v in pairs(all_items) do

                        menu.Button(v.label, nil, {RightLabel = "~g~x"..v.nb}, true, {
                            onSelected = function()
                                local count = KeyboardInput("Combien voulez vous en déposer",nil,4)
                                count = tonumber(count)
                                if count <= v.nb then
                                    TriggerServerEvent("barwoz:takeStockItems",v.item, count)
                                else
                                    ESX.ShowNotification("~r~Vous n'en avez pas assez sur vous")
                                end
                                getStockUni()
                            end
                        })
                    end
                end)
            end
        end)
    end
end

function getStockUni()
    ESX.TriggerServerCallback('barwoz:getStockItems', function(inventory)               
        all_items = inventory        
    end)
end