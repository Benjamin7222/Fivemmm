--[[
  This file is part of Exelity RolePlay.
  Copyright (c) Exelity RolePlay - All Rights Reserved
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]

local pointing = false

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.Get.ESX, function(obj) ESX = obj end)
		Citizen.Wait(100)
    end
end)

local crouched = false
local GUI = {}
GUI.Time = 0

crouch = function()
	RequestAnimSet("move_ped_crouched")

    while not HasAnimSetLoaded("move_ped_crouched") do 
        Citizen.Wait(100)
    end 

    if crouched == true then 
        ResetPedMovementClipset(PlayerPedId(), 0)
        crouched = false 
    elseif crouched == false then
        SetPedMovementClipset(PlayerPedId(), "move_ped_crouched", 0.25)
        crouched = true 
		----pipicaca = true
    end 
    
    GUI.Time = GetGameTimer()
end

Keys.Register('N','S\'accroupir', 'Go s\'accroupir', function()
	crouch()
end)

function startPointing(plyPed)
	ESX.Streaming.RequestAnimDict('anim@mp_point')
	SetPedConfigFlag(plyPed, 36, true)
	TaskMoveNetworkByName(plyPed, 'task_mp_pointing', 0.5, false, 'anim@mp_point', 24)
	RemoveAnimDict('anim@mp_point')
end

function stopPointing(plyPed)
	RequestTaskMoveNetworkStateTransition(plyPed, 'Stop')

	if not IsPedInjured(plyPed) then
		ClearPedSecondaryTask(plyPed)
	end

	SetPedConfigFlag(plyPed, 36, false)
	ClearPedSecondaryTask(plyPed)
end

local function startPointing(plyPed)	
	ESX.Streaming.RequestAnimDict('anim@mp_point', function()
		SetPedConfigFlag(plyPed, 36, 1)
		TaskMoveNetworkByName(plyPed, 'task_mp_pointing', 0.5, 0, 'anim@mp_point', 24)
		RemoveAnimDict('anim@mp_point')
	end)
end

local function stopPointing()
	local plyPed = PlayerPedId()
	RequestTaskMoveNetworkStateTransition(plyPed, 'Stop')

	if not IsPedInjured(plyPed) then
		ClearPedSecondaryTask(plyPed)
	end

	SetPedConfigFlag(plyPed, 36, 0)
	ClearPedSecondaryTask(plyPed)
end

funcP = function()
	if pointing then
		stopPointing()
		pointing = false
	else
		startPointing(PlayerPedId())
		pointing = true
		Citizen.Wait(100)
		Citizen.CreateThread(function()
			while pointing do
				local ped = PlayerPedId()
				local camPitch = GetGameplayCamRelativePitch()
				if camPitch < -70.0 then
					camPitch = -70.0
				elseif camPitch > 42.0 then
					camPitch = 42.0
				end
		
				camPitch = (camPitch + 70.0) / 112.0
		
				local camHeading = GetGameplayCamRelativeHeading()
				local cosCamHeading = Cos(camHeading)
				local sinCamHeading = Sin(camHeading)
		
				if camHeading < -180.0 then
					camHeading = -180.0
				elseif camHeading > 180.0 then
					camHeading = 180.0
				end
		
				camHeading = (camHeading + 180.0) / 360.0
				local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
				local rayHandle, blocked = GetShapeTestResult(StartShapeTestCapsule(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7))
		
				SetTaskMoveNetworkSignalFloat(ped, 'Pitch', camPitch)
				SetTaskMoveNetworkSignalFloat(ped, 'Heading', (camHeading * -1.0) + 1.0)
				SetTaskMoveNetworkSignalBool(ped, 'isBlocked', blocked)
				SetTaskMoveNetworkSignalBool(ped, 'isFirstPerson', N_0xee778f8c7e1142e2(N_0x19cafa3c87f7c2ff()) == 4)
				Citizen.Wait(0)
			end
		end)
	end
end

Keys.Register('B','pointing', 'Pointer du doigt', function()
	funcP()
end)