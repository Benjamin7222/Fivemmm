fx_version 'adamant'

game 'gta5'

description 'ESX Pêche'

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",

}

client_scripts {
    'config.lua',
    'client/cl_peche.lua',
    'client/cl_peche-illegale.lua',
}


server_scripts {
    "@mysql-async/lib/MySQL.lua",
    'server/server.lua',

}

