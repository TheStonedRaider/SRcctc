local tc = false
local cruse = false
local UITC = {
	x =  0.12, 	-- Base Screen Coords 	+ 	 x
	y = 0.740, 	-- Base Screen Coords 	+ 	-y
}
local UI = {
	x =  0.570, 	-- Base Screen Coords 	+ 	 x
	y = 0.440, 	-- Base Screen Coords 	+ 	-y
}

Citizen.CreateThread(function()
	if Config.TCon == true then
		while true do
			Wait(20)
			local playerped = PlayerPedId()
			if IsPedSittingInAnyVehicle(playerped) then
				local veh =	GetVehiclePedIsIn(playerped, false)
				if playerped == GetPedInVehicleSeat(veh, -1) then
					if IsControlPressed(0, Config.TCkey) then
						if tc == true then
							tc = false
							Wait(0)
							SetVehicleMaxSpeed(veh, 300.0)
						else
							TC()
						end
					end
				else
					Wait(2500)
				end
			else
				Wait(2500)
			end
		end
	end
end)

Citizen.CreateThread(function()
	if Config.CCon == true then
		while true do
			Wait(20)
			local playerped = PlayerPedId()
			if IsPedSittingInAnyVehicle(playerped) then
				local veh =	GetVehiclePedIsIn(playerped, false)
				if playerped == GetPedInVehicleSeat(veh, -1) then
					if IsControlPressed(0, Config.CCkey) then
						if cruse == true then
							cruse = false
							Wait(0)
							SetVehicleMaxSpeed(veh, 300.0)
						else
							Cruse()
						end
					end
				else
					Wait(2500)
				end
			else
				Wait(2500)
			end
		end
	end
end)


function TC()
if tc == false then
tc = true
playerped = GetPlayerPed(-1)
		local veh =	GetVehiclePedIsIn(playerped,false)
		local drivebias = GetVehicleHandlingFloat(veh,"CHandlingData", "fDriveBiasFront")
local ped = GetPlayerPed(-1)
local vehicle = GetVehiclePedIsIn(ped)
oldvalue = GetVehicleHandlingFloat(vehicle,'CHandlingData','fLowSpeedTractionLossMult')		

		repeat
		Wait(0)
		if tcacting == true then
		SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',newvalue5)	
SetVehicleEngineTorqueMultiplier(veh, var1)
else
SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',oldvalue)	
SetVehicleEngineTorqueMultiplier(veh, 1.0)
end
var1 = 1.0		
	mod1 = 0.0	
newvalue5 = oldvalue

	tcacting = false	
		
		
wh1 = GetVehicleWheelSpeed(veh,0)
wh1 = (GetVehicleWheelSpeed(veh,1) + wh1) / 2 
wh2 = (GetVehicleWheelSpeed(veh,1) + wh1) / 2 
wh3 = GetVehicleWheelSpeed(veh,2)
wh4 = GetVehicleWheelSpeed(veh,3) 
throttle = 0.0 
wheelave = (GetVehicleWheelSpeed(veh,0) + GetVehicleWheelSpeed(veh,1) + GetVehicleWheelSpeed(veh,2) + GetVehicleWheelSpeed(veh,3)) / 4

DrawRect(UITC.x + 0.01 ,UITC.y + 0.04 ,0.05,0.01,0,0,0,255)
steerang = GetVehicleSteeringAngle(veh)
if steerang > 1 then
mod1 = steerang / 20
elseif steerang < -1.0 then
steerang = steerang - steerang*2
mod1 = steerang / 20
end
--print("1",wh3,wh3 - (wheelave + 1.7 + mod1))
--print("2",wh4,wh4 - (wheelave + 1.7 + mod1))
--print("3",(wheelave + 1.7 + mod1) - wh3)
--print("4",(wheelave + 1.7 + mod1) - wh4)

	if wh1 > (wheelave + 0.15 + mod1) then
var1 = 1.0 / ((wh1 - (wheelave + 0.00 + mod1) )- 0.14) *Config.action
newvalue5 = oldvalue * var1
tcacting = true
elseif  wh2 > (wheelave + 0.15 + mod1) then
var1 = 1.0 / ((wh2 - (wheelave + 0.00 + mod1) )- 0.14) *Config.action
newvalue5 = oldvalue * var1 
tcacting = true
elseif  wh3 > (wheelave + 0.15 + mod1) then
var1 = 1.0 / ((wh3 - (wheelave + 0.00 + mod1) )- 0.14) *Config.action
newvalue5 = oldvalue * var1
tcacting = true
elseif  wh4 > (wheelave + 0.15 + mod1) then
var1 = 1.0 / ((wh4 - (wheelave + 0.00 + mod1) )- 0.14) *Config.action
newvalue5 = oldvalue * var1

