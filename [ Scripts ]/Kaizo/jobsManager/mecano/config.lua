

cfg_mecano = {

--Marker cfg_mecano--
MarkerType = 6, -- Pour voir les différents type de marker: https://docs.fivem.net/docs/game-references/markers/
MarkerSizeLargeur = 0.8, -- Largeur du marker
MarkerSizeEpaisseur = 0.8, -- Épaisseur du marker
MarkerSizeHauteur = 0.8, -- Hauteur du marker
MarkerDistance = 25.0, -- Distane de visibiliter du marker (1.0 = 1 mètre)
MarkerColorR = 0, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
MarkerColorG = 180, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
MarkerColorB = 255, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
MarkerOpacite = 180, -- Opacité du marker (min: 0, max: 255)
MarkerSaute = false, -- Si le marker saute (true = oui, false = non)
MarkerTourne = false, -- Si le marker tourne (true = oui, false = non)


--cfg_mecano Point--
Position = {
    Coffre = {vector3(-224.34, -1320.13, 30.89)}, -- Menu coffre 
    GarageVehicule = {vector3(-192.42, -1290.49, 31.3)}, -- Menu Garage Vehicule
    RangerVehicule = {vector3(-189.61, -1282.22, 31.19)}, -- Menu ranger votre véhicule
    FabricationKit = {vector3(-583.66, -914.32, 23.89)}, -- Menu Fabrication Kit
    Vestiaire = {vector3(-206.69, -1341.7, 34.89)}, -- Menu Vestiaire
},


--cfg_mecano Texte
TextCoffre = "Appuyez sur ~INPUT_CONTEXT~ ~s~pour accèder au ~y~stockage~s~",
TextGarage = "Appuyez sur ~INPUT_CONTEXT~ ~s~pour accèder au ~y~garage",
TextRangerGarage = "Appuyez sur ~INPUT_CONTEXT~ ~s~pour ranger votre ~y~véhicule de service",
TextFabricationKit = "Appuyez sur ~INPUT_CONTEXT~ ~s~pour accèder à ~y~l'établie",
TextVestiaire = "Appuyez sur ~INPUT_CONTEXT~ ~s~pour accèder au ~y~vestiaire",
TextBoss = "Appuyez sur ~INPUT_CONTEXT~ ~s~pour accèder au ~y~compte",


--cfg_mecano Vehicule Benny
VehiculeBenny = { 
    {buttoname = "Dépanneuse à plateau", rightlabel = "→→", spawnname = "flatbed3", spawnzone = vector3(-550.92, -914.0, 23.86), headingspawn = 175.33}, -- Garage Voiture
    {buttoname = "Véhicule de déplacement", rightlabel = "→→", spawnname = "kamacho", spawnzone = vector3(-550.92, -914.0, 23.86), headingspawn = 175.33}, -- Garage Voiture
}



}