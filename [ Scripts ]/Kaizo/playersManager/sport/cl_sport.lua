
Sport = {}

Sport.Destination = {
    {pos = vector3(-1208.14, -1562.02, 4.61), skills = "strength", amount = 1, anim = "WORLD_HUMAN_PUSH_UPS", name = "~g~des pompes", wait = 15000},
    {pos = vector3(-1201.69, -1572.69, 4.61), skills = "strength", amount = 1, anim = "WORLD_HUMAN_PUSH_UPS", name = "~g~des pompes", wait = 15000},

    {pos = vector3(-1205.09, -1560.65, 4.61), skills = "strength", amount = 0.5, anim = "WORLD_HUMAN_SIT_UPS", name = "~g~des abdos", wait = 10000},
    {pos = vector3(-1196.20, -1567.74, 4.61), skills = "strength", amount = 0.5, anim = "WORLD_HUMAN_SIT_UPS", name = "~g~des abdos", wait = 10000},

    {pos = vector3(-1202.77, -1565.34, 4.61), skills = "strength", amount = 3, anim = "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS", name = "~g~des biceps", wait = 15000},
    {pos = vector3(-1199.05, -1574.42, 4.61), skills = "strength", amount = 3, anim = "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS", name = "~g~des biceps", wait = 15000},
    {pos = vector3(-1210.15, -1561.39, 4.61), skills = "strength", amount = 3, anim = "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS", name = "~g~des biceps", wait = 15000},
    
    {pos = vector3(-1200.04, -1571.02, 4.61), skills = "strength", amount = 2, anim = "PROP_HUMAN_MUSCLE_CHIN_UPS_PRISON", name = "~g~des tractions", wait = 12000},
    {pos = vector3(-1204.86, -1564.29, 4.61), skills = "strength", amount = 2, anim = "PROP_HUMAN_MUSCLE_CHIN_UPS_PRISON", name = "~g~des tractions", wait = 12000},

    {pos = vector3(-1197.44, -1571.39, 4.61), skills = "stamina", amount = 5, anim = "WORLD_HUMAN_JOG_STANDING", name = "~g~de la course à pieds", wait = 30000},
}

-- Progres bars
local HaveProgress
function ProgressBarExists() -- Si une barre de progression existe
    return HaveProgress 
end

local petitpoint = {".","..","...",""}
function ProgressBar(Text, r, g, b, a, Timing, NoTiming) -- Créer une progress bar
    if not Timing then 
        return 
    end
    RemoveProgressBar()
    HaveProgress = true
    Citizen.CreateThread(function()
        local Timing1, Timing2 = .0, GetGameTimer() + Timing
        local E, Timing3 = ""
        while HaveProgress and (not NoTiming and Timing1 < 1) do
            Citizen.Wait(0)
            if not NoTiming or Timing1 < 1 then 
                Timing1 = 1-((Timing2 - GetGameTimer())/Timing)
            end
            if not Timing3 or GetGameTimer() >= Timing3 then
                Timing3 = GetGameTimer()+500;
                E = petitpoint[string.len(E)+1] or ""
            end;
            DrawRect(.5,.875,.15,.03,0,0,0,100)
            local y, endroit=.15-.0025,.03-.005;
            local chance = math.max(0,math.min(y,y*Timing1))
            DrawRect((.5-y/2)+chance/2,.875,chance,endroit,r,g,b,a) -- 0,155,255,125
            DrawTextScreen(.5,.875-.0125,.3,(Text or"Action en cours")..E,0,0,false)
        end;
        RemoveProgressBar()
    end)
end

function RemoveProgressBar() -- Delete les progress bar
    HaveProgress = nil 
end

function DrawTextScreen(Text,Text3,Taille,Text2,Font,Justi,havetext) -- Créer un text 2D a l'écran
    SetTextFont(Font)
    SetTextScale(Taille,Taille)
    SetTextColour(255,255,255,255)
    SetTextJustification(Justi or 1)
    SetTextEntry("STRING")
    if havetext then 
        SetTextWrap(Text,Text+.1)
    end;
    AddTextComponentString(Text2)
    DrawText(Text,Text3)
end

function TaskAnim(animName, time, flag, ped, customPos) -- Faire jouer une anim a un ped (joueur)
	if type(animName) ~= "table" then animName = {animName} end
	ped, flag = ped or PlayerPedId(), flag and tonumber(flag) or false

	if not animName or not animName[1] or string.len(animName[1]) < 1 then return end
    if IsEntityPlayingAnim(ped, animName[1], animName[2], 3) or IsPedActiveInScenario(ped) then ClearPedTasks(ped) 
        return end

	Citizen.CreateThread(function()
		TaskAnimForce(animName, flag, { ped = ped, time = time, pos = customPos })
	end)
