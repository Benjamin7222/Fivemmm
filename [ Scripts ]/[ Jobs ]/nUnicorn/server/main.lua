ESX = nil

    TriggerEvent(Config.InitESX, function(obj) ESX = obj end)

----------------------MenuF6
-----Annonce

RegisterServerEvent('Barwoz:annonceUni')
AddEventHandler('Barwoz:annonceUni', function(announce)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
        local xPlayers = ESX.GetPlayers()
        for i = 1, #xPlayers, 1 do
            local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
            TriggerClientEvent("esx:showAdvancedNotification", xPlayers[i], 'Unicorn', 'Unicorn', announce, 'CHAR_STRIPPER_CHEETAH', 8)
        end
end)


-----Recruter

RegisterServerEvent('barwoz:recruterUni')
AddEventHandler('barwoz:recruterUni', function(target, grade2)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob = sourceXPlayer.getJob()

	if sourceJob.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)

		targetXPlayer.setJob(sourceJob.name, 0)
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, ('Vous avez recruté %s.'):format(targetXPlayer.name))
		TriggerClientEvent('esx:showNotification', target, ('Vous avez été embauché par %s.'):format(sourceXPlayer.name))
	end
end)

-----Virer

RegisterServerEvent('barwoz:virerUni')
AddEventHandler('barwoz:virerUni', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	if sourceXPlayer.job.grade_name == 'boss' and sourceXPlayer.job.name == targetXPlayer.job.name then
		targetXPlayer.setJob('unemployed', 0)
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez viré ' .. targetXPlayer.name .. '.')
		TriggerClientEvent('esx:showNotification', target, 'Vous avez été viré par ' .. sourceXPlayer.name .. '.')
	else
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas l\'autorisation.')
	end
end)

-----Promouvoir

RegisterServerEvent('barwoz:promouvoirUni')
AddEventHandler('barwoz:promouvoirUni', function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	if (targetXPlayer.job.grade == tonumber(getMaximumGrade(sourceXPlayer.job.name)) - 1) then
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous devez demander une autorisation du Gouvernement.')
	else
		if sourceXPlayer.job.grade_name == 'boss' and sourceXPlayer.job.name == targetXPlayer.job.name then
			targetXPlayer.setJob(targetXPlayer.job.name, tonumber(targetXPlayer.job.grade) + 1)
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez promu ' .. targetXPlayer.name .. '.')
			TriggerClientEvent('esx:showNotification', target, 'Vous avez été promu par ' .. sourceXPlayer.name .. '.')
		else
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas l\'autorisation.')
		end
	end
end)

----------------------Farms
-----Récoltes

RegisterServerEvent('barwoz:recolteUnicorn')
AddEventHandler('barwoz:recolteUnicorn', function()
	local item = 'bottle'
	local limititem = 30
	local xPlayer = ESX.GetPlayerFromId(source)
	local nbiteminventory = xPlayer.getInventoryItem(item).count

	if nbiteminventory >= limititem then
		TriggerClientEvent('esx:showNotification', source, "Tu n'as plus de place dans ton inventaire !")
	else
		xPlayer.addInventoryItem(item, 1)
		TriggerClientEvent('esx:showNotification', source, "Récolte de Bouteilles Vides en cours...")
	end
end)

-----Traitement

RegisterServerEvent('barwoz:traitementUnicorn')
AddEventHandler('barwoz:traitementUnicorn', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local bouteil = xPlayer.getInventoryItem('bottle').count
    local bouteil_pleine = xPlayer.getInventoryItem('ginmonkey').count

	if bouteil_pleine >= 30 then
		TriggerClientEvent('esx:showNotification', source, "Tu n'as plus de place dans ton inventaire !")
	elseif bouteil < 2 then
		TriggerClientEvent('esx:showNotification', source, "Tu n'as plus assez de bouteilles pour les remplir d'Alcool!")
	else
		xPlayer.removeInventoryItem('bottle', 2)
		xPlayer.addInventoryItem('ginmonkey', 1)
		TriggerClientEvent('esx:showNotification', source, "Remplissage des Bouteilles en cours...")
	end
end)

-----Vente

