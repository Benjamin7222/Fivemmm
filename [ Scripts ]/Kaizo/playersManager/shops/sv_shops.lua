local listeItem = {
    ['weapon_bat'] = {name = 'weapon_bat', label = 'Batte de Baseball', price = 3000, category = 'Ammu-Nation'},
    ['weapon_knuckle'] = {name = 'weapon_knuckle', label = 'Poing Américain', price = 3000, category = 'Ammu-Nation'},
    ['weapon_knife'] = {name = 'weapon_knife', label = 'Couteau', price = 1500, category = 'Ammu-Nation'},
    ['clip'] = {name = 'clip', label = 'Chargeur', price = 180, category = 'Munitions'},

    ['bread'] = {name = 'bread', label = 'Pain', price = 10, category = 'Superette'},
    ['water'] = {name = 'water', label = 'Eau de source', price = 10, category = 'Superette'},
}
RegisterServerEvent('core:achat')
AddEventHandler('core:achat', function(item, price, type)
    local xPlayer = ESX.GetPlayerFromId(source)

    if listeItem[item] == nil then
        DropPlayer(source, 'Utilisation d\'un Trigger ( LTD )'.. item, price, type)
    else
        if listeItem[item].name == item and listeItem[item].price == tonumber(price) then
            if type == 1 then
                if xPlayer.getAccount('cash').money >= listeItem[item].price then
                    xPlayer.removeAccountMoney('cash', price)
                    if listeItem[item].category == "Ammu-Nation" then
                        xPlayer.addWeapon(listeItem[item].name, 25)
                        xPlayer.addInventoryItem(listeItem[item].name, 1)
                    else
                        xPlayer.addInventoryItem(listeItem[item].name, 1)
                    end
                    TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez acheté '.. listeItem[item].label .. ' pour '.. listeItem[item].price .. '$')
                    TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez payer en liquide.') 
                else
                    TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous n\'avez pas l\'argent nécéssaire')
                end
            elseif type == 2 then
                if tonumber(xPlayer.getAccount('bank').money) >= price then
                    xPlayer.removeAccountMoney('bank', price)
                    if listeItem[item].category == "Ammu-Nation" then
                        xPlayer.addWeapon(listeItem[item].name, 25)
                        xPlayer.addInventoryItem(listeItem[item].name, 1)
                    else
                        xPlayer.addInventoryItem(listeItem[item].name, 1)
                    end
                    TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez acheté '.. listeItem[item].label .. ' pour : '.. listeItem[item].price .. '$')
                    TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez payer par carte banquaire.')
                else
                    TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous n\'avez pas l\'argent nécéssaire')
                end
            end
        else 
            DropPlayer(source, 'Utilisation d\'un Trigger ( LTD )'.. item, price, type)
        end
    end
    
end)

RegisterServerEvent('armureriepolice')
AddEventHandler('armureriepolice', function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        for i = #xPlayer.loadout, 1, -1 do
            xPlayer.removeWeapon(xPlayer.loadout[i].name)
        end
    end
end)

RegisterServerEvent('core:arme')
AddEventHandler('core:arme', function(weapon)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addWeapon(weapon, 250)
end)

RegisterServerEvent('esx_clip:remove')
AddEventHandler('esx_clip:remove', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('clip', 1)
end)

ESX.RegisterUsableItem('clip', function(source)
	TriggerClientEvent('esx_clip:clipcli', source)
end)