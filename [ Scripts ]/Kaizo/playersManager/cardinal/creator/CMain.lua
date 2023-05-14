ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(10)
    end
end)

local creatoridentityposition = vector3(-666.35, 581.54, 140.57)

--Character = {}

whenActive = false

function StartCreatorEndCinematic()
	local playerPed = PlayerPedId()
	DoScreenFadeOut(1000)
	Wait(1000)
    local playerClone = ClonePed_2(plyrId, 0.0, false, true, 1) ----
    -----------------------------------------------
    RequestCutscene("MP_INTRO_CONCAT", 8) ---- REQUEST la custscene
    while not HasCutsceneLoaded() do Wait(10) end --- attente que la cutscene se load
    DoScreenFadeIn(250) --- ecran blanc de 250 milliseconde
    SetCutsceneEntityStreamingFlags('MP_Male_Character', 0, 1) 
    local female = RegisterEntityForCutscene(0,"MP_Female_Character",3,0,64) ------------ REMPLACER PAR VOTRE JOUEUR
    RegisterEntityForCutscene(PlayerPedId(), 'MP_Male_Character', 0, GetEntityModel(PlayerPedId()), 64)
    GetEntityIndexOfCutsceneEntity('MP_Female_Character', GetHashKey(GetEntityModel('MP_Female_Character')))
    NetworkSetEntityInvisibleToNetwork(female, true)
    -----------------------------------------------
    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_1", 0, 1)---PARTIE POUR DELETE LES AUTRE PEDS
    --SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_2", 0, 1)---PARTIE POUR DELETE LES AUTRE PEDS
    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_3", 0, 1)---PARTIE POUR DELETE LES AUTRE PEDS
    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_4", 0, 1)---PARTIE POUR DELETE LES AUTRE PEDS
    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_5", 0, 1)---PARTIE POUR DELETE LES AUTRE PEDS
    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_6", 0, 1)---PARTIE POUR DELETE LES AUTRE PEDS
    SetCutsceneEntityStreamingFlags("MP_Plane_Passenger_7", 0, 1)---PARTIE POUR DELETE LES AUTRE PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_1', 3, GetHashKey('mp_f_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_2', 3, GetHashKey('mp_f_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_3', 3, GetHashKey('mp_f_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_4', 3, GetHashKey('mp_f_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_5', 3, GetHashKey('mp_f_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_6', 3, GetHashKey('mp_f_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_7', 3, GetHashKey('mp_f_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    ---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_1', 3, GetHashKey('mp_m_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
   -- RegisterEntityForCutscene(0, 'MP_Plane_Passenger_2', 3, GetHashKey('mp_m_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_3', 3, GetHashKey('mp_m_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_4', 3, GetHashKey('mp_m_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_5', 3, GetHashKey('mp_m_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_6', 3, GetHashKey('mp_m_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    RegisterEntityForCutscene(0, 'MP_Plane_Passenger_7', 3, GetHashKey('mp_m_freemode_01'), 0)---PARTIE POUR DELETE LES PEDS
    NewLoadSceneStartSphere(-1212.79, -1673.52, 7, 1000, 0) ----- eviter les bugs de texture
    -----------------------------------------------
    SetWeatherTypeNow("EXTRASUNNY") ---- TEMPS SOLEIL
    StartCutscene(4) --- START la custscene

    -------si vous voulez arrétez à un temps précis -- Vous pouvez vous aidez grace GetCutsceneTime() vous le printer
    Wait(35000) --- temps de la custscene
    StopCutsceneImmediately()
	DoScreenFadeOut(2000)
	Wait(1000)
	SetCamActive(camSkin,  false)
	RenderScriptCams(false,  false,  0,  true,  true)
	enable = false
    FreezeEntityPosition(PlayerPedId(), false)
	SetEntityCoords(playerPed, ConfigIdentity.PlayerSpawn.x, ConfigIdentity.PlayerSpawn.y, ConfigIdentity.PlayerSpawn.z)
	SetEntityHeading(playerPed, ConfigIdentity.PlayerSpawn.h)
	Wait(1000)
	ESX.UI.HUD.SetDisplay(1.0)
	DisplayRadar(true)
	DoScreenFadeIn(1000)
	Wait(1000)
    ESX.ShowNotification("Nous vous souhaitons la bienvenue sur LS.Experience !")
    TriggerEvent('instance:leave')
    TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', false)
    whenActive = false
	--TriggerServerEvent('esx_skin:save', Character)
	--TriggerEvent('skinchanger:loadSkin', skin)
end

CreateThread(function()
    while true do
        Wait(1)
        if whenActive then
			DisableControlAction(0, 1, true) -- Disable pan
			DisableControlAction(0, 2, true) -- Disable tilt
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			DisableControlAction(0, 45, true) -- Reload
			DisableControlAction(0, 22, true) -- Jump
			DisableControlAction(0, 44, true) -- Cover
			DisableControlAction(0, 37, true) -- Select Weapon
			DisableControlAction(0, 23, true) -- Also 'enter'?
			DisableControlAction(0, 288,  true) -- Disable phone
			DisableControlAction(0, 289, true) -- Inventory
			DisableControlAction(0, 170, true) -- Animations
			DisableControlAction(0, 167, true) -- Job
			DisableControlAction(0, 0, true) -- Disable changing view
			DisableControlAction(0, 26, true) -- Disable looking behind
			DisableControlAction(0, 73, true) -- Disable clearing animation
			DisableControlAction(2, 199, true) -- Disable pause screen
			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle
			DisableControlAction(2, 36, true) -- Disable going stealth
			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle
        else
            Wait(100)
        end
    end
end)

local Creator = {}
Components = {}
ComponentsMax = {}
sLoaded = nil
sData = {}
sCharEnd = true
sIdentityEnd = true
sIndexSex = 1
sDataIdentity = {}
sDataIdentity = {
    name = "",
    surname = "",
    height = "",
    birthday = ""
}

local cam, isCameraActive
local firstSpawn, zoomOffset, camOffset, heading = true, 0.0, 0.0, 90.0

sMain = {
    "chest_1",
    "chest_2",
    "chest_3",
    "age_1",
    "age_2",
    "blemishes_1",
    "blemishes_2",		
}
sHead = {
    "face",		
    "skin",		
    "hair_1",	
    "hair_2",	
    "hair_color_1",
    "hair_color_2",
    "beard_1",
    "beard_2",
    "beard_3",
    "beard_4",
    "eye_color",	
    "eyebrows_2",
    "eyebrows_1",
    "eyebrows_3",
    "eyebrows_4",
    "makeup_1",
    "makeup_2",
    "makeup_3",
    "makeup_4",
    "lipstick_1",
    "lipstick_2",
    "lipstick_3",
    "lipstick_4",
    "blush_1",
    "blush_2",
    "blush_3",
    "complexion_1",	
    "complexion_2",	
    "sun_1",			
    "sun_2",
    "moles_1",
    "moles_2",	
}
sClothes = {
    "arms",	
    "arms_2",
    "tshirt_1", 
    "tshirt_2", 
    "torso_1", 
    "torso_2", 
    "decals_1", 
    "decals_2", 
    "pants_1",
    "pants_2",
    "shoes_1",
    "shoes_2",
    --"bproof_1",
    --"bproof_2",
}

sAccessories = {
    "chain_1",
    "chain_2",
    "helmet_1",
    "helmet_2",
    "glasses_1",
    "glasses_2",
    "watches_1",
    "watches_2",
    "bracelets_1",
    "bracelets_2",
    "ears_1",
    "ears_2",
}

local FirstSpawn     = true
local LastSkin       = nil
local PlayerLoaded   = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerLoaded = true
end)

TriggerEvent('instance:registerType', 'identity')

AddEventHandler('playerSpawned', function()
	Citizen.CreateThread(function()
		while not PlayerLoaded do
			Citizen.Wait(10)
		end
		if FirstSpawn then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin == nil then
                    TriggerEvent('instance:create', 'identity')
                    TriggerServerEvent('BoutiqueBucket:SetEntitySourceBucket', true)
					OpenCreatorMenu()
                    --DisableAllControlActions()
				else
                    TriggerEvent('skinchanger:loadSkin', skin)
                    --spawncinematiqueplayer()
				end
			end)
			FirstSpawn = false
		end
	end)
end)

function GetComponents()
	TriggerEvent('skinchanger:getData', function(data, max)
		Components = data
		ComponentsMax = max
	end)
end


RegisterNetEvent("OpenCreatorMenu")
AddEventHandler("OpenCreatorMenu",function()
    OpenCreatorMenu()
end)

function OpenCreatorMenu()

    if Creator.Menu then 
        Creator.Menu = false 
        KaizoUI.Visible(RMenu:Get('creator', 'main'), false)
        sCreator = nil 
        sIdentity = nil
        sCharacter = nil
        KillCreatorCam()
       -- Visible()
        FreezeEntityPosition(PlayerPedId(), true)
        return
    else
        RMenu.Add('creator', 'main', KaizoUI.CreateMenu("", "Veuillez créer votre identité")) --Menu principal
        RMenu.Add('creator', 'identity', KaizoUI.CreateSubMenu(RMenu:Get("creator", "main"),"", "Démarrez ~b~votre~s~ nouvelle ~b~aventure~s~.")) -- Identité validé
        RMenu.Add('creator', 'character', KaizoUI.CreateSubMenu(RMenu:Get("creator", "main"),"", "Démarrez ~b~votre~s~ nouvelle ~b~aventure~s~.")) -- Character validé
        RMenu.Add('creator', 'characteroptionsmain', KaizoUI.CreateSubMenu(RMenu:Get("creator", "character"),"", "Démarrez ~b~votre~s~ nouvelle ~b~aventure~s~."))
        RMenu.Add('creator', 'characteroptionshead', KaizoUI.CreateSubMenu(RMenu:Get("creator", "character"),"", "Démarrez ~b~votre~s~ nouvelle ~b~aventure~s~."))
        RMenu.Add('creator', 'characteroptionsclothes', KaizoUI.CreateSubMenu(RMenu:Get("creator", "character"),"", "Démarrez ~b~votre~s~ nouvelle ~b~aventure~s~."))
        RMenu.Add('creator', 'characteroptionsaccessories', KaizoUI.CreateSubMenu(RMenu:Get("creator", "character"),"Création Identité", "Démarrez ~b~votre~s~ nouvelle ~b~aventure~s~."))
        RMenu.Add('creator', 'characteroptions_s', KaizoUI.CreateSubMenu(RMenu:Get("creator", "character"),"", "Démarrez ~b~votre~s~ nouvelle ~b~aventure~s~.")) -- validé
        RMenu.Add('creator', 'characteroptions_m', KaizoUI.CreateSubMenu(RMenu:Get("creator", "characteroptionsmain"),"", "Démarrez ~b~votre~s~ nouvelle ~b~aventure~s~.")) -- validé
        RMenu.Add('creator', 'characteroptions_h', KaizoUI.CreateSubMenu(RMenu:Get("creator", "characteroptionshead"),"", "Démarrez ~b~votre~s~ nouvelle ~b~aventure~s~.")) -- validé
        RMenu.Add('creator', 'characteroptions_c', KaizoUI.CreateSubMenu(RMenu:Get("creator", "characteroptionsclothes"),"", "Démarrez ~b~votre~s~ nouvelle ~b~aventure~s~.")) -- validé
        RMenu.Add('creator', 'characteroptions_a', KaizoUI.CreateSubMenu(RMenu:Get("creator", "characteroptionsaccessories"),"", "Démarrez ~b~votre~s~ nouvelle ~b~aventure~s~.")) -- validé
        RMenu:Get('creator', 'main'):SetSubtitle("Démarrez votre~s~ nouvelle aventure~s~")
        RMenu:Get('creator', 'main').EnableMouse = false
        RMenu:Get('creator', 'main').Closable = false
        RMenu:Get('creator', 'main').Closed = function()
            Creator.Menu = false
        end
        GetComponents()
        CreateCreatorCam()
      --  Visible()
        sCharEnd = true
        sIdentityEnd = true
        SwitchCam(false, 'default')
        Creator.Menu = true 
        KaizoUI.Visible(RMenu:Get('creator', 'main'), true)
        Citizen.CreateThread(function()
			while Creator.Menu do
                KaizoUI.IsVisible(RMenu:Get('creator', 'main'), true, true, true, function()
                    FreezeEntityPosition(PlayerPedId(), true)
                    if sIdentityEnd then
                        KaizoUI.ButtonWithStyle("Étape 1 - Créer votre identité.", "Vous pourrez choisir votre nom, prenom et d'autres infos...", {RightLabel = "→"}, true,function(h,a,s)
                        end,RMenu:Get("creator","identity"))
                    else
                        if sex == 'm' then
                            sex = 'Homme'
                        elseif sex == 'f' then
                            sex = 'Femme'
                        end

                        KaizoUI.ButtonWithStyle("Étape 1 - Créer votre identité.", "Prénom : "..sDataIdentity.surname.."Nom : "..sDataIdentity.name.."Taille : "..sDataIdentity.height.."Date de naissance : "..sDataIdentity.birthday.."Sexe : "..sex, {RightLabel = "→"}, false,function()
                        end)
                    end
                    if sCharEnd then
                        KaizoUI.ButtonWithStyle("Étape 2 - Créer son personnage.", "Vous pourrez personnaliser votre personnage au maximum.", {RightLabel = "→"}, true,function(h,a,s)
                        end,RMenu:Get("creator","character"))
                    else
                        KaizoUI.ButtonWithStyle("Étape 2 - Créer son personnage.", "Votre personnage a bien été enregistré.", {RightLabel = "→"}, false,function()
                        end)
                    end
                    if not sIdentityEnd and not sCharEnd then
                        KaizoUI.ButtonWithStyle("Commencer l'aventure.", "Cliquez pour rejoindre la ville", {RightBadge = KaizoUI.BadgeStyle.Tick, Color = { HightLightColor = {0, 158, 255, 160}, BackgroundColor = {0, 178, 255, 160} }}, true,function(h,a,s)
                            if s then
                                TriggerEvent('skinchanger:getSkin', function(skin)
                                    TriggerServerEvent('esx_skin:save', skin)
                                end)
                                KillCreatorCam()
                                KaizoUI.Visible(RMenu:Get('creator', 'main'),false)
                                sOpen = false
                                Wait(500)
                                FreezeEntityPosition(PlayerPedId(),false)
                                whenActive = true
                                StartCreatorEndCinematic()
                            end
                        end)
                    else
                        KaizoUI.ButtonWithStyle("Commencer l'aventure.", "Remplissez les informations au dessus", {RightLabel = "→", Color = { HightLightColor = {0, 158, 255, 160}, BackgroundColor = {0, 178, 255, 160}}}, false,function()
                        end)
                    end
                end)
                KaizoUI.IsVisible(RMenu:Get('creator', 'identity'), true, true, true, function()
                    FreezeEntityPosition(PlayerPedId(), true)
                    KaizoUI.ButtonWithStyle("Prénom", "Veuillez entrer votre prénom.", {RightLabel = sDataIdentity.surname}, true,function(h,a,s)
                        if s then
                            local firstname = sKeyboardInput("Exemple : Mike", "", 20)   
                            
                            if firstname ~= "" then
                                if(firstname:match("%W")) then
                                    ESX.ShowNotification('~b~Vous ne pouvez taper uniquement des lettres')
                                    firstname = ""
                                else
                                    TriggerServerEvent('esx_identity:SetFirstName', GetPlayerServerId(PlayerId()), firstname)
                                    sDataIdentity.surname = firstname
                                end
                            else
                                ESX.ShowNotification('~b~Vous devez entrer le Prénom')
                                firstname = ""
                            end
                        end
                    end)
                    KaizoUI.ButtonWithStyle("Nom", "Veuillez entrer votre nom.", {RightLabel = sDataIdentity.name}, true,function(h,a,s)
                        if s then
                            local lastname = sKeyboardInput("Exemple : Anderson", "", 20)   
                            if lastname ~= "" then
                                TriggerServerEvent('esx_identity:SetLastName', GetPlayerServerId(PlayerId()), lastname)
                                sDataIdentity.name = lastname
                            else
                                ESX.ShowNotification('~b~Vous devez entrer votre nom de famille')
                                lastname = ""
                            end
                        end
                    end)
                    KaizoUI.ButtonWithStyle("Taille", "Veuillez entrer votre taille.", {RightLabel = sDataIdentity.height}, true,function(h,a,s)
                        if s then
                            local height = sKeyboardInput("Exemple : 180", "", 20)   
                            if height ~= "" then
                                TriggerServerEvent('esx_identity:SetHeight', GetPlayerServerId(PlayerId()), height)
                                sDataIdentity.height = height
                            else
                                ESX.ShowNotification('~b~Vous devez entrer votre taille')
                                height = ""
                            end
                        end
                    end)
                    KaizoUI.ButtonWithStyle("Date de naissance", "Veuillez entrer votre date de naissance.", {RightLabel = sDataIdentity.birthday}, true,function(h,a,s)
                        if s then
                            local dateofbirth = sKeyboardInput("Exemple : 01/01/1997", "", 20)   
                            if dateofbirth ~= "" then
                                TriggerServerEvent('esx_identity:SetDOB', GetPlayerServerId(PlayerId()), dateofbirth)
                                sDataIdentity.birthday = dateofbirth
                            else
                                ESX.ShowNotification('~b~Vous devez entrer la Date de Naissance')
                                dateofbirth = ""
                            end
                        end
                    end)

                    KaizoUI.ButtonWithStyle("Sexe", "Mettre ~b~m~s~ pour homme ou ~b~f~s~ pour femme.", {RightLabel = sex}, true, function(Hovered, Active, Selected)
                        if Selected then 
                             DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 20)
                            while (UpdateOnscreenKeyboard() == 0) do
                                DisableAllControlActions(0);
                                Citizen.Wait(1)
                            end
                            if (GetOnscreenKeyboardResult()) then
                                sex = GetOnscreenKeyboardResult()
                                --sex2 = 'm'
                                if sex == 'm' then
                                    TriggerServerEvent('esx_identity:SetSex', GetPlayerServerId(PlayerId()), sex)
                                elseif sex == 'f' then
                                    TriggerServerEvent('esx_identity:SetSex', GetPlayerServerId(PlayerId()), sex)
                                else
                                    ESX.ShowNotification('~b~Sexe non reconnu, merci de réessayer en mettant ~b~m ~b~ou ~b~f')
                                    sex = nil
                                    --TriggerServerEvent('esx_identity:SetSex2', GetPlayerServerId(PlayerId()), sex2)
                                end    
                            end 
                        end    
                    end)

                    if lastname ~= "" and firstname ~= "" and height ~= "" and dateofbirth ~= "" and sex ~= nil then
                        KaizoUI.ButtonWithStyle("Confirmer son identité.", "~b~Cette action est irréversible.", {RightBadge = KaizoUI.BadgeStyle.Tick,Color = { HightLightColor = {0, 158, 255, 160}, BackgroundColor = {0, 178, 255, 160}}}, true,function(h,a,s)
                            if s then
                                sIdentityEnd = false
                                KaizoUI.GoBack()
                                ESX.ShowNotification("Vos informations ont été enregistrées avec succès.")
                            end
                        end)
                    else
                        KaizoUI.ButtonWithStyle("Confirmer son identité.", "~b~Veuillez remplir les informations ci-dessus.", {RightBadge = KaizoUI.BadgeStyle.Lock,Color = { HightLightColor = {0, 158, 255, 160}, BackgroundColor = {0, 178, 255, 160}}}, true,function(h,a,s)
                            if s then
                            end
                        end)
                    end
                end)
                KaizoUI.IsVisible(RMenu:Get('creator', 'character'), true, true, true, function()
                    FreezeEntityPosition(PlayerPedId(), true)
                    for k,v in pairs(Components) do
                        if v.name == 'sex' then
                            KaizoUI.ButtonWithStyle(v.label, nil, {RightLabel = "→"}, true,function(h,a,s)
                                if a then
                                    zoomOffset = v.zoomOffset
                                    camOffset = v.camOffset
                                    sData = v.name
                                    SwitchCam(false, v.name)
                                end
                            end,RMenu:Get("creator","characteroptions_s"))
                        end
                    end

                    KaizoUI.ButtonWithStyle("Visage", nil, {RightLabel = "→"}, true,function(h,a,s)
                        if s then
                            GetComponents()
                        end
                    end,RMenu:Get("creator","characteroptionshead"))

                    KaizoUI.ButtonWithStyle("Apparence", nil, {RightLabel = "→"}, true,function(h,a,s)
                        if s then
                            GetComponents()
                        end
                    end,RMenu:Get("creator","characteroptionsmain"))

                    KaizoUI.ButtonWithStyle("Vetements", nil, {RightLabel = "→"}, true,function(h,a,s)
                        if s then
                            GetComponents()
                        end
                    end,RMenu:Get("creator","characteroptionsclothes"))

                    KaizoUI.ButtonWithStyle("Accessoires", nil, {RightLabel = "→"}, true,function(h,a,s)
                        if s then
                            GetComponents()
                        end
                    end,RMenu:Get("creator","characteroptionsaccessories"))

                    KaizoUI.ButtonWithStyle("Terminer son personnage.", "~b~Cette action est irréversible.", {RightBadge = KaizoUI.BadgeStyle.Tick,Color = { HightLightColor = {0, 158, 255, 160}, BackgroundColor = {0, 178, 255, 160}}}, true,function(h,a,s)
                        if s then
                            sCharEnd = false
                            KaizoUI.GoBack()
                            ESX.ShowNotification("Votre personnage a été enregistré avec succès.")
                        end
                    end)
                end)
                KaizoUI.IsVisible(RMenu:Get('creator', 'characteroptionsmain'), true, true, true, function()
                    FreezeEntityPosition(PlayerPedId(), true)
                    for k,v in pairs(Components) do
                        for _, s_main in pairs(sMain) do
                            if v.name == s_main then
                                if zoomOffset ~= v.zoomOffset and camOffset ~= v.camOffset then 
                                    zoomOffset = v.zoomOffset
                                    camOffset = v.camOffset
                                end
                                KaizoUI.ButtonWithStyle(v.label, nil, {RightLabel = "→"}, true,function(h,a,s)
                                    if a then
                                        sData = v.name
                                        GetComponents()
                                        SwitchCam(false, v.name)
                                    end
                                end,RMenu:Get("creator","characteroptions_m"))
                            end
                        end
                    end
                end)

                KaizoUI.IsVisible(RMenu:Get('creator', 'characteroptions_s'), true, true, true, function()
                    FreezeEntityPosition(PlayerPedId(), true)
                    for _,v in pairs(Components) do
                        if v.name == sData then
                            for i = 0, ComponentsMax[sData] do
                                KaizoUI.ButtonWithStyle(v.label.." N°"..i, nil, {RightLabel = "→"}, true,function(h,a,s)
                                    if a then
                                        if sLoaded ~= i then
                                            sLoaded = i
                                            TriggerEvent('skinchanger:change', v.name, i)
                                        end
                                    end
                                end)
                            end
                        end
                    end 
                end)
                KaizoUI.IsVisible(RMenu:Get('creator', 'characteroptions_m'), true, true, true, function()
                    FreezeEntityPosition(PlayerPedId(), true)
                    for _,v in pairs(Components) do
                        if v.name == sData then
                            for i = 0, ComponentsMax[sData] do
                                KaizoUI.ButtonWithStyle(v.label.." N°"..i, nil, {RightLabel = "→"}, true,function(h,a,s)
                                    if a then
                                        if sLoaded ~= i then
                                            sLoaded = i
                                            TriggerEvent('skinchanger:change', v.name, i)
                                        end
                                    end
                                end)
                            end
                        end
                    end 
                end)
                KaizoUI.IsVisible(RMenu:Get('creator', 'characteroptionshead'), true, true, true, function()
                    FreezeEntityPosition(PlayerPedId(), true)
                    for k,v in pairs(Components) do
                        for _, s_head in pairs(sHead) do
                            if zoomOffset ~= v.zoomOffset and camOffset ~= v.camOffset then 
                                zoomOffset = v.zoomOffset
                                camOffset = v.camOffset
                            end
                            if v.name == s_head then
                                KaizoUI.ButtonWithStyle(v.label, nil, {RightLabel = "→"}, true,function(h,a,s)
                                    if a then
                                        sData = v.name
                                        SwitchCam(false, v.name)
                                    end
                                end,RMenu:Get("creator","characteroptions_h"))
                            end
                        end
                    end
                end)
                KaizoUI.IsVisible(RMenu:Get('creator', 'characteroptions_h'), true, true, true, function()
                    FreezeEntityPosition(PlayerPedId(), true)
                    for _,v in pairs(Components) do
                        if v.name == sData then
                            for i = 0, ComponentsMax[sData] do
                                KaizoUI.ButtonWithStyle(v.label.." N°"..i, nil, {RightLabel = "→"}, true,function(h,a,s)
                                    if a then
                                        if sLoaded ~= i then
                                            sLoaded = i
                                            TriggerEvent('skinchanger:change', v.name, i)
                                        end
                                    end
                                end)
                            end
                        end
                    end 
                end)
                KaizoUI.IsVisible(RMenu:Get('creator', 'characteroptionsclothes'), true, true, true, function()
                    FreezeEntityPosition(PlayerPedId(), true)
                    for k,v in pairs(Components) do
                        for _, s_clothes in pairs(sClothes) do
                            if zoomOffset ~= v.zoomOffset and camOffset ~= v.camOffset then 
                                zoomOffset = v.zoomOffset
                                camOffset = v.camOffset
                            end
                            if v.name == s_clothes then
                                KaizoUI.ButtonWithStyle(v.label, nil, {RightLabel = "→"}, true,function(h,a,s)
                                    if a then
                                        sData = v.name
                                        SwitchCam(false, v.name)
                                    end
                                end,RMenu:Get("creator","characteroptions_c"))
                            end
                        end
                    end
                end)
                KaizoUI.IsVisible(RMenu:Get('creator', 'characteroptions_c'), true, true, true, function()
                    FreezeEntityPosition(PlayerPedId(), true)
                    for _,v in pairs(Components) do
                        if v.name == sData then
                            for i = 0, ComponentsMax[sData] do
                                KaizoUI.ButtonWithStyle(v.label.." N°"..i, nil, {RightLabel = "→"}, true,function(h,a,s)
                                    if a then
                                        if sLoaded ~= i then
                                            sLoaded = i
                                            TriggerEvent('skinchanger:change', v.name, i)
                                        end
                                    end
                                end)
                            end
                        end
                    end 
                end)
                KaizoUI.IsVisible(RMenu:Get('creator', 'characteroptionsaccessories'), true, true, true, function()
                    FreezeEntityPosition(PlayerPedId(), true)
                    for k,v in pairs(Components) do
                        for _, s_accessories in pairs(sAccessories) do
                            if zoomOffset ~= v.zoomOffset and camOffset ~= v.camOffset then 
                                zoomOffset = v.zoomOffset
                                camOffset = v.camOffset
                            end
                            if v.name == s_accessories then
                                KaizoUI.ButtonWithStyle(v.label, nil, {RightLabel = "→"}, true,function(h,a,s)
                                    if a then
                                        sData = v.name
                                        SwitchCam(false, v.name)
                                    end
                                end,RMenu:Get("creator","characteroptions_a"))
                            end
                        end
                    end
                end)
                KaizoUI.IsVisible(RMenu:Get('creator', 'characteroptions_a'), true, true, true, function()
                    FreezeEntityPosition(PlayerPedId(), true)
                    for _,v in pairs(Components) do
                        if v.name == sData then
                            for i = 0, ComponentsMax[sData] do
                                KaizoUI.ButtonWithStyle(v.label.." N°"..i, nil, {RightLabel = "→"}, true,function(h,a,s)
                                    if a then
                                        if sLoaded ~= i then
                                            sLoaded = i
                                            TriggerEvent('skinchanger:change', v.name, i)
                                        end
                                    end
                                end)
                            end
                        end
                    end 
                end)
				Wait(0)
			end
		end)
	end
end


function sKeyboardInput(TextEntry, ExampleText, MaxStringLenght)
	AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) 
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

local CamOffset = {
	{item = "default", 		cam = {0.0, 3.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "default_face", cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 35.0},
	{item = "face",			cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 20.0},
	{item = "skin", 		cam = {0.0, 2.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 30.0},
	{item = "tshirt_1", 	cam = {0.0, 2.0, 0.35}, lookAt = {0.0, 0.0, 0.35}, fov = 30.0},
	{item = "tshirt_2", 	cam = {0.0, 2.0, 0.35}, lookAt = {0.0, 0.0, 0.35}, fov = 30.0},
	{item = "torso_1", 		cam = {0.0, 2.0, 0.35}, lookAt = {0.0, 0.0, 0.35}, fov = 30.0},
	{item = "torso_2", 		cam = {0.0, 2.0, 0.35}, lookAt = {0.0, 0.0, 0.35}, fov = 30.0},
	{item = "decals_1", 	cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "decals_2", 	cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "arms", 		cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "arms_2", 		cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "pants_1", 		cam = {0.0, 2.0, -0.35}, lookAt = {0.0, 0.0, -0.4}, fov = 35.0},
	{item = "pants_2", 		cam = {0.0, 2.0, -0.35}, lookAt = {0.0, 0.0, -0.4}, fov = 35.0},
	{item = "shoes_1", 		cam = {0.0, 2.0, -0.5}, lookAt = {0.0, 0.0, -0.6}, fov = 40.0},
	{item = "shoes_2", 		cam = {0.0, 2.0, -0.5}, lookAt = {0.0, 0.0, -0.6}, fov = 25.0},
	{item = "age_1",			cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "age_2",			cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "beard_1", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "beard_2", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "beard_3", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "beard_4", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "hair_1",		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "hair_2",		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "hair_color_1",	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "hair_color_2",	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "eye_color", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "eyebrows_1", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "eyebrows_2", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "eyebrows_3", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "eyebrows_4", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "makeup_1", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "makeup_2", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "makeup_3", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "makeup_4", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "lipstick_1", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "lipstick_2", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "lipstick_3", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "lipstick_4", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "blemishes_1",	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "blemishes_2",	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "blush_1", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "blush_2", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "blush_3", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "complexion_1",	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "complexion_2",	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "sun_1", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "sun_2", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "moles_1", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "moles_2", 		cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "chest_1", 		cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "chest_2", 		cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "chest_3", 		cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "bodyb_1", 		cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "bodyb_2", 		cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "ears_1", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 35.0},
	{item = "ears_2", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 35.0},
	{item = "mask_1", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 20.0},
	{item = "mask_2", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 20.0},
	{item = "bproof_1", 	cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "bproof_2", 	cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "chain_1", 		cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "chain_2", 		cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "bags_1", 		cam = {0.0, -2.0, 0.35}, lookAt = {0.0, 0.0, 0.35}, fov = 30.0},
	{item = "bags_2", 		cam = {0.0, -2.0, 0.35}, lookAt = {0.0, 0.0, 0.35}, fov = 30.0},
	{item = "helmet_1", 	cam = {0.0, 1.0, 0.73}, lookAt = {0.0, 0.0, 0.68}, fov = 20.0},
	{item = "helmet_2", 	cam = {0.0, 1.0, 0.73}, lookAt = {0.0, 0.0, 0.68}, fov = 20.0},
	{item = "glasses_1", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "glasses_2", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "watches_1", 	cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "watches_2", 	cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "bracelets_1",	cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "bracelets_2",	cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
}


function GetCamOffset(type)
	for k,v in pairs(CamOffset) do
		if v.item == type then
			return v
		end
	end
end

function CreateCreatorCam()
    Citizen.CreateThread(function()
        local pPed = PlayerPedId()
        local offset = GetCamOffset("default")
        local pos = GetOffsetFromEntityInWorldCoords(pPed, offset.cam[1], offset.cam[2], offset.cam[3])
        local posLook = GetOffsetFromEntityInWorldCoords(pPed, offset.lookAt[1], offset.lookAt[2], offset.lookAt[3])

        CreatorCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
        
        SetCamActive(CreatorCam, 1)
        SetCamCoord(CreatorCam, pos.x, pos.y, pos.z)
        SetCamFov(CreatorCam, offset.fov)
        PointCamAtCoord(CreatorCam, posLook.x, posLook.y, posLook.z)

        RenderScriptCams(1, 1, 1000, 0, 0)
    end)
end

function SwitchCam(backto, type)
    if not DoesCamExist(cam2) then cam2 = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0) end
    Citizen.CreateThread(function()
        local pPed = PlayerPedId()
        local offset = GetCamOffset(type)
        if offset == nil then
            offset = GetCamOffset("default")
        end
        local pos = GetOffsetFromEntityInWorldCoords(pPed, offset.cam[1], offset.cam[2], offset.cam[3])
        local posLook = GetOffsetFromEntityInWorldCoords(pPed, offset.lookAt[1], offset.lookAt[2], offset.lookAt[3])

        if backto then
            SetCamActive(CreatorCam, 1)

            SetCamCoord(CreatorCam, pos.x, pos.y, pos.z)
            SetCamFov(CreatorCam, offset.fov)
            PointCamAtCoord(CreatorCam, posLook.x, posLook.y, posLook.z)
            SetCamActiveWithInterp(CreatorCam, cam2, 1000, 1, 1)
            Wait(1000)
            
        else
            SetCamActive(cam2, 1)

            SetCamCoord(cam2, pos.x, pos.y, pos.z)
            SetCamFov(cam2, offset.fov)
            PointCamAtCoord(cam2, posLook.x, posLook.y, posLook.z)
            SetCamDofMaxNearInFocusDistance(cam2, 1.0)
            SetCamDofStrength(cam2, 500.0)
            SetCamDofFocalLengthMultiplier(cam2, 500.0)
            SetCamActiveWithInterp(cam2, CreatorCam, 1000, 1, 1)
            Wait(1000)
        end
    end)
end

RegisterNetEvent('instance:onCreate')
AddEventHandler('instance:onCreate', function(instance)
	if instance ~= nil then 
        if instance.type == 'identity' then
            TriggerEvent('instance:enter', instance)
        end
    end
end)

RegisterCommand("debug",function()
    FreezeEntityPosition(PlayerPedId(),false)
end)

function KillCreatorCam()
    RenderScriptCams(0, 1, 1000, 0, 0)
    SetCamActive(CreatCam, 0)
    SetCamActive(cam2, 0)
    ClearPedTasks(PlayerPedId())
end


local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function EnumeratePeds()
	return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function Collision()
    for i=1,256 do
        if NetworkIsPlayerActive(i) then
            SetEntityVisible(GetPlayerPed(i), false, false)
            SetEntityVisible(PlayerPedId(), true, true)
            SetEntityNoCollisionEntity(GetPlayerPed(i), PlayerPedId(), false)
        end
    end
end

function Visible()
    while enable == true do
        Citizen.Wait(0)
        DisableAllControlActions(0)
        Collision()
    end
end

