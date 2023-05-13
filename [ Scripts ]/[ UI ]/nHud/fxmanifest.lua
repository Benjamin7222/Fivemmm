fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author ('ZEDKOVER#1714')

escrow_ignore {
    'config.lua',
    'server/sv_basic.lua',
    'cl_esx.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/*.lua',
}

client_scripts {
    'cl_esx.lua',
    'client/*.lua',
}

shared_scripts {
    'config.lua'
}

ui_page {
    'html/index.html',
}

files {
	'html/index.html',
	'html/app.js', 
    'html/style.css',
    'html/img/*.png',
}