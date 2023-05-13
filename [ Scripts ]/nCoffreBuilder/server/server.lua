ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local society = nil

local data = {}
local function getCoffre()
    MySQL.Async.fetchAll("SELECT * FROM coffre_builder", {}, function(result)
        if (result) then
            data = result
        end
    end)
end

ESX.RegisterServerCallback('pawal:verifrankstaff', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local group = xPlayer.getGroup()
	cb(group)
end)


RegisterServerEvent("pawal:creationcoffre")
AddEventHandler("pawal:creationcoffre", function(nomcoffre, poscoffre, society, job, activationpropre, activationsale, armeactivation, objetactivation)
    if activationpropre == "yes" then
       propreactivation = 1
    else
       propreactivation = 0
    end

    if activationsale == "yes" then
        saleactivation = 1
    else
        saleactivation = 0
    end

    if armeactivation == "yes" then
        weaponactivation = 1
    else
        weaponactivation = 0
    end

    if objetactivation == "yes" then
        itemactivation = 1
    else
        itemactivation = 0
    end

    MySQL.Async.execute("INSERT INTO coffre_builder (position, namecoffre, society, job, argentpropreactivation, argentsaleactivation, armeactivation, objetactivation) VALUES (@position, @namecoffre, @society, @job, @argentpropreactivation, @argentsaleactivation, @armeactivation, @objetactivation)", 	
        {
            ['@position'] = json.encode(poscoffre),
            ['@namecoffre'] = nomcoffre,
            ['@society'] = society,
            ['@job'] = job,
            ['@argentpropreactivation'] = propreactivation,
            ['@argentsaleactivation'] = saleactivation,
            ['@armeactivation'] = weaponactivation,
            ['@objetactivation'] = itemactivation,
        })
end)

RegisterServerEvent("pawal:setsocietyserveur")
AddEventHandler("pawal:setsocietyserveur", function(societyselection)
   society = societyselection
end)

RegisterServerEvent("pawal:modificationcoffre")
AddEventHandler("pawal:modificationcoffre", function(idcoffremodification, coffrePosmodification, nomcoffremodification, societycoffremodification, jobcoffremodification, argentpropreactivation, argentsaleactivation, objetactivation, armeactivation)
    if argentpropreactivation == "yes" then
        argentpropreactivation = 1
     else
        argentpropreactivation = 0
     end
 
     if argentsaleactivation == "yes" then
        argentsaleactivation = 1
     else
        argentsaleactivation = 0
     end

     if armeactivation == "yes" then
        armeactivation = 1
     else
        armeactivation = 0
     end

     if objetactivation == "yes" then
        objetactivation = 1
     else
        objetactivation = 0
     end
    
    MySQL.Async.execute("UPDATE coffre_builder SET `position` = @position, `namecoffre` = @namecoffre, `society` = @society, `job` = @job , `argentpropreactivation` = @argentpropreactivation , `argentsaleactivation` = @argentsaleactivation , `objetactivation` = @objetactivation , `armeactivation` = @armeactivation  WHERE id = @id ",{
        ['@position'] = json.encode(coffrePosmodification),
        ['@id'] = idcoffremodification,
		['@namecoffre'] = nomcoffremodification,
        ['@society'] = societycoffremodification,
        ['@job'] = jobcoffremodification,
        ['@argentpropreactivation'] = argentpropreactivation,
        ['@argentsaleactivation'] = argentsaleactivation,
        ['@objetactivation'] = objetactivation,
        ['@armeactivation'] = armeactivation,
	})
    TriggerEvent("esx_addonaccount:refreshAccounts")
    TriggerEvent("esx_addoninventory:refreshAddonInventory")
    TriggerEvent("esx_datastore:refreshDatastore")
    
end)

