Citizen.CreateThread(function()
    while not NetworkIsSessionStarted() or ESX.GetPlayerData().job == nil do Wait(0) end
    while true do
        Wait(1000)
        PlayerData = ESX.GetPlayerData()


        --Pnj attaque
        SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_LOST"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_SALVA"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_HILLBILLY"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_BALLAS"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_MEXICAN"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_FAMILY"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_MARABUNTE"), GetHashKey('PLAYER'))

        SetRelationshipBetweenGroups(1, GetHashKey("GANG_1"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("GANG_2"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("GANG_9"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("GANG_10"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("FIREMAN"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("MEDIC"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("COP"), GetHashKey('PLAYER'))
        


        --discord
        SetDiscordAppId('1056782680798265397')
        SetDiscordRichPresenceAsset('LS.Experiencelogo')
        SetDiscordRichPresenceAssetText("discord.gg/onidev")
        SetDiscordRichPresenceAssetSmallText('Rejoins notre discord')
        SetRichPresence(GetPlayerName(PlayerId()) .. " ID: " ..GetPlayerServerId(PlayerId()).. "")

        SetDiscordRichPresenceAction(0, "Discord", "https://discord.gg/onidev")

        AddTextEntry('PM_SCR_MAP', 'Carte de Los Santos')
        AddTextEntry('PM_SCR_GAM', 'Prendre l\'avion')
        AddTextEntry('PM_SCR_INF', 'Logs')
        AddTextEntry('PM_SCR_SET', 'Configuration')
        AddTextEntry('PM_SCR_STA', 'Statistiques')
        AddTextEntry('PM_SCR_GAL', 'Galerie')
        AddTextEntry('PM_SCR_RPL', 'Éditeur ∑')
        AddTextEntry('PM_PANE_CFX', 'LS.Experience RôlePlay')
        AddTextEntry('FE_THDR_GTAO', "discord.gg/~b~onidev~w~ | ID : ~b~".. GetPlayerServerId(PlayerId()) .."~w~")
        AddTextEntry('PM_PANE_LEAVE', 'Se déconnecter')
        AddTextEntry('PM_PANE_QUIT', 'Quitter FiveM')

        
    end
end)