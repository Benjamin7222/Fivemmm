TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Config = {}

-- GENERAL --
Config.webhook = 'https://discord.com/api/webhooks/1063424394430521384/wxl6LctOEU7p2KFCqBNhK7VZxNH5NRKQ8DW_ixtn7TbaqV7tmRGH-GyqHDRfRpIq17rR'

-- LANGUAGE --
Locale = {
	banlistloaded = "La BanList a été chargé avec succès.",
	reason = "Raison",
	noreason = "Raison Indéterminée",
	during = "pendant",
	isban = "a été ban",
	isunban = "a été déban",
	invalidid = "ID incorrect",
	invalididentifier = "Impossible de vous identifier, merci de réouvrir FiveM.",
	invalidtime = "Durée du bannissement incorrecte",
	yourban = "Vous avez été banni",
	youban = "Vous avez banni",
	permban = "permanent",
	timeleft = "Temps Restant",
	day = "Jours",
	hour = "Heures",
	minute = "Minutes",
	by = "par",
	ban = "Bannir un joueur qui est en ligne",
	banoff = "Bannir un joueur qui est hors ligne",
	timehelp = "Durée (heures)",
	licenseid = "LicenseID"
}

AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
	local _source = source
	local licenseid, playerip = 'N/A', 'N/A'
	licenseid = ESX.GetIdentifierFromId(_source, 'license:')
	--playerip = GetPlayerEndpoint(_source)

	if not licenseid then
		setKickReason(Locale.invalididentifier)
		CancelEvent()
	end

	Citizen.Wait(0)

	IsBanned(licenseid, function(isBanned, banData)
		if isBanned then
			if tonumber(banData.permanent) == 1 then
				deferrals.done(('Vous êtes banni de '.. GetConvar("servername", "LS.Experience") ..'\nRaison : %s\nTemps Restant : Permanent\nAuteur : %s'):format(banData.reason, banData.sourceName))
				TriggerEvent('esx:customDiscordLog', ('Tentative de Connexion du Joueur : %s (%s)\nRaison : %s\nTemps Restant : Permanent\nAuteur : %s'):format(playerName, licenseid, banData.reason, banData.sourceName), 'Ban Info')
			else
				if tonumber(banData.expiration) > os.time() then
					local timeRemaining = tonumber(banData.expiration) - os.time()
					deferrals.done(('Vous êtes banni de '.. GetConvar("servername", "LS.Experience") ..'\nRaison : %s\nTemps Restant : %s\nAuteur : %s'):format(banData.reason, SexyTime(timeRemaining), banData.sourceName))
					TriggerEvent('esx:customDiscordLog', ('Tentative de Connexion du Joueur : %s (%s)\nRaison : %s\nTemps Restant : %s\nAuteur : %s'):format(playerName, licenseid, banData.reason, SexyTime(timeRemaining), banData.sourceName), 'Ban Info')
				else
					DeleteBan(licenseid)
					deferrals.done()
				end
			end
		else
			deferrals.done()
		end
	end)
end)

RegisterServerEvent('BanSql:ICheatClient')
AddEventHandler('BanSql:ICheatClient', function(reason)
	local _source = source
	local licenseid, playerip = 'N/A', 'N/A'

	if reason == nil then
		reason = 'Cheat'
	end

	if _source then
		local name = GetPlayerName(_source)

		if name then
			licenseid = ESX.GetIdentifierFromId(_source, 'license:')
			--playerip = GetPlayerEndpoint(_source)

			if not licenseid then
				licenseid = 'N/A'
			end

			AddBan(_source, licenseid, playerip, name, 'Anti-Cheat Predator', 0, reason, 1)
			DropPlayer(_source, ('Vous êtes banni de '.. GetConvar("servername", "LS.Experience") ..'\nRaison : %s\nTemps Restant : Permanent\nAuteur : Anti-Cheat '.. GetConvar("servername", "LS.Experience") ..''):format(reason))
		end
	else
		print('BanSql Error : Anti-Cheat '.. GetConvar("servername", "LS.Experience") ..' have received invalid id.')
	end
end)

AddEventHandler('BanSql:ICheatServer', function(target, reason)
	local licenseid, playerip = 'N/A', 'N/A'

	if reason == nil then
		reason = 'Cheat'
	end

	if target then
		local name = GetPlayerName(target)

		if name then
			licenseid = ESX.GetIdentifierFromId(target, 'license:')
			--playerip = GetPlayerEndpoint(_source)

			if not licenseid then
				licenseid = 'N/A'
			end

			AddBan(target, licenseid, playerip, name, 'Anti-Cheat '.. GetConvar("servername", "LS.Experience") ..'', 0, reason, 1)
			DropPlayer(target, ('Vous êtes banni de '.. GetConvar("servername", "LS.Experience") ..'\nRaison : %s\nTemps Restant : Permanent\nAuteur : Anti-Cheat '.. GetConvar("servername", "LS.Experience") ..''):format(reason))
		end
	else
		print('BanSql Error : Anti-Cheat Predator have received invalid id.')
	end
end)

