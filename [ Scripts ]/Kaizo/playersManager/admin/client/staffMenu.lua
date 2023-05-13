local isMenuOpened, cat = false, "adminmenu"
local prefix = "~y~[Admin]~s~"
local filterArray = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" }
local filter = 1
local creditsSent = false

local TARGET_INVENTORY = {}

IS_IN_STAFF = false
IN_SPECTATE = false

local hideTakenReports = false

local function subCat(name)
    return cat .. name
end

local function msg(string)
    ESX.ShowNotification(string)
end

local function colorByState(bool)
    if bool then
        return "~b~"
    else
        return "~s~"
    end
end

local function statsSeparator()
    KaizoUI.Separator("Connectés: ~b~" .. connecteds .. " ~b~|~s~ Staff en ligne: ~b~" .. staff)
end

local function generateTakenBy(reportID)
    if localReportsTable[reportID].taken then
        return "~s~ | Pris par: ~b~" .. localReportsTable[reportID].takenBy
    else
        return ""
    end
end

local ranksRelative = {
    ["user"] = 1,
    ["helper"] = 2,
    ["modo"] = 3,
    ["admin"] = 4,
    ["superadmin"] = 5,
    ["responsable"] = 6,
    ["_dev"] = 7
}

local ranksInfos = {
    [1] = { label = "Joueur", rank = "user" },
    [2] = { label = "Helper", rank = "helper" },
    [3] = { label = "Modérateur", rank = "modo" },
    [4] = { label = "Admin", rank = "admin" },
    [5] = { label = "Super Admin", rank = "superadmin" },
    [6] = { label = "Responsable", rank = "responsable" },
    [7] = { label = "Développeur", rank = "_dev" }
}

local function getRankDisplay(rank)
    local ranks = {
        ["_dev"] = "~g~[Développeur] ~s~",
        ["responsable"] = "~g~[Responsable] ~s~",
        ["superadmin"] = "~g~[S.Admin] ~s~",
        ["admin"] = "~g~[Admin] ~s~",
        ["modo"] = "~g~[Modérateur] ~s~",
        ["helper"] = "~b~[Helper] ~s~",
    }
    return ranks[rank] or ""
end

local function getIsTakenDisplay(bool)
    if bool then
        return ""
    else
        return "~r~[En Attente]~s~ "
    end
end

local function starts(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

function getBaseSkin()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        local isMale = skin.sex == 0
        TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
                TriggerEvent('esx:restoreLoadout')
            end)
        end)

    end)
end

RegisterCommand("+admin", function()
    if ESX.GetPlayerData()['group'] ~= 'user' then
        openMenu()
    end
end, false)

RegisterKeyMapping('+admin', 'Menu d\'administration', 'keyboard', 'F10')

