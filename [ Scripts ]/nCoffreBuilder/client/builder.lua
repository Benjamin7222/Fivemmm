ESX = nil
local PlayerData = {}
-- CUSTOM AFFICHAGE --
local nomcoffre = "~r~Non saisi"
local position = "~r~Aucune"
local society = "~r~Non saisi"
local argentsale = "~r~Non saisi"
local argentpropre = "~r~Non saisi"
local jobmetier = "~r~Non saisi"
local joborga = "~r~Non saisi"
local nomsetjobmetier = "~r~Non saisi"
local nomsetjobgangorga = "~r~Non saisi"
----------------------------------

-- Activation Argent --
local argentpropreactivation = false
local argentsaleactivation = false
-------------------------------------

-- Activation Setjob --
local gangactivation = false
local jobactivation = false
----------------------------

-- Vérification activation --
local namecoffre = false
local nomsetjobgangorgasaisi = false
local nomsetjobmetiersaisi = false
local pos = false
local societyname = false
local modification = false

local creationencours = false

-- Récupération donnée -- 
Coffre = {
    liste = {}
}
coffrearmee = {}
all_items = {}

-- LISTE --
PW = {
    listactionmodificationIndex = 1,
    listactionmodification = {"~g~Position~s~","~g~Nom~s~", "~g~Society~s~", "~g~Setjob~s~"},

	listactionargentIndex = 1,
    listactionargent = {"~g~Argent propre~s~", "~r~Argent Sale~s~"},

	listactionargentretirerIndex = 1,
    listactionargentretirer = {"~g~Argent propre~s~", "~r~Argent Sale~s~"},


	MarkerCreation = {},
	Position = {PositionCoffre = nil}
};

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
  PlayerData.job = job
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
  PlayerData.job2 = job2
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
 local creationcoffre = RageUI.CreateSubMenu(mainMenu, "", "Action")
 local modificationCoffre = RageUI.CreateSubMenu(mainMenu, '', 'Action')
 local actionmodification = RageUI.CreateSubMenu(modificationCoffre, '', 'Action')
 local modificationinformationcoffre = RageUI.CreateSubMenu(modificationCoffre, '', 'Information Coffre')
 local argentmodificationcoffre = RageUI.CreateSubMenu(mainMenu, '', '')
 local StockageMenuStaff = RageUI.CreateSubMenu(modificationCoffre, '', 'Action')
 local StockageMenuStafff = RageUI.CreateSubMenu(modificationCoffre, '', 'Action')

 local open = false
 local citoyenaction = true
 local vehiculeaction = false
 local communication = false


 mainMenu.X = 0 
 mainMenu.Y = 0
 
 mainMenu.Closed = function() 
     open = false 
	 PW.MarkerCreation = {}
 end 


 creationcoffre.Closed = function()
    PW.MarkerCreation = {}
 end

actionmodification.Closed = function() 
	waitinfos = false 
end 

modificationinformationcoffre.Closed = function() 
	waitinfos = false 
end 

argentmodificationcoffre.Closed = function() 
	argentfiniwait = false 
