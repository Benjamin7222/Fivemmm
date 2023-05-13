ESX = nil

    TriggerEvent(Config.InitESX, function(obj) ESX = obj end)

local melangeUni = false

local UniCokt = menu.CreateMenu('', 'Faire un coktail Unicorn :', 10, 10, 'commonmenu', 'interaction_bgd')
UniCokt.Closed = function()
    melangeUni = false
end

function OpenMenuCocktailUni()
    if melangeUni then
        melangeUni = false
    else
        melangeUni = true
    menu.Visible(UniCokt, true)
        CreateThread(function()
            while melangeUni do
                Wait(1)
                menu.IsVisible(UniCokt, function()
                    for k,v in pairs(Config.Cocktail) do
                        menu.Button(' '..v.label, ''..v.desc, {RightLabel = '~g~'..v.price..'~s~ $'}, true, {
                            onSelected = function()
                                TriggerServerEvent('barwoz:MakedUni', v.name, v.i1, v.i2, v.i3, v.i4, v.i5)
                            end
                        })
                    end
                end)
            end
        end)
    end
end