RegisterServerEvent('framework:carwash')
AddEventHandler('framework:carwash', function(deposit)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer.getAccount('bank').money >= 150 then
    xPlayer.removeAccountMoney('bank', 150)
    xPlayer.showNotification('Vous avez nettoyé votre véhicule')
    TriggerClientEvent('framework:cleanvehicle', source)
  else
    xPlayer.showNotification('Vous n\'avez pas suffisement d\'argent')
  end
end)