function SexyTime(seconds)
	local days = seconds / 86400
	local hours = (days - math.floor(days)) * 24
	local minutes = (hours - math.floor(hours)) * 60
	seconds = (minutes - math.floor(minutes)) * 60
	return ('%s jours %s heures %s minutes %s secondes'):format(math.floor(days), math.floor(hours), math.floor(minutes), math.floor(seconds))
end

function SendMessage(source, message)
	if source ~= 0 then
		TriggerClientEvent('chat:addMessage', source, { args = {'^1BanInfo ', message} })
	else
		print(('SqlBan: %s'):format(message))
	end
end

function AddBan(source, licenseid, playerip, targetName, sourceName, time, reason, permanent)
	time = time * 3600
	local timeat = os.time()
	local expiration = time + timeat

	MySQL.Async.execute('INSERT INTO banlist (licenseid, playerip, targetName, sourceName, reason, timeat, expiration, permanent) VALUES (@licenseid, @playerip, @targetName, @sourceName, @reason, @timeat, @expiration, @permanent)', {
		['@licenseid'] = licenseid,
		['@playerip'] = playerip,
		['@targetName'] = targetName,
		['@sourceName'] = sourceName,
		['@reason'] = reason,
		['@timeat'] = timeat,
		['@expiration'] = expiration,
		['@permanent'] = permanent
	}, function()
		MySQL.Async.execute('INSERT INTO banlisthistory (licenseid, playerip, targetName, sourceName, reason, timeat, expiration, permanent) VALUES (@licenseid, @playerip, @targetName, @sourceName, @reason, @timeat, @expiration, @permanent)', {
			['@licenseid'] = licenseid,
			['@playerip'] = playerip,
			['@targetName'] = targetName,
			['@sourceName'] = sourceName,
			['@reason'] = reason,
			['@timeat'] = timeat,
			['@expiration'] = expiration,
			['@permanent'] = permanent
		})

		if permanent == 0 then
			SendMessage(source, (('Vous avez banni %s / Durée : %s / Raison : %s'):format(targetName, SexyTime(time), reason)))
			TriggerEvent('esx:', ('`%s` a banni `%s` / Durée : `%s` / Raison : `%s`\n```\n%s\n%s\n```'):format(sourceName, targetName, SexyTime(time), reason, licenseid, playerip), 'Ban Info')
		else
			SendMessage(source, (('Vous avez banni %s / Durée : Permanent / Raison : %s'):format(targetName, reason)))
			TriggerEvent('esx:customDiscordLogBan', ('`%s` a banni `%s` / Durée : `Permanent` / Raison : `%s`\n```\n%s\n%s\n```'):format(sourceName, targetName, reason, licenseid, playerip), 'Ban Info')
		end
	end)
end

function DeleteBan(licenseid, cb)
	MySQL.Async.execute('DELETE FROM banlist WHERE licenseid = @licenseid', {
		['@licenseid'] = licenseid
	}, function()
		if cb then
			cb()
		end
	end)
end

function IsBanned(licenseid, cb)
	MySQL.Async.fetchAll('SELECT * FROM banlist WHERE licenseid = @licenseid', {
		['@licenseid'] = licenseid
	}, function(result)
		if #result > 0 then
			cb(true, result[1])
		else
			cb(false, result[1])
		end
	end)
end

RegisterServerEvent("SqlBan:MasterLuaBan")
AddEventHandler("SqlBan:MasterLuaBan", function(id, temps, raison, sourcebase)
	local licenseid, playerip = 'N/A', 'N/A'
	local target = id
	local expiration = tonumber(temps)
	local reason = raison

	if target and target > 0 then
		local sourceName = GetPlayerName(sourcebase)
		local targetName = GetPlayerName(target)

		if targetName then
			if expiration and expiration <= 336 then
				licenseid = ESX.GetIdentifierFromId(target, 'license:')
				--playerip = GetPlayerEndpoint(target)

				if not licenseid then
					licenseid = 'N/A'
				end

				if reason == '' then
					reason = Locale.noreason
				end

				if expiration > 0 then
					AddBan(sourcebase, licenseid, playerip, targetName, sourceName, expiration, reason, 0)
					DropPlayer(target, ('Vous êtes banni de '.. GetConvar("servername", "LS.Experience") ..'\nRaison : %s\nTemps Restant : %s\nAuteur : %s'):format(reason, SexyTime(expiration * 3600), sourceName))
				else
					AddBan(sourcebase, licenseid, playerip, targetName, sourceName, expiration, reason, 1)
					DropPlayer(target, ('Vous êtes banni de '.. GetConvar("servername", "LS.Experience") ..'\nRaison : %s\nTemps Restant : Permanent\nAuteur : %s'):format(reason, sourceName))
				end
			else
			--	SendMessage(source, Locale.invalidtime)
			end
		else
		--	SendMessage(source, Locale.invalidid)
		end
	else
	--	SendMessage(source, Locale.invalidid)
	end
end)


