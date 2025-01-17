
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterServerCallback('KorioZ-PersonalMenu:Admin_getUsergroup', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local plyGroup = xPlayer.getGroup()

	if plyGroup ~= nil then 
		cb(plyGroup)
	else
		cb('user')
	end
end)

ESX.RegisterServerCallback('Nehco:getUsergroup', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local group = xPlayer.getGroup()
    cb(group)
end)

RegisterServerEvent('VMLife:Weapon_addAmmoToPedS')
AddEventHandler('VMLife:Weapon_addAmmoToPedS', function(plyId, value, quantity)
	if #(GetEntityCoords(source, false) - GetEntityCoords(plyId, false)) <= 3.0 then
		TriggerClientEvent('VMLife:Weapon_addAmmoToPedC', plyId, value, quantity)
	end
end)

function getMaximumGrade(jobname)
	local queryDone, queryResult = false, nil

	MySQL.Async.fetchAll('SELECT * FROM job_grades WHERE job_name = @jobname ORDER BY `grade` DESC ;', {
		['@jobname'] = jobname
	}, function(result)
		queryDone, queryResult = true, result
	end)

	while not queryDone do
		Citizen.Wait(10)
	end

	if queryResult[1] then
		return queryResult[1].grade
	end

	return nil
end




RegisterServerEvent('job:set')
AddEventHandler('job:set', function(job, grade)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob(job, 0)	
end)

RegisterServerEvent('vInventory:Boss_promouvoirplayer')
AddEventHandler('vInventory:Boss_promouvoirplayer', function(source, target)
 	local sourceXPlayer = ESX.GetPlayerFromId(source)
 	local targetXPlayer = ESX.GetPlayerFromId(target)

 	if (targetXPlayer.job.grade == tonumber(getMaximumGrade(sourceXPlayer.job.name)) - 1) then
 		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous devez demander une autorisation du Gouvernement.')
 	else
 		if sourceXPlayer.job.grade_name == 'boss' and sourceXPlayer.job.name == targetXPlayer.job.name then
 			targetXPlayer.setJob(targetXPlayer.job.name, tonumber(targetXPlayer.job.grade) + 1)

 			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez promu ' .. targetXPlayer.name .. '~w~.')
 			TriggerClientEvent('esx:showNotification', target, 'Vous avez été promu par ' .. sourceXPlayer.name .. '~w~.')
 		else
 			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas l\'autorisation~w~.')
 		end
 	end

 end)
 RegisterServerEvent('vInventory:Boss_destituerplayer')
 AddEventHandler('vInventory:Boss_destituerplayer', function(source, target)
 	local sourceXPlayer = ESX.GetPlayerFromId(source)
 	local targetXPlayer = ESX.GetPlayerFromId(target)
 	if (targetXPlayer.job.grade == 0) then
 		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous ne pouvez pas étrograder davantage.')
 	else
 		if sourceXPlayer.job.grade_name == 'boss' and sourceXPlayer.job.name == targetXPlayer.job.name then
 			targetXPlayer.setJob(targetXPlayer.job.name, tonumber(targetXPlayer.job.grade) - 1)

 			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez rétrogradé ' .. targetXPlayer.name .. '~w~.')
 			TriggerClientEvent('esx:showNotification', target, 'Vous avez été rétrogradé par ' .. sourceXPlayer.name .. '~w~.')
 		else
 			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas l\'autorisation~w~.')
 		end
 	end
 end)

 RegisterServerEvent('vInventory:Boss_recruterplayer')
 AddEventHandler('vInventory:Boss_recruterplayer', function(source, target, job, grade)
 	local sourceXPlayer = ESX.GetPlayerFromId(source)
 	local targetXPlayer = ESX.GetPlayerFromId(target)
	targetXPlayer.setJob(job, grade)
	TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez recruté ' .. targetXPlayer.name .. '~w~.')
	TriggerClientEvent('esx:showNotification', target, 'Vous avez été embauché par ' .. sourceXPlayer.name .. '~w~.')
 end)
 RegisterServerEvent('vInventory:Boss_virerplayer')
 AddEventHandler('vInventory:Boss_virerplayer', function(source, target)
 	local sourceXPlayer = ESX.GetPlayerFromId(source)
 	local targetXPlayer = ESX.GetPlayerFromId(target)
	 TriggerEvent('calm_frame:Trig', source, 'vInventory:Boss_virerplayer')
 	if sourceXPlayer.job.grade_name == 'boss' and sourceXPlayer.job.name == targetXPlayer.job.name then
 		targetXPlayer.setJob('unemployed', 0)
 		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous avez viré ' .. targetXPlayer.name .. '~w~.')
 		TriggerClientEvent('esx:showNotification', target, 'Vous avez été viré par ' .. sourceXPlayer.name .. '~w~.')
 	else
 		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Vous n\'avez pas l\'autorisation~w~.')
 	end
end)

--------------------- KEY

ESX.RegisterServerCallback('get:key', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
	local keyss = {}

	MySQL.Async.fetchAll('SELECT * FROM open_car WHERE identifier = @owner', {
        ['@owner'] = xPlayer.identifier
    },
        function(result)
        for key = 1, #result, 1 do
            table.insert(keyss, {
				id = result[key].id,
				identifier = result[key].identifier,
				label = result[key].label,
				value = result[key].value,
				got = result[key].got,
				NB = result[key].NB,
            })
        end
        cb(keyss)
    end)
end)


