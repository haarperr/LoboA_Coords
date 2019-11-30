
Citizen.CreateThread(function()
	Pulsado = false
	Activado = false
	MandarCoordenadas = false	
	
	while true do 
		Wait(1)
			if IsControlJustPressed(0, 51) and not Activado then
			Pulsado = true
			Activado = true
			MandarCoordenadas = true
			end

				while Pulsado do
					Wait(1)
					local ped = GetPlayerPed(-1)
					local x,y,z = table.unpack(GetEntityCoords(ped))
					DrawText3D(x,y,z+1,"Coordenadas:  "..x.." : " ..y.. " : "..z, 0.4)
					
					if MandarCoordenadas then
						local ped = GetPlayerPed(-1)
						local coordenadas = GetEntityCoords(ped)
						TriggerServerEvent("MandarCoords", coordenadas)
						MandarCoordenadas = false
					end
					
					if IsControlJustPressed(0, 51) and Activado then
						Pulsado = false
						Activado = false
						MandarCoordenadas = false
					end
				end
		end
end)

function DrawText3D(x, y, z, text, scale)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
 
	SetTextScale(scale, scale)
	SetTextFont(6)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextColour(255, 255, 255, 255)
 
	AddTextComponentString(text)
	DrawText(_x, _y)
end

