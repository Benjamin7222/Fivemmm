--[[

  Made with love by Cheleber, you can join my RP Server here: www.grandtheftlusitan.com
  You can add this lines do your esx_rpchat.

--]]

ESX 						   = nil
local Group 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_chatforadmin:GetGroup', function(source, cb)
    local player = ESX.GetPlayerFromId(source)

    if player ~= nil then
        Group = player.getGroup()
        if Group ~= nil then 
            cb(Group)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)

RegisterCommand('staff', function(source, args, rawCommand)
	local xPlayer = ESX.GetPlayerFromId(source)
	Group = xPlayer.getGroup()
	if Group ~= 'user' then
		TriggerClientEvent("sendMessageAdmin", -1, source,  xPlayer.getName(), table.concat(args, " "))
	end	
end, false)

-- Rcon commands
AddEventHandler('rconCommand', function(commandName, args)
	if commandName == 'setlevel' then
		if (tonumber(args[1]) ~= nil and tonumber(args[1]) >= 0) and (tonumber(args[2]) ~= nil and tonumber(args[2]) >= 0) then
			local xPlayer = ESX.GetPlayerFromId(tonumber(args[1]))

			if xPlayer == nil then
				RconPrint("Player not ingame\n")
				CancelEvent()
				return
			end

			TriggerEvent('esx:customDiscordLog', "CONSOLE a modifié le niveau de permission de " .. xPlayer.name .. " [" .. xPlayer.source .. "] (" .. xPlayer.identifier .. ") - Ancien : " .. xPlayer.getLevel() .. " / Nouveau : " .. tostring(args[2]))
			xPlayer.setLevel(tonumber(args[2]))
		else
			RconPrint("Usage: setlevel [user-id] [level]\n")
			CancelEvent()
			return
		end

		CancelEvent()
	elseif commandName == 'setgroup' then
		if (tonumber(args[1]) ~= nil and tonumber(args[1]) >= 0) and (tostring(args[2]) ~= nil) then
			local xPlayer = ESX.GetPlayerFromId(tonumber(args[1]))

			if xPlayer == nil then
				RconPrint("Player not ingame\n")
				CancelEvent()
				return
			end

			TriggerEvent('esx:customDiscordLog', "CONSOLE a modifié le groupe de permission de " .. xPlayer.name .. " [" .. xPlayer.source .. "] (" .. xPlayer.identifier .. ") - Ancien : " .. xPlayer.getGroup() .. " / Nouveau : " .. tostring(args[2]))
			xPlayer.setGroup(tostring(args[2]))
		else
			RconPrint("Usage: setgroup [user-id] [group]\n")
			CancelEvent()
			return
		end

		CancelEvent()
	end
end)

-- Announce
ESX.AddGroupCommand('announce', "superadmin", function(source, args, user)
	TriggerClientEvent('chatMessage', -1, "ANNONCE", {255, 0, 0}, table.concat(args, " "))
end, {help = "Announce a message to the entire server", params = { {name = "announcement", help = "The message to announce"} }})
  