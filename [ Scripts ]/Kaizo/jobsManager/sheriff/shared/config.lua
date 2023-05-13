cfg_sheriff = {

    MarkerType = 6, -- Pour voir les différents type de marker: https://docs.fivem.net/docs/game-references/markers/
    MarkerSizeLargeur = 0.8, -- Largeur du marker
    MarkerSizeEpaisseur = 0.8, -- Épaisseur du marker
    MarkerSizeHauteur = 0.8, -- Hauteur du marker
    MarkerDistance = 25.0, -- Distane de visibiliter du marker (1.0 = 1 mètre)
    MarkerColorR = 20, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorG = 146, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorB = 0, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerOpacite = 180, -- Opacité du marker (min: 0, max: 255)
    MarkerSaute = false, -- Si le marker saute (true = oui, false = non)
    MarkerTourne = false, -- Si le marker tourne (true = oui, false = non)

Vehiculessheriff = { 
   {buttoname = "Ford Interceptor", disc = 0, rightlabel = "→→", spawnname = "bcvic", spawnzone = vector3(-468.62, 6038.67, 31.34), headingspawn = 223.19}, -- Garage Voiture
   {buttoname = "Dodge Charger", disc = 1, rightlabel = "→→", spawnname = "bc14charger", spawnzone = vector3(-468.62, 6038.67, 31.34), headingspawn = 223.19}, -- Garage Voiture
   {buttoname = "Charger", disc = 3, rightlabel = "→→", spawnname = "bc08charger", spawnzone = vector3(-468.62, 6038.67, 31.34), headingspawn = 223.19}, -- Garage Voiture
   {buttoname = "Ford Interceptor EXP", disc = 7, rightlabel = "→→", spawnname = "bc16exp", spawnzone = vector3(-468.62, 6038.67, 31.34), headingspawn = 223.19}, -- Garage Voiture
},

Helicosheriff = { 
   {buttonameheli = "Hélicoptère de transport (Super Puma)", rightlabel = "→→", spawnnameheli = "as332", spawnzoneheli = vector3(-475.42, 5988.49, 31.34), headingspawnheli = 0.91}, -- Garage Hélico
},

amende = {
   ["amende "] = {
       {label = 'Usage abusif du klaxon', price = 1500},
       {label = 'Franchir une ligne continue', price = 1500},
       {label = 'Circulation à contresens', price = 1500},
       {label = 'Demi-tour non autorisé', price = 1500},
       {label = 'Circulation hors-route', price = 1500},
       {label = 'Non-respect des distances de sécurité', price = 1500},
       {label = 'Arrêt dangereux / interdit', price = 1500},
       {label = 'Stationnement gênant / interdit', price = 1500},
       {label = 'Non respect  de la priorité à droite', price = 1500},
       {label = 'Non-respect à un véhicule prioritaire', price = 1500},
       {label = 'Non-respect d\'un stop', price = 1500},
       {label = 'Non-respect d\'un feu rouge', price = 1500},
       {label = 'Dépassement dangereux', price = 1500},
       {label = 'Véhicule non en état', price = 1500},
       {label = 'Conduite sans permis', price = 1500},
       {label = 'Délit de fuite', price = 1500},
       {label = 'Excès de vitesse < 5 kmh', price = 1500},
       {label = 'Excès de vitesse 5-15 kmh', price = 1500},
       {label = 'Excès de vitesse 15-30 kmh', price = 1500},
       {label = 'Excès de vitesse > 30 kmh', price = 1500},
       {label = 'Entrave de la circulation', price = 1500},
       {label = 'Dégradation de la voie publique', price = 1500},
       {label = 'Trouble à l\'ordre publique', price = 1500},
       {label = 'Entrave opération de sheriff', price = 1500},
       {label = 'Insulte envers / entre civils', price = 1500},
       {label = 'Outrage à agent de sheriff', price = 1500},
       {label = 'Menace verbale ou intimidation envers civil', price = 1500},
       {label = 'Menace verbale ou intimidation envers policier', price = 1500},
       {label = 'Manifestation illégale', price = 1500},
       {label = 'Tentative de corruption', price = 1500},
       {label = 'Arme blanche sortie en ville', price = 1500},
       {label = 'Arme léthale sortie en ville', price = 1500},
       {label = 'Port d\'arme non autorisé (défaut de license)', price = 1500},
       {label = 'Port d\'arme illégal', price = 1500},
       {label = 'Pris en flag lockpick', price = 1500},
       {label = 'Vol de voiture', price = 1500},
       {label = 'Vente de drogue', price = 1500},
       {label = 'Fabriquation de drogue', price = 1500},
       {label = 'Possession de drogue', price = 1500},
       {label = 'Prise d\'ôtage civil', price = 1500},
       {label = 'Prise d\'ôtage agent de l\'état', price = 1500},
       {label = 'Braquage particulier', price = 1500},
       {label = 'Braquage magasin', price = 1500},
       {label = 'Braquage de banque', price = 1500},
       {label = 'Tir sur civil', price = 1500},
       {label = 'Tir sur agent de l\'état', price = 1500},
       {label = 'Tentative de meurtre sur civil', price = 1500},
       {label = 'Tentative de meurtre sur agent de l\'état', price = 1500},
       {label = 'Meurtre sur civil', price = 1500},
       {label = 'Meurte sur agent de l\'état', price = 1500}, 
       {label = 'Escroquerie à l\'entreprise', price = 1500},
   }
},

sheriffCloak = {
   clothes = {
       specials = {
           [0] = {
               label = "Reprendre sa tenue : ~b~Civile",
                minimum_grade = 0,
               variations = {male = {}, female = {}},
               onEquip = function()
                   ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin) TriggerEvent('skinchanger:loadSkin', skin) end)
                   SetPedArmour(PlayerPedId(), 0)
               end
           },
       },

       grades = {

           [1] = {
               label = "Tenue : ~b~Deputy",
               minimum_grade = 0,
               variations = {
                   male = {
                       ['tshirt_1'] = 82,  ['tshirt_2'] = 0,
                       ['torso_1'] = 313,   ['torso_2'] = 3,
                       ['decals_1'] = 0,   ['decals_2'] = 0,
                       ['arms'] = 1,
                       ['pants_1'] = 106,   ['pants_2'] = 0,
                       ['shoes_1'] = 90,   ['shoes_2'] = 0,
                       ['mask_1'] = 133,  ['mask_2'] = 0,
                       ['bproof_1'] = 29,  ['bproof_2'] = 3,
                       ['chain_1'] = 8,    ['chain_2'] = 0,
                       ['helmet_1'] = 13,  ['helmet_2'] = 1,
                       --['ears_1'] = -1,     ['ears_2'] = 0,
                       ['bags_1'] = 64,     ['bags_2'] = 0,
                   },
                   female = {
                       ['tshirt_1'] = 31,  ['tshirt_2'] = 1,
                       ['torso_1'] = 437,   ['torso_2'] = 0,
                       ['decals_1'] = 0,   ['decals_2'] = 0,
                       ['arms'] = 2,
                       ['pants_1'] = 70,   ['pants_2'] = 0,
                       ['shoes_1'] = 25,   ['shoes_2'] = 0,
                       --['helmet_1'] = -1,  ['helmet_2'] = 0,
                       ['chain_1'] = 8,    ['chain_2'] = 0,
                       ['bproof_1'] = 24,  ['bproof_2'] = 0,
                       --['ears_1'] = -1,     ['ears_2'] = 0,
                       ['bags_1'] = 0,     ['bags_2'] = 0,
                   }
           },
               onEquip = function()
               end
           },

           [2] = {
               label = "Tenue : ~b~Deputy I",
               minimum_grade = 1,
               variations = {
                   male = {
                       ['tshirt_1'] = 82,  ['tshirt_2'] = 0,
                       ['torso_1'] = 303,   ['torso_2'] = 3,
                       ['decals_1'] = 0,   ['decals_2'] = 0,
                       ['arms'] = 11,
                       ['pants_1'] = 106,   ['pants_2'] = 0,
                       ['shoes_1'] = 90,   ['shoes_2'] = 0,
                       ['mask_1'] = 133,  ['mask_2'] = 0,
                       ['bproof_1'] = 24,  ['bproof_2'] = 3,
                       ['chain_1'] = 8,    ['chain_2'] = 0,
                       ['helmet_1'] = 13,  ['helmet_2'] = 1,
                       --['ears_1'] = -1,     ['ears_2'] = 0,
                       ['bags_1'] = 64,     ['bags_2'] = 0,
                   },
                   female = {
                       ['tshirt_1'] = 31,  ['tshirt_2'] = 1,
                       ['torso_1'] = 437,   ['torso_2'] = 0,
                       ['decals_1'] = 0,   ['decals_2'] = 0,
                       ['arms'] = 2,
                       ['pants_1'] = 70,   ['pants_2'] = 0,
                       ['shoes_1'] = 25,   ['shoes_2'] = 0,
                       --['helmet_1'] = -1,  ['helmet_2'] = 0,
                       ['chain_1'] = 8,    ['chain_2'] = 0,
                       ['bproof_1'] = 24,  ['bproof_2'] = 0,
                       --['ears_1'] = -1,     ['ears_2'] = 0,
                       ['bags_1'] = 52,     ['bags_2'] = 0,
                   }
           },
               onEquip = function()
               end
           },

           [3] = {
               label = "Tenue : ~b~Deputy II",
               minimum_grade = 2,
               variations = {
                   male = {
                       ['tshirt_1'] = 82,  ['tshirt_2'] = 0,
                       ['torso_1'] = 303,   ['torso_2'] = 3,
                       ['decals_1'] = 1,   ['decals_2'] = 0,
                       ['arms'] = 11,
                       ['pants_1'] = 106,   ['pants_2'] = 0,
                       ['shoes_1'] = 90,   ['shoes_2'] = 0,
                       ['mask_1'] = 133,  ['mask_2'] = 0,
                       ['bproof_1'] = 24,  ['bproof_2'] = 0,
                       ['chain_1'] = 8,    ['chain_2'] = 0,
                       ['helmet_1'] = 13,  ['helmet_2'] = 1,
                       --['ears_1'] = -1,     ['ears_2'] = 0,
                       ['bags_1'] = 64,     ['bags_2'] = 0,
                   },
                   female = {
                       ['tshirt_1'] = 31,  ['tshirt_2'] = 1,
                       ['torso_1'] = 437,   ['torso_2'] = 0,
                       ['decals_1'] = 0,   ['decals_2'] = 0,
                       ['arms'] = 2,
                       ['pants_1'] = 70,   ['pants_2'] = 0,
                       ['shoes_1'] = 25,   ['shoes_2'] = 0,
                       --['helmet_1'] = -1,  ['helmet_2'] = 0,
                       ['chain_1'] = 8,    ['chain_2'] = 0,
                       ['bproof_1'] = 24,  ['bproof_2'] = 0,
                       --['ears_1'] = -1,     ['ears_2'] = 0,
                       ['bags_1'] = 52,     ['bags_2'] = 0,
                   }
           },
               onEquip = function()
               end
           },

           [4] = {
               label = "Tenue : ~b~Deputy III",
               minimum_grade = 2,
               variations = {
                   male = {
                       ['tshirt_1'] = 82,  ['tshirt_2'] = 0,
                       ['torso_1'] = 303,   ['torso_2'] = 3,
                       ['decals_1'] = 1,   ['decals_2'] = 0,
                       ['arms'] = 11,
                       ['pants_1'] = 106,   ['pants_2'] = 0,
                       ['shoes_1'] = 90,   ['shoes_2'] = 0,
                       ['mask_1'] = 133,  ['mask_2'] = 0,
                       ['bproof_1'] = 24,  ['bproof_2'] = 0,
                       ['chain_1'] = 8,    ['chain_2'] = 0,
                       ['helmet_1'] = 13,  ['helmet_2'] = 1,
                       --['ears_1'] = -1,     ['ears_2'] = 0,
                       ['bags_1'] = 64,     ['bags_2'] = 0,
                   },
                   female = {
                       ['tshirt_1'] = 31,  ['tshirt_2'] = 1,
                       ['torso_1'] = 437,   ['torso_2'] = 0,
                       ['decals_1'] = 0,   ['decals_2'] = 0,
                       ['arms'] = 2,
                       ['pants_1'] = 70,   ['pants_2'] = 0,
                       ['shoes_1'] = 25,   ['shoes_2'] = 0,
                       --['helmet_1'] = -1,  ['helmet_2'] = 0,
                       ['chain_1'] = 8,    ['chain_2'] = 0,
                       ['bproof_1'] = 24,  ['bproof_2'] = 0,
                       --['ears_1'] = -1,     ['ears_2'] = 0,
                       ['bags_1'] = 52,     ['bags_2'] = 0,
                   }
           },
               onEquip = function()
               end
           },

           [5] = {
               label = "Tenue : ~b~Senior Deputy",
               minimum_grade = 4,
               variations = {
                   male = {
                       ['tshirt_1'] = 82,  ['tshirt_2'] = 0,
                       ['torso_1'] = 303,   ['torso_2'] = 3,
                       ['decals_1'] = 10,   ['decals_2'] = 0,
                       ['arms'] = 11,
                       ['pants_1'] = 106,   ['pants_2'] = 0,
                       ['shoes_1'] = 90,   ['shoes_2'] = 0,
                       ['mask_1'] = 133,  ['mask_2'] = 0,
                       ['bproof_1'] = 24,  ['bproof_2'] = 0,
                       ['chain_1'] = 8,    ['chain_2'] = 0,
                       ['helmet_1'] = 13,  ['helmet_2'] = 1,
                       --['ears_1'] = -1,     ['ears_2'] = 0,
                       ['bags_1'] = 64,     ['bags_2'] = 0,
                   },
                   female = {
                       ['tshirt_1'] = 31,  ['tshirt_2'] = 1,
                       ['torso_1'] = 437,   ['torso_2'] = 0,
                       ['decals_1'] = 11,   ['decals_2'] = 0,
                       ['arms'] = 2,
                       ['pants_1'] = 70,   ['pants_2'] = 0,
                       ['shoes_1'] = 25,   ['shoes_2'] = 0,
                       --['helmet_1'] = -1,  ['helmet_2'] = 0,
                       ['chain_1'] = 8,    ['chain_2'] = 0,
                       ['bproof_1'] = 24,  ['bproof_2'] = 0,
                       --['ears_1'] = -1,     ['ears_2'] = 0,
                       ['bags_1'] = 52,     ['bags_2'] = 0,
                   }
           },
               onEquip = function()
               end
           },

           [6] = {
               label = "Tenue : ~b~Caporal & Sergent",
               minimum_grade = 5,
               variations = {
                   male = {
                       ['tshirt_1'] = 82,  ['tshirt_2'] = 0,
                       ['torso_1'] = 303,   ['torso_2'] = 3,
                       ['decals_1'] = 2,   ['decals_2'] = 0,
                       ['arms'] = 11,
                       ['pants_1'] = 106,   ['pants_2'] = 0,
                       ['shoes_1'] = 90,   ['shoes_2'] = 0,
                       ['mask_1'] = 133,  ['mask_2'] = 0,
                       ['bproof_1'] = 24,  ['bproof_2'] = 0,
                       ['chain_1'] = 8,    ['chain_2'] = 0,
                       ['helmet_1'] = 13,  ['helmet_2'] = 1,
                       --['ears_1'] = -1,     ['ears_2'] = 0,
                       ['bags_1'] = 64,     ['bags_2'] = 0,
                   },
                   female = {
                       ['tshirt_1'] = 31,  ['tshirt_2'] = 1,
                       ['torso_1'] = 437,   ['torso_2'] = 0,
                       ['decals_1'] = 11,   ['decals_2'] = 1,
                       ['arms'] = 2,
                       ['pants_1'] = 70,   ['pants_2'] = 0,
                       ['shoes_1'] = 25,   ['shoes_2'] = 0,
                       --['helmet_1'] = -1,  ['helmet_2'] = 0,
                       ['chain_1'] = 8,    ['chain_2'] = 0,
                       ['bproof_1'] = 24,  ['bproof_2'] = 0,
                       --['ears_1'] = -1,     ['ears_2'] = 0,
                       ['bags_1'] = 52,     ['bags_2'] = 0,
                   }
           },
               onEquip = function()
               end
           },

           [7] = {
               label = "Tenue : ~b~Lieutenant",
               minimum_grade = 9,
               variations = {
                   male = {
                       ['tshirt_1'] = 82,  ['tshirt_2'] = 0,
                       ['torso_1'] = 303,   ['torso_2'] = 3,
                       ['decals_1'] = 44,   ['decals_2'] = 6,
                       ['arms'] = 11,
                       ['pants_1'] = 106,   ['pants_2'] = 0,
                       ['shoes_1'] = 90,   ['shoes_2'] = 0,
                       ['mask_1'] = 133,  ['mask_2'] = 0,
                       ['bproof_1'] = 24,  ['bproof_2'] = 0,
                       ['chain_1'] = 8,    ['chain_2'] = 0,
                       ['helmet_1'] = 13,  ['helmet_2'] = 1,
                       --['ears_1'] = -1,     ['ears_2'] = 0,
                       ['bags_1'] = 64,     ['bags_2'] = 0,
                   },
                   female = {
                       ['tshirt_1'] = 31,  ['tshirt_2'] = 1,
                       ['torso_1'] = 437,   ['torso_2'] = 0,
                       ['decals_1'] = 11,   ['decals_2'] = 2,
                       ['arms'] = 2,
                       ['pants_1'] = 70,   ['pants_2'] = 0,
                       ['shoes_1'] = 25,   ['shoes_2'] = 0,
                       --['helmet_1'] = -1,  ['helmet_2'] = 0,
                       ['chain_1'] = 8,    ['chain_2'] = 0,
                       ['bproof_1'] = 24,  ['bproof_2'] = 0,
                       --['ears_1'] = -1,     ['ears_2'] = 0,
                       ['bags_1'] = 52,     ['bags_2'] = 1,
                   }
           },
               onEquip = function()
               end
           },

           [8] = {
               label = "Tenue : ~b~Under Sheriff",
               minimum_grade = 13,
               variations = {
                   male = {
                       ['tshirt_1'] = 82,  ['tshirt_2'] = 0,
                       ['torso_1'] = 303,   ['torso_2'] = 3,
                       ['decals_1'] = 43,   ['decals_2'] = 0,
                       ['arms'] = 11,
                       ['pants_1'] = 106,   ['pants_2'] = 0,
                       ['shoes_1'] = 90,   ['shoes_2'] = 0,
                       ['mask_1'] = 133,  ['mask_2'] = 0,
                       ['bproof_1'] = 24,  ['bproof_2'] = 0,
                       ['chain_1'] = 8,    ['chain_2'] = 0,
                       ['helmet_1'] = 13,  ['helmet_2'] = 1,
                       --['ears_1'] = -1,     ['ears_2'] = 0,
                       ['bags_1'] = 64,     ['bags_2'] = 0,
                   },
                   female = {
                       ['tshirt_1'] = 31,  ['tshirt_2'] = 1,
                       ['torso_1'] = 437,   ['torso_2'] = 0,
                       ['decals_1'] = 11,   ['decals_2'] = 3,
                       ['arms'] = 2,
                       ['pants_1'] = 70,   ['pants_2'] = 0,
                       ['shoes_1'] = 25,   ['shoes_2'] = 0,
                       --['helmet_1'] = -1,  ['helmet_2'] = 0,
                       ['chain_1'] = 8,    ['chain_2'] = 0,
                       ['bproof_1'] = 24,  ['bproof_2'] = 0,
                       --['ears_1'] = -1,     ['ears_2'] = 0,
                       ['bags_1'] = 52,     ['bags_2'] = 1,
                   }
           },
               onEquip = function()
               end
           },

           [9] = {
               label = "Tenue : ~b~Sheriff",
               minimum_grade = 13,
               variations = {
                   male = {
                       ['tshirt_1'] = 82,  ['tshirt_2'] = 0,
                       ['torso_1'] = 303,   ['torso_2'] = 3,
                       ['decals_1'] = 42,   ['decals_2'] = 0,
                       ['arms'] = 11,
                       ['pants_1'] = 106,   ['pants_2'] = 0,
                       ['shoes_1'] = 90,   ['shoes_2'] = 0,
                       ['mask_1'] = 133,  ['mask_2'] = 0,
                       ['bproof_1'] = 24,  ['bproof_2'] = 0,
                       ['chain_1'] = 8,    ['chain_2'] = 0,
                       ['helmet_1'] = 13,  ['helmet_2'] = 1,
                       --['ears_1'] = -1,     ['ears_2'] = 0,
                       ['bags_1'] = 64,     ['bags_2'] = 0,
                   },
                   female = {
                       ['tshirt_1'] = 31,  ['tshirt_2'] = 1,
                       ['torso_1'] = 311,   ['torso_2'] = 0,
                       ['decals_1'] = 53,   ['decals_2'] = 0,
                       ['arms'] = 2,
                       ['pants_1'] = 70,   ['pants_2'] = 0,
                       ['shoes_1'] = 25,   ['shoes_2'] = 0,
                       --['helmet_1'] = -1,  ['helmet_2'] = 0,
                       ['chain_1'] = 8,    ['chain_2'] = 0,
                       ['bproof_1'] = 24,  ['bproof_2'] = 0,
                       --['ears_1'] = -1,     ['ears_2'] = 0,
                       ['bags_1'] = 52,     ['bags_2'] = 2,
                   }
           },
               onEquip = function()
               end
           },

       }
   }
},

