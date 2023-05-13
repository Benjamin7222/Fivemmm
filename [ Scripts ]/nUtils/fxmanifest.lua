



















fx_version('bodacious')
game('gta5')

server_script {
    '@mysql-async/lib/MySQL.lua',

    'jobs/**/server/*.lua',

    'utils/**/shared/*.lua',
	'utils/**/server/*.lua'

}

client_script {
    'services/RageUIv2/client/menu.lua',

    'jobs/**/client/*.lua',

    'utils/**/shared/*.lua',
    'utils/**/client/*.lua',
    
    "html/nui.lua"
}


ui_page "html/index.html"

files {
    'metas/carcols.meta',
    'metas/carvariations.meta',
    'metas/vehicles.meta',
    'metas/handling.meta',
    'metas/vehiclelayouts.meta',
    'stream/def_flatbed3_props.ytyp',

    "html/index.html",
    "html/index.js",
    "html/index.css",
    "html/reset.css"
}
data_file 'HANDLING_FILE' 'metas/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'metas/vehicles.meta'
data_file 'CARCOLS_FILE' 'metas/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'metas/carvariations.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'metas/vehiclelayouts.meta'
data_file 'DLC_ITYP_REQUEST' 'stream/def_flatbed3_props.ytyp'

dependency('nFramework')
