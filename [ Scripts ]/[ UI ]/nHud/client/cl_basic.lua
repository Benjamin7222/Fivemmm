local IsAlreadyDrunk = false
local DrunkLevel     = -1

function Drunk(level, start)

  Citizen.CreateThread(function()

    local playerPed = GetPlayerPed(-1)

    if start then
      DoScreenFadeOut(800)
      Wait(1000)
    end

    if level == 0 then

      RequestAnimSet("move_m@drunk@slightlydrunk")

      while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
        Citizen.Wait(0)
      end

      SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)

    elseif level == 1 then

      RequestAnimSet("move_m@drunk@moderatedrunk")

      while not HasAnimSetLoaded("move_m@drunk@moderatedrunk") do
        Citizen.Wait(0)
      end

      SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)

    elseif level == 2 then

      RequestAnimSet("move_m@drunk@verydrunk")

      while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
        Citizen.Wait(0)
      end

      SetPedMovementClipset(playerPed, "move_m@drunk@verydrunk", true)

    end

    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(playerPed, true)
    SetPedIsDrunk(playerPed, true)

    if start then
      DoScreenFadeIn(800)
    end

  end)

end

function Reality()

  Citizen.CreateThread(function()

    local playerPed = GetPlayerPed(-1)

    DoScreenFadeOut(800)
    Wait(1000)

    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(playerPed, 0)
    SetPedIsDrunk(playerPed, false)
    SetPedMotionBlur(playerPed, false)

    DoScreenFadeIn(800)

  end)

end
RegisterNetEvent('esx_optionalneeds:onDrink')
AddEventHandler('esx_optionalneeds:onDrink', function()
  
  local playerPed = GetPlayerPed(-1)
  
  TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_DRINKING", 0, 1)
  Citizen.Wait(1000)
  ClearPedTasksImmediately(playerPed)

end)

local IsDead = false
local IsAnimated = false
local target
local using = false
local lastPos = nil
local anim = "back"
local animscroll = 0
local oPlayer = false

CreateThread(function()
	while true do
		time = 1000
		oPlayer = PlayerPedId()
		local pedPos = GetEntityCoords(oPlayer)
		for k,v in pairs(Config.objects.locations) do
			local oSelectedObject = GetClosestObjectOfType(pedPos.x, pedPos.y, pedPos.z, 0.8, GetHashKey(v.object), 0, 0, 0)
			local oEntityCoords = GetEntityCoords(oSelectedObject)
			local objectexits = DoesEntityExist(oSelectedObject)
			if objectexits then
				if GetDistanceBetweenCoords(oEntityCoords.x, oEntityCoords.y, oEntityCoords.z,pedPos) < 15.0 then
					if oSelectedObject ~= 0 then
						local objects = Config.objects
						if oSelectedObject ~= objects.object then
							objects.object = oSelectedObject
							objects.ObjectVertX = v.verticalOffsetX
							objects.ObjectVertY = v.verticalOffsetY
							objects.ObjectVertZ = v.verticalOffsetZ
							objects.OjbectDir = v.direction
							objects.isBed = v.bed
						end
					end
				end
			end
		end
		local objects = Config.objects
		if objects.object ~= nil and objects.ObjectVertX ~= nil and objects.ObjectVertY ~= nil and objects.ObjectVertZ ~= nil and objects.OjbectDir ~= nil and objects.isBed ~= nil then
			local player = oPlayer
			local getPlayerCoords = GetEntityCoords(player)
			local objectcoords = GetEntityCoords(objects.object)
			if GetDistanceBetweenCoords(objectcoords.x, objectcoords.y, objectcoords.z,getPlayerCoords) < 1.2 and not using then
				time = 0
				if objects.isBed == true then
					ESX.ShowHelpNotification('Appuyez sur ~INPUT_CONTEXT~ pour vous ~b~asseoir.')
					if IsControlJustPressed (1,38) then 
						animscroll = animscroll+1
						if animscroll == 0 then
							anim = "back"
						elseif animscroll == 1 then
							anim = "stomach"
						elseif animscroll == 2 then
							animscroll = 1
						end
					end
					time = 0
					if IsControlJustPressed(0, 174) then 
						animscroll = animscroll-1
						if animscroll == -1 then
							animscroll = 0
						elseif animscroll == 0 then
							anim = "back"
						elseif animscroll == 1 then
							anim = "stomach"
						elseif animscroll == 2 then
							animscroll = 0
							anim = "back"
						end
					end
					if IsControlJustPressed(0, 38) then
						PlayAnimOnPlayer(objects.object,objects.ObjectVertX,objects.ObjectVertY,objects.ObjectVertZ,objects.OjbectDir, objects.isBed, player, objectcoords)
					end
				else
					ESX.ShowHelpNotification("G", "pour vous assoir")
					if IsControlJustPressed(1,47) then
						PlayAnimOnPlayer(objects.object,objects.ObjectVertX,objects.ObjectVertY,objects.ObjectVertZ,objects.OjbectDir, objects.isBed, player, objectcoords)
					end
				end
			end
			if using == true then
				time = 0
				ESX.ShowHelpNotification("F", "pour vous lever")
				if IsControlJustPressed(1,49) then
					ClearPedTasks(player)
					using = false
					TriggerServerEvent('export:using', false)
					local x,y,z = table.unpack(lastPos)
					if GetDistanceBetweenCoords(x, y, z,getPlayerCoords) < 10 then
						SetEntityCoords(player, lastPos)
					end
					FreezeEntityPosition(player, false)
				end
			end
		end
		Citizen.Wait(time)
	end
end)

