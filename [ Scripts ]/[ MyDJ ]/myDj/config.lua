Config = {}
Translation = {}

Translation = {
    ['en'] = {
        ['DJ_interact'] = 'Appuyez sur E, pour accéder au pupitre DJ',
        ['title_does_not_exist'] = 'Ce titre n\'existe pas !',
    }
}

Config.Locale = 'en'

Config.useESX = true -- can not be disabled without changing the callbacks
Config.enableCommand = false

Config.enableMarker = true -- purple marker at the DJ stations

Config.DJPositions = {
    {
        name = 'bahamas',
        pos = vector3(-1378.44, -629.12, 30.63), 
        requiredJob = nil, 
        range = 25.0, 
        volume = 1.0 --[[ Ne pas toucher les volume! --]]
    }
}