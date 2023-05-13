
fx_version "adamant"

game "gta5"

shared_scripts {
    'init/shared/init.lua',
    'playersManager/society/sh_*.lua',
    "playersManager/blackmarket/shared/shared_blackmarket.lua",
    "playersManager/doorlock/config.lua",
    "jobsManager/masques/shared/*.lua",
}

client_scripts {
    -- RAGEUI
    'menuManager/menu.lua',
    
    'RageUI/RMenu.lua',
    'RageUI/menu/RageUI.lua',
    'RageUI/menu/Menu.lua',
    'RageUI/menu/MenuController.lua',
    'RageUI/components/*.lua',
    'RageUI/menu/elements/*.lua',
    'RageUI/menu/items/*.lua',
    'RageUI/menu/panels/*.lua',
    'RageUI/menu/windows/*.lua',
    
	'RageUIv2/RMenu.lua',
    'RageUIv2/menu/RageUI.lua',
    'RageUIv2/menu/Menu.lua',
    'RageUIv2/menu/MenuController.lua',
    'RageUIv2/components/*.lua',
    'RageUIv2/menu/elements/*.lua',
    'RageUIv2/menu/items/*.lua',
    'RageUIv2/menu/panels/*.lua',
    'RageUIv2/menu/windows/*.lua',

    "system/spawnmanager/client/main.lua",
    "system/hardcap/client/main.lua",

    '@nFramework/locale.lua',
    "fr.lua",
    "init/client/*.lua",
    "blips.lua",
    "functions/client.lua",
    "esx/service/client/main.lua",
    "esx/instance/client/main.lua",
    "esx/status/client/status.lua",
    "markers.lua",

    "playersManager/ammu/*.lua",
    "playersManager/ammu/client/*.lua",

    "playersManager/coffre/*.lua",
    
    "peche/cl_peche.lua",

    "playersManager/shops/cl_ammu-nation.lua",
    "playersManager/shops/cl_superettes.lua",

    "playersManager/interact/CMain.lua",
    "playersManager/interact/functions.lua",
    "playersManager/interact/other.lua",

    "playersManager/carwash/client.lua",

    "playersManager/locations/client.lua",
    "playersManager/garage/client/*.lua",
    "playersManager/sit/cl_main.lua",
    "playersManager/cardinal/creator/*.lua",
    "playersManager/vsync/vs_client.lua",
    "playersManager/blanchiment/CBlanchiment.lua",
    "playersManager/essence/cfg_essence.lua",
    "playersManager/essence/fuel_client.lua",
    "playersManager/sport/cl_sport.lua",
    "playersManager/safezone/client.lua",
    "playersManager/handcuff/client/main.lua",
    "playersManager/admin/shared/*.lua",
    "playersManager/admin/client/*.lua",
    "playersManager/blackmarket/client/*.lua",
    "playersManager/society/cl_*.lua",
    "playersManager/karting/CMain.lua",
    "playersManager/doorlock/client/*.lua",
    "playersManager/gangsbuilder/client/*.lua",
    "playersManager/bijouterie/client/*.lua",
    "playersManager/coffrebuild/client/*.lua",
    "playersManager/coffrebuild/shared/*.lua",
    "utils/discord.lua",
    "utils/ped.lua",
    "utils/peds.lua",
    "utils/sirene.lua",
    "utils/levermain.lua",
    "utils/client.lua",
    -- JOBS
    
    'jobsManager/carshop/client/*.lua',
    "jobsManager/livraison/client/*.lua",
    "jobsManager/livraison/shared/*.lua",
    "jobsManager/army/shared/*.lua",
    "jobsManager/army/client/*.lua",
    "jobsManager/police/shared/*.lua",
    "jobsManager/police/client/*.lua",
    "jobsManager/sheriff/shared/*.lua",
    "jobsManager/sheriff/client/*.lua",
    "jobsManager/ambulance/config.lua",
    "jobsManager/ambulance/client/*.lua",
    "jobsManager/gouv/shared/*.lua",
    "jobsManager/gouv/client/*.lua",
    "jobsManager/vigne/client/client/*.lua",
    "jobsManager/vigne/client/farms/*.lua",
    "jobsManager/mecano/config.lua",
    "jobsManager/mecano/client/*.lua",
    "jobsManager/taxi/client/*.lua",
    "jobsManager/bahamas/config.lua",
    "jobsManager/bahamas/client.lua",
    "jobsManager/burgershot/client/*.lua",
    "jobsManager/burgershot/shared/*.lua",
    
    "playersManager/immo/client.lua",
    "playersManager/immo/configi.lua",

    "jobsManager/custom/cfg_custom.lua",
    "jobsManager/custom/functions.lua",
    "jobsManager/custom/client/main.lua",

    'playersManager/peche_illegal/config.lua',
    'playersManager/peche_illegal/client/cl_peche.lua',
    'playersManager/peche_illegal/client/cl_peche-illegale.lua',

    "jobsManager/masques/client/*.lua",
    "jobsManager/masques/shared/*.lua",
}

