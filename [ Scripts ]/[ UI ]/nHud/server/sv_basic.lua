ESX = nil
TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

-- OR IF USE ES_EXTENDED later version

-- ESX = exports['es_extended']:getSharedObject()

local using = false

RegisterServerEvent('export:using')
AddEventHandler('export:using', function(target)
	using = target
end)

-- Plat
ESX.RegisterUsableItem('bread', function(source)
	if using == true then
		local xPlayer = ESX.GetPlayerFromId(source)
		TriggerClientEvent('esx_basicneeds:onEat', source)
		TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
		xPlayer.removeInventoryItem('bread', 1)
		TriggerClientEvent('esx:showNotification', source, ('Vous mangez du Pain.'))
	else
		TriggerClientEvent('esx:showNotification', source, ('Vous devez être assis pour faire cette action.'))
	end
end)  

ESX.RegisterUsableItem('frites', function(source)
	if using == true then
		local xPlayer = ESX.GetPlayerFromId(source)
		TriggerClientEvent('esx_basicneeds:onEat', source)
		TriggerClientEvent('esx_status:add', source, 'hunger', 50000)
		xPlayer.removeInventoryItem('frites', 1)
		TriggerClientEvent('esx:showNotification', source, ('Vous mangez des Frites.'))
	else
		TriggerClientEvent('esx:showNotification', source, ('Vous devez être assis pour faire cette action.'))
	end
end)  

ESX.RegisterUsableItem('burger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('burger', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onBurger', source)
	TriggerClientEvent('esx:showNotification', source, ("Vous mangez un Burger."))
end)


-- Boisson
ESX.RegisterUsableItem('water', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('water', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 150000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, ("Vous buvez de l'Eau."))
end)

ESX.RegisterUsableItem('soda', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('soda', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, ("Vous buvez une canette de Soda."))
end)

ESX.RegisterUsableItem('espresso', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('espresso', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, ("Vous buvez un Espresso."))
end)

ESX.RegisterUsableItem('cafe', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('cafe', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, ("Vous buvez un Café."))
end)

ESX.RegisterUsableItem('chocolat_chaud', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('chocolat_chaud', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, ("Vous buvez un Chocolat Chaud."))
end)