function PlayAnimOnPlayer(object,vertx,verty,vertz,dir, isBed, ped, objectcoords)
	lastPos = GetEntityCoords(ped)
	FreezeEntityPosition(object, true)
	SetEntityCoords(ped, objectcoords.x, objectcoords.y, objectcoords.z+-1.4)
	FreezeEntityPosition(ped, true)
	using = true
	TriggerServerEvent('export:using', true)
	if isBed == false then
		TaskStartScenarioAtPosition(ped, Config.objects.SitAnimation, objectcoords.x+vertx, objectcoords.y-verty, objectcoords.z-vertz, GetEntityHeading(object)+dir, 0, true, true)
	else
		if anim == "back" then
			TaskStartScenarioAtPosition(ped, Config.objects.LayBackAnimation, objectcoords.x+vertx, objectcoords.y+verty, objectcoords.z-vertz, GetEntityHeading(object)+dir, 0, true, true)
		elseif anim == "stomach" then
			TaskStartScenarioAtPosition(ped, Config.objects.LayStomachAnimation, objectcoords.x+vertx, objectcoords.y+verty, objectcoords.z-vertz, GetEntityHeading(object)+dir, 0, true, true)
		end
	end
end

AddEventHandler('esx_basicneeds:resetStatus', function()
	TriggerEvent('esx_status:set', 'hunger', 500000)
	TriggerEvent('esx_status:set', 'thirst', 500000)
end)

RegisterNetEvent('esx_basicneeds:healPlayer')
AddEventHandler('esx_basicneeds:healPlayer', function()
	TriggerEvent('esx_status:set', 'hunger', 1000000)
	TriggerEvent('esx_status:set', 'thirst', 1000000)

	local playerPed = PlayerPedId()
	SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
end)

AddEventHandler('esx:onPlayerDeath', function()
	IsDead = true
end)

AddEventHandler('playerSpawned', function(spawn)
	if IsDead then
		TriggerEvent('esx_basicneeds:resetStatus')
	end

	IsDead = false
end)

AddEventHandler('esx_status:loaded', function(status)
	TriggerEvent('esx_status:registerStatus', 'hunger', 1000000, '#ffae00bd', function(status)
		return true
	end, function(status)
		status.remove(100)
	end)
	TriggerEvent('esx_status:registerStatus', 'thirst', 1000000, '#00bedb', function(status)
		return true
	end, function(status)
		status.remove(75)
	end)

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(1000)
			local playerPed  = PlayerPedId()
			local prevHealth = GetEntityHealth(playerPed)
			local health     = prevHealth
			TriggerEvent('esx_status:getStatus', 'hunger', function(status)
				if status.val == 0 then
					if prevHealth <= 15 then
						health = health - 5
					else
						health = health - 1
					end
				end
			end)

			TriggerEvent('esx_status:getStatus', 'thirst', function(status)
				if status.val == 0 then
					if prevHealth <= 35 then
						health = health - 5
					else
						health = health - 1
					end
				end
			end)

			if health ~= prevHealth then
				SetEntityHealth(playerPed, health)
			end
		end
	end)
end)

AddEventHandler('esx_basicneeds:isEating', function(cb)
	cb(IsAnimated)
end)

RegisterNetEvent('esx_basicneeds:onEat')
AddEventHandler('esx_basicneeds:onEat', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_sandwich_01'
		IsAnimated = true
		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.13, 0.05, 0.02, -50.0, 16.0, 60.0, true, true, false, true, 1, true)
			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 8.0, -8, -1, 49, 0, 0, 0, 0)
				Citizen.Wait(20000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:onBurger')
AddEventHandler('esx_basicneeds:onBurger', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_cs_burger_01'
		IsAnimated = true
		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.13, 0.05, 0.02, -50.0, 16.0, 60.0, true, true, false, true, 1, true)
			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 8.0, -8, -1, 49, 0, 0, 0, 0)
				Citizen.Wait(20000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)
	end
end)


RegisterNetEvent('esx_basicneeds:onDrink')
AddEventHandler('esx_basicneeds:onDrink', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_ld_flow_bottle' --ng_proc_sodacan_01a
		IsAnimated = true
		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.008, 0.03, 240.0, -60.0, 0.0, true, true, false, true, 1, true)
			ESX.Streaming.RequestAnimDict('mp_player_inteat@pnq', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@pnq', 'loop', 8.0, -8, -1, 49, 0, 0, 0, 0)
				Citizen.Wait(8500)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:onMojito')
AddEventHandler('esx_basicneeds:onMojito', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_mojito' --ng_proc_sodacan_01a
		IsAnimated = true
		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.008, 0.03, 240.0, -60.0, 0.0, true, true, false, true, 1, true)
			ESX.Streaming.RequestAnimDict('mp_player_inteat@pnq', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@pnq', 'loop', 8.0, -8, -1, 49, 0, 0, 0, 0)
				Citizen.Wait(8500)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)
	end
end)