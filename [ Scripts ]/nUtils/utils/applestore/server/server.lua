ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('kaizoshop:BuyPhone')
AddEventHandler('kaizoshop:BuyPhone', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 100
    local xMoney = xPlayer.getAccount('cash').money
    if xMoney >= price then
	
		xPlayer.removeAccountMoney('cash', price)
        xPlayer.addInventoryItem('phone', 1)
        TriggerClientEvent('esx:showNotification', source, "Vous avez acheter votre Téléphone")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez d\'argent")
    end
end)


RegisterNetEvent('kaizoshop:BuyRadio')
AddEventHandler('kaizoshop:BuyRadio', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 25
    local xMoney = xPlayer.getAccount('cash').money
    if xMoney >= price then
	
		xPlayer.removeAccountMoney('cash', price)
        xPlayer.addInventoryItem('radio', 1)
        TriggerClientEvent('esx:showNotification', source, "Vous avez acheter votre Radio")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez d\'argent")
    end
end)

