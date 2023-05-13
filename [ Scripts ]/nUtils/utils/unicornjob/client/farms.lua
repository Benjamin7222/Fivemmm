ESX = nil

    TriggerEvent(Config.InitESX, function(obj) ESX = obj end)

-----Récoltes

local RecolteUni = false

local unireco = menu.CreateMenu('', 'Récolter du Unicorn :', 10, 10, 'commonmenu', 'interaction_bgd')
unireco.Closed = function() 
    RecolteUni = false
end

function OpenMenuRecolteUni()
    if RecolteUni then
        RecolteUni = false
    else
        RecolteUni = true
    menu.Visible(unireco, true)
        CreateThread(function()
            while RecolteUni do
                Wait(1)
                menu.IsVisible(unireco, function()
                    menu.Button(' Commencer la Récolte', nil, {}, not cooldawn, {
                        onSelected = function()
                            cooldawn = true
                            FreezeEntityPosition(GetPlayerPed(-1), true)
                            startrecolte()
                            SetTimeout(1000, function()
                                cooldawn = false
                            end)
                        end
                    })
                    menu.Button(' Arrêter la Récolte', nil, {}, true, {
                        onSelected = function()
                            FreezeEntityPosition(GetPlayerPed(-1), false)
                            stoprecolte()
                        end
                    })
                end)
            end
        end)
    end
end

-----Traitements

local TraiteUni = false

local unitrai = menu.CreateMenu('', 'Traitement du Unicorn :', 10, 10, 'commonmenu', 'interaction_bgd')
unitrai.Closed = function() 
    TraiteUni = false
end

function OpenMenuTraitementUni()
    if TraiteUni then
        TraiteUni = false
    else
        TraiteUni = true
    menu.Visible(unitrai, true)
        CreateThread(function()
            while TraiteUni do
                Wait(1)
                menu.IsVisible(unitrai, function()
                    menu.Button(' Commencer le Traitement', nil, {}, not cooldawn, {
                        onSelected = function()
                            cooldawn = true
                            FreezeEntityPosition(GetPlayerPed(-1), true)
                            starttraitement()
                            SetTimeout(1000, function()
                                cooldawn = false
                            end)
                        end
                    })
                    menu.Button(' Arrêter le Traitement', nil, {}, true, {
                        onSelected = function()
                            FreezeEntityPosition(GetPlayerPed(-1), false)
                            stoptraitement()
                        end
                    })
                end)
            end
        end)
    end
end

-----Ventes

local VenteUni = false

local univente = menu.CreateMenu('', 'Vente du Unicorn :', 10, 10, 'commonmenu', 'interaction_bgd')
univente.Closed = function() 
    VenteUni = false
end

function OpenMenuVenteUni()
    if VenteUni then
        VenteUni = false
    else
        VenteUni = true
    menu.Visible(univente, true)
        CreateThread(function()
            while VenteUni do
                Wait(1)
                menu.IsVisible(univente, function()
                    menu.Button(' Commencer la Vente', nil, {}, not cooldawn, {
                        onSelected = function()
                            cooldawn = true
                            FreezeEntityPosition(GetPlayerPed(-1), true)
                            startvente()
                            SetTimeout(1000, function()
                                cooldawn = false
                            end)
                        end
                    })
                    menu.Button(' Arrêter la Vente', nil, {}, true, {
                        onSelected = function()
                            FreezeEntityPosition(GetPlayerPed(-1), false)
                            stopvente()
                        end
                    })
                end)
            end
        end)
    end
end