armurie = {
   {
       grade = "Deputy",
       minimum_grade = 0,
       weapons = {
           "weapon_flashlight",
           "weapon_stungun",
           "WEAPON_NIGHTSTICK"
       }
   },
   {
       grade = "Deputy I",
       minimum_grade = 1,
       weapons = {
           "WEAPON_COMBATPISTOL",
           "WEAPON_CARBINERIFLE",
           "WEAPON_PUMPSHOTGUN",
           "WEAPON_NIGHTSTICK",
           "WEAPON_STUNGUN",
           "WEAPON_FLASHLIGHT",
       }
   },
   {
       grade = "Deputy II",
       minimum_grade = 2,
       weapons = {
           "WEAPON_COMBATPISTOL",
           "WEAPON_CARBINERIFLE",
           "WEAPON_PUMPSHOTGUN",
           "WEAPON_NIGHTSTICK",
           "WEAPON_STUNGUN",
           "WEAPON_FLASHLIGHT",
       }
   },
   
   {
       grade = "Senior Deputy",
       minimum_grade = 4,
       weapons = {
           "WEAPON_COMBATPISTOL",
           "WEAPON_CARBINERIFLE",
           "WEAPON_PUMPSHOTGUN",
           "WEAPON_NIGHTSTICK",
           "WEAPON_STUNGUN",
           "WEAPON_FLASHLIGHT",
       }
   },
   {
       grade = "Caporal",
       minimum_grade = 5,
       weapons = {
           "WEAPON_COMBATPISTOL",
           "WEAPON_CARBINERIFLE",
           "WEAPON_PUMPSHOTGUN",
           "WEAPON_NIGHTSTICK",
           "WEAPON_STUNGUN",
           "WEAPON_FLASHLIGHT",
           --"WEAPON_SNIPERRIFLE"
       }
   },
   {
       grade = "Senior Caporal",
       minimum_grade = 6,
       weapons = {
           "WEAPON_COMBATPISTOL",
           "WEAPON_CARBINERIFLE",
           "WEAPON_PUMPSHOTGUN",
           "WEAPON_NIGHTSTICK",
           "WEAPON_STUNGUN",
           "WEAPON_FLASHLIGHT",
           --"WEAPON_SNIPERRIFLE"
       }
   },
   {
       grade = "Sergent",
       minimum_grade = 7,
       weapons = {
           "WEAPON_COMBATPISTOL",
           "WEAPON_CARBINERIFLE",
           "WEAPON_PUMPSHOTGUN",
           "WEAPON_NIGHTSTICK",
           "WEAPON_STUNGUN",
           "WEAPON_FLASHLIGHT"
       }
   },
   {
       grade = "Senior Sergent",
       minimum_grade = 8,
       weapons = {
           "WEAPON_COMBATPISTOL",
           "WEAPON_CARBINERIFLE",
           "WEAPON_PUMPSHOTGUN",
           "WEAPON_NIGHTSTICK",
           "WEAPON_STUNGUN",
           "WEAPON_FLASHLIGHT"
       }
   },
   {
       grade = "Lieutenant",
       minimum_grade = 9,
       weapons = {
           "WEAPON_COMBATPISTOL",
           "WEAPON_CARBINERIFLE",
           "WEAPON_PUMPSHOTGUN",
           "WEAPON_NIGHTSTICK",
           "WEAPON_STUNGUN",
           "WEAPON_FLASHLIGHT",
           "WEAPON_SNIPERRIFLE"
       }
   },
   {
       grade = "Capitaine",
       minimum_grade = 10,
       weapons = {
           "WEAPON_COMBATPISTOL",
           "WEAPON_CARBINERIFLE",
           "WEAPON_PUMPSHOTGUN",
           "WEAPON_NIGHTSTICK",
           "WEAPON_STUNGUN",
           "WEAPON_FLASHLIGHT",
           "WEAPON_SNIPERRIFLE"
       }
   },
   {
       grade = "Major",
       minimum_grade = 11,
       weapons = {
           "WEAPON_COMBATPISTOL",
           "WEAPON_CARBINERIFLE",
           "WEAPON_PUMPSHOTGUN",
           "WEAPON_NIGHTSTICK",
           "WEAPON_STUNGUN",
           "WEAPON_FLASHLIGHT",
           "WEAPON_SNIPERRIFLE"
       }
   },
   {
       grade = "Commandant",
       minimum_grade = 12,
       weapons = {
           "WEAPON_COMBATPISTOL",
           "WEAPON_CARBINERIFLE",
           "WEAPON_PUMPSHOTGUN",
           "WEAPON_NIGHTSTICK",
           "WEAPON_STUNGUN",
           "WEAPON_FLASHLIGHT",
           "WEAPON_SNIPERRIFLE"
       }
   },
   {
       grade = "Undersheriff",
       minimum_grade = 13,
       weapons = {
           "WEAPON_COMBATPISTOL",
           "WEAPON_CARBINERIFLE",
           "WEAPON_PUMPSHOTGUN",
           "WEAPON_NIGHTSTICK",
           "WEAPON_STUNGUN",
           "WEAPON_FLASHLIGHT",
           "WEAPON_SNIPERRIFLE"
       }
   },
   {
       grade = "Sheriff",
       minimum_grade = 14,
       weapons = {
           "WEAPON_COMBATPISTOL",
           "WEAPON_CARBINERIFLE",
           "WEAPON_PUMPSHOTGUN",
           "WEAPON_NIGHTSTICK",
           "WEAPON_STUNGUN",
           "WEAPON_FLASHLIGHT",
           "WEAPON_SNIPERRIFLE"
       }
   }
},

Position = {
       Vestaire = {vector3(-439.86, 6010.64, 37.0)}, -- Menu Vestaire 
       GarageVehicule = {vector3(-460.55, 6031.05, 31.34)}, -- Menu Garage Vehicule
       RentreVehicule = {vector3(-468.62, 6038.67, 31.34)}, -- Menu Garage Vehicule
        GarageHeli = {vector3(-459.32, 5998.07, 31.49)}, -- Menu Garage Helico
   },

   props = {
       {label = "Barrière", prop = "prop_barrier_work05"},
       {label = "Cone", prop = "prop_roadcone02a"},
       {label = "Herse", prop = "p_ld_stinger_s"}
   }
}