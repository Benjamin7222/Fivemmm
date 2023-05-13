cfg_armeeWebhookRendezVousArmee = "" -- Metez le webhook de votre salon disocrd cfg_armee pour le job ems 


cfg_armee = {

     MarkerType = 6, -- Pour voir les différents type de marker: https://docs.fivem.net/docs/game-references/markers/
     MarkerSizeLargeur = 0.8, -- Largeur du marker
     MarkerSizeEpaisseur = 0.8, -- Épaisseur du marker
     MarkerSizeHauteur = 0.8, -- Hauteur du marker
     MarkerDistance = 10.0, -- Distane de visibiliter du marker (1.0 = 1 mètre)
     MarkerColorR = 62, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
     MarkerColorG = 173, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
     MarkerColorB = 17, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
     MarkerOpacite = 255, -- Opacité du marker (min: 0, max: 255)
     MarkerSaute = false, -- Si le marker saute (true = oui, false = non)
     MarkerTourne = false, -- Si le marker tourne (true = oui, false = non)

 VehiculesArmee = { 
    {buttoname = "Crusader", rightlabel = "→→", spawnname = "crusader", spawnzone = vector3(-2329.3117675781, 3253.0466308594, 32.827671051025), headingspawn = 57.27123260498047},
    {buttoname = "Barracks", rightlabel = "→→", spawnname = "barracks", spawnzone = vector3(-2329.3117675781, 3253.0466308594, 32.827671051025), headingspawn = 57.27123260498047},
    {buttoname = "Barracks 2", rightlabel = "→→", spawnname = "barracks2", spawnzone = vector3(-2329.3117675781, 3253.0466308594, 32.827671051025), headingspawn = 57.27123260498047},
    {buttoname = "Barracks 3", rightlabel = "→→", spawnname = "barracks3", spawnzone = vector3(-2329.3117675781, 3253.0466308594, 32.827671051025), headingspawn = 57.27123260498047},
    {buttoname = "Typhoon", rightlabel = "→→", spawnname = "typhoon", spawnzone = vector3(-2329.3117675781, 3253.0466308594, 32.827671051025), headingspawn = 57.27123260498047},
},

HelicoArmee = { 
 	{buttonameheli = "Cargo Bob", rightlabel = "→→", spawnnameheli = "cargobob4", spawnzoneheli = vector3(-2134.79, 3262.38, 32.81), headingspawnheli = 150.02},
    {buttonameheli = "Valkyrie", rightlabel = "→→", spawnnameheli = "valkyrie2", spawnzoneheli = vector3(-2134.79, 3262.38, 32.81), headingspawnheli = 150.02},
    {buttonameheli = "Avion de chasse 1", rightlabel = "→→", spawnnameheli = "besra", spawnzoneheli = vector3(-2134.79, 3262.38, 32.81), headingspawnheli = 150.02},
    {buttonameheli = "Avion Armée 1", rightlabel = "→→", spawnnameheli = "miljet", spawnzoneheli = vector3(-2134.79, 3262.38, 32.81), headingspawnheli = 150.02},
},

ArmeeCloak = {
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
                label = "Tenue : ~g~Recrue",
                minimum_grade = 0,
                variations = {
                    male = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 333,   ['torso_2'] = 6,
                        ['decals_1'] = 0,   ['decals_2'] = 0,
                        ['arms'] = 41,
                        ['pants_1'] = 168,   ['pants_2'] = 0,
                        ['shoes_1'] = 125,   ['shoes_2'] = 0,
                        ['helmet_1'] = 135,  ['helmet_2'] = 1,
                        ['mask_1'] = 84, ['mask_2'] = 0,
                        ['chain_1'] = 1,    ['chain_2'] = 0,
                        ['bproof_1'] = 9,  ['bproof_2'] = 0,
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 333,   ['torso_2'] = 6,
                        ['decals_1'] = 0,   ['decals_2'] = 0,
                        ['arms'] = 41,
                        ['pants_1'] = 168,   ['pants_2'] = 0,
                        ['shoes_1'] = 125,   ['shoes_2'] = 0,
                        ['helmet_1'] = 135,  ['helmet_2'] = 1,
                        ['mask_1'] = 84, ['mask_2'] = 0,
                        ['chain_1'] = 1,    ['chain_2'] = 0,
                        ['bproof_1'] = 9,  ['bproof_2'] = 0,
                     }
            },
                onEquip = function()
                end
            },

            [2] = {
                label = "Tenue : ~g~Officier",
                minimum_grade = 1,
                variations = {
                    male = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 333,   ['torso_2'] = 6,
                        ['decals_1'] = 0,   ['decals_2'] = 0,
                        ['arms'] = 41,
                        ['pants_1'] = 168,   ['pants_2'] = 0,
                        ['shoes_1'] = 125,   ['shoes_2'] = 0,
                        ['helmet_1'] = 135,  ['helmet_2'] = 1,
                        ['mask_1'] = 84, ['mask_2'] = 0,
                        ['chain_1'] = 1,    ['chain_2'] = 0,
                        ['bproof_1'] = 9,  ['bproof_2'] = 0,
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 333,   ['torso_2'] = 6,
                        ['decals_1'] = 0,   ['decals_2'] = 0,
                        ['arms'] = 41,
                        ['pants_1'] = 168,   ['pants_2'] = 0,
                        ['shoes_1'] = 125,   ['shoes_2'] = 0,
                        ['helmet_1'] = 135,  ['helmet_2'] = 1,
                        ['mask_1'] = 84, ['mask_2'] = 0,
                        ['chain_1'] = 1,    ['chain_2'] = 0,
                        ['bproof_1'] = 9,  ['bproof_2'] = 0,
                     }
            },
                onEquip = function()
                end
            },

            [3] = {
                label = "Tenue : ~g~Sergent",
                minimum_grade = 2,
                variations = {
                    male = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 333,   ['torso_2'] = 6,
                        ['decals_1'] = 0,   ['decals_2'] = 0,
                        ['arms'] = 41,
                        ['pants_1'] = 168,   ['pants_2'] = 0,
                        ['shoes_1'] = 125,   ['shoes_2'] = 0,
                        ['helmet_1'] = 135,  ['helmet_2'] = 1,
                        ['mask_1'] = 84, ['mask_2'] = 0,
                        ['chain_1'] = 1,    ['chain_2'] = 0,
                        ['bproof_1'] = 9,  ['bproof_2'] = 0,
                     },
                     female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 333,   ['torso_2'] = 6,
                        ['decals_1'] = 0,   ['decals_2'] = 0,
                        ['arms'] = 41,
                        ['pants_1'] = 168,   ['pants_2'] = 0,
                        ['shoes_1'] = 125,   ['shoes_2'] = 0,
                        ['helmet_1'] = 135,  ['helmet_2'] = 1,
                        ['mask_1'] = 84, ['mask_2'] = 0,
                        ['chain_1'] = 1,    ['chain_2'] = 0,
                        ['bproof_1'] = 9,  ['bproof_2'] = 0,
                     }
            },
                onEquip = function()
                end
            },

            [4] = {
                label = "Tenue : ~g~Capitaine",
                minimum_grade = 3,
                variations = {
                    male = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 333,   ['torso_2'] = 6,
                        ['decals_1'] = 0,   ['decals_2'] = 0,
                        ['arms'] = 41,
                        ['pants_1'] = 168,   ['pants_2'] = 0,
                        ['shoes_1'] = 125,   ['shoes_2'] = 0,
                        ['helmet_1'] = 135,  ['helmet_2'] = 1,
                        ['mask_1'] = 84, ['mask_2'] = 0,
                        ['chain_1'] = 1,    ['chain_2'] = 0,
                        ['bproof_1'] = 9,  ['bproof_2'] = 0,
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 333,   ['torso_2'] = 6,
                        ['decals_1'] = 0,   ['decals_2'] = 0,
                        ['arms'] = 41,
                        ['pants_1'] = 168,   ['pants_2'] = 0,
                        ['shoes_1'] = 125,   ['shoes_2'] = 0,
                        ['helmet_1'] = 135,  ['helmet_2'] = 1,
                        ['mask_1'] = 84, ['mask_2'] = 0,
                        ['chain_1'] = 1,    ['chain_2'] = 0,
                        ['bproof_1'] = 9,  ['bproof_2'] = 0,
                     }
            },
                onEquip = function()
                end
            },

            [5] = {
                label = "Tenue : ~g~Colonel",
                minimum_grade = 4,
                variations = {
                    male = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 333,   ['torso_2'] = 6,
                        ['decals_1'] = 0,   ['decals_2'] = 0,
                        ['arms'] = 41,
                        ['pants_1'] = 168,   ['pants_2'] = 0,
                        ['shoes_1'] = 125,   ['shoes_2'] = 0,
                        ['helmet_1'] = 135,  ['helmet_2'] = 1,
                        ['mask_1'] = 84, ['mask_2'] = 0,
                        ['chain_1'] = 1,    ['chain_2'] = 0,
                        ['bproof_1'] = 9,  ['bproof_2'] = 0,
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 333,   ['torso_2'] = 6,
                        ['decals_1'] = 0,   ['decals_2'] = 0,
                        ['arms'] = 41,
                        ['pants_1'] = 168,   ['pants_2'] = 0,
                        ['shoes_1'] = 125,   ['shoes_2'] = 0,
                        ['helmet_1'] = 135,  ['helmet_2'] = 1,
                        ['mask_1'] = 84, ['mask_2'] = 0,
                        ['chain_1'] = 1,    ['chain_2'] = 0,
                        ['bproof_1'] = 9,  ['bproof_2'] = 0,
                     }
            },
                onEquip = function()
                end
            },

            [6] = {
                label = "Tenue : ~g~Pilote",
                minimum_grade = 0,
                variations = {
                    male = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 341,   ['torso_2'] = 17,
                        ['decals_1'] = 0,   ['decals_2'] = 0,
                        ['arms'] = 42,
                        ['pants_1'] = 173,   ['pants_2'] = 17,
                        ['shoes_1'] = 126,   ['shoes_2'] = 0,
                        ['helmet_1'] = 171,  ['helmet_2'] = 1,
                        ['mask_1'] = 84, ['mask_2'] = 0,
                        ['chain_1'] = 1,    ['chain_2'] = 0,
                    },
                    female = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 333,   ['torso_2'] = 6,
                        ['decals_1'] = 0,   ['decals_2'] = 0,
                        ['arms'] = 41,
                        ['pants_1'] = 168,   ['pants_2'] = 0,
                        ['shoes_1'] = 125,   ['shoes_2'] = 0,
                        ['helmet_1'] = 135,  ['helmet_2'] = 1,
                        ['mask_1'] = 84, ['mask_2'] = 0,
                        ['chain_1'] = 1,    ['chain_2'] = 0,
                        ['bproof_1'] = 9,  ['bproof_2'] = 0,
                     }
            },
                onEquip = function()
                end
            },

            [7] = {
                label = "Tenue : ~g~Cérémonie",
                minimum_grade = 0,
                variations = {
                    male = {
                        ['tshirt_1'] = 69,  ['tshirt_2'] = 0,
                        ['torso_1'] = 328,   ['torso_2'] = 0,
                        ['decals_1'] = 0,   ['decals_2'] = 0,
                        ['arms'] = 42,
                        ['pants_1'] = 130,   ['pants_2'] = 0,
                        ['shoes_1'] = 85,   ['shoes_2'] = 3,
                        ['chain_1'] = 13,    ['chain_2'] = 0,
                    },
                    female = {
                        ['tshirt_1'] = 69,  ['tshirt_2'] = 0,
                        ['torso_1'] = 341,   ['torso_2'] = 0,
                        ['decals_1'] = 0,   ['decals_2'] = 0,
                        ['arms'] = 42,
                        ['pants_1'] = 130,   ['pants_2'] = 0,
                        ['shoes_1'] = 85,   ['shoes_2'] = 3,
                        ['chain_1'] = 10,    ['chain_2'] = 0,
                     }
            },
                onEquip = function()
                end
            },

            [8] = {
                label = "Casque",
                minimum_grade = 0,
                variations = {
                    male = {
                        ['helmet_1'] = 174,  ['helmet_2'] = 0,
                    },
                    female = {
                        ['helmet_1'] = 174,  ['helmet_2'] = 0,
                     }
            },
                onEquip = function()
                end
            },

            [9] = {
                label = "Gilet Par Balles",
                minimum_grade = 0,
                variations = {
                    male = {
                        ['bproof_1'] = 18,  ['bproof_2'] = 2,
                    },
                    female = {
                        ['bproof_1'] = 18,  ['bproof_2'] = 2,
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
        grade = "~g~Recrue",
        minimum_grade = 0,
        weapons = {
            "weapon_flashlight",
            "weapon_stungun",
            "WEAPON_NIGHTSTICK"
        }
    },
    {
        grade = "~g~Officier",
        minimum_grade = 1,
        weapons = {
            "WEAPON_COMBATPISTOL",
            "WEAPON_NIGHTSTICK",
            "WEAPON_FLASHLIGHT"
        }
    },
    {
        grade = "~g~Sergent",
        minimum_grade = 2,
        weapons = {
            "WEAPON_COMBATPISTOL",
            "WEAPON_CARBINERIFLE",
            "WEAPON_PUMPSHOTGUN",
            "WEAPON_NIGHTSTICK",
            "WEAPON_FLASHLIGHT"
        }
    },
    {
        grade = "~g~Capitaine",
        minimum_grade = 3,
        weapons = {
            "WEAPON_COMBATPISTOL",
            "WEAPON_CARBINERIFLE",
            "WEAPON_PUMPSHOTGUN",
            "WEAPON_NIGHTSTICK",
            "WEAPON_FLASHLIGHT",
            "WEAPON_SNIPERRIFLE"
        }
    },
    {
        grade = "~g~Colonel",
        minimum_grade = 4,
        weapons = {
            "WEAPON_COMBATPISTOL",
            "WEAPON_CARBINERIFLE",
            "WEAPON_PUMPSHOTGUN",
            "WEAPON_NIGHTSTICK",
            "WEAPON_FLASHLIGHT",
            "WEAPON_SNIPERRIFLE"
        }
    }
},

Position = {
        Vestaire = {vector3(-2358.0859375, 3255.2641601563, 32.810718536377)}, -- Menu Vestaire 
        GarageVehicule = {vector3(-2320.798828125, 3257.75390625, 32.827629089355)}, -- Menu Garage Vehicule
        RentreVehicule = {vector3(-2329.3117675781, 3253.0466308594, 32.827671051025)},
        RentreAvion = {vector3(-2134.79, 3262.38, 32.81)}, -- Menu Garage Vehicule
 	    GarageHeli = {vector3(-2156.23, 3276.95, 32.81)}, -- Menu Garage Helico
    },

    props = {
        {label = "Limière", prop = "prop_worklight_03b"},
        {label = "Barrière", prop = "prop_barrier_work05"},
        {label = "Petite Lumière", prop = "prop_worklight_02a"}
    }
}