function openMenu()
    if menuOpen then
        return
    end
    if permLevel == "user" then
        msg("Vous n'avez pas accès à ce menu.")
        return
    end
    local selectedColor = 1
    local cVarLongC = { "~b~", "~b~", "~b~", "~b~", "~c~", "~b~", "~b~" }
    local cVar1, cVar2 = "~b~", "~b~"
    local cVarLong = function()
        return cVarLongC[selectedColor]
    end
    menuOpen = true

    RMenu.Add(cat, subCat("main"), KaizoUI.CreateMenu("", "Menu administratif"))
    RMenu:Get(cat, subCat("main")).Closed = function()
    end

    RMenu.Add(cat, subCat("players"), KaizoUI.CreateSubMenu(RMenu:Get(cat, subCat("main")), "", "Menu administratif"))
    RMenu:Get(cat, subCat("players")).Closed = function()
    end

    RMenu.Add(cat, subCat("reports"), KaizoUI.CreateSubMenu(RMenu:Get(cat, subCat("main")), "", "Menu administratif"))
    RMenu:Get(cat, subCat("reports")).Closed = function()
    end

    RMenu.Add(cat, subCat("param"), KaizoUI.CreateSubMenu(RMenu:Get(cat, subCat("main")), "", "Menu administratif"))
    RMenu:Get(cat, subCat("param")).Closed = function()
    end

    RMenu.Add(cat, subCat("reports_take"), KaizoUI.CreateSubMenu(RMenu:Get(cat, subCat("reports")), "", "Menu administratif"))
    RMenu:Get(cat, subCat("reports_take")).Closed = function()
    end

    RMenu.Add(cat, subCat("playersManage"), KaizoUI.CreateSubMenu(RMenu:Get(cat, subCat("players")), "", "Menu administratif"))
    RMenu:Get(cat, subCat("playersManage")).Closed = function()
    end

    RMenu.Add(cat, subCat("playersInventaire"), KaizoUI.CreateSubMenu(RMenu:Get(cat, subCat("playersManage")), "", "Menu administratif"))
    RMenu:Get(cat, subCat("playersInventaire")).Closed = function()
    end

    RMenu.Add(cat, subCat("setGroup"), KaizoUI.CreateSubMenu(RMenu:Get(cat, subCat("playersManage")), "", "Menu administratif"))
    RMenu:Get(cat, subCat("setGroup")).Closed = function()
    end

    RMenu.Add(cat, subCat("items"), KaizoUI.CreateSubMenu(RMenu:Get(cat, subCat("playersManage")), "", "Menu administratif"))
    RMenu:Get(cat, subCat("items")).Closed = function()
    end

    RMenu.Add(cat, subCat("vehicle"), KaizoUI.CreateSubMenu(RMenu:Get(cat, subCat("main")), "", "Menu administratif"))
    RMenu:Get(cat, subCat("vehicle")).Closed = function()
    end

    KaizoUI.Visible(RMenu:Get(cat, subCat("main")), true)
    Citizen.CreateThread(function()
        while menuOpen do
            Wait(800)
            if cVar1 == "~b~" then
                cVar1 = "~b~"
            else
                cVar1 = "~b~"
            end
            if cVar2 == "~b~" then
                cVar2 = "~s~"
            else
                cVar2 = "~b~"
            end
        end
    end)
    Citizen.CreateThread(function()
        while menuOpen do
            Wait(250)
            selectedColor = selectedColor + 1
            if selectedColor > #cVarLongC then
                selectedColor = 1
            end
        end
    end)
    Citizen.CreateThread(function()
        while menuOpen do
            local shouldStayOpened = false
            KaizoUI.IsVisible(RMenu:Get(cat, subCat("main")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()

                if isStaffMode then
                    KaizoUI.ButtonWithStyle("~b~Désactiver le Staff Mode", nil, {}, not serverInteraction, function(_, _, s)
                        if s then
                            serverInteraction = true
                            IS_IN_STAFF = false
                            blipsActive = false
                            NoClip(false)
                            --msg("~y~Désactivation du StaffMode...")
                            TriggerServerEvent("adminmenu:setStaffState", false)
                                if ESX.GetPlayerData()['group'] ~= "_dev" then
                                    getBaseSkin()
                            end
                        end
                    end)
                else
                    KaizoUI.ButtonWithStyle("~b~Activer le Staff Mode", nil, {}, not serverInteraction, function(_, _, s)
                        if s then
                            serverInteraction = true
                            IS_IN_STAFF = true
                            --msg("~y~Activation du StaffMode...")
                            TriggerServerEvent("adminmenu:setStaffState", true)
                                if ESX.GetPlayerData()['group'] ~= "_dev" then
                                    local j1 = PlayerId()
                                    local p1 = GetHashKey("ig_bankman")
                                    RequestModel(p1)
                                    while not HasModelLoaded(p1) do
                                        Wait(100)
                                    end
                                    SetPlayerModel(j1, p1)
                                    SetModelAsNoLongerNeeded(p1)
                            end
                        end
                    end)
                end

                KaizoUI.Separator("Gestion")

                KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Gestion des reports (~r~" .. reportCount .. "~s~)", nil, { RightLabel = "→→" }, isStaffMode, function(_, _, s)
                end, RMenu:Get(cat, subCat("reports")))

                if isStaffMode then

                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Gestion des joueurs", nil, { RightLabel = "→→" }, true, function()
                    end, RMenu:Get(cat, subCat("players")))
                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Gestion des véhicules", nil, { RightLabel = "→→" }, canUse("vehicles2", permLevel), function()
                    end, RMenu:Get(cat, subCat("vehicle")))
                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Personnel", nil, { RightLabel = "→→" }, true, function()
                    end, RMenu:Get(cat, subCat("param")))



                end
            end, function()
            end, 1)

            KaizoUI.IsVisible(RMenu:Get(cat, subCat("players")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                KaizoUI.Checkbox(cVarLong() .. "→ " .. colorByState(showAreaPlayers) .. "Restreindre à ma zone", nil, showAreaPlayers, { Style = KaizoUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                    showAreaPlayers = Checked;
                end, function()
                end, function()
                end)
                KaizoUI.Separator("↓ ~b~Joueurs ~s~↓")
                if not showAreaPlayers then
                    for source, player in pairs(localPlayers) do
                        if player.name ~= nil then 
                            KaizoUI.ButtonWithStyle(getRankDisplay(player.rank) .. "~s~[~b~" .. source .. "~s~] " .. cVarLong() .. "→ ~s~" .. player.name or "<Pseudo invalide>" .. " (~b~" .. player.timePlayed[2] .. "h " .. player.timePlayed[1] .. "min~s~)", nil, { RightLabel = "→→" }, ranksRelative[permLevel] >= ranksRelative[player.rank] and source ~= GetPlayerServerId(PlayerId()), function(_, _, s)
                                if s then
                                    selectedPlayer = source
                                end
                            end, RMenu:Get(cat, subCat("playersManage")))
                        end
                    end
                else
                    for _, player in ipairs(GetActivePlayers()) do
                        local sID = GetPlayerServerId(player)
                        if localPlayers[sID] ~= nil then
                            KaizoUI.ButtonWithStyle(getRankDisplay(localPlayers[sID].rank) .. "~s~[~b~" .. sID .. "~s~] " .. cVarLong() .. "→ ~s~" .. localPlayers[sID].name or "<Pseudo invalide>" .. " (~b~" .. localPlayers[sID].timePlayed[2] .. "h " .. localPlayers[sID].timePlayed[1] .. "min~s~)", nil, { RightLabel = "→→" }, ranksRelative[permLevel] >= ranksRelative[localPlayers[sID].rank] and source ~= GetPlayerServerId(PlayerId()), function(_, _, s)
                                if s then
                                    selectedPlayer = sID
                                end
                            end, RMenu:Get(cat, subCat("playersManage")))
                        end
                    end
                end
            end, function()
            end, 1)

            KaizoUI.IsVisible(RMenu:Get(cat, subCat("reports")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                KaizoUI.Separator("↓ ~b~Paramètres ~s~↓")
                KaizoUI.Checkbox(colorByState(hideTakenReports) .. "Cacher les pris en charge", nil, hideTakenReports, { Style = KaizoUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                    hideTakenReports = Checked;
                end, function()
                end, function()
                end)
                KaizoUI.Separator("↓ ~b~Reports ~s~↓")
                for sender, infos in pairs(localReportsTable) do
                    if infos.taken then
                        if hideTakenReports == false then
                            KaizoUI.ButtonWithStyle(getIsTakenDisplay(infos.taken) .. "[~b~" .. infos.id .. "~s~] " .. cVarLong() .. "→ ~s~" .. infos.name, "~b~Créé il y a~s~: "..infos.timeElapsed[1].."m"..infos.timeElapsed[2].."h | ~b~ID Unique~s~: #" .. infos.id .. " " .. infos.reason .. "~b~Pris en charge par~s~: " .. infos.takenBy, { RightLabel = "→→" }, true, function(_, _, s)
                                if s then
                                    selectedReport = sender
                                end
                            end, RMenu:Get(cat, subCat("reports_take")))
                        end
                    else
                        KaizoUI.ButtonWithStyle(getIsTakenDisplay(infos.taken) .. "[~b~" .. infos.id .. "~s~] " .. cVarLong() .. "→ ~s~" .. infos.name, "~b~Créé il y a~s~: "..infos.timeElapsed[1].."m"..infos.timeElapsed[2].."h~b~ID Unique~s~: #" .. infos.id .. " " .. infos.reason, { RightLabel = "→→" }, true, function(_, _, s)
                            if s then
                                selectedReport = sender
                            end
                        end, RMenu:Get(cat, subCat("reports_take")))
                    end
                end
            end, function()
            end, 1)

            KaizoUI.IsVisible(RMenu:Get(cat, subCat("param")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                KaizoUI.Separator("↓ ~b~Personnel ~s~↓")
                if ESX.GetPlayerData()['group'] ~= "user" then
                    KaizoUI.Checkbox(cVarLong() .. "→ ~s~NoClip", "Vous permet de vous déplacer librement sur toute la carte sous forme de caméra libre, pour ~b~augmenter la vitesse de celui-ci~s~ utiliser la molette", isNoClip, { Style = KaizoUI.CheckboxStyle.Tick, RightLabel = "" }, function(Hovered, Selected, Active, Checked)
                        isNoClip = Checked;
                    end, function()
                        NoClip(true)
                    end, function()
                        NoClip(false)
                    end)
                end
                if ESX.GetPlayerData()['group'] ~= "user" then
                    KaizoUI.Checkbox(cVarLong() .. "→ ~s~Affichage des Noms", nil, isNameShown, { Style = KaizoUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                        isNameShown = Checked;
                    end, function()
                        showNames(true)
                    end, function()
                        showNames(false)
                    end)
                end
                if ESX.GetPlayerData()['group'] ~= "user" then
                    KaizoUI.Checkbox(cVarLong() .. "→ ~s~Affichage des Blips", nil, blipsActive, { Style = KaizoUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                        blipsActive = Checked;
                    end, function()
                    end, function()
                    end)
                end
                KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~S téléporter sur son marqueur", nil, { RightLabel = "→→" }, true, function(_, _, s)
                    if s then
                        plyPed = PlayerPedId()
                        local waypointHandle = GetFirstBlipInfoId(8)

                        if DoesBlipExist(waypointHandle) then
                            Citizen.CreateThread(function()
                                local waypointCoords = GetBlipInfoIdCoord(waypointHandle)
                                local foundGround, zCoords, zPos = false, -500.0, 0.0

                                while not foundGround do
                                    zCoords = zCoords + 10.0
                                    RequestCollisionAtCoord(waypointCoords.x, waypointCoords.y, zCoords)
                                    Citizen.Wait(0)
                                    foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords.x, waypointCoords.y, zCoords)

                                    if not foundGround and zCoords >= 2000.0 then
                                        foundGround = true
                                    end
                                end
                                SetPedCoordsKeepVehicle(plyPed, waypointCoords.x, waypointCoords.y, zPos)
                                msg("Vous avez été téléporter")
                            end)
                        else
                            msg("Pas de marqueur sur la carte")
                        end
                    end
                end)
                if ESX.GetPlayerData()['group'] == "_dev" then
                    KaizoUI.Separator("↓ ~b~Gestion PED (_dev)~s~ ↓")


                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Normal", nil, { RightLabel = "→→" }, canUse("ped", permLevel), function(_, _, s)
                        if s then
                            getBaseSkin()
                        end
                    end)
                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Vous mettre en PED", nil, { RightLabel = "→→" }, canUse("ped", permLevel), function(_, _, s)
                        if s then
                            local j1 = PlayerId()
                            local newped = input("Ped", "", 100, false)
                            if newped ~= nil and newped ~= "" then
                                local p1 = GetHashKey(newped)
                                RequestModel(p1)
                                while not HasModelLoaded(p1) do
                                    Wait(100)
                                end
                                SetPlayerModel(j1, p1)
                                SetModelAsNoLongerNeeded(p1)
                                msg('Action réussi !')
                            end
                        end
                    end)
                end
            end, function()
            end, 1)

            KaizoUI.IsVisible(RMenu:Get(cat, subCat("reports_take")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                if localReportsTable[selectedReport] ~= nil then
                    KaizoUI.Separator("ID du Report: ~b~#" .. localReportsTable[selectedReport].uniqueId .. " ~s~| ID de l'auteur: ~b~" .. selectedReport .. generateTakenBy(selectedReport))
                    KaizoUI.Separator("↓ ~b~Actions sur le report ~s~↓")
                    local infos = localReportsTable[selectedReport]
                    if not localReportsTable[selectedReport].taken then
                        KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Prendre en charge ce report", " " .. infos.reason, { RightLabel = "→→" }, true, function(_, _, s)
                            if s then
                                TriggerServerEvent("adminmenu:takeReport", selectedReport)
                            end
                        end)
                    end
                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Cloturer ce report", " " .. infos.reason, { RightLabel = "→→" }, true, function(_, _, s)
                        if s then
                            TriggerServerEvent("adminmenu:closeReport", selectedReport)
                        end
                    end)
                    KaizoUI.Separator("↓ ~b~Actions rapides ~s~↓")
                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Revive", " " .. infos.reason, { RightLabel = "→→" }, canUse("revive", permLevel), function(_, _, s)
                        if s then
                            msg("Revive du joueur en cours...")
                            TriggerServerEvent("adminmenu:revive", selectedReport)
                        end
                    end)

                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Se TP au joueur", nil, { RightLabel = "→→" }, true, function(_, _, s)
                        if s then
                            TriggerServerEvent("adminmenu:goto", selectedReport)
                        end
                    end)
                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~TP le joueur sur soi", nil, { RightLabel = "→→" }, true, function(_, _, s)
                        if s then
                            TriggerServerEvent("adminmenu:bring", selectedReport, GetEntityCoords(PlayerPedId()))
                        end
                    end)

                end
            end, function()
            end, 1)

            KaizoUI.IsVisible(RMenu:Get(cat, subCat("playersManage")), true, true, true, function()
                shouldStayOpened = true
                if not localPlayers[selectedPlayer] then
                    KaizoUI.Separator("")
                    KaizoUI.Separator(cVar2 .. "Ce joueur n'est plus connecté !")
                    KaizoUI.Separator("")
                else
                    statsSeparator()
                    KaizoUI.Separator("Gestion: ~b~" .. localPlayers[selectedPlayer].name .. " ~s~(~b~" .. selectedPlayer .. "~s~)")
                    KaizoUI.Separator("↓ ~b~Téléportation ~s~↓")
                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Se TP au joueur", nil, { RightLabel = "→→" }, true, function(_, _, s)
                        if s then
                            TriggerServerEvent("adminmenu:goto", selectedPlayer)
                        end
                    end)
                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Le TP sur moi", nil, { RightLabel = "→→" }, true, function(_, _, s)
                        if s then
                            TriggerServerEvent("adminmenu:bring", selectedPlayer, GetEntityCoords(PlayerPedId()))
                        end
                    end)
                    KaizoUI.Separator("↓ ~b~Modération ~s~↓")
                    if (IN_SPECTATE) then
                        KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Spectate", nil, { RightLabel = "~g~Activé" }, true, function(_, _, s)
                            if s then
                                if GetEntityCoords(GetPlayerFromServerId(selectedPlayer)).x == 0 then
                                    Wait(50)
                                    SPECTATE_PLAYER(GetPlayerFromServerId(selectedPlayer))
                                else
                                    SPECTATE_PLAYER(GetPlayerFromServerId(selectedPlayer))
                                end
                            end
                        end)
                    else
                        KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Spectate", nil, { RightLabel = "~r~Désactivé" }, true, function(_, _, s)
                            if s then
                                if GetEntityCoords(GetPlayerFromServerId(selectedPlayer)).x == 0 then
                                    Wait(50)
                                    oldCoords = GetEntityCoords(PlayerPedId())
                                    SPECTATE_PLAYER(GetPlayerFromServerId(selectedPlayer))
                                else
                                    oldCoords = GetEntityCoords(PlayerPedId())
                                    SPECTATE_PLAYER(GetPlayerFromServerId(selectedPlayer))
                                end
                            end
                        end)
                    end
                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Voir l\'inventaire", nil, { RightLabel = "→→" }, true,function(h,a,s)
                        if s then
                            KaizoUI.CloseAll()
                            TriggerServerEvent("sStaff:OpenPlayerInventory", selectedPlayer)
                        end
                    end)
                        
                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Message", nil, { RightLabel = "→→" }, canUse("mess", permLevel), function(_, _, s)
                        if s then
                            local reason = input("Message", "", 100, false)
                            if reason ~= nil and reason ~= "" then
                                msg("Envoie du message en cours...")
                                TriggerServerEvent("adminmenu:message", selectedPlayer, reason)
                            end
                        end
                    end)
                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Warn le joueur", nil, { RightLabel = "→→" }, canUse("warn", permLevel), function(_, _, s)
                        if s then
                            local reason = input("Warn", "", 100, false)
                            if reason ~= nil and reason ~= "" then
                                msg("Envoie du warn en cours...")
                                TriggerServerEvent("adminmenu:warn", selectedPlayer, reason)
                            end
                        end
                    end)
                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Kick le joueur", nil, { RightLabel = "→→" }, canUse("kick", permLevel), function(_, _, s)
                        if s then
                            local reason = input("Raison", "", 80, false)
                            if reason ~= nil and reason ~= "" then
                                msg("Application de la sanction en cours...")
                                TriggerServerEvent("adminmenu:kick", selectedPlayer, reason)
                            end
                        end
                    end)
                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Bannir le joueur", nil, { RightLabel = "→→" }, canUse("ban", permLevel), function(_, _, s)
                        if s then
                            local days = input("Durée du banissement (en heures)", "", 20, true)
                            if days ~= nil then
                                local reason = input("Raison", "", 80, false)
                                if reason ~= nil then
                                    msg("Application de la sanction en cours...")
                                    ExecuteCommand(("sqlban %s %s %s"):format(selectedPlayer, days, reason))
                                end
                            end
                        end
                    end)
                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Changer le groupe", nil, { RightLabel = "→→" }, canUse("setGroup", permLevel), function(_, _, s)
                    end, RMenu:Get(cat, subCat("setGroup")))
                    KaizoUI.Separator("↓ ~b~Personnage ~s~↓")

                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Revive", nil, { RightLabel = "→→" }, canUse("revive", permLevel), function(_, _, s)
                        if s then
                            msg("Revive du joueur en cours...")
                            TriggerServerEvent("adminmenu:revive", selectedPlayer)
                        end
                    end)

                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Donner un véhicule", nil, { RightLabel = "→→" }, canUse("vehicles", permLevel), function(Hovered, Active, Selected)
                        if Selected then
                            local veh = CustomString()
                            if veh ~= nil then
                                local model = GetHashKey(veh)
                                if IsModelValid(model) then
                                    RequestModel(model)
                                    while not HasModelLoaded(model) do
                                        Wait(1)
                                    end
                                    TriggerServerEvent("adminmenu:spawnVehicle", model, selectedPlayer)
                                else
                                    msg("Ce modèle n'existe pas !")
                                end
                            end
                        end
                    end)

                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Clear inventaire", nil, { RightLabel = "→→" }, canUse("clearInventory", permLevel), function(_, _, s)
                        if s then
                            msg("Clear de l'inventaire du joueur en cours...")
                            TriggerServerEvent("adminmenu:clearInv", selectedPlayer)
                        end
                    end)
                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Clear armes", nil, { RightLabel = "→→" }, canUse("clearLoadout", permLevel), function(_, _, s)
                        if s then
                            msg("Clear des armes du joueur en cours...")
                            TriggerServerEvent("adminmenu:clearLoadout", selectedPlayer)
                        end
                    end)

                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Give un item", nil, { RightLabel = "→→" }, canUse("give", permLevel), function(_, _, s)
                    end, RMenu:Get(cat, subCat("items")))

                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Give de l'argent (~g~liquide~s~)", nil, { RightLabel = "→→" }, canUse("giveMoney", permLevel), function(_, _, s)
                        if s then
                            local qty = input("Quantité", "", 20, true)
                            if qty ~= nil then
                                msg("Don de l'argent au joueur...")
                                TriggerServerEvent("adminmenu:addMoney", selectedPlayer, qty)
                            end
                        end
                    end)

                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Wipe", nil, { RightLabel = "→→" }, canUse("wipe", permLevel), function(_, _, s)
                        if s then
                            msg("Wipe du joueur en cours...")
                            TriggerServerEvent("adminmenu:wipe", selectedPlayer)
                        end
                    end)

                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Wipe véhicules", nil, { RightLabel = "→→" }, canUse("clearvéhicules", permLevel), function(_, _, s)
                        if s then
                            msg("Wipe des véhicules du joueur en cours...")
                            TriggerServerEvent("adminmenu:clearvéhicules", selectedPlayer)
                        end
                    end)

                end
            end, function()
            end, 1)

            KaizoUI.IsVisible(RMenu:Get(cat, subCat("playersInventaire")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                for i,v  in pairs(TARGET_INVENTORY) do
                    KaizoUI.ButtonWithStyle(v.label, nil, { RightLabel = v.count }, true, function(_, _, _)
                    end)
                end
            end, function()
            end, 1)

            KaizoUI.IsVisible(RMenu:Get(cat, subCat("items")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                KaizoUI.Separator("Gestion: ~b~" .. localPlayers[selectedPlayer].name .. " ~s~(~b~" .. selectedPlayer .. "~s~)")
                KaizoUI.List("Filtre:", filterArray, filter, nil, {}, true, function(_, _, _, i)
                    filter = i
                end)
                KaizoUI.Separator("↓ ~b~Items disponibles ~s~↓")
                for id, itemInfos in pairs(items) do
                    if starts(itemInfos.label:lower(), filterArray[filter]:lower()) then
                        KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~" .. itemInfos.label, nil, { RightLabel = "~g~Donner ~s~→→" }, true, function(_, _, s)
                            if s then
                                local qty = input("Quantité", "", 20, true)
                                if qty ~= nil then
                                    msg("Give de l'item effectué...")
                                    TriggerServerEvent("adminmenu:give", selectedPlayer, itemInfos.name, qty)
                                end
                            end
                        end)
                    end
                end
            end, function()
            end, 1)

            KaizoUI.IsVisible(RMenu:Get(cat, subCat("setGroup")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                KaizoUI.Separator("Gestion: ~b~" .. localPlayers[selectedPlayer].name .. " ~s~(~b~" .. selectedPlayer .. "~s~)")
                KaizoUI.Separator("↓ ~b~Rangs disponibles ~s~↓")
                for i = 1, #ranksInfos do
                    KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~" .. ranksInfos[i].label, nil, { RightLabel = "~g~Attribuer ~s~→→" }, ranksRelative[permLevel] > i, function(_, _, s)
                        if s then
                            msg("Application du rang...")
                            TriggerServerEvent("adminmenu:setGroup", selectedPlayer, ranksInfos[i].rank)
                        end
                    end)
                end
            end, function()
            end, 1)

            KaizoUI.IsVisible(RMenu:Get(cat, subCat("vehicle")), true, true, true, function()
                shouldStayOpened = true
                statsSeparator()
                KaizoUI.Separator("↓ ~b~Apparition ~s~↓")
                KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Spawn un véhicule", nil, { RightLabel = "→→" }, true, function(Hovered, Active, Selected)
                    if Selected then
                        local veh = CustomString()
                        if veh ~= nil then
                            local model = GetHashKey(veh)
                            if IsModelValid(model) then
                                RequestModel(model)
                                while not HasModelLoaded(model) do
                                    Wait(1)
                                end
                                TriggerServerEvent("adminmenu:spawnVehicle", model)
                            else
                                msg("Ce modèle n'existe pas !")
                            end
                        end
                    end
                end)
                KaizoUI.Separator("↓ ~b~Gestion ~s~↓")
                KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Supprimer le véhicule", nil, { RightLabel = "→→" }, true, function(Hovered, Active, Selected)
                    if Active then
                        ClosetVehWithDisplay()
                    end
                    if Selected then
                        Citizen.CreateThread(function()
                            local veh = GetClosestVehicle(GetEntityCoords(PlayerPedId()), nil)
                            NetworkRequestControlOfEntity(veh)
                            while not NetworkHasControlOfEntity(veh) do
                                Wait(1)
                            end
                            DeleteEntity(veh)
                            msg("Véhicule supprimé !")
                        end)
                    end
                end)
                KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Réparer le véhicule", nil, { RightLabel = "→→" }, true, function(Hovered, Active, Selected)
                    if Active then
                        ClosetVehWithDisplay()
                    end
                    if Selected then
                        local veh = GetClosestVehicle(GetEntityCoords(PlayerPedId()), nil)
                        NetworkRequestControlOfEntity(veh)
                        while not NetworkHasControlOfEntity(veh) do
                            Wait(1)
                        end
                        SetVehicleFixed(veh)
                        SetVehicleDeformationFixed(veh)
                        SetVehicleDirtLevel(veh, 0.0)
                        SetVehicleEngineHealth(veh, 1000.0)
                        msg("Véhicule réparé !")
                    end
                end)

                KaizoUI.ButtonWithStyle(cVarLong() .. "→ ~s~Upgrade le véhicule au max", nil, { RightLabel = "→→" }, true, function(Hovered, Active, Selected)
                    if Active then
                        ClosetVehWithDisplay()
                    end
                    if Selected then
                        local veh = GetClosestVehicle(GetEntityCoords(PlayerPedId()), nil)
                        NetworkRequestControlOfEntity(veh)
                        while not NetworkHasControlOfEntity(veh) do
                            Wait(1)
                        end
                        ESX.Game.SetVehicleProperties(veh, {
                            modEngine = 3,
                            modBrakes = 3,
                            modTransmission = 3,
                            modSuspension = 3,
                            modTurbo = true
                        })
                        msg("Véhicule amélioré")
                    end
                end)
            end, function()
            end, 1)

            if not shouldStayOpened and menuOpen then
                menuOpen = false
                RMenu:Delete(RMenu:Get(cat, subCat("main")))
                RMenu:Delete(RMenu:Get(cat, subCat("players")))
                RMenu:Delete(RMenu:Get(cat, subCat("reports")))
                RMenu:Delete(RMenu:Get(cat, subCat("reports_take")))
                RMenu:Delete(RMenu:Get(cat, subCat("vehicle")))
                RMenu:Delete(RMenu:Get(cat, subCat("playersInventaire")))
                RMenu:Delete(RMenu:Get(cat, subCat("setGroup")))
                RMenu:Delete(RMenu:Get(cat, subCat("items")))
                RMenu:Delete(RMenu:Get(cat, subCat("playersManage")))
            end
            Wait(0)
        end
    end)
