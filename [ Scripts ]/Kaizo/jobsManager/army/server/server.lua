TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_society:registerSociety', 'lsarmy', 'lsarmy', 'society_lsarmy', 'society_lsarmy', 'society_lsarmy', {type = 'public'})


-- Coffre

ESX.RegisterServerCallback('lsarmy:playerinventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory
	local all_items = {}
	
	for k,v in pairs(items) do
		if v.count > 0 then
			table.insert(all_items, {label = v.label, item = v.name,nb = v.count})
		end
	end

	cb(all_items)

	
end)


ESX.RegisterServerCallback('lsarmy:getStockItems', function(source, cb)
	local all_items = {}
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_lsarmy', function(inventory)
		for k,v in pairs(inventory.items) do
			if v.count > 0 then
				table.insert(all_items, {label = v.label,item = v.name, nb = v.count})
			end
		end

	end)
	cb(all_items)
end)
RegisterServerEvent('lsarmy:putStockItems')
AddEventHandler('lsarmy:putStockItems', function(source, itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)
	local item_in_inventory = xPlayer.getInventoryItem(itemName).count

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_lsarmy', function(inventory)
		if item_in_inventory >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "- Dépot\n- Item : "..itemName.."\n- Quantitée : "..count.."")
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, "Vous n'en avez pas assez sur vous")
		end
	end)
end)
RegisterServerEvent('lsarmy:takeStockItems')
AddEventHandler('lsarmy:takeStockItems', function(source, itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_lsarmy', function(inventory)
			xPlayer.addInventoryItem(itemName, count)
			inventory.removeItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "- Retrait\n- Item : "..itemName.."\n- Quantitée : "..count.."")
	end)
end)




-- Boss
RegisterServerEvent('lsarmy:withdrawMoney')
AddEventHandler('lsarmy:withdrawMoney', function(source, society, amount, money_soc)
	local xPlayer = ESX.GetPlayerFromId(source)
	local src = source
  
	TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
	  if account.money >= tonumber(amount) then
		  xPlayer.addMoney(amount)
		  account.removeMoney(amount)
		  TriggerClientEvent("esx:showNotification", src, "- Retiré \n- Somme : "..amount.."$")
	  else
		  TriggerClientEvent("esx:showNotification", src, "- L'entreprise \n- Pas assez d'argent")
	  end
	end)
	  
end)
RegisterServerEvent('lsarmy:depositMoney')
AddEventHandler('lsarmy:depositMoney', function(source, society, amount)

	local xPlayer = ESX.GetPlayerFromId(source)
	local money = xPlayer.getAccount("cash").money
	local src = source
  
	TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
	  if money >= tonumber(amount) then
		xPlayer.removeAccountMoney('cash', amount)
		  account.addMoney(amount)
		  TriggerClientEvent("esx:showNotification", src, "- Déposé \n- Somme : "..amount.."$")
	  else
		  TriggerClientEvent("esx:showNotification", src, "- Erreur \n- Pas assez d'argent")
	  end
	end)
	
end)

ESX.RegisterServerCallback('lsarmy:getSocietyMoney', function(source, cb, soc)
	local money = nil
		MySQL.Async.fetchAll('SELECT * FROM addon_account_data WHERE account_name = @society ', {
			['@society'] = soc,
		}, function(data)
			for _,v in pairs(data) do
				money = v.money
			end
			cb(money)
		end)
end)

--- Prise de service