end 



 function menubuilder()
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
                        
						RageUI.Button("Créer un coffre", "Ouvrir la création de coffre", {RightLabel = "→→→"}, true, {
							onSelected = function()
								 nomcoffre = "~r~Non saisi"
								 position = "~r~Aucune"
								 society = "~r~Non saisi"
								 argentsale = "~r~Non saisi"
								 argentpropre = "~r~Non saisi"
								 jobmetier = "~r~Non saisi"
								 joborga = "~r~Non saisi"	
								 nomsetjobmetier = "~r~Non saisi"
                                 nomsetjobgangorga = "~r~Non saisi"		
								 activationsale = "no"
								 activationpropre = "no"
								 argentpropreactivation = false
								 nomsetjobgangorgasaisi = false
								 nomsetjobmetiersaisi = false
                                 argentsaleactivation = false	
								 gangactivation = false
								 checkboxgangorga = false
								 checkboxmetier = false
								 checkboxsale = false
								 checkboxpropre = false
                                 jobactivation = false	
								 checkboxobjet = false	
								 checkboxweapon = false			
						end
						}, creationcoffre)
						RageUI.Button("Modifier un coffre", "Ouvrir la modification de coffre", {RightLabel = "→→→"}, true, {
							onSelected = function()
								ESX.TriggerServerCallback("pawal:coffrelist", function(coffrelist)
									Coffre.liste = coffrelist
								end)
						    end
						}, modificationCoffre)
            end)

			RageUI.IsVisible(creationcoffre, function()
				for k,v in pairs(PW.MarkerCreation) do
					local dst = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.pos, true)
					DrawMarker(22, v.pos.x, v.pos.y, v.pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.55, 0.55, 0.55, v.rgb.r,v.rgb.g,v.rgb.b, 65, false, false, true, 2, false, false, false, false)
						RageUI.Text({message = "[~b~Coffre Builder~s~] : Prévisualisation du point ~g~actif"})
				end

				if jobactivation == true then
					gangactivation = false
			    end

				if gangactivation == true then
					jobactivation = false
				end

				RageUI.Button("Nom du coffre", "Nom du coffre", {RightLabel = "~g~"..nomcoffre}, true, {
					onSelected = function()
						local nomcoffreinsert = KeyboardInput("test", 'Nom du coffre' , '', 2000)
						if nomcoffreinsert ~= nil and nomcoffreinsert ~= "" then
						nomcoffre = nomcoffreinsert
						namecoffre = true
						else
							ESX.ShowNotification('~r~Veuillez saisir un nom valide')
						end
				end
				})

				RageUI.Button("Position", "Position du coffre", {RightLabel = "~g~"..position}, true, {
					onSelected = function()
						pos = true
						position = "Enregistrer"
						PW.Position.PositionCoffre = GetEntityCoords(PlayerPedId())
						coffrePos = GetEntityCoords(PlayerPedId())
						PW.MarkerCreation["PW.PositionCoffre"] = {pos = PW.Position.PositionCoffre, rgb = {r = 0, g = 120, b = 255}, name = ""}    
					end
				})
				RageUI.Button("Nom du society", "Nom du society de l'entreprise/orga", {RightLabel = "~g~"..society}, true, {
					onSelected = function()
						local societyinsert = KeyboardInput("test", 'Nom du society' , 'society_', 2000)
						if societyinsert ~= nil and societyinsert ~= "" then
						society = societyinsert
						societyname = true
						else
						ESX.ShowNotification('~r~Veuillez saisir un society valide')
						end
				end
				})

				RageUI.line(255,255,255)

				RageUI.Checkbox("Activer : ~g~Argent propre", "Activer le stockage d'argent propre", checkboxpropre, {}, {
					onChecked = function()
						checkboxpropre = true
						argentpropreactivation = true
						activationpropre = "yes"
					end,
					onUnChecked = function()
						checkboxpropre = false
						argentpropreactivation = false
						activationpropre = "no"
					end
				}) 

				RageUI.Checkbox("Activer : ~r~Argent sale", "Activer le stockage d'argent sale", checkboxsale, {}, {
					onChecked = function()
						checkboxsale = true
						argentsaleactivation = true
						activationsale = "yes"
					end,
					onUnChecked = function()
						checkboxsale = false
						argentsaleactivation = false
						activationsale = "no"
					end
				}) 

				RageUI.line(255,255,255)

				RageUI.Checkbox("Activer : ~g~Coffre Objet", "Activer le stockage d'objet", checkboxobjet, {}, {
					onChecked = function()
						checkboxobjet = true
						objetactivation = true
						activationobjet = "yes"
					end,
					onUnChecked = function()
						checkboxobjet = false
						objetactivation = false
						activationobjet = "no"
					end
				}) 

				RageUI.Checkbox("Activer : ~r~Coffre Arme", "Activer le stockage d'arme", checkboxweapon, {}, {
					onChecked = function()
						checkboxweapon = true
						weaponactivation = true
						activationweapon = "yes"
					end,
					onUnChecked = function()
						checkboxweapon = false
						weaponactivation = false
						activationweapon = "no"
					end
				}) 

				RageUI.line(255,255,255)

					RageUI.Button("Setjob", "Nom du setjob", {RightLabel = "~g~"..nomsetjobmetier}, true, {
						onSelected = function()
							local nomsetjobmetierinsert = KeyboardInput("test", 'Nom du setjob' , '', 2000)
							if nomsetjobmetierinsert ~= nil and nomsetjobmetierinsert ~= "" then
							nomsetjobmetier = nomsetjobmetierinsert
							nomsetjobmetiersaisi = true
							setjob = nomsetjobmetierinsert
							else
							ESX.ShowNotification('~r~Veuillez saisir un setjob valide')
							end
					end
					})
			

			if pos ~= false and societyname ~= false and namecoffre ~= false then
					if nomsetjobgangorgasaisi or nomsetjobmetiersaisi == true then
						if weaponactivation or objetactivation ~= false then
				       RageUI.line(255,255,255)

				RageUI.Button("Créer le coffre", "Acceptez afin de mettre en place le coffre", {RightLabel = "→→→"}, true, {
					onSelected = function()
						TriggerServerEvent('pawal:creationcoffre', nomcoffre, coffrePos, society, setjob, activationpropre , activationsale, activationweapon, activationobjet)
						creationencours = true
						ESX.ShowNotification('~g~Coffre créer avec succès')
						Wait(100)
						refresh()
				end
				}, mainMenu)
			end
		end
			end

	        end)

			RageUI.IsVisible(modificationCoffre, function()
				for i = 1, #Coffre.liste, 1 do
					local nomcoffre = Coffre.liste[i].namecoffre
					local idcoffre = Coffre.liste[i].id
					local poscoffre = Coffre.liste[i].position
					local societycoffre = Coffre.liste[i].society
					local argentpropresomme = Coffre.liste[i].amountpropre
					local argentsalesomme = Coffre.liste[i].amountsale
					local jobcoffre = Coffre.liste[i].job
					local argentsaleactivationcoffre = Coffre.liste[i].argentsaleactivation
					local argentpropreactivationcoffre = Coffre.liste[i].argentpropreactivation
					local objetactivationcoffre = Coffre.liste[i].objetactivation
					local armectivationcoffre = Coffre.liste[i].armeactivation
					RageUI.Button("[~g~"..idcoffre.."~s~] Coffre : ~g~"..nomcoffre, "Modifier le coffre : ~g~"..nomcoffre,{RightLabel = "→→"}, true, {
						onSelected = function()
							 idcoffreselection = idcoffre
							 nomcoffreselection = nomcoffre
							 poscoffreselection = poscoffre
							 societycoffreselection = societycoffre
							 jobcoffreselection = jobcoffre
							 argentsaleactivationcoffreselection = argentsaleactivationcoffre
							 argentpropreactivationcoffreselection = argentpropreactivationcoffre
							 argentsalesommeselection = argentsalesomme
							 argentpropresommeselection = argentpropresomme
							 objetselectionmodificationselection = objetactivationcoffre
							 armeselectionmodificationselection = armectivationcoffre
							 Wait(1)
                            waitinfos = true
						end
					}, actionmodification)
				end  
				
				if #Coffre.liste == 0 then
                  RageUI.Separator('')
				  RageUI.Separator('~r~Aucun coffre disponible')
                  RageUI.Separator('')
				end

	          end)

			  RageUI.IsVisible(actionmodification, function()
				if waitinfos == true then
					RageUI.Separator('Id du coffre : ~g~'..idcoffreselection)
                    RageUI.Separator('Nom du coffre : ~g~'..nomcoffreselection)
					RageUI.Separator('Society : ~g~'..societycoffreselection)
					RageUI.Separator('Job : ~g~'..jobcoffreselection)

					if argentpropreactivationcoffreselection == "1" then
						RageUI.Separator('Argent Propre : ~g~Actif')
					else
						RageUI.Separator('Argent Propre : ~r~Inactif')
					end

					if argentsaleactivationcoffreselection == "1" then
						RageUI.Separator('Argent Sale : ~g~Actif')
					else
						RageUI.Separator('Argent Sale : ~r~Inactif')
					end

					if objetselectionmodificationselection == "1" then
						RageUI.Separator('Coffre Objet : ~g~Actif')
					else
						RageUI.Separator('Coffre Objet : ~r~Inactif')
					end

					if armeselectionmodificationselection == "1" then
						RageUI.Separator('Coffre Arme : ~g~Actif')
					else
						RageUI.Separator('Coffre Arme : ~r~Inactif')
					end
					RageUI.line(255,255,255,255)
					RageUI.Button("Modifier les informations sur coffre", "Modifier le coffre", {RightLabel = "→→→"}, true, {
						onSelected = function()
							nomcoffreselectionmodification = nomcoffreselection
							societycoffreselectionmodification = societycoffreselection
							poscoffreselectionmodification = poscoffreselection
							jobcoffreselectionmodification = jobcoffreselection
							idcoffreselectionmodification = idcoffreselection
							argentpropreactivationcoffreselectionmodification = argentpropreactivationcoffreselection
							argentsaleactivationcoffreselectionmodification = argentsaleactivationcoffreselection
							objetselectionmodification = objetselectionmodificationselection
							armeselectionmodification = armeselectionmodificationselection
							modification = false
							checkboxpropree = false
							checkboxsalee = false
							checkboxobjett = false
							checkboxarmee = false
							Wait(1)
							if argentpropreactivationcoffreselectionmodification == "1" then
								checkboxpropree = true
							else
								checkboxpropree = false
							end
			
							if argentsaleactivationcoffreselectionmodification == "1" then
								checkboxsalee = true
							else
								checkboxsalee = false
							end

							if objetselectionmodification == "1" then
								checkboxobjett = true
							else
								checkboxobjett = false
							end
			
							if armeselectionmodification == "1" then
								checkboxarmee = true
							else
								checkboxarmee = false
							end
                            finiwait = true
					end
					}, modificationinformationcoffre)

					RageUI.Button("Modifier le contenue du coffre (Objet)", "Ajouter ou retirer des objets du coffre", {RightLabel = "→→→"}, true, {
						onSelected = function()
							nomcoffreseletionmodificationarme = nomcoffreselection
							TriggerServerEvent('pawal:setsocietyserveur', societycoffreselection)
							armeactivationselection = armectivationcoffre
							getStock()
							Wait(50)
					end
					}, StockageMenuStaff)

					RageUI.Button("Modifier le contenue du coffre (Arme)", "Ajouter ou retirer des armes du coffre", {RightLabel = "→→→"}, true, {
						onSelected = function()
							societycoffreselectionmodificationarme = societycoffreselection
							nomcoffreseletionmodificationarme = nomcoffreselection
							ESX.TriggerServerCallback('pawal:weaponrecuperation', function(weapons) 
								coffrearmee = weapons
							end, societycoffreselection)
							Wait(50)
					end
					}, StockageMenuStafff)


					if argentpropreactivationcoffreselection == "1" or argentsaleactivationcoffreselection == "1" then					
					RageUI.Button("Modifier l'argent du coffre", "Modifier l'argent dans le coffre", {RightLabel = "→→→"}, true, {
						onSelected = function()
							idcoffreargentmodification = idcoffreselection
							argentpropresommemodification = argentpropresommeselection
							argentsalesommemodification = argentsalesommeselection
							jobcoffreselectionmodification = jobcoffreselection
							societycoffreselectionmodification = societycoffreselection
							Wait(1)
							argentfiniwait = true
				     	end
					}, argentmodificationcoffre)
				end
				RageUI.Button("~r~Supprimer le coffre", "Action sans retour possible", {RightLabel = "→→→"}, true, {
					onSelected = function()
						local validation = KeyboardInput("test", 'Pour valider, veuillez écrire : ~r~OUI (Majuscule)' , '', 2000)
							if validation ~= nil and validation == "OUI" then
								TriggerServerEvent('pawal:suppressioncoffre', idcoffreselection)
								ESX.ShowNotification('ID du coffre : ~g~['..idcoffreselection.."]~s~\nNom : ~b~"..nomcoffreselection.."\n~r~Suppréssion réussi")
								Wait(100)
								refresh()
							else
								ESX.ShowNotification('~r~Validation échouer')
						end
				end
				}, mainMenu)
				end
	          end)

			  RageUI.IsVisible(modificationinformationcoffre, function()
			  if checkboxpropree then
			    activationpropree = "yes"
			  else
				activationpropree = "no"
			  end

			  if checkboxsalee then
			    activationsalee = "yes"
			  else
			    activationsalee = "no"
			  end

			  if checkboxobjett then
			    activationobjett = "yes"
			  else
			    activationobjett = "no"
			  end

		      if checkboxarmee then
			    activationarmee = "yes"
			  else
			    activationarmee = "no"
			  end
			  
				for k,v in pairs(PW.MarkerCreation) do
					local dst = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.pos, true)
					DrawMarker(22, v.pos.x, v.pos.y, v.pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.55, 0.55, 0.55, v.rgb.r,v.rgb.g,v.rgb.b, 65, false, false, true, 2, false, false, false, false)
						RageUI.Text({message = "[~b~Coffre Builder~s~] : Prévisualisation du point ~g~actif"})
				end
				if finiwait == true then
					RageUI.Separator('Nom du coffre : ~g~'..nomcoffreselectionmodification)
					RageUI.Separator('Society : ~g~'..societycoffreselectionmodification)
					RageUI.Separator('Job : ~g~'..jobcoffreselectionmodification)

					RageUI.line(255,255,255,255)

					RageUI.List("Modifier : ", PW.listactionmodification, PW.listactionmodificationIndex, nil, {}, true, {
                        onListChange = function(Index)
                            PW.listactionmodificationIndex = Index
                        end,
                        onSelected = function()
							if PW.listactionmodificationIndex == 1 then
								poscoffreselectionmodification = GetEntityCoords(PlayerPedId())
								PW.Position.PositionCoffre = GetEntityCoords(PlayerPedId())
								PW.MarkerCreation["PW.PositionCoffre"] = {pos = PW.Position.PositionCoffre, rgb = {r = 0, g = 120, b = 255}, name = ""}    
								modification = true
								modificationposition = true

							elseif PW.listactionmodificationIndex == 2 then
								local nomcoffremodificationinsert = KeyboardInput("test", 'Nom du coffre' , '', 2000)
								if nomcoffremodificationinsert ~= nil and nomcoffremodificationinsert ~= "" then
								nomcoffreselectionmodification = nomcoffremodificationinsert
								modification = true
								else
									ESX.ShowNotification('~r~Veuillez saisir un nom valide')
							end
							elseif PW.listactionmodificationIndex == 3 then
								local societymodficicationinsert = KeyboardInput("test", 'Nom du society' , 'society_', 2000)
								if societymodficicationinsert ~= nil and societymodficicationinsert ~= "" then
								societycoffreselectionmodification = societymodficicationinsert
								modification = true
								else
								ESX.ShowNotification('~r~Veuillez saisir un society valide')
							end
							elseif PW.listactionmodificationIndex == 4 then
								local nomsetjobmodificationinsert = KeyboardInput("test", 'Nom du setjob' , '', 2000)
								if nomsetjobmodificationinsert ~= nil and nomsetjobmodificationinsert ~= "" then
									jobcoffreselectionmodification = nomsetjobmodificationinsert
									modification = true
								else
								ESX.ShowNotification('~r~Veuillez saisir un setjob valide')
								end
							end
                        end
                    })

					RageUI.line(255,255,255,255)

					RageUI.Checkbox("Activer : ~g~Argent propre", "Activer le stockage d'argent propre", checkboxpropree, {}, {
						onChecked = function()
							checkboxpropree = true
							argentpropreactivation = true
							activationpropree = "yes"
							modification = true
						end,
						onUnChecked = function()
							checkboxpropree = false
							argentpropreactivation = false
							activationpropree = "no"
							modification = true
						end
					}) 
	
					RageUI.Checkbox("Activer : ~r~Argent sale", "Activer le stockage d'argent sale", checkboxsalee, {}, {
						onChecked = function()
							checkboxsalee = true
							argentsaleactivation = true
							activationsalee = "yes"
							modification = true
						end,
						onUnChecked = function()
							checkboxsalee = false
							argentsaleactivation = false
							activationsalee = "no"
							modification = true
						end
					}) 

					RageUI.line(255,255,255,255)

					RageUI.Checkbox("Activer : ~g~Coffre Objet", "Activer le stockage d'objet", checkboxobjett, {}, {
						onChecked = function()
							checkboxobjett = true
							objettactivation = true
							activationobjett = "yes"
							modification = true
						end,
						onUnChecked = function()
							checkboxobjett = false
							objettactivation = false
							activationobjett = "no"
							modification = true
						end
					}) 
	
					RageUI.Checkbox("Activer : ~r~Coffre Arme", "Activer le stockage d'arme", checkboxarmee, {}, {
						onChecked = function()
							checkboxarmee = true
							armeeactivation = true
							activationarmee = "yes"
							modification = true
						end,
						onUnChecked = function()
							checkboxarmee = false
							armeeactivation = false
							activationarmee = "no"
							modification = true
						end
					}) 
	


					if modification ~= false then
							   RageUI.line(255,255,255)
		                 if modificationposition == true then
						RageUI.Button("Modifier le coffre", "Acceptez afin de mettre en place le coffre", {RightLabel = "→→→"}, true, {
							onSelected = function()
								TriggerServerEvent('pawal:modificationcoffre', idcoffreselectionmodification, poscoffreselectionmodification, nomcoffreselectionmodification, societycoffreselectionmodification, jobcoffreselectionmodification, activationpropree, activationsalee, activationobjett, activationarmee)
								ESX.ShowNotification('~g~Coffre mise à jour')
								Wait(500)
								refresh()
						end
						},mainMenu)
					else
						RageUI.Button("Modifier le coffre", "Acceptez afin de mettre en place le coffre", {RightLabel = "→→→"}, true, {
							onSelected = function()
								TriggerServerEvent('pawal:modificationcoffrenoposition', idcoffreselectionmodification, nomcoffreselectionmodification, societycoffreselectionmodification, jobcoffreselectionmodification, activationpropree, activationsalee, activationobjett, activationarmee)
								ESX.ShowNotification('~g~Coffre mise à jour')
								Wait(500)

								refresh()
						end
						},mainMenu)
					end
					end



				end
	          end)

			  RageUI.IsVisible(StockageMenuStaff, function()

				RageUI.Button("Ajouter un objet au coffre", nil, {RightLabel = "→→→"}, true, {
					onSelected = function()
						local item = KeyboardInput("test", 'Nom de l\'item ? (Give)' , '', 2000)
						local quantite = KeyboardInput("test", 'Quantité ?' , '', 2000)
						TriggerServerEvent('pawal:ajoutobjet', item, GetLabelText(item), quantite, nomcoffreseletionmodificationarme)
						getStock()
				end}
			    )

				RageUI.line(255,255,255,255)
            
				for k,v in pairs(all_items) do
					RageUI.Button(v.label, nil, {RightLabel = "~g~x"..math.round(v.nb)}, true, {
						onSelected = function()
							local nombre = KeyboardInput("test", 'Quantité à supprimer ?' , '', 2000)
							 if nombre ~= nil and nombre ~= "0" then
							TriggerServerEvent('pawal:suppressionobjet', v.item, v.label, nombre, nomcoffreseletionmodificationarme)
							getStock()
							 else
								ESX.ShowNotification('~r~Valeur invalide')
							 end
					end});
				end
			end)

			RageUI.IsVisible(StockageMenuStafff, function()

				RageUI.Button("Ajouter une arme au coffre", nil, {RightLabel = "→→→"}, true, {
					onSelected = function()
						local item = KeyboardInput("test", 'Nom de l\'arme ? (Give)' , 'weapon_', 2000)
						ESX.TriggerServerCallback('pawal:ajoutarme', function()
						end, item, societycoffreselectionmodificationarme)			
						ESX.ShowNotification('~g~Vous venez d\'ajouter x1 '..ESX.GetWeaponLabel(item).." dans le coffre "..nomcoffreseletionmodificationarme)			
						refreshcoffreweaponn(societycoffreselectionmodificationarme)
						refreshcoffreweaponsecondary(societycoffreselectionmodificationarme)
						Wait(10) 
				end}
			    )

				RageUI.line(255,255,255,255)
            
				for k,v in pairs(coffrearmee) do
					if v.count > 0 then
					RageUI.Button(ESX.GetWeaponLabel(v.name), nil, {RightLabel = "~g~x"..math.round(v.count)}, true, {
						onSelected = function()
							ESX.TriggerServerCallback('pawal:suppressionarme', function()
							end, v.name, societycoffreselectionmodificationarme)	
							ESX.ShowNotification('~g~Vous venez de retirer x1 '..ESX.GetWeaponLabel(v.name))
							refreshcoffreweaponn(societycoffreselectionmodificationarme)
							refreshcoffreweaponsecondary(societycoffreselectionmodificationarme)
							Wait(10)
					end});
				 end
				end
			end)
			  

			  RageUI.IsVisible(argentmodificationcoffre, function()
				if argentfiniwait == true then
				RageUI.Separator('Argent propre : ~g~'..argentpropresommemodification.."$")
				RageUI.Separator('Argent sale : ~r~'..argentsalesommemodification.."$")

				RageUI.line(255,255,255,255)

				RageUI.List("Déposer : ", PW.listactionargent, PW.listactionargentIndex, nil, {}, true, {
					onListChange = function(Index)
						PW.listactionargentIndex = Index
					end,
					onSelected = function()
						if PW.listactionargentIndex == 1 then
							local Depotgive = KeyboardInput("test", 'Combien vous vous give ~g~d\'argent propre ?' , '', 2000)
							if Depotgive ~= nil then 
								Depotgive = tonumber(Depotgive)
								if type(Depotgive) == "number" then 
									TriggerServerEvent("pawal:admingivemoneypropre", idcoffreargentmodification, Depotgive)
									Wait(100)
									ESX.TriggerServerCallback('pawal:coffrelist', function(result)		 
										for k,v in pairs(result) do
											if "society_"..ESX.PlayerData.job.name == societycoffreselectionmodification and societycoffreselectionmodification == v.society then
										 argentpropresommemodification = v.amountpropre
											elseif "society_"..ESX.PlayerData.job2.name == societycoffreselectionmodification and societycoffreselectionmodification == v.society then
											argentpropresommemodification = v.amountpropre
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
						elseif PW.listactionargentIndex == 2 then
							local WithdrawCount = KeyboardInput("test", 'Combien vous vous give ~r~d\'argent sale ?' , '', 2000)
							if WithdrawCount ~= nil then 
								WithdrawCount = tonumber(WithdrawCount)
								if type(WithdrawCount) == "number" then 
									TriggerServerEvent("pawal:admingivemoneysale", idcoffreargentmodification, WithdrawCount)
									Wait(100)
									ESX.TriggerServerCallback('pawal:coffrelist', function(result)		 
										for k,v in pairs(result) do
											if "society_"..ESX.PlayerData.job.name == societycoffreselectionmodification and societycoffreselectionmodification == v.society then
												argentsalesommemodification = v.amountsale
											elseif "society_"..ESX.PlayerData.job2.name == societycoffreselectionmodification and societycoffreselectionmodification == v.society then
												argentsalesommemodification = v.amountsale
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
					end
				end
				})

				RageUI.List("Retirer : ", PW.listactionargentretirer, PW.listactionargentretirerIndex, nil, {}, true, {
					onListChange = function(Index)
						PW.listactionargentretirerIndex = Index
					end,
					onSelected = function()
						if PW.listactionargentretirerIndex == 1 then
							local Revoveadminpropre = KeyboardInput("test", 'Combien vous vous give ~g~d\'argent propre ?' , '', 2000)
							if Revoveadminpropre ~= nil then 
								Revoveadminpropre = tonumber(Revoveadminpropre)
								if type(Revoveadminpropre) == "number" then 
									TriggerServerEvent("pawal:adminremovemoneypropre", idcoffreargentmodification, Revoveadminpropre)
									Wait(100)
									ESX.TriggerServerCallback('pawal:coffrelist', function(result)		 
										for k,v in pairs(result) do
											if "society_"..ESX.PlayerData.job.name == societycoffreselectionmodification and societycoffreselectionmodification == v.society then
												argentpropresommemodification = v.amountpropre
											elseif "society_"..ESX.PlayerData.job2.name == societycoffreselectionmodification and societycoffreselectionmodification == v.society then
												argentpropresommemodification = v.amountpropre
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
						elseif PW.listactionargentretirerIndex == 2 then
							local Revoveadminsale = KeyboardInput("test", 'Combien vous vous give ~r~d\'argent sale ?' , '', 2000)
							if Revoveadminsale ~= nil then 
								Revoveadminsale = tonumber(Revoveadminsale)
								if type(Revoveadminsale) == "number" then 
									TriggerServerEvent("pawal:adminremovemoneysale", idcoffreargentmodification, Revoveadminsale)
									Wait(100)
									ESX.TriggerServerCallback('pawal:coffrelist', function(result)		 
										for k,v in pairs(result) do
											if "society_"..ESX.PlayerData.job.name == societycoffreselectionmodification and societycoffreselectionmodification == v.society then
											    argentsalesommemodification = v.amountsale
											elseif "society_"..ESX.PlayerData.job2.name == societycoffreselectionmodification and societycoffreselectionmodification == v.society then
												argentsalesommemodification = v.amountsale
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
					end
				end
				})

				end
	          end)

             Wait(0)
             end
         end)
     end
 end
 
 -- MARKERS
 


RegisterNetEvent('pawal:openmenubuilder')
AddEventHandler('pawal:openmenubuilder', function(xPlayer)
	ESX.TriggerServerCallback('pawal:verifperm', function(group)
		playergroup = group
		if playergroup == "_dev" then
			menubuilder()
			ESX.GetPlayerData()
			ESX.TriggerServerCallback("pawal:coffrelist", function(coffrelist)
				Coffre.liste = coffrelist
			end)
	end
	end)
end)



function getStock()
    ESX.TriggerServerCallback('pawal:récupérationstockitem', function(inventory)               
                
        all_items = inventory
        
    end)
end

function DrawTextBuilder(x, y, z, scl_factor, text)
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

Citizen.CreateThread(function()
	 while true do
		if creationencours == true then
			ESX.TriggerServerCallback("pawal:coffrelist", function(coffrelist)
				Coffre.liste = coffrelist
			end)
			creationencours = false
		end
		 Citizen.Wait(1)
	 end
 end)

function refreshcoffreweaponn(societyretraitweapon)
	ESX.TriggerServerCallback('pawal:weaponrecuperation', function(weapons) 
		coffrearmee = weapons
	end, societyretraitweapon)
end