cfg_policeWebhookRendezVousPolice = "https://discord.com/api/webhooks/1106562552089034823/6astPE4tqFjXRT1Z3QhHQLOJTZ2M8GH-Z9rhfIkqUqEMwzMR5n5Ums1DKn-6vsBX2Aja" -- Metez le webhook de votre salon disocrd cfg_policeure pour le job ems 


cfg_police = {

     MarkerType = 6, -- Pour voir les différents type de marker: https://docs.fivem.net/docs/game-references/markers/
     MarkerSizeLargeur = 0.8, -- Largeur du marker
     MarkerSizeEpaisseur = 0.8, -- Épaisseur du marker
     MarkerSizeHauteur = 0.8, -- Hauteur du marker
     MarkerDistance = 10.0, -- Distane de visibiliter du marker (1.0 = 1 mètre)
     MarkerColorR = 0, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
     MarkerColorG = 180, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
     MarkerColorB = 255, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
     MarkerOpacite = 255, -- Opacité du marker (min: 0, max: 255)
     MarkerSaute = false, -- Si le marker saute (true = oui, false = non)
     MarkerTourne = false, -- Si le marker tourne (true = oui, false = non)

 VehiculesPolice = { 
    {buttoname = "Stanier Police", rightlabel = "→→", spawnname = "Police", spawnzone = vector3(443.9020690918, -992.88220214844, 25.141269683838), headingspawn = 88.67304992675781},
    {buttoname = "Cruiser Police", rightlabel = "→→", spawnname = "police2", spawnzone = vector3(443.9020690918, -992.88220214844, 25.141269683838), headingspawn = 88.67304992675781},
    {buttoname = "Scout Police", rightlabel = "→→", spawnname = "pscout", spawnzone = vector3(443.9020690918, -992.88220214844, 25.141269683838), headingspawn = 88.67304992675781},
    {buttoname = "Scout Bana", rightlabel = "→→", spawnname = "swatstalker_hi", spawnzone = vector3(443.9020690918, -992.88220214844, 25.141269683838), headingspawn = 88.67304992675781},
    {buttoname = "Speedo Police", rightlabel = "→→", spawnname = "polspeedo_hi", spawnzone = vector3(443.9020690918, -992.88220214844, 25.141269683838), headingspawn = 88.67304992675781},
    {buttoname = "K9 Police", rightlabel = "→→", spawnname = "polsadlerk9", spawnzone = vector3(443.9020690918, -992.88220214844, 25.141269683838), headingspawn = 88.67304992675781},
    {buttoname = "4x4 Police", rightlabel = "→→", spawnname = "poleveron", spawnzone = vector3(443.9020690918, -992.88220214844, 25.141269683838), headingspawn = 88.67304992675781},
    {buttoname = "Buffalo Banalisé", rightlabel = "→→", spawnname = "police42old", spawnzone = vector3(443.9020690918, -992.88220214844, 25.141269683838), headingspawn = 88.67304992675781},
    {buttoname = "Stanier Bana", rightlabel = "→→", spawnname = "poleveron", spawnzone = vector3(443.9020690918, -992.88220214844, 25.141269683838), headingspawn = 88.67304992675781},
    {buttoname = "Moto Police", rightlabel = "→→", spawnname = "lspdb", spawnzone = vector3(443.9020690918, -992.88220214844, 25.141269683838), headingspawn = 88.67304992675781},
    {buttoname = "GND King", rightlabel = "→→", spawnname = "policeslick", spawnzone = vector3(443.9020690918, -992.88220214844, 25.141269683838), headingspawn = 88.67304992675781},


    {buttoname = "Intervention | SWAT", rightlabel = "→→", spawnname = "bearcatbb", spawnzone = vector3(443.9020690918, -992.88220214844, 25.141269683838), headingspawn = 88.67304992675781}, -- Garage Voiture
    {buttoname = "Anti-émeute | SWAT", rightlabel = "→→", spawnname = "mrapbb", spawnzone = vector3(443.9020690918, -992.88220214844, 25.141269683838), headingspawn = 88.67304992675781}, -- Garage Voiture
    {buttoname = "SUV Blindé | SWAT", rightlabel = "→→", spawnname = "14suvbb", spawnzone = vector3(443.9020690918, -992.88220214844, 25.141269683838), headingspawn = 88.67304992675781}, -- Garage Voiture
    {buttoname = "Blindé | SWAT", rightlabel = "→→", spawnname = "gurkhabb", spawnzone = vector3(443.9020690918, -992.88220214844, 25.141269683838), headingspawn = 88.67304992675781}, -- Garage Voiture
    {buttoname = "Rook | SWAT", rightlabel = "→→", spawnname = "rookbb", spawnzone = vector3(443.9020690918, -992.88220214844, 25.141269683838), headingspawn = 88.67304992675781}, -- Garage Voiture

},

HelicoPolice = { 
 	{buttonameheli = "Hélicoptère", rightlabel = "→→", spawnnameheli = "polmav", spawnzoneheli = vector3(449.1641, -981.3759, 43.6913), headingspawnheli = 93.3062}, -- Garage Hélico
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
        {label = 'Entrave opération de police', price = 1500},
        {label = 'Insulte envers / entre civils', price = 1500},
        {label = 'Outrage à agent de police', price = 1500},
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

PoliceCloak = {
    clothes = {
        specials = {
            [0] = {
                label = "Récupérer vos vêtements",
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
                label = "Tenue : ~b~Recrue",
                minimum_grade = 0,
                variations = {
                    male = {
                        ['bags_1'] = 61, ['bags_2'] = 0,
                        ['tshirt_1'] = 80,  ['tshirt_2'] = 0,
                        ['torso_1'] = 306,   ['torso_2'] = 0,
                        ['decals_1'] = 74,   ['decals_2'] = 0,
                        ['arms'] = 1,
                        ['pants_1'] = 116,   ['pants_2'] = 0,
                        ['shoes_1'] = 90,   ['shoes_2'] = 0,
                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                        ['chain_1'] = 0,    ['chain_2'] = 0,
                        ['ears_1'] = 2,     ['ears_2'] = 0,
                        ['bproof_1'] = 29,  ['bproof_2'] = 0,
                    },
                    female = {
                        ['bags_1'] = 61, ['bags_2'] = 0,
                            ['tshirt_1'] = 62,['tshirt_2'] = 0,
                            ['torso_1'] = 205, ['torso_2'] = 0,
                            ['arms'] = 3, ['arms_2'] = 0,
                            ['pants_1'] = 96, ['pants_2'] = 0,
                            ['shoes_1'] = 40, ['shoes_2'] = 0,
                            ['mask_1'] = 0, ['mask_2'] = 0,
                            ['bproof_1'] = 20,  ['bproof_2'] = 0,
                            ['chain_1'] = 0,
                            ['helmet_1'] = -1, ['helmet_2'] = 0,
                     }
            },
                onEquip = function()
                end
            },

            [2] = {
                label = "Tenue : ~b~Officier",
                minimum_grade = 1,
                variations = {
                    male = {
                        ['bags_1'] = 61, ['bags_2'] = 0,
                        ['tshirt_1'] = 80,  ['tshirt_2'] = 0,
                        ['torso_1'] = 306,   ['torso_2'] = 0,
                        ['decals_1'] = 74,   ['decals_2'] = 0,
                        ['arms'] = 1,
                        ['pants_1'] = 116,   ['pants_2'] = 0,
                        ['shoes_1'] = 90,   ['shoes_2'] = 0,
                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                        ['chain_1'] = 8,    ['chain_2'] = 0,
                        ['ears_1'] = 2,     ['ears_2'] = 0,
                        ['bproof_1'] = 7,  ['bproof_2'] = 0,
                    },
                    female = {
                        ['bags_1'] = 61, ['bags_2'] = 0,
                            ['tshirt_1'] = 62,['tshirt_2'] = 0,
                            ['torso_1'] = 205, ['torso_2'] = 0,
                            ['arms'] = 3, ['arms_2'] = 0,
                            ['pants_1'] = 96, ['pants_2'] = 0,
                            ['shoes_1'] = 40, ['shoes_2'] = 0,
                            ['mask_1'] = 0, ['mask_2'] = 0,
                            ['bproof_1'] = 7,  ['bproof_2'] = 0,
                            ['chain_1'] = 0,
                            ['helmet_1'] = -1, ['helmet_2'] = 0,
                     }
            },
                onEquip = function()
                end
            },

            [3] = {
                label = "Tenue : ~b~DOA",
                minimum_grade = 4,
                variations = {
                    male = {
                        ['bags_1'] = 0, ['bags_2'] = 0,
                        ['tshirt_1'] = 82,  ['tshirt_2'] = 0,
                        ['torso_1'] = 206,   ['torso_2'] = 0,
                        ['decals_1'] = 0,   ['decals_2'] = 0,
                        ['arms'] = 19,
                        ['pants_1'] = 133,   ['pants_2'] = 0,
                        ['shoes_1'] = 90,   ['shoes_2'] = 0,
                        ['helmet_1'] = 195,  ['helmet_2'] = 0,
                        ['chain_1'] = 1,    ['chain_2'] = 0,
                        ['ears_1'] = 2,     ['ears_2'] = 0,
                        ['bproof_1'] = 7,  ['bproof_2'] = 4,
                     },
                     female = {
                        ['bags_1'] = 61, ['bags_2'] = 0,
                            ['tshirt_1'] = 62,['tshirt_2'] = 0,
                            ['torso_1'] = 205, ['torso_2'] = 0,
                            ['arms'] = 3, ['arms_2'] = 0,
                            ['pants_1'] = 96, ['pants_2'] = 0,
                            ['shoes_1'] = 40, ['shoes_2'] = 0,
                            ['mask_1'] = 0, ['mask_2'] = 0,
                            ['bproof_1'] = 7,  ['bproof_2'] = 0,
                            ['chain_1'] = 0,
                            ['helmet_1'] = -1, ['helmet_2'] = 0,
                     }
            },
                onEquip = function()
                end
            },

            [4] = {
                label = "Tenue : ~b~Sergent",
                minimum_grade = 5,
                variations = {
                    male = {
                        ['bags_1'] = 61, ['bags_2'] = 0,
                        ['tshirt_1'] = 80,  ['tshirt_2'] = 0,
                        ['torso_1'] = 306,   ['torso_2'] = 0,
                        ['decals_1'] = 74,   ['decals_2'] = 0,
                        ['arms'] = 1,
                        ['pants_1'] = 116,   ['pants_2'] = 0,
                        ['shoes_1'] = 90,   ['shoes_2'] = 0,
                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                        ['chain_1'] = 8,    ['chain_2'] = 0,
                        ['ears_1'] = 2,     ['ears_2'] = 0,
                        ['bproof_1'] = 7,  ['bproof_2'] = 0,
                    },
                    female = {
                        ['bags_1'] = 61, ['bags_2'] = 0,
                            ['tshirt_1'] = 62,['tshirt_2'] = 0,
                            ['torso_1'] = 205, ['torso_2'] = 0,
                            ['decals_1'] = 74,   ['decals_2'] = 0,
                            ['arms'] = 3, ['arms_2'] = 0,
                            ['pants_1'] = 96, ['pants_2'] = 0,
                            ['shoes_1'] = 40, ['shoes_2'] = 0,
                            ['mask_1'] = 0, ['mask_2'] = 0,
                            ['bproof_1'] = 7,  ['bproof_2'] = 0,
                            ['chain_1'] = 0,
                            ['helmet_1'] = -1, ['helmet_2'] = 0,
                     }
            },
                onEquip = function()
                end
            },

            [5] = {
                label = "Tenue : ~b~Lieutenant",
                minimum_grade = 7,
                variations = {
                    male = {
                        ['bags_1'] = 61, ['bags_2'] = 0,
                        ['tshirt_1'] = 80,  ['tshirt_2'] = 0,
                        ['torso_1'] = 306,   ['torso_2'] = 0,
                        ['decals_1'] = 74,   ['decals_2'] = 0,
                        ['arms'] = 1,
                        ['pants_1'] = 116,   ['pants_2'] = 0,
                        ['shoes_1'] = 90,   ['shoes_2'] = 0,
                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                        ['chain_1'] = 8,    ['chain_2'] = 0,
                        ['ears_1'] = 2,     ['ears_2'] = 0,
                        ['bproof_1'] = 7,  ['bproof_2'] = 0,
                    },
                    female = {
                        ['bags_1'] = 61, ['bags_2'] = 0,
                            ['tshirt_1'] = 62,['tshirt_2'] = 0,
                            ['torso_1'] = 205, ['torso_2'] = 0,
                            ['arms'] = 3, ['arms_2'] = 0,
                            ['pants_1'] = 96, ['pants_2'] = 0,
                            ['shoes_1'] = 40, ['shoes_2'] = 0,
                            ['mask_1'] = 0, ['mask_2'] = 0,
                            ['bproof_1'] = 7,  ['bproof_2'] = 0,
                            ['chain_1'] = 0,
                            ['helmet_1'] = -1, ['helmet_2'] = 0,
                     }
            },
                onEquip = function()
                end
            },

            [6] = {
                label = "Tenue : ~b~Capitaine",
                minimum_grade = 8,
                variations = {
                male = {
                    ['bags_1'] = 61, ['bags_2'] = 0,
                    ['tshirt_1'] = 80,  ['tshirt_2'] = 0,
                    ['torso_1'] = 306,   ['torso_2'] = 0,
                    ['decals_1'] = 74,   ['decals_2'] = 0,
                    ['arms'] = 1,
                    ['pants_1'] = 116,   ['pants_2'] = 0,
                    ['shoes_1'] = 90,   ['shoes_2'] = 0,
                    ['helmet_1'] = -1,  ['helmet_2'] = 0,
                    ['chain_1'] = 8,    ['chain_2'] = 0,
                    ['ears_1'] = 2,     ['ears_2'] = 0,
                    ['bproof_1'] = 7,  ['bproof_2'] = 0,
                    },
                    female = {
                        ['bags_1'] = 61, ['bags_2'] = 0,
                            ['tshirt_1'] = 62,['tshirt_2'] = 0,
                            ['torso_1'] = 205, ['torso_2'] = 0,
                            ['arms'] = 3, ['arms_2'] = 0,
                            ['pants_1'] = 96, ['pants_2'] = 0,
                            ['shoes_1'] = 40, ['shoes_2'] = 0,
                            ['mask_1'] = 0, ['mask_2'] = 0,
                            ['bproof_1'] = 7,  ['bproof_2'] = 0,
                            ['chain_1'] = 0,
                            ['helmet_1'] = -1, ['helmet_2'] = 0,
                     }
            },
                onEquip = function()
                end
            },

            [7] = {
                label = "Tenue : ~b~Commandant",
                minimum_grade = 9,
                variations = {
                    male = {
                        ['bags_1'] = 61, ['bags_2'] = 0,
                        ['tshirt_1'] = 80,  ['tshirt_2'] = 0,
                        ['torso_1'] = 306,   ['torso_2'] = 0,
                        ['decals_1'] = 74,   ['decals_2'] = 0,
                        ['arms'] = 1,
                        ['pants_1'] = 116,   ['pants_2'] = 0,
                        ['shoes_1'] = 90,   ['shoes_2'] = 0,
                        ['helmet_1'] = -1,  ['helmet_2'] = 0,
                        ['chain_1'] = 8,    ['chain_2'] = 0,
                        ['ears_1'] = 2,     ['ears_2'] = 0,
                        ['bproof_1'] = 7,  ['bproof_2'] = 0,
                    },
                    female = {
                        ['bags_1'] = 61, ['bags_2'] = 0,
                            ['tshirt_1'] = 62,['tshirt_2'] = 0,
                            ['torso_1'] = 205, ['torso_2'] = 0,
                            ['arms'] = 3, ['arms_2'] = 0,
                            ['pants_1'] = 96, ['pants_2'] = 0,
                            ['shoes_1'] = 40, ['shoes_2'] = 0,
                            ['mask_1'] = 0, ['mask_2'] = 0,
                            ['bproof_1'] = 7,  ['bproof_2'] = 0,
                            ['chain_1'] = 0,
                            ['helmet_1'] = -1, ['helmet_2'] = 0,
                     }
            },
                onEquip = function()
                end
            },

            [8] = {
                label = "Tenue : ~b~Intervention",
                minimum_grade = 6,
                variations = {
                    male = {
                        ['bags_1'] = 0, ['bags_2'] = 0,
                        ['tshirt_1'] = 66,  ['tshirt_2'] = 0,
                        ['torso_1'] = 333,   ['torso_2'] = 0,
                        ['arms'] = 19,
                        ['pants_1'] = 112,   ['pants_2'] = 0,
                        ['shoes_1'] = 90,   ['shoes_2'] = 0,
                        ['helmet_1'] = 186,  ['helmet_2'] = 0,
                        ['mask_1'] = 201, ['mask_2'] = 0,
                        ['chain_1'] = 0,    ['chain_2'] = 0,
                        ['ears_1'] = 2,     ['ears_2'] = 0,
                        ['bproof_1'] = 7,  ['bproof_2'] = 3,
                    },
                    female = {
                        ['bags_1'] = 61, ['bags_2'] = 0,
                            ['tshirt_1'] = 62,['tshirt_2'] = 0,
                            ['torso_1'] = 205, ['torso_2'] = 0,
                            ['arms'] = 3, ['arms_2'] = 0,
                            ['pants_1'] = 96, ['pants_2'] = 0,
                            ['shoes_1'] = 40, ['shoes_2'] = 0,
                            ['mask_1'] = 0, ['mask_2'] = 0,
                            ['bproof_1'] = 7,  ['bproof_2'] = 0,
                            ['chain_1'] = 0,
                            ['helmet_1'] = -1, ['helmet_2'] = 0,
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
        grade = "~b~Recrue",
        minimum_grade = 0,
        weapons = {
            "weapon_flashlight",
            "weapon_stungun",
            "WEAPON_NIGHTSTICK"
        }
    },
    {
        grade = "~b~Officier I",
        minimum_grade = 1,
        weapons = {
            "WEAPON_COMBATPISTOL",
            "WEAPON_NIGHTSTICK",
            "WEAPON_STUNGUN",
            "WEAPON_FLASHLIGHT",
        }
    },
    {
        grade = "~b~Officier II",
        minimum_grade = 2,
        weapons = {
            "WEAPON_COMBATPISTOL",
            "WEAPON_NIGHTSTICK",
            "WEAPON_STUNGUN",
            "WEAPON_FLASHLIGHT",
        }
    },
    {
        grade = "~b~Officier III",
        minimum_grade = 3,
        weapons = {
            "WEAPON_COMBATPISTOL",
            "WEAPON_PUMPSHOTGUN",
            "WEAPON_NIGHTSTICK",
            "WEAPON_STUNGUN",
            "WEAPON_FLASHLIGHT",
        }
    },
    {
        grade = "~b~Sergent I",
        minimum_grade = 5,
        weapons = {
            "WEAPON_COMBATPISTOL",
            "WEAPON_PUMPSHOTGUN",
            "WEAPON_NIGHTSTICK",
            "WEAPON_STUNGUN",
            "WEAPON_FLASHLIGHT",
            --"WEAPON_SNIPERRIFLE"
        }
    },
    {
        grade = "~b~Sergent II",
        minimum_grade = 6,
        weapons = {
            "WEAPON_COMBATPISTOL",
            "WEAPON_PUMPSHOTGUN",
            "WEAPON_NIGHTSTICK",
            "WEAPON_STUNGUN",
            "WEAPON_FLASHLIGHT",
            --"WEAPON_SNIPERRIFLE"
        }
    },
    {
        grade = "~b~DOA",
        minimum_grade = 7,
        weapons = {
            "WEAPON_COMBATPISTOL",
            "WEAPON_PUMPSHOTGUN",
            "WEAPON_CARBINERIFLE",
            "WEAPON_NIGHTSTICK",
            "WEAPON_STUNGUN",
            "WEAPON_FLASHLIGHT",
        }
    },
    {
        grade = "~b~Lieutenant",
        minimum_grade = 7,
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
        grade = "~b~Capitaine",
        minimum_grade = 8,
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
        grade = "~b~Commandant",
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
    }
},

Position = {
        Vestaire = {vector3(444.21737670898, -997.09533691406, 35.062412261963)}, -- Menu Vestaire 
        Accueil = {vector3(438.78567504883, -986.67907714844, 30.724321365356)}, -- Menu Pour Accueil 
        GarageVehicule = {vector3(461.90130615234, -992.76586914063, 25.467370986938)}, -- Menu Garage Vehicule
        RentreVehicule = {vector3(443.9020690918, -992.88220214844, 25.141269683838)}, -- Menu Garage Vehicule
 	    GarageHeli = {vector3(449.17761, -981.4251, 43.6913)}, -- Menu Garage Helico
    },

    props = {
        {label = "Police Barrière", prop = "prop_barrier_work05"},
    }
}