function sendToDiscordWithSpecialURL(name,message,color,url)
    local DiscordWebHook = url
	local embeds = {
		{
			["title"]=message,
			["type"]="rich",
			["color"] =color,
			["footer"]=  {
			["text"]= "LS.Experience armée",
			},
		}
	}
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(cfg_armeeWebhookRendezVousArmee, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

RegisterNetEvent('lsarmy:prisedeservice')
AddEventHandler('lsarmy:prisedeservice', function()
	local _src = source
	local xPlayer = ESX.GetPlayerFromId(_src)
	sendToDiscordWithSpecialURL("Prise de service",xPlayer.getName().." à prise son service", 16744192, cfg_armeeWebhookRendezVousArmee)
end)

RegisterNetEvent('lsarmy:quitteleservice')
AddEventHandler('lsarmy:quitteleservice', function()
	local _src = source
	local xPlayer = ESX.GetPlayerFromId(_src)
	sendToDiscordWithSpecialURL("Fin de service",xPlayer.getName().." à quitter son service", 16744192, cfg_armeeWebhookRendezVousArmee)
end)

-- Infos lsarmy
RegisterServerEvent('lsarmy:PriseEtFinservice')
AddEventHandler('lsarmy:PriseEtFinservice', function(PriseOuFin)
	local _source = source
	local _raison = PriseOuFin
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local name = xPlayer.getName(_source)

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'lsarmy' then
			TriggerClientEvent('lsarmy:InfoService', xPlayers[i], _raison, name)
		end
	end
end)

-- Renfort

RegisterServerEvent('renfort')
AddEventHandler('renfort', function(coords, raison)
	local _source = source
	local _raison = raison
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	for i = 1, #xPlayers, 1 do
		local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
		if thePlayer.job.name == 'lsarmy' then
			TriggerClientEvent('renfort:setBlip', xPlayers[i], coords, _raison)
		end
	end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---- FOUILLE ----
-----------------

RegisterNetEvent('lsarmy:confiscatePlayerItem')
AddEventHandler('lsarmy:confiscatePlayerItem', function(target, itemType, itemName, amount)
    local _source = source
    local sourceXPlayer = ESX.GetPlayerFromId(_source)
    local targetXPlayer = ESX.GetPlayerFromId(target)

    if itemType == 'item_standard' then
        local targetItem = targetXPlayer.getInventoryItem(itemName)
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)
		
			targetXPlayer.removeInventoryItem(itemName, amount)
			sourceXPlayer.addInventoryItem(itemName, amount)
            TriggerClientEvent("esx:showNotification", source, "Vous avez volé "..amount..' '..sourceItem.label..".")
            TriggerClientEvent("esx:showNotification", target, "Il t'a été volé "..amount..' '..sourceItem.label..".")
        else
			--TriggerClientEvent("esx:showNotification", source, "quantité invalide")
		end
        
    if itemType == 'item_account' then
        targetXPlayer.removeAccountMoney(itemName, amount)
        sourceXPlayer.addAccountMoney   (itemName, amount)
        
        TriggerClientEvent("esx:showNotification", source, "Vous avez volé "..amount.."€ Argent sale.")
        TriggerClientEvent("esx:showNotification", target, "Il t'a été volé "..amount.."€ Argent sale.")
        
    elseif itemType == 'item_weapon' then
        if amount == nil then amount = 0 end
        targetXPlayer.removeWeapon(itemName, amount)
        sourceXPlayer.addWeapon   (itemName, amount)

        TriggerClientEvent("esx:showNotification", source, "Vous avez volé "..ESX.GetWeaponLabel(itemName).." avec "..amount.." munitions.")
        TriggerClientEvent("esx:showNotification", target, "Il t'a été volé "..ESX.GetWeaponLabel(itemName).." avec "..amount.." munitions.")
    end
end)


ESX.RegisterServerCallback('lsarmy:getOtherPlayerData', function(source, cb, target, notify)
    local xPlayer = ESX.GetPlayerFromId(target)

    TriggerClientEvent("esx:showNotification", target, "Tu es fouillé...")

    if xPlayer then
        local data = {
            name = xPlayer.getName(),
            job = xPlayer.job.label,
            grade = xPlayer.job.grade_label,
            inventory = xPlayer.getInventory(),
            accounts = xPlayer.getAccounts(),
            weapons = xPlayer.getLoadout()
        }

        cb(data)
    end
end)

RegisterServerEvent('lsarmy:drag')
AddEventHandler('lsarmy:drag', function(target)
  local _source = source
  TriggerClientEvent('lsarmy:drage', target, _source)
end)

RegisterServerEvent('lsarmy:putInVehicle')
AddEventHandler('lsarmy:putInVehicle', function(target)
	local _source = source
  TriggerClientEvent('lsarmy:putInVehiclee', target, _source)
end)

RegisterServerEvent('lsarmy:OutVehicle')
AddEventHandler('lsarmy:OutVehicle', function(target)
    TriggerClientEvent('lsarmy:OutVehicle', target)
end)

-- Ppa

RegisterNetEvent('donner:ppa')
AddEventHandler('donner:ppa', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 2500
    local xMoney = xPlayer.getAccount("cash").money
	local societyAccount

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_lsarmy', function(account)
        societyAccount = account
	end)


            if price < societyAccount.money then

					societyaccount.removeMoney(price)

    else
        TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez d\'argent dans votre société")
end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---- FOUILLE ----
-----------------

ESX.RegisterServerCallback('lsarmy:getOtherPlayerData', function(source, cb, target)
	local xPlayer = ESX.GetPlayerFromId(target)

	TriggerClientEvent("esx:showAdvancedNotification", target, "Vous êtes en train de vous faire fouiller.", 5000, "Attention")

	if xPlayer then
		local data = {
			inventory = xPlayer.getInventory(),
			accounts = xPlayer.getAccounts(),
			weapons = xPlayer.getLoadout()
		}

		cb(data)
	end
end)


ESX.RegisterServerCallback('esx_armeejob:getOtherPlayerData', function(source, cb, target)
	local xPlayer = ESX.GetPlayerFromId(target)

	MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		local data = {
			name = GetPlayerName(target),
			job = xPlayer.job,
			job2 = xPlayer.job2,
			inventory = xPlayer.inventory,
			accounts = xPlayer.accounts,
			weapons = xPlayer.loadout,
			firstname = result[1]['firstname'],
			lastname = result[1]['lastname'],
			sex = result[1]['sex'],
			dob = result[1]['dateofbirth'],
			height = result[1]['height']
		}
	
		TriggerEvent('esx_license:getLicenses', target, function(licenses)
			if licenses ~= nil then
				data.licenses = licenses
			end
		end)
	
		cb(data)
	end)
end)


