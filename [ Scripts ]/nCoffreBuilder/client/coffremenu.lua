ESX = nil
local PlayerData = {}

-- Récupération donnée -- 
Coffre = {
    liste = {}
}

local allGradeForJobSelected = {}

-- LISTE --
PWCOFFRE = {
	listactionsaleIndex = 1,
    listactionsale = {"~g~Déposer~s~", "~r~Retirer~s~"},

	listactionargentIndex = 1,
    listactionargent = {"~g~Déposer~s~", "~r~Retirer~s~"},

};


all_items = {}
aucun = {}
coffrearme = {}
coffrearmesecondary = {}



Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job2 == nil do
		Citizen.Wait(10)
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

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
  ESX.PlayerData.job2 = job2
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
    AddTextEntry(entryTitle, textEntry)
    DisplayOnscreenKeyboard(1, entryTitle, "", inputText, "", "", "", maxLength)
	blockinput = true
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
		blockinput = false
        return result
    else
        Citizen.Wait(500)
		blockinput = false
        return nil
    end
end

 -- MENU
 local mainMenu = RageUI.CreateMenu("", "Action") 
 local depot = RageUI.CreateSubMenu(mainMenu, "", "Dépôt")
 local retrait = RageUI.CreateSubMenu(mainMenu, '', 'Retrait')
 local argent = RageUI.CreateSubMenu(mainMenu, '', 'Action')
 local permissionmenu = RageUI.CreateSubMenu(mainMenu, '', 'Action')
 local permissiondepot = RageUI.CreateSubMenu(permissionmenu, '', 'Permission')
 local permissionretrait = RageUI.CreateSubMenu(permissionmenu, '', 'Permission')
 local permissiondepotargent = RageUI.CreateSubMenu(permissionmenu, '', 'Permission')
 local permissionretraitargent = RageUI.CreateSubMenu(permissionmenu, '', 'Permission')
 local permissiondepotarme = RageUI.CreateSubMenu(permissionmenu, '', 'Permission')
 local permissionretraitarme = RageUI.CreateSubMenu(permissionmenu, '', 'Permission')
 local permissioncoffrefort = RageUI.CreateSubMenu(permissionmenu, '', 'Permission')
 local depositweapon = RageUI.CreateSubMenu(mainMenu, '', 'Dépôt')
 local retraitweapon = RageUI.CreateSubMenu(mainMenu, '', 'Retrait')


 local open = false
 local citoyenaction = true
 local vehiculeaction = false
 local communication = false


 mainMenu.X = 0 
 mainMenu.Y = 0
 
 mainMenu.Closed = function() 
     open = false 
 end 



 function coffremenu(id, society, jobselection, amountpropre, amountsale, checkpropre, checksale, armeactivation, objetactivation)
     if open then 
         open = false 
             RageUI.Visible(mainMenu, false) 
         return 
     else 
         open = true 
             RageUI.Visible(mainMenu, true)
         Citizen.CreateThread(function()
             while open do 
			RageUI.IsVisible(mainMenu, function()
				ESX.TriggerServerCallback('pawal:coffrelist', function(result)			
						for k,v in pairs(result) do
								   if ESX.PlayerData.job.name == v.job then
									   if ESX.PlayerData.job.grade >= tonumber(v.autorisationdepotitem) then
										   autorisationdepotitemmenu = true
										   affichageautorisationdepotitem = tonumber(v.autorisationdepotitem)
									   else
										   autorisationdepotitemmenu = false
									   end
								   end
		   
								   if ESX.PlayerData.job.name == v.job then
									   if ESX.PlayerData.job.grade >= tonumber(v.autorisationretraititem) then
										   autorisationretraititemmenu = true
										   affichageautorisationretraititem = tonumber(v.autorisationretraititem)
									   else
										   autorisationretraititemmenu = false
									   end
								   end
		   
								   if ESX.PlayerData.job.name == v.job then
									   if ESX.PlayerData.job.grade >= tonumber(v.autorisationdepotargent) then
										   autorisationdepotargemntmenu = true
										   affichageautorisationdepotargent = tonumber(v.autorisationdepotargent)
									   else
										   autorisationdepotargemntmenu = false
									   end
								   end
		   
								   if ESX.PlayerData.job.name == v.job then
									   if ESX.PlayerData.job.grade >= tonumber(v.autorisationretraitargent) then
										   autorisationretraitargentmenu = true
										   affichageautorisationretraitargent = tonumber(v.autorisationretraitargent)
									   else
										   autorisationretraitargentmenu = false
									   end
								   end
		   
								   if ESX.PlayerData.job.name == v.job then
									   if ESX.PlayerData.job.grade >= tonumber(v.autorisationcoffrefort) then
										   coffrefortautorisation = true
										   affichageautorisationcoffre = v.autorisationcoffrefort
									   else
										   coffrefortautorisation = false
									   end
								   end

							    if ESX.PlayerData.job.name == v.job then
									if ESX.PlayerData.job.grade >= tonumber(v.autorisationdepotarme) then
										coffredepotarme = true
										affichageautorisationcoffre = v.autorisationdepotarme
									else
										coffredepotarme = false
									end
								end

								if ESX.PlayerData.job.name == v.job then
									if ESX.PlayerData.job.grade >= tonumber(v.autorisationretraitarme) then
										coffreretraitarme = true
										affichageautorisationcoffre = v.autorisationretraitarme
									else
										coffreretraitarme = false
									end
								end

								end
							end)


				RageUI.Separator('Coffre : ~b~'..nomcoffre)
				RageUI.Separator('Votre grade : ~b~'..ESX.PlayerData.job.grade_label)
				if ESX.PlayerData.job.grade_name == "boss" or ESX.PlayerData.job.grade_name == "chief" then
				RageUI.Button("Gestion Permission", "Gérer les permissions du coffre", {RightLabel = "→→→"}, true, {
					onSelected = function()
						idcoffre = id
						checkproprecoffre= checkpropre
						checksalecoffre = checksale
						armeactivationselection = armeactivation
						objetactivationselection = objetactivation
						ESX.TriggerServerCallback("pawal:coffrelist", function(coffrelist)
							Coffre.liste = coffrelist
						end)
					end
				}, permissionmenu)
			end

			if Config.armeitem == false and objetactivation == "1" or Config.armeitem == true then
				if autorisationdepotitemmenu or autorisationretraititemmenu ~= false then
				RageUI.line(255,255,255,255)
				end
				if autorisationdepotitemmenu == true then
				RageUI.Button("Déposer un objet", "Déposer un objet dans le coffre", {RightLabel = "→→→"}, true, {
					onSelected = function()
						TriggerServerEvent('pawal:setsocietyserveur', society)
						ESX.TriggerServerCallback("pawal:coffrelist", function(coffrelist)
							Coffre.liste = coffrelist
						end)
						getInventory()
						Wait(50)
					end
				}, depot)
			    end

				if autorisationretraititemmenu == true then
				RageUI.Button("Prendre un objet", "Récupérer un objet dans le coffre", {RightLabel = "→→→"}, true, {
					onSelected = function()
						TriggerServerEvent('pawal:setsocietyserveur', society)
						ESX.TriggerServerCallback("pawal:coffrelist", function(coffrelist)
							Coffre.liste = coffrelist
						end)
						getStock()
						Wait(50)
					end
				}, retrait)
	          end
			end
			  
			if Config.armeitem == false and armeactivation == "1" then
			  if coffredepotarme and coffreretraitarme ~= false then
				
			RageUI.line(255,255,255,255)

			if coffredepotarme == true then
			  RageUI.Button("Déposer une arme", "Déposer une arme dans le coffre", {RightLabel = "→→→"}, true, {
				  onSelected = function()
					TriggerServerEvent('pawal:setsocietyserveur', society)
					societydepositweapon = society
					Wait(550)
				  end
			  }, depositweapon)
			end
  
			if coffreretraitarme == true then
			  RageUI.Button("Prendre une arme", "Récupérer une arme dans le coffre", {RightLabel = "→→→"}, true, {
				  onSelected = function()
					societyretraitweapon = society
					refreshcoffreweapon(society)
					Wait(550)
				  end
			  }, retraitweapon)
			end
		end
		end

				if checkpropre == "1" or checksale == "1" then

				if coffrefortautorisation == true then
					RageUI.line(255,255,255,255)

				RageUI.Button("Coffre-fort", "Accedez au stockage de l'argent", {RightLabel = "→→→"}, true, {
					onSelected = function()
						TriggerServerEvent('pawal:setsocietyserveur', society)	
						ESX.TriggerServerCallback('pawal:coffrelist', function(result)		 
			            for k,v in pairs(result) do
							if "society_"..ESX.PlayerData.job.name == v.society then
						amountpropresaisi = v.amountpropre
						amountsalesaisi = v.amountsale
						autorisationsale = v.argentsaleactivation
						autorisationpropre = v.argentpropreactivation  
						idsaisi = id
						Wait(100)
						TriggerServerEvent('pawal:refresh', id)
						argentcoffrewait = true
						  end
						end
					  end)
					end
				}, argent)
			end
			end
	    end)

		RageUI.IsVisible(depositweapon, function()
			local weaponList = ESX.GetWeaponList()

			for i=1, #weaponList, 1 do
				local weaponHash = GetHashKey(weaponList[i].name)
				if HasPedGotWeapon(PlayerPedId(), weaponHash, false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
				RageUI.Button(weaponList[i].label, nil, {RightLabel = "→→"}, true, {
					onSelected = function()
						ESX.ShowNotification('~g~Vous avez déposer x1 '..weaponList[i].label..' dans le coffre '..nomcoffre)
						ESX.TriggerServerCallback('pawal:depositweapon', function()
                        end, weaponList[i].name, true)
                    end
				})
		end
		end
	    end)

		RageUI.IsVisible(retraitweapon, function()
				for k,v in pairs(coffrearme) do 
					if v.count > 0 then
					RageUI.Button(ESX.GetWeaponLabel(v.name), nil, {RightLabel = "~b~x"..v.count}, true, {
						onSelected = function()
							if HasPedGotWeapon(PlayerPedId(), GetHashKey(v.name), false) then
								ESX.ShowNotification('~r~Vous avez déjà un/une '..ESX.GetWeaponLabel(v.name)..' sur vous')

							else
							ESX.ShowNotification('~g~Vous avez retirer x1 '..ESX.GetWeaponLabel(v.name).." du coffre "..nomcoffre)
							ESX.TriggerServerCallback('pawal:retraitweapon', function()
							end, v.name, societyretraitweapon)
							RageUI.CloseAll()
							refreshcoffreweapon(societyretraitweapon)
                            Wait(50)
							RageUI.Visible(retraitweapon, true)
						end
						end
						})
				end
			end
	    end)

		RageUI.IsVisible(permissionmenu, function()
			ESX.TriggerServerCallback('pawal:coffrelist', function(result)			
				for k,v in pairs(result) do
						   if ESX.PlayerData.job.name == v.job then
							   if ESX.PlayerData.job.grade >= tonumber(v.autorisationdepotitem) then
								   autorisationdepotitemmenu = true
								   affichageautorisationdepotitem = tonumber(v.autorisationdepotitem)
							   else
								   autorisationdepotitemmenu = false
							   end
						   end
   
						   if ESX.PlayerData.job.name == v.job then
							   if ESX.PlayerData.job.grade >= tonumber(v.autorisationretraititem) then
								   autorisationretraititemmenu = true
								   affichageautorisationretraititem = tonumber(v.autorisationretraititem)
							   else
								   autorisationretraititemmenu = false
							   end
						   end
   
						   if ESX.PlayerData.job.name == v.job then
							   if ESX.PlayerData.job.grade >= tonumber(v.autorisationdepotargent) then
								   autorisationdepotargemntmenu = true
								   affichageautorisationdepotargent = tonumber(v.autorisationdepotargent)
							   else
								   autorisationretraititemmenu = false
							   end
						   end
   
						   if ESX.PlayerData.job.name == v.job then
							   if ESX.PlayerData.job.grade >= tonumber(v.autorisationretraitargent) then
								   autorisationretraitargentmenu = true
								   affichageautorisationretraitargent = tonumber(v.autorisationretraitargent)
							   else
								   autorisationretraitargentmenu = false
							   end
						   end
   
						   if ESX.PlayerData.job.name == v.job then
							   if ESX.PlayerData.job.grade >= tonumber(v.autorisationcoffrefort) then
								   coffrefortautorisation = true
								   affichageautorisationcoffre = v.autorisationcoffrefort
							   else
								   coffrefortautorisation = false
							   end
						   end

						   if ESX.PlayerData.job.name == v.job then
							if ESX.PlayerData.job.grade >= tonumber(v.autorisationdepotarme) then
								coffredepotarme = true
								affichageautorisationdepotarme = v.autorisationdepotarme
							else
								coffredepotarme = false
							end
						end

						if ESX.PlayerData.job.name == v.job then
							if ESX.PlayerData.job.grade >= tonumber(v.autorisationretraitarme) then
								coffreretraitarme = true
								affichageautorisationretraitarme = v.autorisationretraitarme
							else
								coffreretraitarme = false
							end
						end

						end
					end)
			
			if Config.armeitem == true or Config.armeitem == false and objetactivationselection == "1" then
			RageUI.Separator('Gestion Coffre : ~b~Item')

			RageUI.Button("Permission Dépôt", "Gérer les permissions du coffre", {RightLabel = "→→→"}, true, {
				onSelected = function()
					nameSo = ESX.PlayerData.job.name
					idcoffremodificationgrade = idcoffre
					ESX.TriggerServerCallback('pawal:getAllGrade', function(allGrade)
					 allGradeForJobSelected = allGrade
					end, ESX.PlayerData.job.name)
					Wait(150)
				end
			}, permissiondepot)

			RageUI.Button("Permission Retrait", "Gérer les permissions du coffre", {RightLabel = "→→→"}, true, {
				onSelected = function()
					nameSo = ESX.PlayerData.job.name
					idcoffremodificationgrade = idcoffre
					ESX.TriggerServerCallback('pawal:getAllGrade', function(allGrade)
					 allGradeForJobSelected = allGrade
					end, ESX.PlayerData.job.name)
					Wait(150)
				end
			}, permissionretrait)
		end

			if Config.armeitem == false and armeactivationselection == "1" then
			RageUI.Separator('Gestion Coffre : ~b~Arme')

			RageUI.Button("Permission Arme", "Gérer les permissions du coffre", {RightLabel = "→→→"}, true, {
				onSelected = function()
					nameSo = ESX.PlayerData.job.name
					idcoffremodificationgrade = idcoffre
					ESX.TriggerServerCallback('pawal:getAllGrade', function(allGrade)
					 allGradeForJobSelected = allGrade
					end, ESX.PlayerData.job.name)
					Wait(150)
				end
			}, permissiondepotarme)
		

			RageUI.Button("Permission Retrait", "Gérer les permissions du coffre", {RightLabel = "→→→"}, true, {
				onSelected = function()
					nameSo = ESX.PlayerData.job.name
					idcoffremodificationgrade = idcoffre
					ESX.TriggerServerCallback('pawal:getAllGrade', function(allGrade)
					 allGradeForJobSelected = allGrade
					end, ESX.PlayerData.job.name)
					Wait(150)
				end
			}, permissionretraitarme)
		end

			if checkproprecoffre == "1" or checksalecoffre == "1" then
			RageUI.Separator('Gestion Coffre : ~b~Argent')

			
			RageUI.Button("Permission Dépôt", "Gérer les permissions du coffre", {RightLabel = "→→→"}, true, {
				onSelected = function()
					nameSo = ESX.PlayerData.job.name
					idcoffremodificationgrade = idcoffre
					ESX.TriggerServerCallback('pawal:getAllGrade', function(allGrade)
					 allGradeForJobSelected = allGrade
					end, ESX.PlayerData.job.name)
					Wait(150)
				end
			}, permissiondepotargent)

			RageUI.Button("Permission Retrait", "Gérer les permissions du coffre", {RightLabel = "→→→"}, true, {
				onSelected = function()
					nameSo = ESX.PlayerData.job.name
					idcoffremodificationgrade = idcoffre
					ESX.TriggerServerCallback('pawal:getAllGrade', function(allGrade)
					 allGradeForJobSelected = allGrade
					end, ESX.PlayerData.job.name)
					Wait(150)
				end
			}, permissionretraitargent)

			RageUI.Separator('Gestion Coffre : ~b~Coffre Fort')

			
			RageUI.Button("Permission Accès Coffre Fort", "Gérer les permissions du coffre", {RightLabel = "→→→"}, true, {
				onSelected = function()
					nameSo = ESX.PlayerData.job.name
					idcoffremodificationgrade = idcoffre
					ESX.TriggerServerCallback('pawal:getAllGrade', function(allGrade)
					 allGradeForJobSelected = allGrade
					end, ESX.PlayerData.job.name)
					Wait(150)
				end
			}, permissioncoffrefort)
		end
	end)

	RageUI.IsVisible(permissioncoffrefort, function()
		RageUI.Separator(' Désigner le grade minimum pour : ~b~Coffre Fort')
		RageUI.Separator('Permission Actuel (Numéro du grade) : ~b~'..affichageautorisationcoffre)
		RageUI.line(255,255,255,255)
        for k,v in pairs(allGradeForJobSelected) do

            RageUI.Button(v.gradeLabel, "Numéro grade :~b~ "..v.gradeJob, {RightLabel = "→→→"}, true, {
				onSelected = function()
					TriggerServerEvent('pawal:modificationcoffrefort', idcoffremodificationgrade, v.gradeJob)
					ESX.ShowNotification('~g~Modification réussi')
					
                end
            }, permissionmenu)
        end
   end)

	RageUI.IsVisible(permissiondepot, function()
		RageUI.Separator('Désigner le grade minimum pour : ~b~Dépôt')
		RageUI.Separator('Permission Actuel (Numéro du grade) : ~b~'..affichageautorisationdepotitem)
		RageUI.line(255,255,255,255)
        for k,v in pairs(allGradeForJobSelected) do

            RageUI.Button(v.gradeLabel, "Numéro grade :~b~ "..v.gradeJob, {RightLabel = "→→→"}, true, {
				onSelected = function()
					TriggerServerEvent('pawal:modificationcoffredepotitem', idcoffremodificationgrade, v.gradeJob)
					ESX.ShowNotification('~g~Modification réussi')
					
                end
            }, permissionmenu)
        end
   end)


	RageUI.IsVisible(permissionretrait, function()
		RageUI.Separator('Désigner le grade minimum pour : ~b~Retrait')
		RageUI.Separator('Permission Actuel (Numéro du grade) : ~b~'..affichageautorisationretraititem)
		RageUI.line(255,255,255,255)
        for k,v in pairs(allGradeForJobSelected) do

            RageUI.Button(v.gradeLabel, "Numéro grade :~b~ "..v.gradeJob, {RightLabel = "→→→"}, true, {
				onSelected = function()
					TriggerServerEvent('pawal:modificationcoffreretraititem', idcoffremodificationgrade, v.gradeJob)
					ESX.ShowNotification('~g~Modification réussi')
					
                end
            }, permissionmenu)
        end
   end)

   RageUI.IsVisible(permissiondepotargent, function()
	RageUI.Separator('Désigner le grade minimum pour : ~b~Dépôt')
	RageUI.Separator('Permission Actuel (Numéro du grade) : ~b~'..affichageautorisationdepotargent)
	RageUI.line(255,255,255,255)
	for k,v in pairs(allGradeForJobSelected) do

		RageUI.Button(v.gradeLabel, "Numéro grade :~b~ "..v.gradeJob, {RightLabel = "→→→"}, true, {
			onSelected = function()
				TriggerServerEvent('pawal:modificationcoffredepotargent', idcoffremodificationgrade, v.gradeJob)
				ESX.ShowNotification('~g~Modification réussi')
				
			end
		}, permissionmenu)
	end
end)

RageUI.IsVisible(permissiondepotarme, function()
	RageUI.Separator('Désigner le grade minimum pour : ~b~Dépôt')
	RageUI.Separator('Permission Actuel (Numéro du grade) : ~b~'..affichageautorisationdepotarme)
	RageUI.line(255,255,255,255)
	for k,v in pairs(allGradeForJobSelected) do

		RageUI.Button(v.gradeLabel, "Numéro grade :~b~ "..v.gradeJob, {RightLabel = "→→→"}, true, {
			onSelected = function()
				TriggerServerEvent('pawal:modificationcoffredepotarme', idcoffremodificationgrade, v.gradeJob)
				ESX.ShowNotification('~g~Modification réussi')
				
			end
		}, permissionmenu)
	end
end)

RageUI.IsVisible(permissionretraitarme, function()
	RageUI.Separator('Désigner le grade minimum pour : ~b~Retrait')
	RageUI.Separator('Permission Actuel (Numéro du grade) : ~b~'..affichageautorisationretraitarme)
	RageUI.line(255,255,255,255)
	for k,v in pairs(allGradeForJobSelected) do

		RageUI.Button(v.gradeLabel, "Numéro grade :~b~ "..v.gradeJob, {RightLabel = "→→→"}, true, {
			onSelected = function()
				TriggerServerEvent('pawal:modificationcoffreretraitarme', idcoffremodificationgrade, v.gradeJob)
				ESX.ShowNotification('~g~Modification réussi')
				
			end
		}, permissionmenu)
	end
end)

RageUI.IsVisible(permissionretraitargent, function()
	RageUI.Separator('Désigner le grade minimum pour : ~b~Retrait')
	RageUI.Separator('Permission Actuel (Numéro du grade) : ~b~'..affichageautorisationretraitargent)
	RageUI.line(255,255,255,255)
	for k,v in pairs(allGradeForJobSelected) do

		RageUI.Button(v.gradeLabel, "Numéro grade :~b~ "..v.gradeJob, {RightLabel = "→→→"}, true, {
			onSelected = function()
				TriggerServerEvent('pawal:modificationcoffreretraitargent', idcoffremodificationgrade, v.gradeJob)
				ESX.ShowNotification('~g~Modification réussi')
				
			end
		}, permissionmenu)
	end
end)

		RageUI.IsVisible(retrait, function()
            
            for k,v in pairs(all_items) do
                RageUI.Button(v.label, nil, {RightLabel = "~g~x"..math.round(v.nb)}, true, {onSelected = function()
                    local count = KeyboardInput("test", '~s~Quanité à retirer ?' , '', 2000)
                    count = tonumber(count)
                    if count <= v.nb then
                        TriggerServerEvent("pawal:retrait",v.item, nomcoffre, count)
                    else
						ESX.ShowNotification("~r~Pas assez de stock de "..v.label.." pour pouvoir retirer le montant saisi")
                    end
                    getStock()
                end});
            end
        end)

		RageUI.IsVisible(argent, function()
			if argentcoffrewait == true then
			
			if autorisationpropre == "1" then	
			RageUI.Separator('Argent propre : ~g~'..amountpropresaisi.."$")
			end

			if autorisationsale == "1" then
			RageUI.Separator('Argent sale : ~r~'..amountsalesaisi.."$")
			end

            RageUI.line(255,255,255,255)
			if autorisationpropre == "1" then
			RageUI.List("Argent propre : ", PWCOFFRE.listactionargent, PWCOFFRE.listactionargentIndex, nil, {}, true, {
				onListChange = function(Index)
					PWCOFFRE.listactionargentIndex = Index
				end,
				onSelected = function()
					if PWCOFFRE.listactionargentIndex == 1 then
						if autorisationdepotargemntmenu == true then
						local Depotjoueurpropre = KeyboardInput("test", 'Combien vous voulez déposer ~g~d\'argent propre ?' , '', 2000)
						if Depotjoueurpropre ~= nil then 
							Depotjoueurpropre = tonumber(Depotjoueurpropre)
							if type(Depotjoueurpropre) == "number" then 
								TriggerServerEvent("pawal:ActionMoneyPropreDEPOSER", idsaisi, Depotjoueurpropre)
								Wait(100)
								ESX.TriggerServerCallback('pawal:coffrelist', function(result)		 
									for k,v in pairs(result) do
										if "society_"..ESX.PlayerData.job.name == v.society  then
									amountpropresaisi = v.amountpropre
									Wait(1)
									TriggerServerEvent('pawal:refresh', idsaisi)
										end
									end
								  end)
							else
								ESX.ShowNotification('~r~Valeur invalide')
							end
						else
							ESX.ShowNotification('~r~Valeur invalide')
						end
					else
						ESX.ShowNotification('~r~Vous n\'avez pas les permissions néceissaire !')
					end
					elseif PWCOFFRE.listactionargentIndex == 2 then
						if autorisationretraitargentmenu == true then
						local Retraitjoueurpropre = KeyboardInput("test", 'Combien vous voulez retirer ~g~d\'argent propre ?' , '', 2000)
						if Retraitjoueurpropre ~= nil then 
							Retraitjoueurpropre = tonumber(Retraitjoueurpropre)
							if type(Retraitjoueurpropre) == "number" then 
								TriggerServerEvent("pawal:ActionMoneyPropreRETIRER", idsaisi, Retraitjoueurpropre)
								Wait(100)
								ESX.TriggerServerCallback('pawal:coffrelist', function(result)		 
									for k,v in pairs(result) do
										if "society_"..ESX.PlayerData.job.name == v.society then
									amountpropresaisi = v.amountpropre
										end
									Wait(1)
									TriggerServerEvent('pawal:refresh', idsaisi)
									end
								  end)							
								else
								ESX.ShowNotification('~r~Valeur invalide')
							end
						else
							ESX.ShowNotification('~r~Valeur invalide')
						end
					else
						ESX.ShowNotification('~r~Vous n\'avez pas les permissions néceissaire !')
					end
				end
			end
			})
		end

		if autorisationsale == "1" then
			RageUI.List("Argent sale : ", PWCOFFRE.listactionsale, PWCOFFRE.listactionsaleIndex, nil, {}, true, {
				onListChange = function(Index)
					PWCOFFRE.listactionsaleIndex = Index
				end,
				onSelected = function()
					if PWCOFFRE.listactionsaleIndex == 1 then
						if autorisationdepotargemntmenu == true then
							local Depotjoueursale = KeyboardInput("test", 'Combien vous voulez déposer ~r~d\'argent sale ?' , '', 2000)
						if Depotjoueursale ~= nil then 
							Depotjoueursale = tonumber(Depotjoueursale)
							if type(Depotjoueursale) == "number" then 
								TriggerServerEvent("pawal:ActionMoneySaleDEPOSER", idsaisi, Depotjoueursale)
								Wait(100)
								ESX.TriggerServerCallback('pawal:coffrelist', function(result)		 
									for k,v in pairs(result) do
										if "society_"..ESX.PlayerData.job.name == v.society then
									      amountsalesaisi = v.amountsale
										end
									Wait(1)
									TriggerServerEvent('pawal:refresh', idsaisi)
									end
								  end)
							else
								ESX.ShowNotification('~r~Valeur invalide')
							end
						else
							ESX.ShowNotification('~r~Valeur invalide')
						end
					else
						ESX.ShowNotification('~r~Vous n\'avez pas les permissions néceissaire !')
					end
					elseif PWCOFFRE.listactionsaleIndex == 2 then
						if autorisationretraitargentmenu == true then
						local Retraitjoueursale = KeyboardInput("test", 'Combien vous voulez retirer ~r~d\'argent sale ?' , '', 2000)
						if Retraitjoueursale ~= nil then 
							Retraitjoueursale = tonumber(Retraitjoueursale)
							if type(Retraitjoueursale) == "number" then 
								TriggerServerEvent("pawal:ActionMoneySaleRETIRER", idsaisi, Retraitjoueursale)
								Wait(100)
								ESX.TriggerServerCallback('pawal:coffrelist', function(result)		 
									for k,v in pairs(result) do
										if "society_"..ESX.PlayerData.job.name == v.society then
									amountsalesaisi = v.amountsale
										end
									Wait(5)
									TriggerServerEvent('pawal:refresh', idsaisi)
									end
								  end)
							else
								ESX.ShowNotification('~r~Valeur invalide')
							end
						else
							ESX.ShowNotification('~r~Valeur invalide')
						end
					else
						ESX.ShowNotification('~r~Vous n\'avez pas les permissions néceissaire !')
					end
				end
			end
			})
		end
			end
        end)

		RageUI.IsVisible(depot, function()
            
            for k,v in pairs(all_items) do
                RageUI.Button(v.label, nil, {RightLabel = "~g~x"..math.round(v.nb)}, true, {onSelected = function()
                    local count = KeyboardInput("test", '~s~Quantité à déposer ?' , '', 2000)
                    count = tonumber(count)
                    TriggerServerEvent("pawal:depot",v.item, count, nomcoffre)
                    getInventory()
                end});
            end
            

       end)

	   Citizen.Wait(0)
             end
         end)
     end
 end

 function coffremenu2(id, society, jobselection, amountpropre, amountsale, checkpropre, checksale, armeactivation2, objetactivation2)
	if open then 
		open = false 
			RageUI.Visible(mainMenu, false) 
		return 
	else 
		open = true 
			RageUI.Visible(mainMenu, true)
		Citizen.CreateThread(function()
			while open do 
		   RageUI.IsVisible(mainMenu, function()
			ESX.TriggerServerCallback('pawal:coffrelist', function(result)			
				for k,v in pairs(result) do
						   if ESX.PlayerData.job2.name == v.job then
							   if ESX.PlayerData.job2.grade >= tonumber(v.autorisationdepotitem) then
								   autorisationdepotitemmenu2 = true
								   affichageautorisationdepotitem2 = tonumber(v.autorisationdepotitem)
							   else
								   autorisationdepotitemmenu2 = false
							   end
						   end
   
						   if ESX.PlayerData.job2.name == v.job then
							   if ESX.PlayerData.job2.grade >= tonumber(v.autorisationretraititem) then
								   autorisationretraititemmenu2 = true
								   affichageautorisationretraititem2 = tonumber(v.autorisationretraititem)
							   else
								   autorisationretraititemmenu2 = false
							   end
						   end
   
						   if ESX.PlayerData.job2.name == v.job then
							   if ESX.PlayerData.job2.grade >= tonumber(v.autorisationdepotargent) then
								   autorisationdepotargemntmenu2 = true
								   affichageautorisationdepotargent2 = tonumber(v.autorisationdepotargent)
							   else
								   autorisationretraititemmenu2 = false
							   end
						   end
   
						   if ESX.PlayerData.job2.name == v.job then
							   if ESX.PlayerData.job2.grade >= tonumber(v.autorisationretraitargent) then
								   autorisationretraitargentmenu2 = true
								   affichageautorisationretraitargent2 = tonumber(v.autorisationretraitargent)
							   else
								   autorisationretraitargentmenu2 = false
							   end
						   end
   
						   if ESX.PlayerData.job2.name == v.job then
							   if ESX.PlayerData.job2.grade >= tonumber(v.autorisationcoffrefort) then
								   coffrefortautorisation2 = true
								   affichageautorisationcoffre2 = v.autorisationcoffrefort
							   else
								   coffrefortautorisation2 = false
							   end
						   end

						   if ESX.PlayerData.job2.name == v.job then
							if ESX.PlayerData.job2.grade >= tonumber(v.autorisationcoffrefort) then
								coffrefortautorisation2 = true
								affichageautorisationcoffre2 = v.autorisationcoffrefort
							else
								coffrefortautorisation2 = false
							end
						end

						if ESX.PlayerData.job2.name == v.job then
							if ESX.PlayerData.job2.grade >= tonumber(v.autorisationdepotarme) then
								coffredepotarme2 = true
								affichageautorisationdepotarme2 = v.autorisationdepotarme
							else
								coffredepotarme2 = false
							end
						end

						if ESX.PlayerData.job2.name == v.job then
							if ESX.PlayerData.job2.grade >= tonumber(v.autorisationretraitarme) then
								coffreretraitarme2 = true
								affichageautorisationretraitarmee2 = v.autorisationretraitarme
							else
								coffreretraitarme2 = false
							end
						end

						end
					end)

			   RageUI.Separator('Coffre : ~b~'..nomcoffre)
			   RageUI.Separator('Votre grade : ~b~'..ESX.PlayerData.job2.grade_label)
			   if ESX.PlayerData.job2.grade_name == "boss" then
			   RageUI.Button("Gestion Permission", "Gérer les permissions du coffre", {RightLabel = "→→→"}, true, {
				   onSelected = function()
					   idcoffre = id
					   checkproprecoffre = checkpropre
					   checksalecoffre = checksale
					   armeactivationselectionn = armeactivation
					   objetactivationselectionn = objetactivation
					   ESX.TriggerServerCallback("pawal:coffrelist", function(coffrelist)
						   Coffre.liste = coffrelist
					   end)
				   end
			   }, permissionmenu)
		   end
		   
		   if Config.armeitem == false and objetactivation2 == "1" or Config.armeitem == true then
			 RageUI.line(255,255,255,255)

			   if autorisationretraititemmenu2 == true then
			   RageUI.Button("Déposer un objet", "Déposer un objet dans le coffre", {RightLabel = "→→→"}, true, {
				   onSelected = function()
					   TriggerServerEvent('pawal:setsocietyserveur', society)
					   ESX.TriggerServerCallback("pawal:coffrelist", function(coffrelist)
						   Coffre.liste = coffrelist
					   end)
					   getInventory()
					   Wait(50)
				   end
			   }, depot)
			   end

              if autorisationdepotitemmenu2 == true then
			   RageUI.Button("Prendre un objet", "Récupérer un objet dans le coffre", {RightLabel = "→→→"}, true, {
				   onSelected = function()
					   TriggerServerEvent('pawal:setsocietyserveur', society)
					   ESX.TriggerServerCallback("pawal:coffrelist", function(coffrelist)
						   Coffre.liste = coffrelist
					   end)
					   getStock()
					   Wait(50)

				   end
			   }, retrait)
			end
		end

			if Config.armeitem == false and armeactivation2 == "1" then
				if coffredepotarme2 and coffredepotarme2 ~= false then

			RageUI.line(255,255,255,255)

			if coffredepotarme2 == true then
			RageUI.Button("Déposer une arme", "Déposer une arme dans le coffre", {RightLabel = "→→→"}, true, {
				onSelected = function()
					societydepositweapon = society
					Wait(550)
				end
			}, depositweapon)
		end

			if coffreretraitarme2 == true then
			RageUI.Button("Prendre une arme", "Récupérer une arme dans le coffre", {RightLabel = "→→→"}, true, {
				onSelected = function()
					societyretraitweapon = society
					refreshcoffreweaponsecondary(society)
					Wait(550)

				end
			}, retraitweapon)
		end
	end
	end


			   if checkpropre == "1" or checksale == "1" then
			   RageUI.line(255,255,255,255)

			   if coffrefortautorisation2 == true then
			   RageUI.Button("Coffre-fort", "Accedez au stockage de l'argent", {RightLabel = "→→→"}, true, {
				   onSelected = function()
					   TriggerServerEvent('pawal:setsocietyserveur', society)	
					   ESX.TriggerServerCallback('pawal:coffrelist', function(result)		 
					   for k,v in pairs(result) do
						   if "society_"..ESX.PlayerData.job2.name == v.society then
					   amountpropresaisi2 = v.amountpropre
					   amountsalesaisi2 = v.amountsale
					   autorisationsale2 = v.argentsaleactivation
					   autorisationpropre2 = v.argentpropreactivation 
					   idsaisi = id
					   Wait(1)
					   TriggerServerEvent('pawal:refresh', id)
					   argentcoffrewait2 = true
						 end
					   end
					 end)
				   end
			   }, argent)
			end
		   end
	   end)

	   RageUI.IsVisible(retraitweapon, function()
		for k,v in pairs(coffrearmesecondary) do 
			if v.count > 0 then
			RageUI.Button(ESX.GetWeaponLabel(v.name), nil, {RightLabel = "~b~x"..v.count}, true, {
				onSelected = function()
					if Config.armeitem == false then
					if HasPedGotWeapon(PlayerPedId(), GetHashKey(v.name), false) then
						ESX.ShowNotification('~r~Vous avez déjà un/une '..ESX.GetWeaponLabel(v.name)..' sur vous')
					else
					end
					ESX.ShowNotification('~g~Vous avez retirer x1 '..ESX.GetWeaponLabel(v.name).." du coffre "..nomcoffre)
					ESX.TriggerServerCallback('pawal:retraitweapon', function()
					end, v.name, societyretraitweapon)
					RageUI.CloseAll()
					refreshcoffreweaponsecondary(societyretraitweapon)
					Wait(50)
					RageUI.Visible(retraitweapon, true)
					if Config.armeitem == false then
				end
			end
				end
				})
		end
	end
end)

	   RageUI.IsVisible(depositweapon, function()
		local weaponList = ESX.GetWeaponList()

		for i=1, #weaponList, 1 do
			local weaponHash = GetHashKey(weaponList[i].name)
			if HasPedGotWeapon(PlayerPedId(), weaponHash, false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
			RageUI.Button(weaponList[i].label, nil, {RightLabel = "→→"}, true, {
				onSelected = function()
					ESX.ShowNotification('~g~Vous avez déposer x1 '..weaponList[i].label)
					ESX.TriggerServerCallback('pawal:depositweapon', function()
					end, weaponList[i].name, true, societyretraitweapon)
				end
			})
	end
	end
	end)

	   RageUI.IsVisible(permissionmenu, function()
		ESX.TriggerServerCallback('pawal:coffrelist', function(result)			
			for k,v in pairs(result) do
					   if ESX.PlayerData.job2.name == v.job then
						   if ESX.PlayerData.job2.grade >= tonumber(v.autorisationdepotitem) then
							   autorisationdepotitemmenu2 = true
							   affichageautorisationdepotitem2 = tonumber(v.autorisationdepotitem)
						   else
							   autorisationdepotitemmenu2 = false
						   end
					   end

					   if ESX.PlayerData.job2.name == v.job then
						   if ESX.PlayerData.job2.grade >= tonumber(v.autorisationretraititem) then
							   autorisationretraititemmenu2 = true
							   affichageautorisationretraititem2 = tonumber(v.autorisationretraititem)
						   else
							   autorisationretraititemmenu2 = false
						   end
					   end

					   if ESX.PlayerData.job2.name == v.job then
						   if ESX.PlayerData.job2.grade >= tonumber(v.autorisationdepotargent) then
							   autorisationdepotargemntmenu2 = true
							   affichageautorisationdepotargent2 = tonumber(v.autorisationdepotargent)
						   else
							   autorisationretraititemmenu2 = false
						   end
					   end

					   if ESX.PlayerData.job2.name == v.job then
						   if ESX.PlayerData.job2.grade >= tonumber(v.autorisationretraitargent) then
							   autorisationretraitargentmenu2 = true
							   affichageautorisationretraitargent2 = tonumber(v.autorisationretraitargent)
						   else
							   autorisationretraitargentmenu2 = false
						   end
					   end

					   if ESX.PlayerData.job2.name == v.job then
						   if ESX.PlayerData.job2.grade >= tonumber(v.autorisationcoffrefort) then
							   coffrefortautorisation2 = true
							   affichageautorisationcoffre2 = v.autorisationcoffrefort
						   else
							   coffrefortautorisation2 = false
						   end
					   end

					   if ESX.PlayerData.job2.name == v.job then
						if ESX.PlayerData.job2.grade >= tonumber(v.autorisationdepotarme) then
							armedepotautorisation2 = true
							affichageautorisationdepotarme2 = v.autorisationdepotarme
						else
							armedepotautorisation2 = false
						end
					end

					if ESX.PlayerData.job2.name == v.job then
						if ESX.PlayerData.job2.grade >= tonumber(v.autorisationretraitarme) then
							armeretraitautorisation2 = true
							affichageautorisationretraitarme2 = v.autorisationretraitarme
						else
							armeretraitautorisation2 = false
						end
					end

					end
				end)
				
		if Config.armeitem == true or Config.armeitem == false and objetactivationselectionn == "1" then

		RageUI.Separator('Gestion Coffre : ~b~Item')


		RageUI.Button("Permission Dépôt", "Gérer les permissions du coffre", {RightLabel = "→→→"}, true, {
			onSelected = function()
				nameSo = ESX.PlayerData.job2.name
				idcoffremodificationgrade = idcoffre
				ESX.TriggerServerCallback('pawal:getAllGrade', function(allGrade)
				 allGradeForJobSelected = allGrade
				end, ESX.PlayerData.job2.name)
				Wait(150)
			end
		}, permissiondepot)

		RageUI.Button("Permission Retrait", "Gérer les permissions du coffre", {RightLabel = "→→→"}, true, {
			onSelected = function()
				nameSo = ESX.PlayerData.job2.name
				idcoffremodificationgrade = idcoffre
				ESX.TriggerServerCallback('pawal:getAllGrade', function(allGrade)
				 allGradeForJobSelected = allGrade
				end, ESX.PlayerData.job2.name)
				Wait(150)
			end
		}, permissionretrait)
	end

	if Config.armeitem == false and armeactivationselectionn == "1" then

		RageUI.Separator('Gestion Coffre : ~b~Arme')

		RageUI.Button("Permission Dépôt", "Gérer les permissions du coffre", {RightLabel = "→→→"}, true, {
			onSelected = function()
				nameSo = ESX.PlayerData.job2.name
				idcoffremodificationgrade = idcoffre
				ESX.TriggerServerCallback('pawal:getAllGrade', function(allGrade)
				 allGradeForJobSelected = allGrade
				end, ESX.PlayerData.job2.name)
				Wait(150)
			end
		}, permissiondepotarme)

		RageUI.Button("Permission Retrait", "Gérer les permissions du coffre", {RightLabel = "→→→"}, true, {
			onSelected = function()
				nameSo = ESX.PlayerData.job2.name
				idcoffremodificationgrade = idcoffre
				ESX.TriggerServerCallback('pawal:getAllGrade', function(allGrade)
				 allGradeForJobSelected = allGrade
				end, ESX.PlayerData.job2.name)
				Wait(150)
			end
		}, permissionretraitarme)

	end

		if checkproprecoffre == "1" or checksalecoffre == "1" then
		RageUI.Separator('Gestion Coffre : ~b~Argent')
		
		RageUI.Button("Permission Dépôt", "Gérer les permissions du coffre", {RightLabel = "→→→"}, true, {
			onSelected = function()
				nameSo = ESX.PlayerData.job2.name
				idcoffremodificationgrade = idcoffre
				ESX.TriggerServerCallback('pawal:getAllGrade', function(allGrade)
				 allGradeForJobSelected = allGrade
				end, ESX.PlayerData.job2.name)
				Wait(150)
			end
		}, permissiondepotargent)

		RageUI.Button("Permission Retrait", "Gérer les permissions du coffre", {RightLabel = "→→→"}, true, {
			onSelected = function()
				nameSo = ESX.PlayerData.job2.name
				idcoffremodificationgrade = idcoffre
				ESX.TriggerServerCallback('pawal:getAllGrade', function(allGrade)
				 allGradeForJobSelected = allGrade
				end, ESX.PlayerData.job2.name)
				Wait(150)
			end
		}, permissionretraitargent)

		RageUI.Separator('Gestion Coffre : ~b~Coffre Fort')

		
		RageUI.Button("Permission Accès Coffre Fort", "Gérer les permissions du coffre", {RightLabel = "→→→"}, true, {
			onSelected = function()
				nameSo = ESX.PlayerData.job2.name
				idcoffremodificationgrade = idcoffre
				ESX.TriggerServerCallback('pawal:getAllGrade', function(allGrade)
				 allGradeForJobSelected = allGrade
				end, ESX.PlayerData.job2.name)
				Wait(150)
			end
		}, permissioncoffrefort)
	end
end)

RageUI.IsVisible(permissioncoffrefort, function()
	RageUI.Separator(' Désigner le grade minimum pour : ~b~Coffre Fort')
	RageUI.Separator('Permission Actuel (Numéro du grade) : ~b~'..affichageautorisationcoffre2)
	RageUI.line(255,255,255,255)
	for k,v in pairs(allGradeForJobSelected) do

		RageUI.Button(v.gradeLabel, "Numéro grade :~b~ "..v.gradeJob, {RightLabel = "→→→"}, true, {
			onSelected = function()
				TriggerServerEvent('pawal:modificationcoffrefort', idcoffremodificationgrade, v.gradeJob)
				ESX.ShowNotification('~g~Modification réussi')
				
			end
		}, permissionmenu)
	end
end)

RageUI.IsVisible(permissiondepotarme, function()
	RageUI.Separator('Désigner le grade minimum pour : ~b~Dépôt')
	RageUI.Separator('Permission Actuel (Numéro du grade) : ~b~'..affichageautorisationdepotarme2)
	RageUI.line(255,255,255,255)
	for k,v in pairs(allGradeForJobSelected) do

		RageUI.Button(v.gradeLabel, "Numéro grade :~b~ "..v.gradeJob, {RightLabel = "→→→"}, true, {
			onSelected = function()
				TriggerServerEvent('pawal:modificationcoffredepotarme', idcoffremodificationgrade, v.gradeJob)
				ESX.ShowNotification('~g~Modification réussi')
				
			end
		}, permissionmenu)
	end
end)

RageUI.IsVisible(permissionretraitarme, function()
	RageUI.Separator('Désigner le grade minimum pour : ~b~Retrait')
	RageUI.Separator('Permission Actuel (Numéro du grade) : ~b~'..affichageautorisationretraitarme2)
	RageUI.line(255,255,255,255)
	for k,v in pairs(allGradeForJobSelected) do

		RageUI.Button(v.gradeLabel, "Numéro grade :~b~ "..v.gradeJob, {RightLabel = "→→→"}, true, {
			onSelected = function()
				TriggerServerEvent('pawal:modificationcoffreretraitarme', idcoffremodificationgrade, v.gradeJob)
				ESX.ShowNotification('~g~Modification réussi')
				
			end
		}, permissionmenu)
	end
end)

RageUI.IsVisible(permissiondepot, function()
	RageUI.Separator('Désigner le grade minimum pour : ~b~Dépôt')
	RageUI.Separator('Permission Actuel (Numéro du grade) : ~b~'..affichageautorisationdepotitem2)
	RageUI.line(255,255,255,255)
	for k,v in pairs(allGradeForJobSelected) do

		RageUI.Button(v.gradeLabel, "Numéro grade :~b~ "..v.gradeJob, {RightLabel = "→→→"}, true, {
			onSelected = function()
				TriggerServerEvent('pawal:modificationcoffredepotitem', idcoffremodificationgrade, v.gradeJob)
				ESX.ShowNotification('~g~Modification réussi')
				
			end
		}, permissionmenu)
	end
end)


RageUI.IsVisible(permissionretrait, function()
	RageUI.Separator('Désigner le grade minimum pour : ~b~Retrait')
	RageUI.Separator('Permission Actuel (Numéro du grade) : ~b~'..affichageautorisationretraititem2)
	RageUI.line(255,255,255,255)
	for k,v in pairs(allGradeForJobSelected) do

		RageUI.Button(v.gradeLabel, "Numéro grade :~b~ "..v.gradeJob, {RightLabel = "→→→"}, true, {
			onSelected = function()
				TriggerServerEvent('pawal:modificationcoffreretraititem', idcoffremodificationgrade, v.gradeJob)
				ESX.ShowNotification('~g~Modification réussi')
				
			end
		}, permissionmenu)
	end
end)

RageUI.IsVisible(permissiondepotargent, function()
RageUI.Separator('Désigner le grade minimum pour : ~b~Dépôt')
RageUI.Separator('Permission Actuel (Numéro du grade) : ~b~'..affichageautorisationdepotargent2)
RageUI.line(255,255,255,255)
for k,v in pairs(allGradeForJobSelected) do

	RageUI.Button(v.gradeLabel, "Numéro grade :~b~ "..v.gradeJob, {RightLabel = "→→→"}, true, {
		onSelected = function()
			TriggerServerEvent('pawal:modificationcoffredepotargent', idcoffremodificationgrade, v.gradeJob)
			ESX.ShowNotification('~g~Modification réussi')
			
		end
	}, permissionmenu)
end
end)

RageUI.IsVisible(permissionretraitargent, function()
RageUI.Separator('Désigner le grade minimum pour : ~b~Retrait')
RageUI.Separator('Permission Actuel (Numéro du grade) : ~b~'..affichageautorisationretraitargent2)
RageUI.line(255,255,255,255)
for k,v in pairs(allGradeForJobSelected) do

	RageUI.Button(v.gradeLabel, "Numéro grade :~b~ "..v.gradeJob, {RightLabel = "→→→"}, true, {
		onSelected = function()
			TriggerServerEvent('pawal:modificationcoffreretraitargent', idcoffremodificationgrade, v.gradeJob)
			ESX.ShowNotification('~g~Modification réussi')
			
		end
	}, permissionmenu)
end
end)


	   RageUI.IsVisible(retrait, function()
		   
		   for k,v in pairs(all_items) do
			   RageUI.Button(v.label, nil, {RightLabel = "~g~x"..math.round(v.nb)}, true, {onSelected = function()
				   local count = KeyboardInput("test", '~s~Quanité à retirer ?' , '', 2000)
				   count = tonumber(count)
				   if count <= v.nb then
					TriggerServerEvent("pawal:retrait",v.item, nomcoffre, count)
				else
					ESX.ShowNotification("~r~Pas assez de stock de "..v.label.." pour pouvoir retirer le montant saisi")
				end
				   getStock()
			   end});
		   end
	   end)

	   RageUI.IsVisible(argent, function()
		   if argentcoffrewait2 == true then
		   
		   if autorisationpropre2 == "1" then	
		   RageUI.Separator('Argent propre : ~g~'..amountpropresaisi2.."$")
		   end

		   if autorisationsale2 == "1" then
		   RageUI.Separator('Argent sale : ~r~'..amountsalesaisi2.."$")
		   end

		   RageUI.line(255,255,255,255)
		   if autorisationpropre2 == "1" then
		   RageUI.List("Argent propre : ", PWCOFFRE.listactionargent, PWCOFFRE.listactionargentIndex, nil, {}, true, {
			   onListChange = function(Index)
				   PWCOFFRE.listactionargentIndex = Index
			   end,
			   onSelected = function()
				   if PWCOFFRE.listactionargentIndex == 1 then
					if autorisationdepotargemntmenu2 == true then
					   local Depotjoueurpropre = KeyboardInput("test", 'Combien vous voulez déposer ~g~d\'argent propre ?' , '', 2000)
					   if Depotjoueurpropre ~= nil then 
						   Depotjoueurpropre = tonumber(Depotjoueurpropre)
						   if type(Depotjoueurpropre) == "number" then 
							   TriggerServerEvent("pawal:ActionMoneyPropreDEPOSER", idsaisi, Depotjoueurpropre)
							   Wait(100)
							   ESX.TriggerServerCallback('pawal:coffrelist', function(result)		 
								   for k,v in pairs(result) do
									   if "society_"..ESX.PlayerData.job2.name == v.society  then
								   amountpropresaisi2 = v.amountpropre
								   Wait(1)
								   TriggerServerEvent('pawal:refresh', idsaisi)
									   end
								   end
								 end)
						   else
							   ESX.ShowNotification('~r~Valeur invalide')
						   end
					   else
						   ESX.ShowNotification('~r~Valeur invalide')
					   end
					else
						ESX.ShowNotification('~r~Vous n\'avez pas les permissions néceissaire !')
					end
				   elseif PWCOFFRE.listactionargentIndex == 2 then
					if autorisationretraitargentmenu2 == true then
					   local Retraitjoueurpropre = KeyboardInput("test", 'Combien vous voulez retirer ~g~d\'argent propre ?' , '', 2000)
					   if Retraitjoueurpropre ~= nil then 
						   Retraitjoueurpropre = tonumber(Retraitjoueurpropre)
						   if type(Retraitjoueurpropre) == "number" then 
							   TriggerServerEvent("pawal:ActionMoneyPropreRETIRER", idsaisi, Retraitjoueurpropre)
							   Wait(100)
							   ESX.TriggerServerCallback('pawal:coffrelist', function(result)		 
								   for k,v in pairs(result) do
									   if "society_"..ESX.PlayerData.job2.name == v.society then
								   amountpropresaisi2 = v.amountpropre
									   end
								   Wait(1)
								   TriggerServerEvent('pawal:refresh', idsaisi)
								   end
								 end)							
							   else
							   ESX.ShowNotification('~r~Valeur invalide')
						   end
					   else
						   ESX.ShowNotification('~r~Valeur invalide')
					   end
					else
						ESX.ShowNotification('~r~Vous n\'avez pas les permissions néceissaire !')
					end
			   end
		   end
		   })
	   end

	   if autorisationsale2 == "1" then
		   RageUI.List("Argent sale : ", PWCOFFRE.listactionsale, PWCOFFRE.listactionsaleIndex, nil, {}, true, {
			   onListChange = function(Index)
				   PWCOFFRE.listactionsaleIndex = Index
			   end,
			   onSelected = function()
				   if PWCOFFRE.listactionsaleIndex == 1 then
					if autorisationdepotargemntmenu2 == true then
					   local Depotjoueursale = KeyboardInput("test", 'Combien vous voulez déposer ~r~d\'argent sale ?' , '', 2000)
					   if Depotjoueursale ~= nil then 
						   Depotjoueursale = tonumber(Depotjoueursale)
						   if type(Depotjoueursale) == "number" then 
							   TriggerServerEvent("pawal:ActionMoneySaleDEPOSER", idsaisi, Depotjoueursale)
							   Wait(100)
							   ESX.TriggerServerCallback('pawal:coffrelist', function(result)		 
								   for k,v in pairs(result) do
									   if "society_"..ESX.PlayerData.job2.name == v.society then
								   amountsalesaisi2 = v.amountsale
									   end
								   Wait(1)
								   TriggerServerEvent('pawal:refresh', idsaisi)
								   end
								 end)
						   else
							   ESX.ShowNotification('~r~Valeur invalide')
						   end
					   else
						   ESX.ShowNotification('~r~Valeur invalide')
					   end
					else
						ESX.ShowNotification('~r~Vous n\'avez pas les permissions néceissaire !')
					end
				   elseif PWCOFFRE.listactionsaleIndex == 2 then
					if autorisationretraitargentmenu2 == true then
					   local Retraitjoueursale = KeyboardInput("test", 'Combien vous voulez retirer ~r~d\'argent sale ?' , '', 2000)
					   if Retraitjoueursale ~= nil then 
						   Retraitjoueursale = tonumber(Retraitjoueursale)
						   if type(Retraitjoueursale) == "number" then 
							   TriggerServerEvent("pawal:ActionMoneySaleRETIRER", idsaisi, Retraitjoueursale)
							   Wait(100)
							   ESX.TriggerServerCallback('pawal:coffrelist', function(result)		 
								   for k,v in pairs(result) do
									   if "society_"..ESX.PlayerData.job2.name == v.society then
								   amountsalesaisi2 = v.amountsale
									   end
								   Wait(1)
								   TriggerServerEvent('pawal:refresh', idsaisi)
								   end
								 end)
						   else
							   ESX.ShowNotification('~r~Valeur invalide')
						   end
					   else
						   ESX.ShowNotification('~r~Valeur invalide')
					   end
					else
						ESX.ShowNotification('~r~Vous n\'avez pas les permissions néceissaire !')
					end
			   end
		   end
		   })
	   end
		   end
	   end)

	   RageUI.IsVisible(depot, function()
		   
		   for k,v in pairs(all_items) do
			   RageUI.Button(v.label, nil, {RightLabel = "~g~x"..math.round(v.nb)}, true, {onSelected = function()
				   local count = KeyboardInput("test", '~s~Quantité à déposer ?' , '', 2000)
				   count = tonumber(count)
				   TriggerServerEvent("pawal:depot",v.item, count, nomcoffre)
				   getInventory()
			   end});
		   end
		   

	  end)

	  Citizen.Wait(0)
			end
		end)
	end
end

Citizen.CreateThread(function()
	ESX.TriggerServerCallback('pawal:coffrelist', function(result)
		Coffre.liste = result
	end)
		 while true do
			 local playerPos = GetEntityCoords(PlayerPedId())
			 for k,v in pairs(Coffre.liste) do
				local coffrePos = vector3(json.decode(v.position).x, json.decode(v.position).y, json.decode(v.position).z)
				 local distanceCoffrePlayer = #(coffrePos-playerPos)
				 if ESX.PlayerData.job.name == v.job and ESX.PlayerData.job2.name ~= v.job then
					if distanceCoffrePlayer <= 20 then
							wait = 0
							if open == false then
								DrawMarker(22, coffrePos.x, coffrePos.y, coffrePos.z, 0, 0, 0, 0, 0, 0, 0.25, 0.25, 0.25, 0, 255, 100, 120, 1, 0, 0, 2)                              
							end
							 if distanceCoffrePlayer <= 0.7 then
								wait = 0
								if open == false then
								 ESX.ShowHelpNotification("E", "Pour ouvrir le coffre " ..v.namecoffre) 
								end
								 if IsControlJustPressed(0, 51) then
									coffremenu(v.id, v.society, v.job, v.amountpropre, v.amountsale, v.argentpropreactivation, v.argentsaleactivation, v.armeactivation, v.objetactivation)
									nomcoffre = v.namecoffre
									society = v.society
									job = v.job
									argentpropre = v.amountpropre
									argentsale = v.amountsale
									TriggerServerEvent('pawal:refresh', id)
								 end
						end
					end
			end
		 end 
		 Citizen.Wait(1)
	 end
 end)

function refresh()
		ESX.TriggerServerCallback('pawal:coffrelist', function(result)
			Coffre.liste = result
		end)
end

function refreshcoffreweapon(societyretraitweapon)

	ESX.TriggerServerCallback('pawal:weaponrecuperation', function(weapons) 
		coffrearme = weapons
	end, societyretraitweapon)
end

function refreshcoffreweaponsecondary(societyretraitweapon)
	ESX.TriggerServerCallback('pawal:weaponrecuperation', function(weapons) 
		coffrearmesecondary = weapons
	end, societyretraitweapon)
end
 


 Citizen.CreateThread(function()

	ESX.TriggerServerCallback('pawal:coffrelist', function(result)
		Coffre.liste = result
	end)
		 while true do
			 local playerPos = GetEntityCoords(PlayerPedId())
 
			 for k,v in pairs(Coffre.liste) do
				local coffrePos = vector3(json.decode(v.position).x, json.decode(v.position).y, json.decode(v.position).z)
				 local distanceCoffrePlayer = #(coffrePos-playerPos)
				 if ESX.PlayerData.job2.name == v.job and ESX.PlayerData.job.name ~= v.job then
						 if distanceCoffrePlayer <= 20 then
							wait = 0
							if open == false then
								DrawMarker(22, coffrePos.x, coffrePos.y, coffrePos.z, 0, 0, 0, 0, 0, 0, 0.25, 0.25, 0.25, 0, 255, 100, 120, 1, 0, 0, 2)                              
							end
							 if distanceCoffrePlayer <= 0.7 then
								wait = 0
								if open == false then
									ESX.ShowHelpNotification("Appuyer sur ~INPUT_PICKUP~ pour intéragir\nCoffre : ~b~"..v.namecoffre) 
								end
								 if IsControlJustPressed(0, 51) then
									coffremenu2(v.id, v.society, v.job, v.amountpropre, v.amountsale, v.argentpropreactivation, v.argentsaleactivation, v.armeactivation, v.objetactivation)
									nomcoffre = v.namecoffre
									society = v.society
									job = v.job
									argentpropre = v.amountpropre
									argentsale = v.amountsale
									TriggerServerEvent('pawal:refresh', id)
								 end
						end
				end
			end
		 end 
		 Citizen.Wait(1)
	 end
 end)
 


function getInventory()
    ESX.TriggerServerCallback('pawal:intentairejoueur', function(inventory)               
                
        all_items = inventory
        aucun = inventory

    end)
end

function Draw3DText(x, y, z, scl_factor, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov * scl_factor
    if onScreen then
        SetTextScale(0.0, scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end