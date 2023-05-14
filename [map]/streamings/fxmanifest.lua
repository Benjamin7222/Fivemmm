





fx_version 'adamant'
game 'gta5'

this_is_a_map 'yes'

loadscreen "[loads]/index.html"

ui_page "[loads]/dist/ui/index.html"

data_file 'TIMECYCLEMOD_FILE' 'gabz_mrpd_timecycle.xml'
data_file 'INTERIOR_PROXY_ORDER_FILE' 'interiorproxies.meta'

files {
	'gabz_mrpd_timecycle.xml',
	'interiorproxies.meta',
	"**/*",
    "*"
}

client_script {
    "gabz_mrpd_entitysets.lua"
}

files({
	'timecycles/ocean_h_timecycle.xml',
	'timecycle_mods_1.xml',
})

data_file('TIMECYCLEMOD_FILE')('timecycle_mods_1.xml')

file 'gabz_timecycle_mods_1.xml'
data_file 'TIMECYCLEMOD_FILE' 'gabz_timecycle_mods_1.xml'

data_file "SCALEFORM_DLC_FILE" "stream/int3232302352.gfx"

data_file 'DLC_ITYP_REQUEST' 'stream/ffxv_galdinquay.ytyp'

data_file 'TIMECYCLEMOD_FILE' 'timecycles/ocean_h_timecycle.xml'
data_file 'SCALEFORM_DLC_FILE' 'stream/minimap/int164437691.gfx'
data_file 'SCALEFORM_DLC_FILE' 'stream/minimap/int1855188787.gfx'
data_file 'SCALEFORM_DLC_FILE' 'stream/minimap/int1975778630.gfx'
data_file 'SCALEFORM_DLC_FILE' 'stream/minimap/int2439777779.gfx'
data_file 'SCALEFORM_DLC_FILE' 'stream/minimap/int2574468285.gfx'
data_file 'SCALEFORM_DLC_FILE' 'stream/minimap/int3680022772.gfx'

files {
  "stream/int3232302352.gfx"
}

files({
	'peds.meta'
})

data_file 'PED_METADATA_FILE' 'peds.meta'

files({
	'data/**/carcols.meta',
	'data/**/carvariations.meta',
	'data/**/contentunlocks.meta',
	'data/**/handling.meta',
	'data/**/vehiclelayouts.meta',
	'data/**/vehicles.meta'
})

client_scripts({
	'client/main.lua'
})

data_file('CONTENT_UNLOCKING_META_FILE')('data/**/contentunlocks.meta')
data_file('HANDLING_FILE')('data/**/handling.meta')
data_file('VEHICLE_METADATA_FILE')('data/**/vehicles.meta')
data_file('CARCOLS_FILE')('data/**/carcols.meta')
data_file('VEHICLE_VARIATION_FILE')('data/**/carvariations.meta')
data_file('VEHICLE_LAYOUTS_FILE')('data/**/vehiclelayouts.meta')