RegisterNetEvent('lsarmy:confiscatePlayerItem')
AddEventHandler('lsarmy:confiscatePlayerItem', function(target, itemType, itemName, amount)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	if itemType == 'item_standard' then
		local targetItem = targetXPlayer.getInventoryItem(itemName)
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)
		local inv = xPlayer.getInventory()

		for i=1, #inv, 1 do
			if inv[i].label == itemName then 
				if targetItem.count > 0 and targetItem.count <= amount then

					targetXPlayer.removeInventoryItem(itemName, amount)
					sourceXPlayer.addInventoryItem(itemName, amount)
				end
			else 
				TriggerClientEvent("esx:showNotification", sourceXPlayer, "Ce joueur ne possède plus cet objet désolé :/.")
			end
		end

	elseif itemType == 'item_account' then
		local acc = xPlayer.getAccounts()
		for i=1, #acc, 1 do
			if acc[i].name == 'dirtycash' and acc[i].money == amount then
				targetXPlayer.removeAccountMoney(itemName, amount)
				sourceXPlayer.addAccountMoney(itemName, amount)
			else 
				TriggerClientEvent("esx:showNotification", sourceXPlayer, "Ce joueur ne possède plus cet objet désolé :/.")
			end
		end

	elseif itemType == 'item_weapon' then
		if amount == nil then amount = 0 end
		local weapons = xPlayer.getLoadout()
		for i=1, #weapons, 1 do
			if weapons[i].name == itemName then 
				targetXPlayer.removeWeapon(itemName, amount)
				sourceXPlayer.addWeapon(itemName, amount)
			else 
				TriggerClientEvent("esx:showNotification", sourceXPlayer, "Ce joueur ne possède plus cette arme désolé :/.")
			end
		end
	end
	--TriggerEvent('Logger:SendToDiscordIfPossible', 'lsarmy-confiscate', false, 0, GetPlayerName(source), itemName, amount, GetPlayerName(target));

end)


-- Plaque

ESX.RegisterServerCallback('lsarmy:getVehicleInfos', function(source, cb, plate)

	MySQL.Async.fetchAll('SELECT owner, vehicle FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)

		local retrivedInfo = {
			plate = plate
		}

		if result[1] then
			MySQL.Async.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier',  {
				['@identifier'] = result[1].owner
			}, function(result2)

				retrivedInfo.owner = result2[1].firstname .. ' ' .. result2[1].lastname

				retrivedInfo.vehicle = json.decode(result[1].vehicle)

				cb(retrivedInfo)

			end)
		else
			cb(retrivedInfo)
		end
	end)
end)

-- Facture

RegisterNetEvent("lsarmy:SendFacture")
AddEventHandler("lsarmy:SendFacture", function(target, price)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_lsarmy', function(account)
        if account ~= nil then
			societyAccount = account
			local xPlayer = ESX.GetPlayerFromId(target)
			xPlayer.removeAccountMoney('bank', price)
			societyAccount.addMoney(price)
			TriggerClientEvent("esx:showNotification", target, "Votre compte en banque à été réduit de "..price.."e.")
			TriggerClientEvent("esx:showNotification", source, "Vous avez donné une amende de "..price.."e")
		end
	end)
end)