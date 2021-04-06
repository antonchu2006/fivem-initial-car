ESX = nil

--local 

local lugar = {x = -1048.31, y = -2712.79,z = 20.14}
local SPAWN = {x = -1048.31, y = -2712.79,z = 20.14}

--citizen

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
		DrawMarker(1, lugar.x, lugar.y, lugar.z - 1 , 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,52,155,0, 200, 0, 0, 0, 0)
		if GetDistanceBetweenCoords(lugar.x, lugar.y, lugar.z - 1, x,y,z) < 1.5 then
			drawTxt("Alquila un coche inicial!! pulsa ~r~E",4, 1, 0.5, 0.835, 0.85,255,255,255,255)
			if IsControlJustPressed(1,38) then
				spawn_coche()
				TriggerServerEvent('punto:showNotify')
			end
		end
	end
end)





Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)



-- Funciones
function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x , y)
end


function spawn_coche()
	Citizen.Wait(0)

	local myPed = GetPlayerPed(-1)
	local player = PlayerId()
	local vehicle = GetHashKey('warrener') -- modelo de coche

	RequestModel(vehicle)

	while not HasModelLoaded(vehicle) do
		Wait(1)
	end

	local plate = math.random(100, 900)
	local spawned_car = CreateVehicle(vehicle, SPAWN.x,SPAWN.y,SPAWN.z, 431.436, - 996.786, 25.1887, true, false)

	local plate = "HEIL"..math.random(100, 900)
    SetVehicleNumberPlateText(spawned_car, plate)
	SetVehicleOnGroundProperly(spawned_car)
	SetVehicleLivery(spawned_car, 2)
	SetPedIntoVehicle(myPed, spawned_car, - 1)
	SetEntityHeading(spawned_car, SPAWN.h)
	SetModelAsNoLongerNeeded(vehicle)
	Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
	TriggerEvent("advancedFuel:setEssence", 100, GetVehicleNumberPlateText(spawned_car), GetDisplayNameFromVehicleModel(GetEntityModel(spawned_car)))
end