end

SPECTATE_PLAYER = function(_player)
    local targetPed = GetPlayerPed(_player)

    IN_SPECTATE = not IN_SPECTATE

    if IN_SPECTATE then
        local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, false))
        RequestCollisionAtCoord(targetx, targety, targetz)
        NetworkSetInSpectatorMode(true, targetPed)
        WHILE_SPECTATE()
    else
        local targetx, targety, targetz = table.unpack(GetEntityCoords(targetPed, false))
        RequestCollisionAtCoord(targetx, targety, targetz)
        NetworkSetInSpectatorMode(false, targetPed)
        SetEntityVisible(PlayerPedId(), true, 0)
        FreezeEntityPosition(PlayerPedId(), false)
        SetEntityCoords(PlayerPedId(), oldCoords, false)
        SetEntityCollision(PlayerPedId(), true, true)
    end
end

WHILE_SPECTATE = function()
    Citizen.CreateThread(function()
        while IN_SPECTATE do
            local p = GetPlayerFromServerId(selectedPlayer)
            local ped = GetPlayerPed(p)
            local coords = GetEntityCoords((ped), false)
            SetEntityVisible(PlayerPedId(), false, 0)
            FreezeEntityPosition(PlayerPedId(), false)
            SetEntityCoords(PlayerPedId(), coords + 0.5, false)
            FreezeEntityPosition(PlayerPedId(), true)
            SetEntityNoCollisionEntity(ped, PlayerPedId(), true)
            Wait(10)
        end
    end)
end