RegisterServerEvent("pawal:modificationcoffrenoposition")
AddEventHandler("pawal:modificationcoffrenoposition", function(idcoffremodification, nomcoffremodification, societycoffremodification, jobcoffremodification, argentpropreactivation, argentsaleactivation, objetactivation, armeactivation)
    if argentpropreactivation == "yes" then
        argentpropreactivation = 1
     else
        argentpropreactivation = 0
     end
 
     if argentsaleactivation == "yes" then
        argentsaleactivation = 1
     else
        argentsaleactivation = 0
     end

     if armeactivation == "yes" then
        armeactivation = 1
     else
        armeactivation = 0
     end

     if objetactivation == "yes" then
        objetactivation = 1
     else
        objetactivation = 0
     end
    
    MySQL.Async.execute("UPDATE coffre_builder SET `namecoffre` = @namecoffre, `society` = @society, `job` = @job , `argentpropreactivation` = @argentpropreactivation , `argentsaleactivation` = @argentsaleactivation , `objetactivation` = @objetactivation , `armeactivation` = @armeactivation WHERE id = @id ",{
        ['@id'] = idcoffremodification,
		['@namecoffre'] = nomcoffremodification,
        ['@society'] = societycoffremodification,
        ['@job'] = jobcoffremodification,
        ['@argentpropreactivation'] = argentpropreactivation,
        ['@argentsaleactivation'] = argentsaleactivation,
        ['@objetactivation'] = objetactivation,
        ['@armeactivation'] = armeactivation,
	})
    TriggerEvent("esx_addonaccount:refreshAccounts")
    TriggerEvent("esx_addoninventory:refreshAddonInventory")
    TriggerEvent("esx_datastore:refreshDatastore")
    
end)

RegisterServerEvent("pawal:suppressioncoffre")
AddEventHandler("pawal:suppressioncoffre", function(idcoffremodification, moneyCount)
    MySQL.Async.execute('DELETE from coffre_builder WHERE id = @id', {['@id'] = idcoffremodification})  
    TriggerEvent("esx:refreshJobs")
    TriggerEvent("esx_addonaccount:refreshAccounts")
    TriggerEvent("esx_addoninventory:refreshAddonInventory")
    TriggerEvent("esx_datastore:refreshDatastore")
end)

RegisterServerEvent("pawal:admingivemoneysale")
AddEventHandler("pawal:admingivemoneysale", function(id, moneyCount)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xMoney = xPlayer.getMoney()
    MySQL.Async.fetchAll('SELECT * FROM coffre_builder WHERE id = @id', {
        ['@id'] = id,
    }, function(data)    
        for k, v in pairs(data) do   
    
            MySQL.Async.execute("UPDATE coffre_builder SET amountsale = @amountsale WHERE id = @id", {
                ["id"] = id,
                ["amountsale"] = v.amountsale + moneyCount
            })
                TriggerClientEvent("esx:showNotification", _src, "~g~Vous avez déposé "..moneyCount.."$ d'argent sale")     
         end
        end) 
end)

RegisterServerEvent("pawal:adminremovemoneysale")
AddEventHandler("pawal:adminremovemoneysale", function(id, moneyCount)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xMoney = xPlayer.getMoney()
    MySQL.Async.fetchAll('SELECT * FROM coffre_builder WHERE id = @id', {
        ['@id'] = id,
    }, function(data)    
        for k, v in pairs(data) do   
         if ESX.Math.Round(tonumber(v.amountsale)) >= moneyCount then
            MySQL.Async.execute("UPDATE coffre_builder SET amountsale = @amountsale WHERE id = @id", {
                ["id"] = id,
                ["amountsale"] = v.amountsale - moneyCount
            })
                TriggerClientEvent("esx:showNotification", _src, "~g~Vous avez retirer "..moneyCount.."$ d'argent sale")   
        else
            TriggerClientEvent("esx:showNotification", _src, "~r~Action impossible")   
         end    
        end
    end) 
end)

