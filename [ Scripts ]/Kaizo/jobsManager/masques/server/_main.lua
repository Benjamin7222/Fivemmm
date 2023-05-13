ESX = nil

KaizoMasques.Utils.InSide(KaizoMasques.Utils.GetESX, function(obj) ESX = obj end)

RegisterNetEvent(("%s:buyMask"):format(KaizoMasques.Utils.GetESX))
AddEventHandler(("%s:buyMask"):format(KaizoMasques.Utils.GetESX), function(pos, price)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)

    if (not (pos ~= nil)) then
        KaizoMasques.Utils.Kick(src, _Server.Function.Locales["cheatDetected"])
        return
    end
    if (not (price ~= nil)) then
        KaizoMasques.Utils.Kick(src, _Server.Function.Locales["cheatDetected"])
        return
    end
    if (_Server.Function.getPos(pos)) then
        if (xPlayer.getAccount('cash').money >= price) then
            xPlayer.removeAccountMoney('cash', price)
            TriggerClientEvent(("%s:buyMask"):format(KaizoMasques.Utils.PrefixEvent), src)
            TriggerClientEvent(("%s:showNotification"):format(KaizoMasques.Utils.PrefixEvent), src, _Server.Function.Locales["buyMask"])
        else
            TriggerClientEvent(("%s:notMoney"):format(KaizoMasques.Utils.PrefixEvent), src)
            TriggerClientEvent(("%s:showNotification"):format(KaizoMasques.Utils.PrefixEvent), src, _Server.Function.Locales["notEnoughMoney"])
        end 
    else
        KaizoMasques.Utils.Kick(src, _Server.Function.Locales["cheatDetected"])
        return
    end
end)


