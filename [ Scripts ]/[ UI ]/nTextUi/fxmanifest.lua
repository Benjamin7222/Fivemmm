fx_version 'adamant'
game 'gta5'
lua54 'yes'
ui_page('hud/hud.html')

files {
    "hud/hud.html",
    "hud/assets/css/*.css",
    "hud/assets/fonts/*.ttf",
    "hud/assets/fonts/*.woff",
    "hud/assets/images/*.png",
    "hud/assets/js/*.js",
}

client_scripts {
    "configuration.lua",
	"client.lua",
}
