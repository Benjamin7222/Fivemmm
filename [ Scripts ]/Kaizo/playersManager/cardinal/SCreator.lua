local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getIdentity(source, cb)
	local identifier = ESX.GetIdentifierFromId(source)

	MySQL.Async.fetchAll('SELECT identifier, firstname, lastname, dateofbirth, sex, height FROM `users` WHERE `identifier` = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		local data = {}

		data.identifier = identifier

		if result[1] then
			data.firstname = result[1].firstname
			data.lastname = result[1].lastname
			data.dateofbirth = result[1].dateofbirth
			data.sex = result[1].sex
			data.height = result[1].height
		end

		cb(data)
	end)
end

function SetFirstName(identifier, firstname)
	MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@firstname']		= firstname
	})
end

function SetLastName(identifier, lastname)
	MySQL.Async.execute('UPDATE `users` SET `lastname` = @lastname WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@lastname']		= lastname
	})
end

function SetDOB(identifier, dateofbirth, callback)
	MySQL.Async.execute('UPDATE `users` SET `dateofbirth` = @dateofbirth WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@dateofbirth']	= dateofbirth
	})
end

function SetSex(identifier, sex)
	MySQL.Async.execute('UPDATE `users` SET `sex` = @sex WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@sex']		    = sex
	})
end

function SetSex2(identifier, sex2)
	MySQL.Async.execute('UPDATE `users` SET `sex` = @sex WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@sex']		    = sex2
	})
end

function SetHeight(identifier, height)
	MySQL.Async.execute('UPDATE `users` SET `height` = @height WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@height']		    = height
	})
end

RegisterServerEvent('esx_identity:SetFirstName')
AddEventHandler('esx_identity:SetFirstName', function(ID, firstname)
    local identifier = ESX.GetPlayerFromId(ID).identifier

    SetFirstName(identifier, firstname)
end)

RegisterServerEvent('esx_identity:SetLastName')
AddEventHandler('esx_identity:SetLastName', function(ID, lastname)
    local identifier = ESX.GetPlayerFromId(ID).identifier

    SetLastName(identifier, lastname)
end)

RegisterServerEvent('esx_identity:SetDOB')
AddEventHandler('esx_identity:SetDOB', function(ID, dateofbirth)
    local identifier = ESX.GetPlayerFromId(ID).identifier

    SetDOB(identifier, dateofbirth)
end)

RegisterServerEvent('esx_identity:SetSex')
AddEventHandler('esx_identity:SetSex', function(ID, sex)
    local identifier = ESX.GetPlayerFromId(ID).identifier

    SetSex(identifier, sex)  
end)

RegisterServerEvent('esx_identity:SetSex2')
AddEventHandler('esx_identity:SetSex2', function(ID, sex2)
    local identifier = ESX.GetPlayerFromId(ID).identifier

    SetSex2(identifier, sex2)  
end)

RegisterServerEvent('esx_identity:SetHeight')
AddEventHandler('esx_identity:SetHeight', function(ID, height)
    local identifier = ESX.GetPlayerFromId(ID).identifier

    SetHeight(identifier, height)
end)

AddEventHandler('esx:playerLoaded', function(source)
	getIdentity(source, function(data)
		if data.firstname == nil or data.firstname == '' then
			TriggerClientEvent('esx_identity:identityCheck', source, false)
			TriggerClientEvent('esx_identity:showRegisterIdentity', source)
		else
			TriggerClientEvent('esx_identity:identityCheck', source, true)
		end
	end)
end)