ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)


RegisterServerEvent('punto:showNotify')
AddEventHandler('punto:showNotify', function()
	xPlayer.addMoney(-100)
	TriggerClientEvent("pNotify:SendNotification", _source, {text = "<center><strong><b style='color:#B2FF33'>COMUNISTAS RP</b><strong><br /> <br /> Aquí tienes tu coche gratis ;)<center>", type = "success", queue = "global", timeout = 5000, layout = "centerRight" })
end)