ESX.RegisterUsableItem('mojito', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('mojito', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onMojito', source)
	TriggerClientEvent('esx:showNotification', source, ("Vous buvez un Mojito."))
end)

ESX.RegisterUsableItem('coca', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('coca', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onMojito', source)
	TriggerClientEvent('esx:showNotification', source, ("Vous buvez un Coca."))
end)

ESX.RegisterUsableItem('whisky', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('whisky', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onMojito', source)
	TriggerClientEvent('esx:showNotification', source, ("Vous buvez un Whisky."))
end)

ESX.RegisterUsableItem('vodka', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('vodka', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onMojito', source)
	TriggerClientEvent('esx:showNotification', source, ("Vous buvez de la Vodka."))
end)

ESX.RegisterUsableItem('rhum', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('rhum', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onMojito', source)
	TriggerClientEvent('esx:showNotification', source, ("Vous buvez du Rhum."))
end)

ESX.RegisterUsableItem('jager', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('jager', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onMojito', source)
	TriggerClientEvent('esx:showNotification', source, ("Vous buvez un Jägermeister."))
end)


ESX.RegisterUsableItem('chips', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_sandwich_01', 'chips', 'hunger', 200000, 'กิน <strong class="green-text">ขนมปัง</strong> 1 ชิ้น')
end)

ESX.RegisterUsableItem('sandwich', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_sandwich_01', 'sandwich', 'hunger', 200000, 'กิน <strong class="green-text">ขนมปัง</strong> 1 ชิ้น')
end)

ESX.RegisterUsableItem('chocolate', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_sandwich_01', 'chocolate', 'hunger', 200000, 'กิน <strong class="green-text">ขนมปัง</strong> 1 ชิ้น')
end)

ESX.RegisterUsableItem('cacahuete', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_sandwich_01', 'cacahuete', 'hunger', 200000, 'กิน <strong class="green-text">ขนมปัง</strong> 1 ชิ้น')
end)

ESX.RegisterUsableItem('poire', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_sandwich_01', 'poire', 'hunger', 200000, 'กิน <strong class="green-text">ขนมปัง</strong> 1 ชิ้น')
end)

ESX.RegisterUsableItem('sucrebrin', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_sandwich_01', 'sucrebrin', 'hunger', 200000, 'กิน <strong class="green-text">ขนมปัง</strong> 1 ชิ้น')
end)

ESX.RegisterUsableItem('citron', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_sandwich_01', 'citron', 'hunger', 200000, 'กิน <strong class="green-text">ขนมปัง</strong> 1 ชิ้น')
end)

ESX.RegisterUsableItem('ananas', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_sandwich_01', 'ananas', 'hunger', 200000, 'กิน <strong class="green-text">ขนมปัง</strong> 1 ชิ้น')
end)

ESX.RegisterUsableItem('glacon', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_sandwich_01', 'glacon', 'hunger', 200000, 'กิน <strong class="green-text">ขนมปัง</strong> 1 ชิ้น')
end)

ESX.RegisterUsableItem('menthe', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_sandwich_01', 'menthe', 'hunger', 200000, 'กิน <strong class="green-text">ขนมปัง</strong> 1 ชิ้น')
end)

ESX.RegisterUsableItem('cerise', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_sandwich_01', 'cerise', 'hunger', 200000, 'กิน <strong class="green-text">ขนมปัง</strong> 1 ชิ้น')
end)

ESX.RegisterUsableItem('citronvert', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_sandwich_01', 'citronvert', 'hunger', 200000, 'กิน <strong class="green-text">ขนมปัง</strong> 1 ชิ้น')
end)

ESX.RegisterUsableItem('goussevanille', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onEat', source, 'prop_sandwich_01', 'goussevanille', 'hunger', 200000, 'กิน <strong class="green-text">ขนมปัง</strong> 1 ชิ้น')
end)

-- Drink
ESX.RegisterUsableItem('water', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'water', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('cocacola', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'cocacola', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('icetea', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'icetea', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('bierre', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'bierre', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('gin', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'gin', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('liqueurorange', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'liqueurorange', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('juscitron', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'juscitron', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('brancheromarin', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'brancheromarin', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('juspamplemouse', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'juspamplemouse', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('siropthea', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'siropthea', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('juscanneberge', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'juscanneberge', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('vinblanc', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'vinblanc', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('liqueurcuracaobleu', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'liqueurcuracaobleu', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('jusananaas', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'jusananaas', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('limonade', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'limonade', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('hanesy', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'hanesy', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('siropromarin', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'siropromarin', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('angostura', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'angostura', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('bourbon', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'bourbon', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('vermouth', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'vermouth', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('siropcanne', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'siropcanne', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('rhum', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'rhum', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('cremecoco', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'cremecoco', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('watergaz', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'watergaz', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('condelumar', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'condelumar', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('cafe', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'cafe', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('aromevanille', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'aromevanille', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('chantilly', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'chantilly', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('presquesante', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'presquesante', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('rosemarie', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'rosemarie', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('sangria', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'sangria', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('nouvellefrance', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'nouvellefrance', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('oldfashioned', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'oldfashioned', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('martini', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'martini', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('pinacoladaananas', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'pinacoladaananas', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('valhalla', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'valhalla', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('vanilla', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_basicneeds:onDrink', source, 'prop_ld_flow_bottle', 'vanilla', 'thirst', 200000, 'ดื่ม <strong class="blue-text">น้ำ</strong> 1 ขวด')
end)

ESX.RegisterUsableItem('sodaburgershot', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sodaburgershot', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
end)

ESX.RegisterUsableItem('hamburger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('hamburger', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
end)

ESX.RegisterUsableItem('menuburgershot', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('menuburgershot', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 450000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
end)


ESX.RegisterUsableItem('menuburgershotluxe', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('menuburgershotluxe', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 650000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 600000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
end)