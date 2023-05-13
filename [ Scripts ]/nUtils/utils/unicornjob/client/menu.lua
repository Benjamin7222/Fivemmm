ESX = nil

    TriggerEvent(Config.InitESX, function(obj) ESX = obj end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)

function RefreshPlayerDataUni()
    CreateThread(function()
        Wait(10000)
        ESX.PlayerData = ESX.GetPlayerData()
    end)
end

local labelService = 'Prendre son service'

local MenuUni = false

local uniF6 = menu.CreateMenu('', 'Menu Intéraction :', 10, 10, 'commonmenu', 'interaction_bgd')
local annonce = menu.CreateSubMenu(uniF6, '', 'Annonce Unicorn :', 10, 10, 'commonmenu', 'interaction_bgd')
local farm = menu.CreateSubMenu(uniF6, '', 'Point de Farm Unicorn :', 10, 10, 'commonmenu', 'interaction_bgd')
uniF6.Closed = function()
    MenuUni = false
end

function OpenMenuUniF6()
    if MenuUni then
        MenuUni = false
    else 
        MenuUni = true
    menu.Visible(uniF6, true)
        CreateThread(function()
            while MenuUni do
                Wait(1)
                menu.IsVisible(uniF6, function()
                    menu.Checkbox(''..labelService, nil, OnService, {}, {
                        onChecked = function()
                            OnService = true
                            labelService = 'Terminer son service'
                        end,
                        onUnChecked = function()
                            OnService = false
                            labelService = 'Prendre son service'
                        end
                    })

                    if OnService then
                        menu.Button('Annonces', nil, {}, true, {}, annonce)
                        menu.Button('Points de Farms', nil, {}, true, {}, farm)
                    end
                end)

                menu.IsVisible(annonce, function()
                    menu.Button('Anonce ~g~Ouverture~s~', nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent('Barwoz:annonceUni', 'Le Unicorn est désormais OUVERT !')
                        end
                    })
                    menu.Button('Anonce ~r~Fermeture~s~', nil, {}, true, {
                        onSelected = function()
                            TriggerServerEvent('Barwoz:annonceUni', 'Le Unicorn est désormais FERMER !')
                        end
                    })
                    menu.Button('Anonce ~o~Personalisé~s~', nil, {}, true, {
                        onSelected = function()
                            local txtperso = KeyboardInput('Ecrire un Message si-dessou :', '', 99)
                            TriggerServerEvent('Barwoz:annonceUni', txtperso)
                        end
                    })
                end)

                menu.IsVisible(farm, function()
                
                    menu.Button('Point de Récolte', nil, {}, true, {
                        onSelected = function()
                            SetNewWaypoint(137.90, -3110.81, 5.89)
                        end
                    })

                    menu.Button('Point de Traitement', nil, {}, true, {
                        onSelected = function()
                            SetNewWaypoint(-51.05, 1901.11, 195.36)
                        end
                    })

                    menu.Button('Point de Vente', nil, {}, true, {
                        onSelected = function()
                            SetNewWaypoint(-708.36, -904.75, 19.21)
                        end
                    })

                    menu.Button('Points des Courses', nil, {}, true, {
                        onSelected = function()
                            SetNewWaypoint(1085.19, -2289.46, 30.22)
                        end
                    })
                end)
            end
        end)
    end
end

Keys.Register(Config.Control, Config.Control, 'Ouvrir Menu F6 Unicorn', function()
    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'unicorn' then
        if MenuUni == false then
            OpenMenuUniF6()
        end
    end
end)

CreateThread(function()
    Wait(10)
    while true do 
        local interval = 250
        local coord = GetEntityCoords(PlayerPedId())
        RefreshPlayerDataUni()
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'unicorn' then
            for k, v in pairs(Config.MarkerUni) do
                    local dist = GetDistanceBetweenCoords(coord, v.position, true)
                    if dist < 5 then 
                        interval = 1
                        if v.marker then 
                            DrawMarker(22, v.position.x, v.position.y, v.position.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.4, 0.4, 0.4, v.color.r, v.color.g, v.color.b, v.color.a, 55555, false, true, 2, false, false, false, false)
                        end
                        if dist < 1.5 then 
                            Visual.Subtitle(v.help)
                            if IsControlJustPressed(1,51) then 
                                RefreshPlayerDataUni()
                                v.interact()
                            end 
                        end 
                    end 
                end
            end
        Wait(interval)
    end 
end)