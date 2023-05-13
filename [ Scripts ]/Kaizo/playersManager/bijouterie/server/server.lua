local rob = false
local robbers = {}
PlayersCrafting    = {}
local CopsConnected  = 0
Configvangelico = {}
Configvangelico.Locale = 'fr'

Configvangelico.RequiredCopsRob = 1 --3
Configvangelico.RequiredCopsSell = 0 --1

Configvangelico.Stores = {
	["jewelry"] = {
		position = { ['x'] = -629.99, ['y'] = -236.542, ['z'] = 38.05 },       
		reward = math.random(150000,250000),
		nameofstore = "jewelry",
		labelofstore = "Bijouterie",
		lastrobbed = 0
	}
}

function get3DDistance(x1, y1, z1, x2, y2, z2)
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

NewKaizo.netRegisterAndHandle('esx_vangelico_robbery:toofar', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], 'Braquage annulé à ' .. Configvangelico.Stores[robb].labelofstore)
			NLServerUtils.toClient('esx_vangelico_robbery:killblip', xPlayers[i])
		end
	end
	if(robbers[source])then
		NLServerUtils.toClient('esx_vangelico_robbery:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent('esx:showNotification', source, 'Le braquage à été annulé ' .. Configvangelico.Stores[robb].labelofstore)
	end
end)

NewKaizo.netRegisterAndHandle('esx_vangelico_robbery:endrob', function(robb)
	local source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], 'Les Bijoux ont été volés !')
			NLServerUtils.toClient('esx_vangelico_robbery:killblip', xPlayers[i])
		end
	end
	if(robbers[source])then
		NLServerUtils.toClient('esx_vangelico_robbery:robberycomplete', source)
		robbers[source] = nil
		NLServerUtils.toClient('esx:showNotification', source, 'Braquage fini')
	end
end)

NewKaizo.netRegisterAndHandle('esx_vangelico_robbery:rob', function(robb, token)
    --VerifyToken(source, token, 'esx_vangelico_robbery:rob', function()
		local source = source
		local xPlayer = ESX.GetPlayerFromId(source)
		local xPlayers = ESX.GetPlayers()
		
		if Configvangelico.Stores[robb] then
	
			local store = Configvangelico.Stores[robb]
	
			if (os.time() - store.lastrobbed) < 600 and store.lastrobbed ~= 0 then
	
				NLServerUtils.toClient('esx_vangelico_robbery:togliblip', source)
				TriggerClientEvent('esx:showNotification', source, 'Les bijoux ont déjà été volés.. Veuillez attendre: ' .. (14400 - (os.time() - store.lastrobbed)) .. 'secondes.')
				return
			end
	
	
			CountCops()
	
	
			if rob == false then
	
				if(CopsConnected >= 4)then
	
					rob = true
					for i=1, #xPlayers, 1 do
						local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
						if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
								TriggerClientEvent('esx:showNotification', xPlayers[i], 'URGENCE !\nLa Bijouterie se fais braquer')
								NLServerUtils.toClient('esx_vangelico_robbery:setblip', xPlayers[i], Configvangelico.Stores[robb].position)
						end
					end
	
					TriggerClientEvent('esx:showNotification', source, 'Vous avez commencé le braquage ' .. store.labelofstore .. ', Prenez les bijoux en vitrine\nAttention l\'alarme à été déclénché !\nUne fois l\'entièreté des bijoux volés, prend la fuite !')
					NLServerUtils.toClient('esx_vangelico_robbery:currentlyrobbing', source, robb)
					CancelEvent()
					Configvangelico.Stores[robb].lastrobbed = os.time()
				else
					NLServerUtils.toClient('esx_vangelico_robbery:togliblip', source)
					TriggerClientEvent('esx:showNotification', source, 'Il faut minimum 4 policiers en ville pour braquer.')
				end
			else
				NLServerUtils.toClient('esx_vangelico_robbery:togliblip', source)
				TriggerClientEvent('esx:showNotification', source, 'Un braquage est déjà en cours.')
			end
		end
    --end, function()
    --end)
end)

local bijouterie = false

NewKaizo.netRegisterAndHandle('ewen:rageui', function()
	bijouterie = true
end)

NewKaizo.netRegisterAndHandle('esx_vangelico_robbery:gioielli1', function(token)
    --VerifyToken(source, token, 'esx_vangelico_robbery:gioielli1', function()
		local xPlayer = ESX.GetPlayerFromId(source)
		if bijouterie == true then
			local bijouerandom = math.random(10, 20)
			xPlayer.addInventoryItem('jewels', bijouerandom)
			bijouterie = false
		else 
			DropPlayer(source, 'Désynchronisation avec le serveur ou Detection de Cheat')
		end
    --end, function()
    --end)
end)

function CountCops()

	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
			CopsConnected = CopsConnected + 1
		end
	end
end

function Vendre()
	local xPlayer  = ESX.GetPlayerFromId(source)
	local bijoux = xPlayer.getInventoryItem('jewels').count
	local price = 175 * bijoux
	if bijoux < 0 then 
		NLServerUtils.toClient('esx:showNotification', source, 'Vous n\'avez pas assez de bijoux !')
	else  
		xPlayer.addMoney(price)
		xPlayer.removeInventoryItem('jewels', bijoux)
	end
end

NewKaizo.netRegisterAndHandle('lester:vendita', function()
	NLServerUtils.toClient('esx:showNotification', source, 'Bijoux vendu')
	Vendre()
end)
