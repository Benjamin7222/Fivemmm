ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)


----------------------Coiffeur

-----Prix

RegisterNetEvent('kaizo:coiffeur')
AddEventHandler('kaizo:coiffeur', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 50
    local xMoney = xPlayer.getAccount('cash').money

    if xMoney >= price then
        xPlayer.removeAccountMoney('cash', price)
        TriggerClientEvent('esx:showNotification', source, "Tu as payé le coiffeur")
        TriggerClientEvent("kaizo:saveSkin", source)
    else
        TriggerClientEvent('esx:showNotification', source, "Il vous manque "..price-xMoney.."$ !")
    end
end)
