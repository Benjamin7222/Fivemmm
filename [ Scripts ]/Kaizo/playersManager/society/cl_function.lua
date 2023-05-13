Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent(mSocietyCFG.ESX, function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

mSociety = {}
mSociety.Zone = {}
mSociety.Trad = mSocietyTranslation[mSocietyCFG.Language]

mSociety.InitKaizoUIMenu = function(_title, _subtitle, _texturedict, _texturename, _banner)
    if _banner then
	    RMenu.Add('bossmenu', 'main', KaizoUI.CreateMenu(_title, _subtitle, nil, nil, _texturedict, _texturename))
    else
        RMenu.Add('bossmenu', 'main', KaizoUI.CreateMenu(_title, _subtitle, 10, 200))
    end
    RMenu.Add('bossmenu', 'manage_employees', KaizoUI.CreateSubMenu(RMenu:Get('bossmenu', 'main'), _title, _subtitle))
    RMenu.Add('bossmenu', 'update_employee', KaizoUI.CreateSubMenu(RMenu:Get('bossmenu', 'manage_employees'), _title, _subtitle))
    RMenu.Add('bossmenu', 'manage_salary', KaizoUI.CreateSubMenu(RMenu:Get('bossmenu', 'main'), _title, _subtitle))
	RMenu:Get('bossmenu', 'main').EnableMouse = false
	RMenu:Get('bossmenu', 'main').Closed = function() mSociety.Menu = false end
end

mSociety.KeyboardInput = function(entryTitle, textEntry, inputText, maxLength) 
    AddTextEntry(entryTitle, textEntry) 
    DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength) 
    while (UpdateOnscreenKeyboard() ~= 1) and (UpdateOnscreenKeyboard() ~= 2) do 
        DisableAllControlActions(0) 
        Citizen.Wait(0) 
    end 
    if UpdateOnscreenKeyboard() ~= 2 then 
        return GetOnscreenKeyboardResult() 
    else 
        return nil 
    end 
end

mSociety.ShowHelpNotification = function(msg)
    AddTextEntry('HelpNotification', msg)
    BeginTextCommandDisplayHelp('HelpNotification')
    EndTextCommandDisplayHelp(0, false, true, -1)
end

Citizen.CreateThread(function()

    for k,v in pairs(mSocietyCFG.Zone) do
        if v.blip ~= nil then
            local _blips = AddBlipForCoord(v.pos)
            SetBlipSprite(_blips, v.blip.id)
            SetBlipScale(_blips, v.blip.scale)
            SetBlipColour(_blips, v.blip.color)
            SetBlipAsShortRange(_blips, true)
            SetBlipCategory(_blips, 8)
        
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.blip.label)
            EndTextCommandSetBlipName(_blips)
        end
    end

    TriggerEvent("mSociety:CreateSociety", mSocietyCFG.Zone)

end)

Citizen.CreateThread(function()
    while true do
        att = 500
        local pCoords = GetEntityCoords(PlayerPedId(), false)
        if mSociety.Zone ~= nil and ESX ~= nil then
            for k,v in pairs(mSociety.Zone) do

                if not mSociety.Menu then
					if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == v.name and ESX.PlayerData.job.grade_name == "boss" then
						if #(pCoords - v.pos) <= 10.0 then
							att = 1
                            local cfg = mSocietyCFG.Marker
							DrawMarker(cfg.Type, v.pos.x, v.pos.y, v.pos.z-0.9, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, cfg.Scale[1], cfg.Scale[2],cfg.Scale[3], cfg.Color[1], cfg.Color[2],cfg.Color[3], 170, false, false, false, 1, nil, nil, 0)
						
							if #(pCoords - v.pos) <= 1.5 then
								mSociety.ShowHelpNotification(mSociety.Trad["press_interact"])
								if IsControlJustPressed(0, 51) then
									mSociety.OpenKaizoUIMenu(v, v.options)
								end
							end
						end
					end
                end
            end
        end
        Citizen.Wait(att)
    end
end)

RegisterNetEvent("mSociety:CreateSociety")
AddEventHandler('mSociety:CreateSociety', function(data)
	Citizen.CreateThread(function()
		for k,v in pairs(data) do
            table.insert(mSociety.Zone, v)
            TriggerServerEvent('mSociety:registerSociety', v.name, v.label, "society_"..v.name, "society_"..v.name, "society_"..v.name, {type = "public"})
		end
	end)
end)

mSociety.RefreshMoney = function(_job)
    Citizen.CreateThread(function()
        if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
            ESX.TriggerServerCallback('mSociety:getSocietyMoney', function(money)
                mSociety.societyMoney = ESX.Math.GroupDigits(money)
            end, _job)
        end
    end)
end

mSociety.RefeshEmployeesList = function(_job)
    mSociety.EmployeesList = {}
    ESX.TriggerServerCallback('mSociety:getEmployees', function(employees)
        for i=1, #employees, 1 do
            table.insert(mSociety.EmployeesList,  employees[i])
        end
    end, _job)
end

mSociety.RefeshjobInfos = function(_job)
    mSociety.JobList = {}
    ESX.TriggerServerCallback('mSociety:getJob', function(job)
        for i=1, #job.grades, 1 do
            table.insert(mSociety.JobList,  job.grades[i])
        end
    end, _job)
end

local Alert = {
	Inprogress = false
}

RegisterNetEvent("mSociety:SendRequestRecruit")
AddEventHandler("mSociety:SendRequestRecruit", function(bb, cc, pp)
	RageUI.PopupChar({
		message = "~y~infos:~s~\n"..bb.."\n\n~y~Y~s~ "..mSociety.Trad["accept"]..". | ~y~G~s~ "..mSociety.Trad["decline"]..".",
		picture = "CHAR_CHAT_CALL",
		title = mSociety.Trad["new_offer"],
		iconTypes = 1,
		sender = mSociety.Trad["job"]
	})

	Citizen.Wait(100)
	Alert.Inprogress = true
	local count = 0
	Citizen.CreateThread(function()
		while Alert.Inprogress do

			if IsControlPressed(0, 246) then
				RageUI.Popup({message=mSociety.Trad["accepted_offer"]})
				ESX.PlayerData = ESX.GetPlayerData()
                TriggerServerEvent("mSociety:SetJob", cc, pp)
				Alert.Inprogress = false
				count = 0
			elseif IsControlPressed(0, 58) then
				RageUI.Popup({message=mSociety.Trad["decline_offer"]})
				Alert.Inprogress = false
				count = 0
			end
	
			count = count + 1

			if count >= 1000 then
				Alert.Inprogress = false
				count = 0
				RageUI.Popup({message=mSociety.Trad["ignored_offer"]})
			end
	
			Citizen.Wait(10)
		end
	end)
end)