RegisterServerEvent("pawal:adminremovemoneypropre")
AddEventHandler("pawal:adminremovemoneypropre", function(id, moneyCount)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xMoney = xPlayer.getMoney()
    MySQL.Async.fetchAll('SELECT * FROM coffre_builder WHERE id = @id', {
        ['@id'] = id,
    }, function(data)    
        for k, v in pairs(data) do   
            if ESX.Math.Round(tonumber(v.amountpropre)) >= moneyCount then
            MySQL.Async.execute("UPDATE coffre_builder SET amountpropre = @amountpropre WHERE id = @id", {
                ["id"] = id,
                ["amountpropre"] = v.amountpropre - moneyCount
            })
                TriggerClientEvent("esx:showNotification", _src, "~g~Vous avez retirer "..moneyCount.."$ d'argent propre")     
        else
            TriggerClientEvent("esx:showNotification", _src, "~r~Action impossible")   
        end
         end
        end) 
end)

RegisterServerEvent("pawal:admingivemoneypropre")
AddEventHandler("pawal:admingivemoneypropre", function(id, moneyCount)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xMoney = xPlayer.getMoney()
    MySQL.Async.fetchAll('SELECT * FROM coffre_builder WHERE id = @id', {
        ['@id'] = id,
    }, function(data)    
        for k, v in pairs(data) do   
    
            MySQL.Async.execute("UPDATE coffre_builder SET amountpropre = @amountpropre WHERE id = @id", {
                ["id"] = id,
                ["amountpropre"] = v.amountpropre + moneyCount
            })
                TriggerClientEvent("esx:showNotification", _src, "~g~Vous avez déposé "..moneyCount.."$ d'argent propre")     
         end
        end) 
end)

ESX.RegisterServerCallback('pawal:récupérationstockitem', function(source, cb)
	local all_items = {}
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerEvent('esx_addoninventory:getSharedInventory', society, function(inventory)
		for k,v in pairs(inventory.items) do
			if v.count > 0 then
				table.insert(all_items, {label = v.label,item = v.name, nb = v.count})
			end
		end

	end)
	cb(all_items)
end)

RegisterServerEvent('pawal:suppressionobjet')
AddEventHandler('pawal:suppressionobjet', function(itemName, itemLabel, count, namecoffreselection)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', society, function(inventory)
			inventory.removeItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "~g~Vous venez de retirer x"..count.." "..itemLabel..' du coffre '..namecoffreselection)
	end)
end)

RegisterServerEvent('pawal:ajoutobjet')
AddEventHandler('pawal:ajoutobjet', function(itemName, itemLabel, count, coffrename)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', society, function(inventory)
        local inventoryItem = inventory.getItem(itemName)
			inventory.addItem(itemName, count) 
			TriggerClientEvent('esx:showNotification', xPlayer.source, "~g~Vous venez d'ajouter x"..count.." "..inventoryItem.label.." dans le coffre "..coffrename)
	end)
end)

ESX.RegisterServerCallback('pawal:ajoutarme', function(source, cb, weaponName, society)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getSharedDataStore', society, function(store)
		local weapons = store.get('weapons') or {}
		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].label = weaponLabel
				weapons[i].count = weapons[i].count + 1
				foundWeapon = true
				break
			end
		end
		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 1
			})
		end
		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('pawal:suppressionarme', function(source, cb, weaponName, society)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerEvent('esx_datastore:getSharedDataStore', society, function(store)
		local weapons = store.get('weapons') or {}
		local foundWeapon = false
		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
				foundWeapon = true
				break
			end
		end
		if not foundWeapon then
			table.insert(weapons, {name = weaponName, count = 0}) 
		end
		store.set('weapons', weapons)
		cb()
	end)
end)
---------------------------------------------------------------------------------------------------