end

local AnimBlacklist = {"WORLD_HUMAN_MUSICIAN", "WORLD_HUMAN_CLIPBOARD"}
local AnimFemale = {
	["WORLD_HUMAN_BUM_WASH"] = {"amb@world_human_bum_wash@male@high@idle_a", "idle_a"},
	["WORLD_HUMAN_SIT_UPS"] = {"amb@world_human_sit_ups@male@idle_a", "idle_a"},
	["WORLD_HUMAN_PUSH_UPS"] = {"amb@world_human_push_ups@male@base", "base"},
	["WORLD_HUMAN_BUM_FREEWAY"] = {"amb@world_human_bum_freeway@male@base", "base"},
	["WORLD_HUMAN_CLIPBOARD"] = {"amb@world_human_clipboard@male@base", "base"},
	["WORLD_HUMAN_VEHICLE_MECHANIC"] = {"amb@world_human_vehicle_mechanic@male@base", "base"},
}

function TaskAnimForce(animName, flag, args) -- Faire forcer une anim a un ped (joueur)
	flag, args = flag and tonumber(flag) or false, args or {}
	local ped, time, clearTasks, animPos, animRot, animTime = args.ped or PlayerPedId(), args.time, args.clearTasks, args.pos, args.ang

	if IsPedInAnyVehicle(ped) and (not flag or flag < 40) then return end

	if not clearTasks then ClearPedTasks(ped) end

	if not animName[2] and AnimFemale[animName[1]] and GetEntityModel(ped) == -1667301416 then
		animName = AnimFemale[animName[1]]
	end

	if animName[2] and not HasAnimDictLoaded(animName[1]) then
		if not DoesAnimDictExist(animName[1]) then return end
		RequestAnimDict(animName[1])
		while not HasAnimDictLoaded(animName[1]) do
			Citizen.Wait(10)
		end
	end

	if not animName[2] then
		ClearAreaOfObjects(GetEntityCoords(ped), 1.0)
		TaskStartScenarioInPlace(ped, animName[1], -1, not TableGetValue(AnimBlacklist, animName[1]))
	else
        if not animPos then
            TaskPlayAnim(ped, animName[1], animName[2], 8.0, -8.0, -1, flag or 44, 1, 0, 0, 0, 0)
		else
			TaskPlayAnimAdvanced(ped, animName[1], animName[2], animPos.x, animPos.y, animPos.z, animRot.x, animRot.y, animRot.z, 8.0, -8.0, -1, 1, 1, 0, 0, 0)
		end
	end

	if time and type(time) == "number" then
		Citizen.Wait(time)
		ClearPedTasks(ped)
	end

	if not args.dict then RemoveAnimDict(animName[1]) end
end

function TableGetValue(tbl, value, k) -- Si une table a une value précise
	if not tbl or not value or type(tbl) ~= "table" then return end
	for _,v in pairs(tbl) do
		if k and v[k] == value or v == value then return true, _ end
	end
end

Sport.Timer = 0
Sport.TimerAnim = 0
Citizen.CreateThread(function()
    local player = PlayerPedId()
    while true do 
        local wait = 650
            for k,v in pairs(Sport.Destination) do 
                local dist = Vdist2(GetEntityCoords(PlayerPedId(), false), v.pos)

                if dist <= 5 then
                    wait = 5
                    DrawText3D(v.pos.x, v.pos.y, v.pos.z, "Appuyez sur ~g~E~s~ pour faire "..v.name, 8)
                    if dist <= 2.0 then  
                        if IsControlJustPressed(0, 51) then 
                            if Sport.Timer + Sport.TimerAnim >= GetGameTimer() then 
                                ESX.ShowNotification("~g~Vous êtes fatigué.")
                            else
                                ProgressBar("Musculation en cours", 100, 150, 250, 200, v.wait)
                                TaskAnim(v.anim)
                                Wait(v.wait)
                                Sport.TimerAnim  = v.wait
                                Sport.Timer = GetGameTimer()
                                --TriggerServerEvent("rCore:AddSkills", v.skills, v.amount)
                                ClearPedTasks(PlayerPedId())
                            end
                        end
                    end
                end
            end
        Wait(wait)
    end
end)