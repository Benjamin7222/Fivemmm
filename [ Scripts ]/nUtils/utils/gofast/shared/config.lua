ConfigGoFast = {

    -- CONFIG DU MENU
    Couleur1 = '~r~', -- couleur principale du script
    Couleur2 = '~s~', -- couleur secondaire du script
    ActiverSeparator = true, -- activer le message en haut des boutons ?
    Separator = "GoFast", -- texte du message
    Drogue = { -- listes des drogues
        n1 = "Weed",
        n2 = "Coke",
        n3 = "Opium",
        n4 = "Meth",
    },
    
    -- CONFIG DU PED
    ActiverPed = true, -- activer/désactiver le ped
    NomPed = 'g_m_m_armlieut_01', -- type de ped
    PedPosX = 96.31, PedPosY = -2216.51, PedPosZ = 6.17, PedPosH = 94.796, -- position du ped

    -- CONFIG DES MARQUEURS
    MarkVente = 36, -- type des marqueurs des points de ventes
    Color = {R = 10, G = 10, B = 10, A = 100}, -- couleur des marqueurs des points de ventes
    PosMenu = {{x = 96.07, y = -2216.3, z = 6.17}}, -- position du menu gofast
    PosVente1 = {{x = -112.66, y = 6367.27, z = 31.47}}, -- position du point de vente 1
    PosVente2 = {{x = 1466.92, y = 6554.37, z = 14.0}}, -- position du point de vente 2
    PosVente3 = {{x = 1300.39, y = 4319.85, z = 38.2}}, -- position du point de vente 3

    -- CONFIG DES VÉHICULES
    PosVeh = vector3(90.52, -2214.69, 6.04), -- position de spawn des véhicules
    HashVeh = 3.011, -- hash de spawn des véhicules
    -- la liste des véhicules est modifiable dans le client.lua à la ligne
}