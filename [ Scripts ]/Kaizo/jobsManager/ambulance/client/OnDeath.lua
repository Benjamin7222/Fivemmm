local SetEntityRagdoll = false
local IsTimeFinish = nil
local IsTimeDead = nil
AddEventHandler('esx:onPlayerDeath', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed, false)
	TriggerServerEvent('EMS:UpdateTableIsDead', true)
	Citizen.CreateThread(function()
		DoScreenFadeOut(800)

		while not IsScreenFadedOut() do
			Citizen.Wait(0)
		end

		RespawnPed(playerPed, {coords = coords, heading = 0.0})
		AnimpostfxStop('DeathFailOut')
		DoScreenFadeIn(800)
	end)
	SetEntityRagdoll = true
	Citizen.CreateThread(function()
		local DeathMenu = RageUI.CreateMenu('', "Vous êtes dans le coma")
		DeathMenu.Closable = false
		RageUI.Visible(DeathMenu, not RageUI.Visible(DeathMenu))
		IsTimeFinish = false
		IsTimeDead = 8 -- 8 minutes
		LunchTimer()
		SetEntityInvincible(PlayerPedId(), true)
		while SetEntityRagdoll do
			Wait(0)
			RageUI.IsVisible(DeathMenu, function()
				RageUI.Separator('')
				RageUI.Separator('~b~Vous êtes inconscient')
				RageUI.Separator('Temps restant ~b~'..IsTimeDead..' ~w~minutes')
				RageUI.Separator('')
				RageUI.Button("Signalez votre situation", nil, {}, true, {
					onSelected = function() 
						TriggerServerEvent('ewen:CreateEmsSignal')
					end
				})
				RageUI.Button('Réaparaitre', nil,  {RightBadge = RageUI.BadgeStyle.Tick}, IsTimeFinish, {
					onSelected = function()
						TriggerServerEvent('ewen:RespawnHopital')
						SetEntityRagdoll = false
						SetEntityInvincible(PlayerPedId(), false)
						RageUI.CloseAll()
					end
				})
			end)
			
			if not RageUI.Visible(DeathMenu) then
				DeathMenu = RMenu:DeleteType('DeathMenu', true)
			end

			if SetEntityRagdoll then
				SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
			end
		end
	end)
end)

function LunchTimer()
	Citizen.CreateThread(function()
		while true do 
			Wait(1*60*1000)
			if IsTimeDead >= 1 then
				IsTimeDead = IsTimeDead-1
			else
				IsTimeFinish = true
				break
			end
		end
	end)
end

function RespawnPed(ped, spawn)
	SetEntityCoordsNoOffset(ped, spawn.coords, false, false, false, true)
	NetworkResurrectLocalPlayer(spawn.coords, spawn.heading, true, false)
	SetPlayerInvincible(ped, false)
	TriggerEvent('playerSpawned', spawn)
	ClearPedBloodDamage(ped)
end

RegisterNetEvent('EMS:ReviveClientPlayer')
AddEventHandler('EMS:ReviveClientPlayer', function()
	SetEntityRagdoll = false
	TriggerServerEvent('EMS:UpdateTableIsDead', false)
end)