RegisterServerEvent('barwoz:venteUnicorn')
AddEventHandler('barwoz:venteUnicorn', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local bouteil_pleine = xPlayer.getInventoryItem('ginmonkey').count

	if bouteil_pleine < 0 then
		TriggerClientEvent('esx:showNotification', source, "Tu n'as plus assez de bouteilles à Vendre !")
	else
		xPlayer.removeInventoryItem('ginmonkey', 1)
		TriggerEvent('esx_addonaccount:getSharedAccount', "society_unicorn", function(account)
			account.addMoney("200")
		  end)
		xPlayer.addMoney('50')
		TriggerClientEvent('esx:showNotification', source, "Vente d'Eau en cours...")
	end
end)

----------------------Bar
-----Buy

RegisterServerEvent('barwoz:buyUni')
AddEventHandler('barwoz:buyUni', function(object, money, nbitem)
	local item = object
	local price = money
	local count = nbitem

	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_unicorn', function(account)
		account_unicorn = account
	end)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_unicorn', function(inventory)
		inventory_unicorn = inventory
	end)
		if account_unicorn.money >= price then
			inventory_unicorn.addItem(item, count)
			account_unicorn.removeMoney(price*count)
			TriggerClientEvent('esx:showNotification', source, 'Achat en Cours ...')
		else
			TriggerClientEvent('esx:shownotification', source, 'L\'entreprise n\'a pas assez d\'argent pour acheter ce-ci !')
		end
end)

-----Maked

RegisterServerEvent('barwoz:MakedUni')
AddEventHandler('barwoz:MakedUni', function(object, object1, object2, object3, object4, object5)
	local item_donnate = object
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_unicorn', function(inventory)
		inventory_unicorn = inventory
	end)

	local item1 = inventory_unicorn.getItem(object1)
	local item2 = inventory_unicorn.getItem(object2)
	local item3 = inventory_unicorn.getItem(object3)
	local item4 = inventory_unicorn.getItem(object4)
	local item5 = inventory_unicorn.getItem(object5)

		if item1.count >= 1 then 
			if item2.count >= 1 then 
				if item3.count >= 1 then 
					if item4.count >= 1 then 
						if item5.count >= 1 then 
							xPlayer.addInventoryItem(item_donnate, 1)
							inventory_unicorn.removeItem(object1, 1)
							inventory_unicorn.removeItem(object2, 1)
							inventory_unicorn.removeItem(object3, 1)
							inventory_unicorn.removeItem(object4, 1)
							inventory_unicorn.removeItem(object5, 1)
							TriggerClientEvent('esx:showNotification', source, 'Préparation en Cours ...')
						else
							TriggerClientEvent('esx:showNotification', source, 'L\'entreprise n\'a plus assez de '..object5..' !')
						end
					else
						TriggerClientEvent('esx:showNotification', source, 'L\'entreprise n\'a plus assez de '..object4..' !')
					end
				else
					TriggerClientEvent('esx:showNotification', source, 'L\'entreprise n\'a plus assez de '..object3..' !')
				end
			else
				TriggerClientEvent('esx:showNotification', source, 'L\'entreprise n\'a plus assez de '..object2..' !')
			end
		else
			TriggerClientEvent('esx:showNotification', source, 'L\'entreprise n\'a plus assez de '..object1..' !')
		end
end)

----------------------Coffre
-----Get Unicorn

ESX.RegisterServerCallback('barwoz:getStockItems', function(source, cb)
	local all_items = {}
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_unicorn', function(inventory)
		for k,v in pairs(inventory.items) do
			if v.count > 0 then
				table.insert(all_items, {label = v.label, item = v.name, nb = v.count})
			end
		end

	end)
	cb(all_items)
end)

-----Prendre

RegisterServerEvent('barwoz:takeStockItems')
AddEventHandler('barwoz:takeStockItems', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_unicorn', function(inventory)
			xPlayer.addInventoryItem(itemName, count)
			inventory.removeItem(itemName, count)
	end)
end)

-----Déposer

RegisterNetEvent('barwoz:putStockItems')
AddEventHandler('barwoz:putStockItems', function(itemName, count, society)
	local _src = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_unicorn', function(inventory)
		local inventoryItem = inventory.getItem(itemName)

		if sourceItem.count >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showAdvancedNotification', _src, 'Coffre', 'Informations', 'Vous avez déposé '..inventoryItem.label.." x"..count, 'CHAR_MP_FM_CONTACT', 8)
		else
			TriggerClientEvent('esx:showAdvancedNotification', _src, 'Coffre', 'Informations', "Quantité invalide", 'CHAR_MP_FM_CONTACT', 9)
		end
	end)
end)