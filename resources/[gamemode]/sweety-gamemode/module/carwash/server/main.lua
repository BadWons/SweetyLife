ESX = nil

TriggerEvent('SwLife:initObject', function(obj) ESX = obj end)
enableprice = true 

price = 100 

RegisterServerEvent('es_carwash:checkmoney')
AddEventHandler('es_carwash:checkmoney', function ()
	if enableprice == true then
		local xPlayer = ESX.GetPlayerFromId(source)
		userMoney = xPlayer.getAccount('cash').money
		if userMoney >= price then
			xPlayer.removeAccountMoney('cash', price)
			TriggerClientEvent('es_carwash:success', source, price)
		else
			moneyleft = price - userMoney
			TriggerClientEvent('es_carwash:notenoughmoney', source, moneyleft)
		end
	else
		TriggerClientEvent('es_carwash:free', source)
	end
end)