tcacting = true
end
if tcacting == true then
if newvalue5 > 0.0 and newvalue5 < oldvalue  then
SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',newvalue5)
newvalue5 = oldvalue * var1
elseif newvalue5 > oldvalue then
newvalue5 = oldvalue * var1
SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',newvalue5)
elseif newvalue5 < 0.0 then
newvalue5 = 0.01
SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',newvalue5)
end
if var1 < 1.0 then
SetVehicleEngineTorqueMultiplier(veh, var1)
if var1 < 0.98 then
DrawRect(UITC.x - 0.01 ,UITC.y + 0.04 ,0.01,0.01,0,255,0,255)
end
if var1 < 0.7 then
DrawRect(UITC.x - 0.00 ,UITC.y + 0.04 ,0.01,0.01,100,200,0,255)
end
if var1 < 0.5 then
DrawRect(UITC.x + 0.01 ,UITC.y + 0.04 ,0.01,0.01,150,200,0,255)
end
if var1 < 0.3 then
DrawRect(UITC.x + 0.02 ,UITC.y + 0.04 ,0.01,0.01,150,100,0,255)
end
if var1 < 0.2 then
DrawRect(UITC.x + 0.03 ,UITC.y + 0.04 ,0.01,0.01,233,0,0,255)
end
else
var1 = 1.0
SetVehicleEngineTorqueMultiplier(veh, var1)
end

end
drawTxta(UITC.x + 0.20 ,UITC.y + 0.0 , 1.0,1.0,0.55,""..oldvalue.."", 255,50,0,255)
drawTxta(UITC.x + 0.10 ,UITC.y + 0.0 , 1.0,1.0,0.55,""..newvalue5.."", 255,50,0,255)
drawTxta(UITC.x - 0.1 ,UITC.y + 0.0 , 1.0,1.0,0.55,""..var1.."", 255,50,0,255)
drawTxta(UITC.x - 0.0 ,UITC.y + 0.0 , 1.0,1.0,0.55,"~w~TC ~g~ON", 255,50,0,255)
drawTxtb(UITC.x - 0.01 ,UITC.y + 0.041 , 1.0,1.0,0.27,"By DOJSRC", 255,255,255,255)
if IsControlJustPressed(0,Config.TCkey) or IsControlJustPressed(0,Config.TCkey) then
						SetVehicleMaxSpeed(veh,300.0)
tc = false
elseif IsPedInAnyVehicle(playerped,true) == false then
tc = false
end

until tc == false
SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',oldvalue)
tc = false
Wait(200)
end
end

function Cruse()
	if cruse == false then
		cruse = true
		local playerped = PlayerPedId()
		local veh =	GetVehiclePedIsIn(playerped, false)
		local vel = GetVehicleWheelSpeed(veh, 1)

		if vel > Config.Minspeed and vel < Config.Maxspeed then
			local speed = vel * 2.237
			repeat
				Wait(0)
				local vel2 = GetVehicleWheelSpeed(veh, 1)
				if vel2 < 0.001 then
					vel2 = 0.01
				end

				local diff  = vel + 0.2 - vel2
				local throttle = 0.2
				if diff  > 1.0 then
					throttle = 1.0
				else
					throttle = diff
				end

				if not IsControlPressed(0, 76) and throttle > 0.01 then
					SetControlNormal(0, 71, throttle)
				end

				if throttle < 0.001 then
					throttle = 0.0
				end

				local curspeed = GetVehicleWheelSpeed(veh, 1) * 2.237
				speed = vel * 2.237
				drawTxta(UI.x - 0.55, UI.y + 0.25, 0.45, "~w~Target Speed = " ..(round(speed,1)).. " MPH", 255, 50, 0, 255)
				drawTxta(UI.x - 0.55, UI.y + 0.27, 0.45, "~w~Current speed = " ..round(curspeed,1).. " MPH", 255, 50, 0, 255)
				drawTxta(UI.x - 0.55, UI.y + 0.3, 0.45, "~w~Throttle % = " ..round((throttle*100)), 255, 50, 0, 255)
				if Config.Watermark then drawTxtb(UITC.x - 0.01, UITC.y + 0.041, 0.27, "By DOJSRC", 255, 255, 255, 255) end

				local sr = toint((throttle*255)) - 10
				local sg = 255 - sr + 10
				sg = toint(sg)

				if Config.OnScreenText then DrawRect(UI.x - 0.51, UI.y + 0.34, throttle/12, 0.01, sr, sg, 0, 255) end
				if IsControlPressed(0, Config.CCkey) and GetVehicleWheelSpeed(veh,1) < Config.Maxspeed then
					vel = GetVehicleWheelSpeed(veh,1)
				end

				if IsControlJustPressed(0, 8) or IsControlJustPressed(0, Config.CCkey) then
					SetVehicleMaxSpeed(veh, 300.0)
					cruse = false
				end
			until cruse == false

			cruse = false
			Wait(200)
		else
			cruse = true
		end
	end
end

function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    if num >= 0 then return math.floor(num * mult + 0.5) / mult
    else return math.ceil(num * mult - 0.5) / mult end
end

function toint(n)
    local s = tostring(n)
    local i, j = s:find('%.')
    if i then
        return tonumber(s:sub(1, i-1))
    else
        return n
    end
end


function drawTxta(x, y, scale, text, r, g, b, a)
	if Config.OnScreenText then
		SetTextFont(4)
		SetTextProportional(0)
		SetTextScale(scale, scale)
		SetTextColour(r, g, b, a)
		SetTextDropShadow(0, 0, 0, 0,255)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		AddTextComponentString(text)
		DrawText(x, y)
	end
end

function drawTxtb(x, y, scale, text, r, g, b, a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end
