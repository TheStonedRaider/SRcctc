

tc = false
Citizen.CreateThread(function()
if Config.TCon == true then
	while true do
		Wait(20)
		playerped = GetPlayerPed(-1)
		if IsPedSittingInAnyVehicle(playerped) then 
			local veh =	GetVehiclePedIsIn(playerped,false)
			if playerped == GetPedInVehicleSeat(veh,-1) then
				if IsControlPressed(0,Config.TCkey) then
					if tc == true then						
						tc = false
						Wait(0)
						playerped = GetPlayerPed(-1)
						local veh =	GetVehiclePedIsIn(playerped,false)
						--vel =		GetEntityVelocity(veh)
						SetVehicleMaxSpeed(veh,300.0)
						else
						--print"startingTC"
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


cruse = false
Citizen.CreateThread(function()
if Config.TCon == true then
	while true do
		Wait(20)
		playerped = GetPlayerPed(-1)
		if IsPedSittingInAnyVehicle(playerped) then 
			local veh =	GetVehiclePedIsIn(playerped,false)
			if playerped == GetPedInVehicleSeat(veh,-1) then
				if IsControlPressed(0,Config.CCkey) then
					if cruse == true then						
						cruse = false						
						playerped = GetPlayerPed(-1)
						local veh =	GetVehiclePedIsIn(playerped,false)
						SetVehicleMaxSpeed(veh,300.0)
						else
						cruse = true
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
local UITC = {

	x =  0.12 ,	-- Base Screen Coords 	+ 	 x
	y = 0.740 ,	-- Base Screen Coords 	+ 	-y

}
local UI = {

	x =  0.570 ,	-- Base Screen Coords 	+ 	 x
	y = 0.440 ,	-- Base Screen Coords 	+ 	-y

}

function TC()
if tc == false then
tc = true
playerped = GetPlayerPed(-1)
		local veh =	GetVehiclePedIsIn(playerped,false)
		local drivebias = GetVehicleHandlingFloat(veh,"CHandlingData", "fDriveBiasFront")
local ped = GetPlayerPed(-1)
local vehicle = GetVehiclePedIsIn(ped)
oldvalue = GetVehicleHandlingFloat(vehicle,'CHandlingData','fLowSpeedTractionLossMult')		
newvalue2 = oldvalue / 1.6	
newvalue3 = oldvalue / 1.5
newvalue4 = oldvalue / 1.4	
newvalue5 = oldvalue / 1.2	
		repeat
		Wait(0)
		
		
		
		
		
		
wh1 = GetVehicleWheelSpeed(veh,0)
wh1 = (GetVehicleWheelSpeed(veh,1) + wh1) / 2 
wh2 = (GetVehicleWheelSpeed(veh,1) + wh1) / 2 
wh3 = GetVehicleWheelSpeed(veh,2)
wh4 = GetVehicleWheelSpeed(veh,3) 
throttle = 0.0 
wheelave = (GetVehicleWheelSpeed(veh,0) + GetVehicleWheelSpeed(veh,1) + GetVehicleWheelSpeed(veh,2) + GetVehicleWheelSpeed(veh,3)) / 4

DrawRect(UITC.x + 0.01 ,UITC.y + 0.04 ,0.04,0.01,0,0,0,255)
steerang = GetVehicleSteeringAngle(veh)
if steerang > 30 or steerang < -30.0 then
mod1 = 1.3
mod2 = 1.9
else
mod1 = 0.5
mod2 = 0.7
end
SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',oldvalue)	
SetVehicleEngineTorqueMultiplier(veh, 1.0)
	if wh1 > (wheelave + 1.7 + mod1) then
SetVehicleEngineTorqueMultiplier(veh, 0.2)
SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',newvalue5)
DrawRect(UITC.x - 0.005 ,UITC.y + 0.04 ,0.01,0.01,233,0,0,255)
elseif  wh2 > (wheelave + 1.7 + mod1) then 
SetVehicleEngineTorqueMultiplier(veh, 0.2)
SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',newvalue5)
DrawRect(UITC.x - 0.005 ,UITC.y + 0.04 ,0.01,0.01,230,0,0,255)
elseif  wh3 > (wheelave + 1.7 + mod1) then
SetVehicleEngineTorqueMultiplier(veh, 0.2)
SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',newvalue5)
DrawRect(UITC.x - 0.005 ,UITC.y + 0.04 ,0.01,0.01,230,0,0,255)
elseif  wh4 > (wheelave + 1.7 + mod1) then
SetVehicleEngineTorqueMultiplier(veh, 0.2)
SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',newvalue5)
DrawRect(UITC.x - 0.005 ,UITC.y + 0.04 ,0.01,0.01,230,0,0,255)

elseif wh1 > (wheelave + 1.2 + mod1) then
SetVehicleEngineTorqueMultiplier(veh, 0.4)
SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',newvalue4)
DrawRect(UITC.x + 0.005 ,UITC.y + 0.04 ,0.01,0.01,200,86,0,255)
elseif  wh2 > (wheelave + 1.2 + mod1) then 
SetVehicleEngineTorqueMultiplier(veh, 0.4)
SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',newvalue4)
DrawRect(UITC.x + 0.005 ,UITC.y + 0.04 ,0.01,0.01,200,86,0,255)
elseif  wh3 > (wheelave + 1.2 + mod1) then
SetVehicleEngineTorqueMultiplier(veh, 0.4)
SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',newvalue4)
DrawRect(UITC.x + 0.005 ,UITC.y + 0.04 ,0.01,0.01,200,86,0,255)
elseif  wh4 > (wheelave + 1.2 + mod1) then
SetVehicleEngineTorqueMultiplier(veh, 0.4)
SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',newvalue4)
DrawRect(UITC.x + 0.005 ,UITC.y + 0.04 ,0.01,0.01,200,86,0,255)

elseif wh1 > (wheelave + mod2) then
SetVehicleEngineTorqueMultiplier(veh, 0.5)
SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',newvalue3)
DrawRect(UITC.x + 0.015 ,UITC.y + 0.04 ,0.01,0.01,200,200,0,255)
elseif  wh2 > (wheelave + mod2) then 
SetVehicleEngineTorqueMultiplier(veh, 0.5)
SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',newvalue3)
DrawRect(UITC.x + 0.015 ,UITC.y + 0.04 ,0.01,0.01,200,200,0,255)
elseif  wh3 > (wheelave + mod2) then
SetVehicleEngineTorqueMultiplier(veh, 0.5)
SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',newvalue3)
DrawRect(UITC.x + 0.015 ,UITC.y + 0.04 ,0.01,0.01,200,200,0,255)
elseif  wh4 > (wheelave + mod2) then
SetVehicleEngineTorqueMultiplier(veh, 0.5)
SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',newvalue3)
DrawRect(UITC.x + 0.015 ,UITC.y + 0.04 ,0.01,0.01,200,200,0,255)

elseif wh1 > (wheelave + mod1) then
SetVehicleEngineTorqueMultiplier(veh, 0.8)
SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',newvalue2)
DrawRect(UITC.x + 0.025 ,UITC.y + 0.04 ,0.01,0.01,0,255,0,255)
elseif  wh2 > (wheelave + mod1) then 
SetVehicleEngineTorqueMultiplier(veh, 0.8)
SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',newvalue2)
DisableControlAction(0,71,true)
DrawRect(UITC.x + 0.025 ,UITC.y + 0.04 ,0.01,0.01,0,255,0,255)
elseif  wh3 > (wheelave + mod1) then
SetVehicleEngineTorqueMultiplier(veh, 0.8)
SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',newvalue2)
DrawRect(UITC.x + 0.025 ,UITC.y + 0.04 ,0.01,0.01,0,255,0,255)
elseif  wh4 > (wheelave + mod1) then
SetVehicleEngineTorqueMultiplier(veh, 0.8)
SetVehicleHandlingField(vehicle,'CHandlingData','fLowSpeedTractionLossMult',newvalue2)
DrawRect(UITC.x + 0.025 ,UITC.y + 0.04 ,0.01,0.01,0,255,0,255)
end

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
playerped = GetPlayerPed(-1)
		local veh =	GetVehiclePedIsIn(playerped,false)
vel = GetVehicleWheelSpeed(veh,1) 
if vel > Config.Minspeed and vel < Config.Maxspeed then
speed = vel * 2.237
repeat 
Wait(0)
vel2 = GetVehicleWheelSpeed(veh,1) 
if vel2 < 0.001 then
vel2 = 0.01
end 
diff  = vel + 0.2 - vel2
--print(diff)
throttle = 0.2
if diff  > 1.0 then
throttle = 1.0
else
throttle = diff 
end 
--print(throttle)
if not IsControlPressed(0,76) and throttle > 0.01 then
SetControlNormal(0,71,throttle)
end
if throttle < 0.001 then
throttle = 0.0
end
curspeed = GetVehicleWheelSpeed(veh,1) * 2.237
speed = vel * 2.237
drawTxta(UI.x - 0.55 ,UI.y + 0.25 , 1.0,1.0,0.45,"~w~Target Speed = "..(round(speed,1)).." MPH", 255,50,0,255)
drawTxta(UI.x - 0.55 ,UI.y + 0.27 , 1.0,1.0,0.45,"~w~Current speed = "..round(curspeed,1).." MPH", 255,50,0,255)
drawTxta(UI.x - 0.55 ,UI.y + 0.3 , 1.0,1.0,0.45,"~w~Throttle % = "..round((throttle*100)).."", 255,50,0,255)
drawTxtb(UITC.x - 0.01 ,UITC.y + 0.041 , 1.0,1.0,0.27,"By DOJSRC", 255,255,255,255)
sr = toint((throttle*255)) - 10
sg = 255 - sr + 10 
sg = toint(sg)
DrawRect(UI.x - 0.51 ,UI.y + 0.34 ,throttle/12,0.01,sr,sg,0,255)
--DrawRect(UI.x + 0.0,UI.y - 0.0, 0.04,0.84,0,0,0,255)
if IsControlPressed(0,Config.CCkey) and GetVehicleWheelSpeed(veh,1) < Config.Maxspeed then
--print"newvel"
vel = GetVehicleWheelSpeed(veh,1)
end
if IsControlJustPressed(0,8) or IsControlJustPressed(0,Config.CCkey) then
						SetVehicleMaxSpeed(veh,300.0)
cruse = false
end

until cruse == false
else
cruse = false
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
	function drawTxta(x,y ,width,height,scale, text, r,g,b,a)
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
	function drawTxtb(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end