ESX.RegisterServerCallback("pawal:coffrelist", function(source, cb)
    local coffrelist =  {}
        MySQL.Async.fetchAll('SELECT * FROM coffre_builder', {
        }, function(data)
            for k, v in pairs(data) do
                table.insert(coffrelist, {id = v.id, position = v.position, namecoffre = v.namecoffre, society = v.society, job = v.job, argentsaleactivation = v.argentsaleactivation, argentpropreactivation = v.argentpropreactivation, amountpropre = v.amountpropre, amountsale = v.amountsale , autorisationretraititem = v.autorisationretraititem, autorisationdepotitem = v.autorisationdepotitem, autorisationretraitargent = v.autorisationretraitargent, autorisationdepotargent = v.autorisationdepotargent, autorisationcoffrefort = v.autorisationcoffrefort, armeactivation = v.armeactivation, objetactivation = v.objetactivation, autorisationretraitarme = v.autorisationretraitarme, autorisationdepotarme = v.autorisationdepotarme})
            end
            cb(coffrelist)
        end)
    end)

-----------------------------------------------------------------------------------------------------------

ESX.RegisterServerCallback('pawal:intentairejoueur', function(source, cb)
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

RegisterServerEvent('pawal:depot')
AddEventHandler('pawal:depot', function(itemName, count, namecoffre)
	local xPlayer = ESX.GetPlayerFromId(source)
	local item_in_inventory = xPlayer.getInventoryItem(itemName).count

	TriggerEvent('esx_addoninventory:getSharedInventory', society, function(inventory)
        local inventoryItem = inventory.getItem(itemName)

		if item_in_inventory >= count and count > 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "~g~Vous venez de déposer x"..count.." "..inventoryItem.label..' dans le coffre '..namecoffre)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, "~r~Vous n'en avez pas assez sur vous")
		end
	end)
end)

RegisterServerEvent('pawal:retrait')
AddEventHandler('pawal:retrait', function(itemName, labelcoffre, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', society, function(inventory)
        local inventoryItem = inventory.getItem(itemName)

			xPlayer.addInventoryItem(itemName, count)
			inventory.removeItem(itemName, count)
			TriggerClientEvent('esx:showNotification', xPlayer.source, "~g~Vous venez de retirer x"..count.." "..inventoryItem.label.." du coffre "..labelcoffre)
	end)
end)

ESX.RegisterServerCallback('pawal:verifperm', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local group = xPlayer.getGroup()
	cb(group)
end)

-----------------------------------------------------------------------------------------------------------

RegisterServerEvent("pawal:ActionMoneyPropreDEPOSER")
AddEventHandler("pawal:ActionMoneyPropreDEPOSER", function(id, moneyCount)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xMoney = xPlayer.getMoney()
    MySQL.Async.fetchAll('SELECT * FROM coffre_builder WHERE id = @id', {
        ['@id'] = id,
    }, function(data)    
        for k, v in pairs(data) do   
    
         if xPlayer.getAccount('bank').money >= moneyCount then
            MySQL.Async.execute("UPDATE coffre_builder SET amountpropre = @amountpropre WHERE id = @id", {
                ["id"] = id,
                ["amountpropre"] = v.amountpropre + moneyCount
            })
                xPlayer.removeAccountMoney('bank', moneyCount)
                TriggerClientEvent("esx:showNotification", _src, "~g~Vous avez déposé "..moneyCount.."$ d'argent propre")     
            else
                TriggerClientEvent("esx:showNotification", _src, "~r~Vous n'avez pas assez d'argent propre pour faire un dépôt de ce montant")
            end
         end
    end) 
end)

