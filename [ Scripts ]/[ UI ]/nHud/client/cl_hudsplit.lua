
local ped, id, position, streetName, zone, zoneLabel, _sleep
local mostrar = true

RegisterNetEvent('zHudSplit:updateStatus')
AddEventHandler('zHudSplit:updateStatus', function(status)
	SendNUIMessage({action = "updateStatus", status = status})
end)

AddEventHandler('playerSpawned', function()
    while true do 
    if mostrar and not IsPauseMenuActive() then 
        _sleep = 2000
        ped = PlayerPedId()
        id = GetPlayerServerId(PlayerId())
        position = GetEntityCoords(ped)
        streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(position.x, position.y, position.z))
        zone = GetNameOfZone(position.x, position.y, position.z)
        zoneLabel = GetLabelText(zone)
        local data = ESX.GetPlayerData()
        local money, bank = 0, 0
        for i = 1, #data.accounts do 
            if data.accounts[i].name == 'cash' then 
                money = data.accounts[i].money
            elseif data.accounts[i].name == 'bank' then
                bank = data.accounts[i].money
            end
        end

        SendNUIMessage({
            show = true;
            coche = true;
            s1 = streetName;
            s2 = zoneLabel;
            food = food;
            thirst = agua;
            showmoney = true;
            money = money;
        })
    else
        SendNUIMessage({
            show = false;
        })
    end

        Citizen.Wait(_sleep)
    end
end)

RegisterCommand(Config.CommandHud, function ()
    if mostrar then 
         mostrar = false
         DisplayRadar(false)
    else 
        mostrar = true
        DisplayRadar(true)
    end
end)

if Config.UseHudKey then 
    RegisterKeyMapping(Config.CommandHud, 'Show/Hide the HUD', 'keyboard', Config.HudKey)
end

RegisterNUICallback("exit" , function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({
        font = false;
    })
end)