
LTDItem = {
    {name = 'bread', label = 'Pain', price = 10},
    {name = 'water', label = 'Bouteille d\'eau', price = 10},
}



function OpenMenuLtd()
    local menu = RageUI.CreateMenu("", "Articles disponibles :")

    RageUI.Visible(menu, not RageUI.Visible(menu))

    while menu do
        Wait(0)
        RageUI.IsVisible(menu, function()

        for k,v in pairs(LTDItem) do
            RageUI.Button(v.label, nil, {RightLabel = "~g~".. v.price.."$"}, true, {
                onSelected = function()
                    OpenMenuPaiement(v.name, v.price)
                end
            })
        end
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
        end
    end
end

function OpenMenuPaiement(item, price)
    local menu = RageUI.CreateMenu("", "Comment voulez vous payer ?")

    RageUI.Visible(menu, not RageUI.Visible(menu))

    while menu do
        Wait(0)
        RageUI.IsVisible(menu, function()

        RageUI.Button('Payer en Liquide', nil, {}, true, {
            onSelected = function()
                RageUI.CloseAll()
                TriggerServerEvent('core:achat', item, price, 1)
            end
        })
        RageUI.Button('Payer par Carte Bancaire', nil, {}, true, {
            onSelected = function()
                RageUI.CloseAll()
                TriggerServerEvent('core:achat', item, price, 2)
            end
        })

        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
        end
    end
end