RegisterServerEvent("pawal:ActionMoneyPropreRETIRER")
AddEventHandler("pawal:ActionMoneyPropreRETIRER", function(id, moneyCount)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xMoney = xPlayer.getMoney()
    MySQL.Async.fetchAll('SELECT * FROM coffre_builder WHERE id = @id', {
        ['@id'] = id,
    }, function(data)   
        for k, v in pairs(data) do   
         if ESX.Math.Round(tonumber(v.amountpropre)) >= moneyCount then
            MySQL.Async.execute("UPDATE coffre_builder SET amountpropre = @amountpropre WHERE id = @id", {
                ["id"] = id,
                ["amountpropre"] = v.amountpropre - moneyCount
            })
            xPlayer.addAccountMoney('bank', moneyCount)
            TriggerClientEvent("esx:showNotification", _src, "~g~Vous avez récupérez "..moneyCount.."$ d'argent propre")   
            else
                TriggerClientEvent("esx:showNotification", _src, "~r~Pas assez d'argent dans le coffre pour récupérer ce montant")
            end
         end
     end)  
     SetTimeout(120, function()
    end)  
end)

RegisterServerEvent("pawal:ActionMoneySaleDEPOSER")
AddEventHandler("pawal:ActionMoneySaleDEPOSER", function(id, moneyCount)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xMoney = xPlayer.getMoney()
    MySQL.Async.fetchAll('SELECT * FROM coffre_builder WHERE id = @id', {
        ['@id'] = id,
    }, function(data)    
        for k, v in pairs(data) do   
    
         if xPlayer.getAccount('black_money').money >= moneyCount then
            MySQL.Async.execute("UPDATE coffre_builder SET amountsale = @amountsale WHERE id = @id", {
                ["@id"] = id,
                ["@amountsale"] = v.amountsale + moneyCount
            })
                xPlayer.removeAccountMoney('black_money', moneyCount)
                TriggerClientEvent("esx:showNotification", _src, "~g~Vous avez déposé "..moneyCount.."$ d'argent sale")     
            else
                TriggerClientEvent("esx:showNotification", _src, "~r~Vous n'avez pas assez d'argent sale pour faire un dépôt de ce montant")
            end
         end
    end) 
end)

RegisterServerEvent("pawal:ActionMoneySaleRETIRER")
AddEventHandler("pawal:ActionMoneySaleRETIRER", function(id, moneyCount)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xMoney = xPlayer.getMoney()
    MySQL.Async.fetchAll('SELECT * FROM coffre_builder WHERE id = @id', {
        ['@id'] = id,
    }, function(data)   
        for k, v in pairs(data) do   
         if ESX.Math.Round(tonumber(v.amountsale)) >= moneyCount then
            MySQL.Async.execute("UPDATE coffre_builder SET amountsale = @amountsale WHERE id = @id", {
                ["@id"] = id,
                ["@amountsale"] = v.amountsale - moneyCount
            })
            xPlayer.addAccountMoney('black_money', moneyCount)
            TriggerClientEvent("esx:showNotification", _src, "~g~Vous avez récupérez "..moneyCount.."$ d'argent sale")   
            else
                TriggerClientEvent("esx:showNotification", _src, "~r~Pas assez d'argent dans le coffre pour récupérer ce montant")
            end
         end
     end)  
end)

ESX.RegisterServerCallback("pawal:getAllGrade", function(source, cb, jobName)
    local gradeJobs = {}
  
    MySQL.Async.fetchAll("SELECT * FROM job_grades WHERE job_name = @job_name", {['job_name'] = jobName}, function(data)
        for _,v in pairs(data) do
        table.insert(gradeJobs, {
          gradeJob = v.grade,
          gradeLabel = v.label
        })
        end
        cb(gradeJobs)
    end)
  end)

-----------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("pawal:modificationcoffredepotitem")
AddEventHandler("pawal:modificationcoffredepotitem", function(idcoffremodification, modificationgrade)
    MySQL.Async.execute("UPDATE coffre_builder SET `autorisationdepotitem` = @autorisationdepotitem WHERE id = @id ",{
        ['@id'] = idcoffremodification,
		['@autorisationdepotitem'] = modificationgrade,
	})
end)

RegisterServerEvent("pawal:modificationcoffreretraititem")
AddEventHandler("pawal:modificationcoffreretraititem", function(idcoffremodification, modificationgrade)
    MySQL.Async.execute("UPDATE coffre_builder SET `autorisationretraititem` = @autorisationretraititem WHERE id = @id ",{
        ['@id'] = idcoffremodification,
		['@autorisationretraititem'] = modificationgrade,
	})
end)

