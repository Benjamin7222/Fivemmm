
local AmmuItem = {
    {name = 'weapon_bat', label = 'Batte de Baseball', price = 3000},
    {name = 'weapon_knuckle', label = 'Poing Américain', price = 3000},
    {name = 'weapon_knife', label = 'Couteau', price = 1500},
}

local MunitionsItem = {
    {name = 'clip', label = 'Chargeur', price = 180},
}

function AmmuNation()
        local menu = RageUI.CreateMenu("", "Articles disponibles :")

        RageUI.Visible(menu, not RageUI.Visible(menu))

        while menu do
            Wait(0)
            RageUI.IsVisible(menu, function()

            RageUI.Button('Armes blanche', nil, {RightLabel = ">"}, true, {
                onSelected = function()
                    OpenArmeBlanche()
                end
            })
            RageUI.Button('Munitions', nil, {RightLabel = ">"}, true, {
                onSelected = function()
                    OpenMunitions()
                end
            })
            end, function()
            end)

            if not RageUI.Visible(menu) then
                menu = RMenu:DeleteType('menu', true)
            end
        end
end

function OpenArmeBlanche()
    local menu = RageUI.CreateMenu("", "Articles disponibles :")

    RageUI.Visible(menu, not RageUI.Visible(menu))

    while menu do
        Wait(0)
        RageUI.IsVisible(menu, function()
        for k,v in pairs(AmmuItem) do
            RageUI.Button(v.label, nil, {RightLabel = "~g~".. v.price.."$"}, true, {
                onSelected = function()
                    OpenMenuPaiement(v.name, v.price)
                end
            })
        end
        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
        end
    end
end

function OpenMunitions()
    local menu = RageUI.CreateMenu("", "Articles disponibles :")

    RageUI.Visible(menu, not RageUI.Visible(menu))

    while menu do
        Wait(0)
        RageUI.IsVisible(menu, function()
        for k,v in pairs(MunitionsItem) do
            RageUI.Button(v.label, nil, {RightLabel = "~g~".. v.price.."$"}, true, {
                onSelected = function()
                    OpenMenuPaiement(v.name, v.price)
                end
            })
        end
        end, function()
        end)

        if not RageUI.Visible(menu) then
            menu = RMenu:DeleteType('menu', true)
        end
    end
end

RegisterNetEvent('esx_clip:clipcli')
AddEventHandler('esx_clip:clipcli', function()
  ped = PlayerPedId()
  if IsPedArmed(ped, 4) then
    hash=GetSelectedPedWeapon(ped)
    if hash~=nil then
      TriggerServerEvent('esx_clip:remove')
      AddAmmoToPed(PlayerPedId(), hash,25)
      ESX.ShowNotification("Tu as utilisé un chargeur !")
    else
      ESX.ShowNotification("Tu n'as pas d'arme en main !")
    end
  else
    ESX.ShowNotification("Vous n'avez pas d'arme en main !")
  end
end)