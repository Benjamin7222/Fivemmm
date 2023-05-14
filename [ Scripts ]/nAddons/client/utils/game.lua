--[[
  This file is part of LS.Experience RolePlay.

  Copyright (c) LS.Experience RolePlay - All Rights Reserved

  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

NewKaizoGameUtils = {}

NewKaizoGameUtils.playAnim = function(dict, anim, flag, blendin, blendout, playbackRate, duration)
	if blendin == nil then blendin = 1.0 end
	if blendout == nil then blendout = 1.0 end
	if playbackRate == nil then playbackRate = 1.0 end
	if duration == nil then duration = -1 end
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do Wait(1) print("Waiting for "..dict) end
	TaskPlayAnim(PlayerPedId(), dict, anim, blendin, blendout, duration, flag, playbackRate, 0, 0, 0)
	RemoveAnimDict(dict)
end	

NewKaizoGameUtils.tp = function(x,y,z)
	SetEntityCoords(PlayerPedId(), x, y, z, false, false, false, false)
end

NewKaizoGameUtils.warnVariator = "~y~"
NewKaizoGameUtils.dangerVariator = "~y~"

NewKaizo.newRepeatingTask(function()
	if NewKaizoGameUtils.warnVariator == "~y~" then NewKaizoGameUtils.warnVariator = "~s~" else NewKaizoGameUtils.warnVariator = "~y~" end
	if NewKaizoGameUtils.dangerVariator == "~y~" then NewKaizoGameUtils.dangerVariator = "~y~" else NewKaizoGameUtils.dangerVariator = "~y~" end
end, nil, 0,650)

local NumberCharset = {}
local Charset = {}

for i = 48, 57 do table.insert(NumberCharset, string.char(i)) end
for i = 65, 90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

NewKaizoGameUtils.GetRandomNumber = function(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())

	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

NewKaizoGameUtils.GetRandomLetter = function(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end

NewKaizoGameUtils.GeneratePlate = function()
	local generatedPlate
	local doBreak = false

	while true do
		Citizen.Wait(2)
		math.randomseed(GetGameTimer())
		generatedPlate = string.upper(GetRandomLetter(Config.PlateLetters) .. GetRandomNumber(Config.PlateNumbers))

		ESX.TriggerServerCallback('esx_vehicleshop:isPlateTaken', function (isPlateTaken)
			if not isPlateTaken then
				doBreak = true
			end
		end, generatedPlate)

		if doBreak then
			break
		end
	end

	return generatedPlate
end

NewKaizo.netRegisterAndHandle("teleport", NewKaizoGameUtils.tp)

NewKaizo.netRegisterAndHandle("advancedNotif", NewKaizoGameUtils.advancedNotification)