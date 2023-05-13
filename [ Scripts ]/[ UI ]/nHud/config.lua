Config = {}

Config.CommandHud = 'hidezhud'
Config.UseHudKey = true
Config.HudKey = 'J'
Config.StatusMax      = 1000000
Config.TickTime       = 2000
Config.UpdateInterval = 12000

-- S'asseoir sur une Banc/Chaise

Config.DrawDistance = 100
Config.Size         = {x = 1.5, y = 1.5, z = 1.5}
Config.Color        = {r = 0, g = 128, b = 255}
Config.Type         = 1
Config.coef         = 0.10
Config.objects = {
    object = nil, ObjectVertX = nil, ObjectVertY = nil, ObjectVertZ = nil, OjbectDir = nil, isBed = nil,
    SitAnimation = 'PROP_HUMAN_SEAT_CHAIR_MP_PLAYER',
    LayBackAnimation = 'WORLD_HUMAN_SUNBATHE_BACK',
    LayStomachAnimation = 'WORLD_HUMAN_SUNBATHE',
    locations = {
        [1] = {object="v_med_bed2", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-1.4, direction=0.0, bed=true},
        [2] = {object="v_serv_ct_chair02", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.0, direction=168.0, bed=false},
        [3] = {object="prop_off_chair_04", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
        [4] = {object="prop_off_chair_03", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
        [5] = {object="prop_off_chair_05", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
        [6] = {object="prop_bench_01a", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
        [7] = {object="v_club_officechair", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
        [8] = {object="v_ilev_leath_chr", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
        [9] = {object="v_corp_offchair", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
        [10] = {object="v_med_emptybed", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-1.4, direction=0.0, bed=true},
        [11] = {object="Prop_Off_Chair_01", verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
        [12] = {object="gabz_pillbox_MRI_bed", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=0.0, bed=true},
        [13] = {object="gabz_pillbox_diagnostics_bed_01", verticalOffsetX=0.0, verticalOffsetY=0.2, verticalOffsetZ=-1.8, direction=0.0, bed=true},
        [14] = {object="gabz_pillbox_diagnostics_bed_02", verticalOffsetX=0.0, verticalOffsetY=0.2, verticalOffsetZ=-1.8, direction=0.0, bed=true},	
        [15] = {object="gabz_pillbox_diagnostics_bed_03", verticalOffsetX=0.0, verticalOffsetY=0.2, verticalOffsetZ=-1.8, direction=0.0, bed=true},
        [16] = {object="v_med_bed1", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-1.4, direction=0.0, bed=true},
        [17] = {object="prop_cs_office_chair", verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
        [18] = {object="v_med_cor_medstool", verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
        [19] = {object="prop_chair_01a", verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
        [20] = {object="bs_ab_dinerchair", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=0.0, direction=0.0, bed=false},
        [21] = {object="bs_ab_burger_seat1c", verticalOffsetX=1.4, verticalOffsetY=0.0, verticalOffsetZ=0.0, direction=0.0, bed=false},
        [22] = {object="bs_ab_burger_seat2l", verticalOffsetX=1.0, verticalOffsetY=0.0, verticalOffsetZ=0.0, direction=270.0, bed=false},
        [23] = {object="bs_ab_dinerbench", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=0.0, direction=180.0, bed=false},
        [24] = {object="v_ilev_chair02_ped", verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
        [25] = {object="prop_bench_09", verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},       
    }
}