RegisterServerEvent("pawal:modificationcoffredepotargent")
AddEventHandler("pawal:modificationcoffredepotargent", function(idcoffremodification, modificationgrade)
    MySQL.Async.execute("UPDATE coffre_builder SET `autorisationdepotargent` = @autorisationdepotargent WHERE id = @id ",{
        ['@id'] = idcoffremodification,
		['@autorisationdepotargent'] = modificationgrade,
	})
end)

RegisterServerEvent("pawal:modificationcoffredepotarme")
AddEventHandler("pawal:modificationcoffredepotarme", function(idcoffremodification, modificationgrade)
    MySQL.Async.execute("UPDATE coffre_builder SET `autorisationdepotarme` = @autorisationdepotarme WHERE id = @id ",{
        ['@id'] = idcoffremodification,
		['@autorisationdepotarme'] = modificationgrade,
	})
end)

RegisterServerEvent("pawal:modificationcoffreretraitarme")
AddEventHandler("pawal:modificationcoffreretraitarme", function(idcoffremodification, modificationgrade)
    MySQL.Async.execute("UPDATE coffre_builder SET `autorisationretraitarme` = @autorisationretraitarme WHERE id = @id ",{
        ['@id'] = idcoffremodification,
		['@autorisationretraitarme'] = modificationgrade,
	})
end)

RegisterServerEvent("pawal:modificationcoffreretraitargent")
AddEventHandler("pawal:modificationcoffreretraitargent", function(idcoffremodification, modificationgrade)
    MySQL.Async.execute("UPDATE coffre_builder SET `autorisationretraitargent` = @autorisationretraitargent WHERE id = @id ",{
        ['@id'] = idcoffremodification,
		['@autorisationretraitargent'] = modificationgrade,
	})
end)

RegisterServerEvent("pawal:modificationcoffrefort")
AddEventHandler("pawal:modificationcoffrefort", function(idcoffremodification, modificationgrade)
    MySQL.Async.execute("UPDATE coffre_builder SET `autorisationcoffrefort` = @autorisationcoffrefort WHERE id = @id ",{
        ['@id'] = idcoffremodification,
		['@autorisationcoffrefort'] = modificationgrade,
	})
end)

ESX.RegisterServerCallback('pawal:depositweapon', function(source, cb, weaponName, removeWeapon)
	local xPlayer = ESX.GetPlayerFromId(source)

	if removeWeapon then
		xPlayer.removeWeapon(weaponName)
	end
	TriggerEvent('esx_datastore:getSharedDataStore', society, function(store)
		local weapons = store.get('weapons') or {}
		local foundWeapon = false

		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].label = weaponLabel
				weapons[i].count = weapons[i].count + 1
				foundWeapon = true
				break
			end
		end
		if not foundWeapon then
			table.insert(weapons, {
				name  = weaponName,
				count = 1
			})
		end
		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('pawal:retraitweapon', function(source, cb, weaponName, societyyy)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weaponName, 60)
	TriggerEvent('esx_datastore:getSharedDataStore', societyyy, function(store)
		local weapons = store.get('weapons') or {}
		local foundWeapon = false
		for i=1, #weapons, 1 do
			if weapons[i].name == weaponName then
				weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
				foundWeapon = true
				break
			end
		end
		if not foundWeapon then
			table.insert(weapons, {name = weaponName, count = 0}) 
		end
		store.set('weapons', weapons)
		cb()
	end)
end)

ESX.RegisterServerCallback('pawal:weaponrecuperation', function(source, cb, society)
	TriggerEvent('esx_datastore:getSharedDataStore', society, function(store)
		local weapons = store.get('weapons')
		if weapons == nil then weapons = {} end
		cb(weapons)
	end)
end)