ESX.AddGroupCommand('sqlban', 'admin', function(source, args, user)
	local licenseid, playerip = 'N/A', 'N/A'
	local target = tonumber(args[1])
	local expiration = tonumber(args[2])
	local reason = table.concat(args, ' ', 3)

	if target and target > 0 then
		local sourceName = GetPlayerName(source)
		local targetName = GetPlayerName(target)

		if targetName then
			if expiration and expiration <= 336 then
				licenseid = ESX.GetIdentifierFromId(target, 'license:')
				--playerip = GetPlayerEndpoint(target)

				if not licenseid then
					licenseid = 'N/A'
				end

				if reason == '' then
					reason = Locale.noreason
				end

				if expiration > 0 then
					AddBan(source, licenseid, playerip, targetName, sourceName, expiration, reason, 0)
					DropPlayer(target, ('Vous êtes banni de '.. GetConvar("servername", "LS.Experience") ..'\nRaison : %s\nTemps Restant : %s\nAuteur : %s'):format(reason, SexyTime(expiration * 3600), sourceName))
				else
					AddBan(source, licenseid, playerip, targetName, sourceName, expiration, reason, 1)
					DropPlayer(target, ('Vous êtes banni de '.. GetConvar("servername", "LS.Experience") ..'\nRaison : %s\nTemps Restant : Permanent\nAuteur : %s'):format(reason, sourceName))
				end
			else
				SendMessage(source, Locale.invalidtime)
			end
		else
			SendMessage(source, Locale.invalidid)
		end
	else
		SendMessage(source, Locale.invalidid)
	end
end, {help = Locale.ban, params = { {name = 'id'}, {name = 'hour', help = Locale.timehelp}, {name = 'reason', help = Locale.reason} }})

ESX.AddGroupCommand('sqlbanoffline', 'admin', function(source, args, user)
	local licenseid = tostring(args[1])
	local expiration = tonumber(args[2])
	local reason = table.concat(args, ' ', 3)
	local sourceName = GetPlayerName(source)

	if expiration then
		if licenseid then
			MySQL.Async.fetchAll('SELECT * FROM account_info WHERE license = @license', {
				['@license'] = licenseid
			}, function(data)
				if data[1] then
					if expiration and expiration <= 336 then
						if reason == '' then
							reason = Locale.noreason
						end

						if expiration > 0 then
							AddBan(source, data[1].license, data[1].ip, data[1].name, sourceName, expiration, reason, 0)
						else
							AddBan(source, data[1].license, data[1].ip, data[1].name, sourceName, expiration, reason, 1)
						end
					else
						SendMessage(source, Locale.invalidtime)
					end
				else
					SendMessage(source, Locale.invalidid)
				end
			end)
		else
			SendMessage(source, Locale.invalidname)
		end
	else
		SendMessage(source, Locale.invalidtime)
	end
end, {help = Locale.banoff, params = { {name = 'licenseid', help = Locale.licenseid}, {name = 'hour', help = Locale.timehelp}, {name = 'reason', help = Locale.reason} }})

ESX.AddGroupCommand('sqlunban', 'superadmin', function(source, args, user)
	local sourceName = GetPlayerName(source)
	local licenseid = table.concat(args, ' ')

	if licenseid then
		MySQL.Async.fetchAll('SELECT * FROM banlist WHERE licenseid LIKE @licenseid', {
			['@licenseid'] = ('%' .. licenseid .. '%')
		}, function(data)
			if data[1] then
				DeleteBan(data[1].licenseid, function()
					SendMessage(source, ('%s a était déban'):format(data[1].targetName))
					TriggerEvent('esx:customDiscordLogBan', ('`%s` a était déban par `%s`'):format(data[1].targetName, sourceName), 'Ban Info')
				end)
			else
				SendMessage(source, Locale.invalidname)
			end
		end)
	else
		SendMessage(source, Locale.cmdunban)
	end
end, {help = Locale.unban, params = { {name = 'licenseid', help = Locale.licenseid} }})    