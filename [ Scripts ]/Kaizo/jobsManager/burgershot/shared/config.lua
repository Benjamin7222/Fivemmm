
BurgerShot = {

--Marker Config--
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

--Config Point--
Position = {
    Coffre = {vector3(-1204.3210449219,-892.11309814453,13.995185852051)}, -- Menu coffre 
    GarageVehicule = {vector3(-1177.6529541016,-892.39562988281,13.760370254517)}, -- Menu Garage Vehicule
    RangerVehicule = {vector3(-1169.6101074219,-895.13696289063,13.919534683228)}, -- Menu ranger votre véhicule
    VestiaireBurgerShot = {vector3(-1182.1320800781, -899.98742675781, 13.974183082581)}, -- Menu Vestiaire
    RecolteViande = {vector3(-62.81, 6239.64, 31.09)}, -- Menu Récolte Viande
    RecoltePain = {vector3(-87.03, 1880.44, 197.32)}, -- Menu Récolte Pain
    RecolteFrites = {vector3(1551.92, 2190.21, 78.84)}, -- Menu Récolte Frites
    CreationFrites = {vector3(-1200.3853759766, -897.31524658203, 13.974189758301)}, -- Création Frites
    CreationSteak = {vector3(-1197.7863769531, -895.66094970703, 13.974189758301)}, -- Création Steak
    CreationHamburger = {vector3(-1196.8416748047, -901.45874023438, 13.974182128906)}, -- Création Hamburger
    CreationMenuBurger = {vector3(-1196.2185058594, -899.88885498047, 13.974178314209)}, -- Création Menu
    accueilmenu1 = {vector3(-1194.4373779297, -895.11883544922, 13.974179267883)}, -- Création Menu
    accueilmenu2 = {vector3(-1193.3447265625, -896.75500488281, 13.974180221558)}, -- Création Menu
    menuvente = {vector3(959.03344726563,-1998.5632324219,30.237998962402)}, -- Vente Item




},


FarmList = {Index = 1, "~r~1~s~", "~r~5~s~", "~r~10~s~"},
FarmListboisson = {Index = 1, "~r~1~s~", "~r~2~s~", "~r~5~s~"},
AnnonceList = {Index = 1, "~g~Ouverture~s~", "~r~Fermeture~s~", "~y~Recrutement~s~", "~o~Personnalisé~s~"},
VenteList = {Index = 1, "~g~Hamburger~s~", "~g~Frites~s~", "~g~Soda-shot~s~", "~g~Menu WhiteBurger~s~", "~g~Menu Burger Prestige~s~"},


--GPS
RecolteViandeGPS = vector2(-77.73, 6279.28),
RecoltePainGPS = vector2(-84.99, 1880.07),
RecolteFritesGPS = vector2(1552.06, 2189.95),
VenteItemGPS = vector2(955.45324707031, -1998.0155029297),


--Config Vehicule Benny
VehiculeBurgerShot = { 
	{buttoname = "Speedo", rightlabel = "→→", spawnname = "nspeedo", spawnzone = vector3(-1172.044921875,-892.29913330078,13.902005195618), headingspawn = 31.93}, -- Garage Voiture
	{buttoname = "Burrito", rightlabel = "→→", spawnname = "burrito4", spawnzone = vector3(-1172.044921875,-892.29913330078,13.902005195618), headingspawn = 31.93}, -- Garage Voiture
}




}