server_scripts {
    '@nFramework/locale.lua',
    "@system/async/async.lua",
    "@mysql-async/lib/MySQL.lua",

    "system/hardcap/server/main.lua",
    "system/cron/server/main.lua",

    "peche/sv_peche.lua",

    "fr.lua",
    "init/server/*.lua",
    "maintenance.lua",
    "functions/server.lua",
    "esx/addonaccount/server/classes/addonaccount.lua",
    "esx/addonaccount/server/main.lua",
    "esx/status/server/status.lua",
    "esx/addoninventory/server/classes/addoninventory.lua",
    "esx/addoninventory/server/main.lua",
    "esx/addons_gcphone/server/main.lua",
    "esx/datastore/server/classes/datastore.lua",
    "esx/datastore/server/main.lua",
    "esx/license/server/main.lua",
    "esx/service/server/main.lua",
    "esx/instance/server/main.lua",
    "esx/billing/server/main.lua",
    "playersManager/banSQL.lua",
    "playersManager/interact/server.lua",
    "playersManager/shops/configbraquagesuperette.lua",
    "playersManager/shops/sv_shops.lua",
    "playersManager/shops/sv_braquagesuperette.lua",
    "playersManager/vêtements/server/*.lua",
    "playersManager/carwash/server.lua",
    "playersManager/locations/server.lua",
    "playersManager/garage/LiteMySQL.lua",
    "playersManager/garage/server/*.lua",
    "playersManager/cardinal/SCreator.lua",
    "playersManager/cardinal/creator/*.lua",
    "playersManager/vsync/vs_server.lua",
    "playersManager/blanchiment/SBlanchiment.lua",
    "playersManager/essence/cfg_essence.lua",
    "playersManager/essence/fuel_server.lua",
    "playersManager/handcuff/server/main.lua",
    "playersManager/admin/shared/*.lua",
    "playersManager/admin/server/*.lua",
    "playersManager/society/sv_*.lua",
    "playersManager/blackmarket/server/*.lua",
    "playersManager/doorlock/server/*.lua",
    "playersManager/gangsbuilder/server/*.lua",
    "playersManager/bijouterie/server/*.lua",
    "utils/sv_carry.lua",

    "playersManager/auto-ecole/server/*.lua",
    "playersManager/auto-ecole/shared/*.lua",
    "playersManager/coffrebuild/server/*.lua",

    'jobsManager/carshop/server/*.lua',
    "jobsManager/police/shared/*.lua",
    "jobsManager/police/server/*.lua",
    "jobsManager/army/shared/*.lua",
    "jobsManager/army/server/*.lua",
    "jobsManager/sheriff/shared/*.lua",
    "jobsManager/sheriff/server/*.lua",
    "jobsManager/ambulance/config.lua",
    "jobsManager/ambulance/server/*.lua",
    "jobsManager/gouv/shared/*.lua",
    "jobsManager/gouv/server/*.lua",
    "jobsManager/vigne/server/*.lua",
    "jobsManager/mecano/config.lua",
    "jobsManager/mecano/server/*.lua",
    "jobsManager/taxi/server/*.lua",
    "jobsManager/bahamas/config.lua",
    "jobsManager/bahamas/server.lua",
    "jobsManager/burgershot/server/*.lua",
    
    "jobsManager/masques/server/*.lua",
    
    "jobsManager/custom/server/main.lua",

    "playersManager/peche_illegal/server/server.lua",

}

dependency('nFramework')

files {
    'html/index.html',
    'html/music/load.mp3',
    'html/bg/*.jpg',
    'html/bg/*.png',
    'html/bg/*.mp4',
	'html/style.css',
    'html/js/jquery.ajaxchimp.js',
	'html/js/jquery.backstretch.min.js',
    'html/js/jquery-1.11.0.min.js',
	'html/js/lj-safety-first.js',
    'html/js/owl.carousel.min.js',
}

files({
	'utils/events.meta',
})

data_file('FIVEM_LOVES_YOU_4B38E96CC036038F')('utils/events.meta')

files {
    "playersManager/recul/weapons.meta",
}
  
data_file "WEAPONINFO_FILE_PATCH" "playersManager/recul/weapons.meta"
server_scripts { '@mysql-async/lib/MySQL.lua' }