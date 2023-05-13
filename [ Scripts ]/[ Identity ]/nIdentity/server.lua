ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('ozne:achetersacarte')
AddEventHandler('ozne:achetersacarte', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 100
    local xMoney = xPlayer.getAccount('cash').money
    local item = 'carteidentite'
    local carte = xPlayer.getInventoryItem(item).count

    if carte <=0 then    
        if xPlayer.getAccount('cash').money >= price then
					TriggerClientEvent('okokNotify:Alert', source, "Policier", "Paiement accepté , vous avez payer "..price.."$", 4000, 'success')
            xPlayer.removeAccountMoney('cash', price)
            xPlayer.addInventoryItem(item, 1)
        else
		TriggerClientEvent('okokNotify:Alert', source, "Policier", "Paiement refusé", 4000, 'error')
        end
    else
		TriggerClientEvent('okokNotify:Alert', source, "Policier", "Vous avez déjà une carte", 4000, 'error')
    end       

end)