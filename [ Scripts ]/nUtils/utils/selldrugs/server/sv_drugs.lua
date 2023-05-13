ESX = nil
TriggerEvent('esx:getSharedObject', function(a)
	ESX = a 
end)

RegisterServerEvent("cDrugs:SellDrugs")
AddEventHandler("cDrugs:SellDrugs", function(item, label, money, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    if item ~= nil then 
        xPlayer.removeInventoryItem(item, count)
        xPlayer.addAccountMoney('dirtycash', money)

        TriggerClientEvent("esx:showNotification", source, "Vous avez vendu x"..count.." "..label.." pour "..money.."$.")
    end
end)

ESX.RegisterServerCallback("cDrugs:getPlayerInventory", function(source, cb, target)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if targetXPlayer ~= nil then
		cb({inventory = targetXPlayer.inventory})
	else
		cb(nil)
	end
end)

RegisterServerEvent('cDrugs:saleInProgress')
AddEventHandler('cDrugs:saleInProgress', function(streetName, playerGender)
	if playerGender == 0 then
		playerGender = 'Female'
	else
		playerGender = 'Male'
	end

	TriggerClientEvent('cDrugs:policeNotify', -1, 'Drug deal in progress: A ' .. playerGender .. ' has been spotted selling drugs at ' .. streetName)
end)