ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("kPeche:AchatsItems")
AddEventHandler("kPeche:AchatsItems", function(item, name, price, types)
    if source then 
        local xPlayer = ESX.GetPlayerFromId(source)
        local item_in_inventory = xPlayer.getInventoryItem(item).count

        if xPlayer.getAccount('cash').money <= price then
            TriggerClientEvent("esx:showNotification", source, "Vous n'avez pas assez d'argent sur vous") 

        elseif item == "canne_a_peche" and item_in_inventory > 0 then
            TriggerClientEvent("esx:showNotification", source, "Vous avez déjà une "..name.." sur vous !") 

        else
            TriggerClientEvent("esx:showNotification", source, "Vous venez d'acheter un "..name.." pour "..ESX.Math.GroupDigits(price).."$ !")
            xPlayer.removeAccountMoney('cash', price)
            xPlayer.addInventoryItem(item, 1)

            if types then 
                TriggerEvent('esx_addonaccount:getSharedAccount', 'society_gouvernement', function(account)
                    societyAccount = account
                end) 
                societyAccount.addMoney(price) 
            end
        end       
    end
end)


RegisterServerEvent("kPeche:LouerBateau")
AddEventHandler("kPeche:LouerBateau", function(label, price)
    if source then 
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getAccount('cash').money <= price then
            TriggerClientEvent("esx:showNotification", source, "Vous n'avez pas assez d'argent sur vous") 

        else
            TriggerClientEvent("esx:showNotification", source, "Vous venez de louer un "..label.." pour "..ESX.Math.GroupDigits(price).."$ !")
            xPlayer.removeAccountMoney('cash', price)
        end       
    end
end)

RegisterServerEvent("kPeche:RetourLocation")
AddEventHandler("kPeche:RetourLocation", function(price_caution)

    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addMoney(price_caution)
    TriggerClientEvent("esx:showNotification", source, "Vous venez d'être rembourser de "..ESX.Math.GroupDigits(price_caution).."$ !") 

end)


RegisterServerEvent("kPeche:VentePoissons")
AddEventHandler("kPeche:VentePoissons", function(item, name, price)
    if source then 
        local xPlayer = ESX.GetPlayerFromId(source)
        local item_in_inventory = xPlayer.getInventoryItem(item).count
        local price_total = price * item_in_inventory

        if item_in_inventory > 0 then
            xPlayer.removeInventoryItem(item, item_in_inventory) 
            xPlayer.addMoney(price_total)
            TriggerClientEvent("esx:showNotification", source, "Vous venez de vendre "..item_in_inventory.." "..name.." pour une somme de "..ESX.Math.GroupDigits(price_total).."$ !") 
        else   
            TriggerClientEvent("esx:showNotification", source, "Vous n'avez rien à vendre !") 
        end
    end
end)
      
RegisterServerEvent("kPeche:BateauDetruit")
AddEventHandler("kPeche:BateauDetruit", function(price)
    if source then 
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.removeAccountMoney('cash', price)
        TriggerClientEvent("esx:showNotification", source, "Votre bateau vient d'être détruit, pour cela vous venez de payer une caution de ~r~"..ESX.Math.GroupDigits(price).."$ !") 
    
    end
end)
     

RegisterServerEvent("kPeche:RandomPoisson")
AddEventHandler("kPeche:RandomPoisson", function(item, count, name)
    
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent("esx:showNotification", source, "Vous venez de pêcher un "..name.." !")
    xPlayer.addInventoryItem(item, count)

end)

RegisterServerEvent("kPeche:UtilisationAppat")
AddEventHandler("kPeche:UtilisationAppat", function(xappats, number)
    
    appats = xappats
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(appats, number)

end)


ESX.RegisterServerCallback('kPeche:AssezCAP', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)
	local result = xPlayer.getInventoryItem('canne_a_peche').count
	if result >= 1 then 
		cb(true)
	else 
	 	cb(false)
	end
end)

ESX.RegisterServerCallback('kPeche:AssezAppats', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)
	local result = xPlayer.getInventoryItem('appats').count
	if result >= 1 then 
		cb(true)
	else 
	 	cb(false)
	end
end)


-- Illégale

RegisterServerEvent("kPeche:UtilisationAppatTortue")
AddEventHandler("kPeche:UtilisationAppatTortue", function(xappats, number)
    
    appats = xappats
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(appats, number)

end)

ESX.RegisterServerCallback('kPeche:AssezAppatsTortue', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)
	local result = xPlayer.getInventoryItem('appats_tortue').count
	if result >= 1 then 
		cb(true)
	else 
	 	cb(false)
	end
end)


ESX.RegisterServerCallback('kPeche:AssezTortues', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)
	local result = xPlayer.getInventoryItem('tortue').count
	if result >= 1 then 
		cb(true)
	else 
	 	cb(false)
	end
end)

RegisterServerEvent("kPeche:UtilisationAppatTortue")
AddEventHandler("kPeche:UtilisationAppatTortue", function(xappats, number)
    
    local xPlayer = ESX.GetPlayerFromId(source)
    local result = xPlayer.getInventoryItem('tortue').count
    xPlayer.removeInventoryItem(appats, number)

end)

RegisterServerEvent("kPeche:DebutVenteTortue")
AddEventHandler("kPeche:DebutVenteTortue", function()
    
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff'  then
			TriggerClientEvent('esx:showNotification', xPlayers[i], "Une vente de tortue est en cours !")
            TriggerClientEvent('kPeche:setBlip', xPlayers[i])
        end 
    end
        
    SetTimeout(15000, function()
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff'  then
				TriggerClientEvent('kPeche:deleteBlip', xPlayers[i])
            end 
        end
	end)
end)