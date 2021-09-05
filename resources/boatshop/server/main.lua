ESX = nil

if ConfigBoat.Logs == true then print = printcacao end

TriggerEvent('SwLife:initObject', function(obj) ESX = obj end)

MySQL.ready(function()
	RangerBateaux()
end)

function RangerBateaux()
	MySQL.Async.execute('UPDATE owned_vehicles SET state = true WHERE state = false AND type = @type', {
		['@type'] = 'boat'
	}, function (rowsChanged)
		if rowsChanged > 0 then
			printcacao("Tous les bateaux ont été rangés")
		end
	end)
end

ESX.RegisterServerCallback('jetski', function(source, cb, price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local priceAvailable = false
	price = 7500

	if price == price then
		priceAvailable = true
	end

	if priceAvailable and xPlayer.getAccount('cash').money >= price then
		xPlayer.removeAccountMoney('cash', price)
		TriggerClientEvent('::{razzway.xyz}::esx:showNotification', xPlayer.source, 'Vous avez payez ~b~' .. price .. '$~s~, bonne navigation à vous !')
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('Suntrap', function(source, cb, price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local priceAvailable = false
	price = 10000

	if price == price then
		priceAvailable = true
	end

	if priceAvailable and xPlayer.getAccount('cash').money >= price then
		xPlayer.removeAccountMoney('cash', price)
		TriggerClientEvent('::{razzway.xyz}::esx:showNotification', xPlayer.source, 'Vous avez payez ~b~' .. price .. '$~s~, bonne navigation à vous !')
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('Jetmax', function(source, cb, price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local priceAvailable = false
	price = 45000

	if price == price then
		priceAvailable = true
	end

	if priceAvailable and xPlayer.getAccount('cash').money >= price then
		xPlayer.removeAccountMoney('cash', price)
		TriggerClientEvent('::{razzway.xyz}::esx:showNotification', xPlayer.source, 'Vous avez payez ~b~' .. price .. '$~s~, bonne navigation à vous !')
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('Tropic', function(source, cb, price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local priceAvailable = false
	price = 65000

	if price == price then
		priceAvailable = true
	end

	if priceAvailable and xPlayer.getAccount('cash').money >= price then
		xPlayer.removeAccountMoney('cash', price)
		TriggerClientEvent('::{razzway.xyz}::esx:showNotification', xPlayer.source, 'Vous avez payez ~b~' .. price .. '$~s~, bonne navigation à vous !')
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('Dinghy', function(source, cb, price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local priceAvailable = false
	price = 32500

	if price == price then
		priceAvailable = true
	end

	if priceAvailable and xPlayer.getAccount('cash').money >= price then
		xPlayer.removeAccountMoney('cash', price)
		TriggerClientEvent('::{razzway.xyz}::esx:showNotification', xPlayer.source, 'Vous avez payez ~b~' .. price .. '$~s~, bonne navigation à vous !')
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('Dinghya', function(source, cb, price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local priceAvailable = false
	price = 40000

	if price == price then
		priceAvailable = true
	end

	if priceAvailable and xPlayer.getAccount('cash').money >= price then
		xPlayer.removeAccountMoney('cash', price)
		TriggerClientEvent('::{razzway.xyz}::esx:showNotification', xPlayer.source, 'Vous avez payez ~b~' .. price .. '$~s~, bonne navigation à vous !')
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('Speeder', function(source, cb, price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local priceAvailable = false
	price = 85000

	if price == price then
		priceAvailable = true
	end

	if priceAvailable and xPlayer.getAccount('cash').money >= price then
		xPlayer.removeAccountMoney('cash', price)
		TriggerClientEvent('::{razzway.xyz}::esx:showNotification', xPlayer.source, 'Vous avez payez ~b~' .. price .. '$~s~, bonne navigation à vous !')
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('Toro', function(source, cb, price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local priceAvailable = false
	price = 200000

	if price == price then
		priceAvailable = true
	end

	if priceAvailable and xPlayer.getAccount('cash').money >= price then
		xPlayer.removeAccountMoney('cash', price)
		TriggerClientEvent('::{razzway.xyz}::esx:showNotification', xPlayer.source, 'Vous avez payez ~b~' .. price .. '$~s~, bonne navigation à vous !')
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('plaquebateau', function (source, cb, plate)
    MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function (result)
        cb(result[1] ~= nil)
    end)
end)

RegisterServerEvent("payeboat")
AddEventHandler("payeboat", function(vehicleProps)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
	--if xPlayer.getAccount('cash').money >= price then
		--xPlayer.removeAccountMoney('cash', price)
		--TriggerClientEvent("::{razzway.xyz}::esx:showNotification", source, "~r~[ACHAT] ~s~Vous avez acheter votre navire !.")
		MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, type, state) VALUES (@owner, @plate, @vehicle, @type, @state)', {
			['@owner']   = xPlayer.identifier,
			['@plate']   = vehicleProps.plate,
			['@vehicle'] = json.encode(vehicleProps),
			['@type']    = 'boat',
			['@state']  = true
		}, function(rowsChanged)
		end)
	--else
		--TriggerClientEvent("::{razzway.xyz}::esx:showNotification", source, "~r~[ACHAT] ~s~Vous n'avez pas assez d'argent.")
	--end
end)

ESX.RegisterServerCallback('Fourr', function(source, cb, price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local priceAvailable = false
	price = 5000

	if price == price then
		priceAvailable = true
	end

	if priceAvailable and xPlayer.getAccount('cash').money >= price then
		xPlayer.removeAccountMoney('cash', price)
		TriggerClientEvent('::{razzway.xyz}::esx:showNotification', xPlayer.source, 'Vous avez payez ~b~' .. price .. '$~s~, bonne navigation à vous !')
		cb(true)
	else
		cb(false)
	end
end)

RegisterServerEvent('::{razzway.xyz}::takeOutVehicle')
AddEventHandler('::{razzway.xyz}::takeOutVehicle', function(plate)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE owned_vehicles SET state = @state WHERE owner = @owner AND plate = @plate', {
		['@state'] = false,
		['@owner']  = xPlayer.identifier,
		['@plate']  = plate
	}, function(rowsChanged)
		if rowsChanged == 0 then
			printcacao((': %s exploited the garage!'):format(xPlayer.identifier))
		end
	end)
end)

RegisterServerEvent('::{razzway.xyz}::storeVehicle')
AddEventHandler('::{razzway.xyz}::storeVehicle', function(vehicle, state)
	local _source = source
	--local xPlayer = ESX.GetPlayerFromId(_source)
	local vehicules = getPlayerVehicles(ESX.GetIdentifierFromId(_source))
	local state = state
	local plate = vehicle.plate
	printcacao('UPDATING STATE...')
	if plate ~= nil then
		printcacao('plate')
		plate = plate:gsub("^%s*(.-)%s*$", "%1")
		printcacao(plate)
	else
		printcacao('vehicle')
		printcacao(vehicle)
	end
	for _,v in pairs(vehicules) do
		if v.plate == plate then
			MySQL.Sync.execute("UPDATE owned_vehicles SET state =@state WHERE plate=@plate",{['@state'] = state , ['@plate'] = plate})
			printcacao('STATE UPDATED...')
			break
		else
			--TriggerClientEvent('::{razzway.xyz}::esx:showNotification', _source, "Ce véhicule ne vous appartient pas")
		end
	end
end)

function getPlayerVehicles(identifier)
	
	local vehicles = {}
	local data = MySQL.Sync.fetchAll("SELECT * FROM owned_vehicles WHERE owner=@identifier",{['@identifier'] = identifier})	
	for _,v in pairs(data) do
		local vehicle = json.decode(v.vehicle)
		table.insert(vehicles, {id = v.id, plate = v.plate})
	end
	return vehicles
end

ESX.RegisterServerCallback('::{razzway.xyz}::getGarage', function(source, cb)
	local ownedBoats = {}

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND type = @type', {
		['@owner'] = ESX.GetIdentifierFromId(source),
		['@type'] = 'boat'
	}, function(data)
		for k, v in pairs(data) do
			local vehicle = json.decode(v.vehicle)
			table.insert(ownedBoats, {vehicle = vehicle, state = v.state, plate = v.plate})
		end

		cb(ownedBoats)
	end)
end)

ESX.RegisterServerCallback('::{razzway.xyz}::getFourriere', function(source, cb)
	local ownedBoats = {}

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND type = @type', {
		['@owner'] = ESX.GetIdentifierFromId(source),
		['@type'] = 'boat'
	}, function(data)
		for k, v in pairs(data) do
			local vehicle = json.decode(v.vehicle)
			table.insert(ownedBoats, {vehicle = vehicle, state = v.state, plate = v.plate})
		end

		cb(ownedBoats)
	end)
end)

