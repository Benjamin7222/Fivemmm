local knockedOut = false
local wait = 15
local count = 60

Citizen.CreateThread(function()
	while true do
		local waiting = 85
		local myPed = PlayerPedId()
		if IsPedInMeleeCombat(myPed) then
			if GetEntityHealth(myPed) < 115 then
				SetPlayerInvincible(PlayerId(), true)
				SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
				ESX.ShowNotification("~b~Vous vous êtes fait assommé...")
				wait = 15
				knockedOut = true
				SetEntityHealth(myPed, 116)
			end
		end
		if knockedOut == true then
			waiting = 15
			SetPlayerInvincible(PlayerId(), true)
			DisablePlayerFiring(PlayerId(), true)
			SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
			ResetPedRagdollTimer(myPed)
			
			if wait >= 0 then
				count = count - 1
				if count == 0 then
					count = 60
					wait = wait - 1
					SetEntityHealth(myPed, GetEntityHealth(myPed)+4)
				end
			else
				SetPlayerInvincible(PlayerId(), false)
				knockedOut = false
			end
		end
		Wait(waiting)
	end
end)

Citizen.CreateThread( function()
	local resetCounter = 0
	local jumpDisabled = false
  	
  	while true do
		if jumpDisabled and resetCounter > 0 and IsPedJumping(PlayerPedId()) and not (GetPedParachuteState(PlayerPedId()) == 1)then
			SetPedToRagdoll(PlayerPedId(), 500, 500, 3, 0, 0, 0)
			ESX.ShowNotification("Tu t'es cru pour un kangourou à sauter comme ça ?")
			resetCounter = 0
		end

		if not jumpDisabled and IsPedJumping(PlayerPedId()) then
			jumpDisabled = true
			resetCounter = 10
			Citizen.Wait(1200)
		end

		if resetCounter > 0 then
			resetCounter = resetCounter - 1
		else
			if jumpDisabled then
				resetCounter = 0
				jumpDisabled = false
			end
		end
        Citizen.Wait(100)
	end
end)



Citizen.CreateThread(function()
	while true do
		SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
		SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
		SetSwimMultiplierForPlayer(PlayerId(), 1.0)
		Citizen.Wait(150)
	end
end)

local passager = true -- True = passager peux tirer, False = passager ne peux pas tirer

Citizen.CreateThread(function()
    while true do
		local msec = 5000
        if IsPedSittingInAnyVehicle(PlayerPedId()) then
			msec = 0
            player = PlayerPedId()
            car = GetVehiclePedIsIn(player, false)
            if car then
                if GetPedInVehicleSeat(car, -1) == player then
                    SetPlayerCanDoDriveBy(PlayerId(), false)
                elseif passager then
                    SetPlayerCanDoDriveBy(PlayerId(), true)
                else
                    SetPlayerCanDoDriveBy(PlayerId(), false)
                end
            end
        end
		Citizen.Wait(msec)
    end
end)