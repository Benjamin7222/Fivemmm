Config = {}

Config.DistanceToVolume = 30.0 -- La distance qui sera avec le volume à 1,0, donc si le volume est de 0,5 la distance sera de 15,0, si le volume est de 0,2 la distance sera de 6.
Config.PlayToEveryone = true -- La musique en voiture sera jouée à tout le monde ? Ou juste pour les personnes qui sont dans ce véhicule ? Si faux, DistanceToVolume ne fera rien

Config.ItemInVehicle = false -- Put here, if you want the radio to be an item, inside "", like "radio". With or false you will need to do /carradio

Config.CommandVehicle = "carradio" -- Ne fonctionnera que si Config.ItemInVehicle == false

Config.Zones = {
	{
		name = "Mechanic Zone", -- Le nom de la radio, peu importe
		coords = vector3(-211.98,-1341.44,34.89), -- la position où la musique est jouée
		job = "mecano", --le travail qui peut changer la musique
		range = 30.0, -- la plage dans laquelle la musique peut être entendue
		volume = 0.1, --default volume? min 0.00, max 1.00
		deflink = "https://www.youtube.com/watch?v=Emap7LU6hYk&t",-- le lien par défaut, si nul il ne jouera rien
		isplaying = false, -- la musique sera-t-elle jouée au démarrage du serveur ?
		loop = false,-- quand la musique s'arrête-t-elle se répétera-t-elle ?
		deftime = 0, -- où commence la musique ? 0 et il commencera au début
		changemusicblip = vector3(-211.98,-1341.44,34.89) -- où le joueur peut changer la musique
	},
	{
		name = "Vanilla Zone", -- The name of the radio, it doesn't matter
		coords = vector3(-1378.35,-628.88,30.63), -- the position where the music is played
		job = "bahamas", --the job that can change the music
		range = 30.0, -- the range that music can be heard
		volume = 0.1, --default volume? min 0.00, max 1.00
		deflink = "https://www.youtube.com/watch?v=W9iUh23Xrsg",-- the default link, if nill it won't play nothing
		isplaying = false, -- the music will play when the server start?
		loop = false,-- when the music stops it will repaeat?
		deftime = 0, -- where does the music starts? 0 and it will start in the beginning
		changemusicblip = vector3(-1378.35,-628.88,30.63) -- where the player can change the music
	},
}