local res = external_profile("Config/Input/Aircrafts/common_keyboard_binding.lua")
local cockpit = folder.."../../../Cockpit/"
dofile(cockpit.."devices.lua")
dofile(cockpit.."command_defs.lua")

join(res.keyCommands,{
    
	--HOTAS
	-- A. HOTAS Stick
	{combos = {{key = 'Space'}}, down = iCommandPlaneFire, up = iCommandPlaneFireOff, name = _('Weapons FIRE/Bomb Release'), category = _('HOTAS')},
	{combos = {{key = 'A', reformers = {'LAlt'}}},   down = iCommandPlaneAutopilotOverrideOn,   up = iCommandPlaneAutopilotOverrideOff,      name = _('Autopilot Standby Mode'),                     category = _('HOTAS')},
	{combos = {{key = 'A', reformers = {'LShift'}}}, down = iCommandPlane_HOTAS_PinkySwitchAft, up = iCommandPlane_HOTAS_PinkySwitchForward, name = _('Autopilot Disconnect/Exceed Elastic Limit'),  category = _('HOTAS')},
	{combos = {{key = 'S'}},     down = iCommandPlane_HOTAS_BoatSwitchAft, up = iCommandPlane_HOTAS_BoatSwitchForward, name = _('Nosewheel Steering/IFF Interrogate'), category = _('HOTAS')},
	
    {down = iCommandPlaneModeVS,      name = _('Special Modes FWD'), category = _('HOTAS')},
    {down = iCommandPlaneModeHelmet,  name = _('Special Modes AFT'), category = _('HOTAS')},
	{combos = {{key = 'Back'}},  down = iCommandRefusalTWS, name = _('Target Unlock/Special Modes Deselect'), category = _('HOTAS')},
	
	{combos = {{key = 'Enter'}},      down = iCommandPlaneChangeLock, name = _('STT/TWS Toggle (Target Lock)'), category = _('HOTAS')},
	
	{combos = {{key = 'S', reformers = {'RCtrl'}}}, pressed = iCommandPlaneTrimUp,    up = iCommandPlaneTrimStop, name = _('Trim UP'),    category = _('HOTAS')},
	{combos = {{key = 'W', reformers = {'RCtrl'}}}, pressed = iCommandPlaneTrimDown,  up = iCommandPlaneTrimStop, name = _('Trim DOWN'),  category = _('HOTAS')},
	{combos = {{key = 'A', reformers = {'RCtrl'}}}, pressed = iCommandPlaneTrimLeft,  up = iCommandPlaneTrimStop, name = _('Trim LEFT'),  category = _('HOTAS')},
	{combos = {{key = 'D', reformers = {'RCtrl'}}}, pressed = iCommandPlaneTrimRight, up = iCommandPlaneTrimStop, name = _('Trim RIGHT'), category = _('HOTAS')},

	{combos = {{key = 'Delete'}}, down = iCommandPlaneDropFlareOnce, name = _('Decoy Program release'), category = _('HOTAS')},
	
	{down = iCommandPlaneCircuitBreaker_12,  name = _('NAV Update/MAGIC unlock'), category = _('HOTAS')},
	
	-- B. HOTAS Throttle
	{combos = {{key = 'C'}}, down = iCommandPlaneModeCannon, name = _('AA Gun SELECT'), category = _('HOTAS')},
	{down = iCommandPlaneModeGrid, name = _('PCA SELECT'),   category = _('HOTAS')},
	{down = iCommandPlaneModeFI0,  name = _('MAGIC SELECT'), category = _('HOTAS')},
	
	{down = iCommandAutoLockOnNearestSurfaceTarget,     name = _('Magic Slave/AG Designate/INS Position Update'), category = _('HOTAS')},
	{combos = {{key = 'Num+', reformers = {'LShift'}}}, down = iCommandPlane_HOTAS_MIC_SwitchUp,    up = iCommandPlane_HOTAS_MIC_SwitchOff, name = _('Main U/VHF Radio SELECT'), category = _('HOTAS')},
	{combos = {{key = 'Num-', reformers = {'LAlt'}}},   down = iCommandPlane_HOTAS_MIC_SwitchDown,  up = iCommandPlane_HOTAS_MIC_SwitchOff, name = _('Aux. UHF Radio SELECT'),   category = _('HOTAS')},
	
	{combos = {{key = 'B'}}, down = iCommandPlaneAirBrake, name = _('Airbrake TOGGLE'),     category = _('HOTAS')},
	{combos = {{key = 'B',   reformers = {'LShift'}}},     down = iCommandPlaneAirBrakeOn,  name = _('Airbrake ON'), category = _('HOTAS')},
	{combos = {{key = 'B',   reformers = {'LCtrl'}}},      down = iCommandPlaneAirBrakeOff, name = _('Airbrake OFF'), category = _('HOTAS')},
	
	{combos = {{key = ';'}}, pressed = iCommandPlaneRadarUp,    up = iCommandPlaneRadarStop, name = _('TDC UP'),     category = _('HOTAS')},
	{combos = {{key = '.'}}, pressed = iCommandPlaneRadarDown,  up = iCommandPlaneRadarStop, name = _('TDC DOWN'),   category = _('HOTAS')},
	{combos = {{key = ','}}, pressed = iCommandPlaneRadarLeft,  up = iCommandPlaneRadarStop, name = _('TDC LEFT'),   category = _('HOTAS')},
	{combos = {{key = '/'}}, pressed = iCommandPlaneRadarRight, up = iCommandPlaneRadarStop, name = _('TDC RIGHT'),  category = _('HOTAS')},
	{down = iCommandPlaneRadarCenter, name = _('TDC CENTER'),        category = _('HOTAS')},
	
	{pressed = iCommandSelecterUp,   up = iCommandSelecterStop, name = _('Radar Antenna UP'),     category = _('HOTAS')},
	{pressed = iCommandSelecterDown, up = iCommandSelecterStop, name = _('Radar Antenna DOWN'),   category = _('HOTAS')},
	{pressed = iCommandSelecterLeft, up = iCommandSelecterStop, name = _('Radar Antenna CENTER'), category = _('HOTAS')},
	
	{combos = {{key = 'Insert'}}, down = iCommandPlaneDropChaffOnce, name = _('Decoy PANIC release'), category = _('HOTAS')},
	{combos = {{key = 'E'}}, down = iCommandActiveJamming, name = _('Jammer ACTIVATE/Standby Toggle'), category = _('HOTAS')},
	{down = iCommandPlaneRotorTipLights, name = _('Police Light Toggle'), category = _('HOTAS')},
	
	-- Weapons Management
	{down = 3249, up = 3249, cockpit_device_id = 6,  value_down = 1, name = _('Selective Jettison ON'), category = _('Weapons Management')},
	{down = 3249, up = 3249, cockpit_device_id = 6,  value_down = 0, name = _('Selective Jettison OFF'), category = _('Weapons Management')},
	{down = 3248, up = 3248, cockpit_device_id = 6,  value_down = 1, name = _('Selective Jettison Safety Cover OPEN'), category = _('Weapons Management')},
	{down = 3248, up = 3248, cockpit_device_id = 6,  value_down = 0, name = _('Selective Jettison Safety Cover CLOSED'), category = _('Weapons Management')},
	{combos = {{key = 'E', reformers = {'LShift'}}}, down = 3409, up = 3409, cockpit_device_id = 6,  value_up = 0, value_down = 1, name = _('Emergency Jettison'), category = _('Weapons Management')},
	{down = 3206, up = 3206, cockpit_device_id = 5, value_down = 0, name = _('Auxiliary Gunsight OFF'), category = _('Weapons Management')},
	{down = 3206, up = 3206, cockpit_device_id = 5, value_down = 1, name = _('Auxiliary Gunsight ON'), category = _('Weapons Management')},
	{combos = {{key = '6', reformers = {'LCtrl'}}}, down = iCommandPlaneAHCPGUNArm, name = _('Gun Arm TOGGLE'), category = _('Weapons Management')},
	{combos = {{key = '0'}}, down = iCommandSwitchMasterArm,   name = _('Master Arm TOGGLE'),   category = _('Weapons Management')},
	{combos = {{key = '1'}}, down = iCommandPlaneLeftMFD_OSB1, name = _('PCA Button 1 SELECT'), category = _('Weapons Management')},
	{combos = {{key = '2'}}, down = iCommandPlaneLeftMFD_OSB2, name = _('PCA Button 2 SELECT'), category = _('Weapons Management')},
	{combos = {{key = '3'}}, down = iCommandPlaneLeftMFD_OSB3, name = _('PCA Button 3 SELECT'), category = _('Weapons Management')},
	{combos = {{key = '4'}}, down = iCommandPlaneLeftMFD_OSB4, name = _('PCA Button 4 SELECT'), category = _('Weapons Management')},
	{combos = {{key = '5'}}, down = iCommandPlaneLeftMFD_OSB5, name = _('PCA Button 5 SELECT'), category = _('Weapons Management')},
	{combos = {{key = '0', reformers = {'LCtrl'}}}, down = iCommandPlaneLeftMFD_OSB6,  name = _('AG Gun  SELECT'),  category = _('Weapons Management')},
	{combos = {{key = '1', reformers = {'LCtrl'}}}, down = iCommandPlaneLeftMFD_OSB7,  name = _('Stores 1 SELECT'), category = _('Weapons Management')},
	{combos = {{key = '2', reformers = {'LCtrl'}}}, down = iCommandPlaneLeftMFD_OSB8,  name = _('Stores 2 SELECT'), category = _('Weapons Management')},
	{combos = {{key = '3', reformers = {'LCtrl'}}}, down = iCommandPlaneLeftMFD_OSB9,  name = _('Stores 3 SELECT'), category = _('Weapons Management')},
	{combos = {{key = '4', reformers = {'LCtrl'}}}, down = iCommandPlaneLeftMFD_OSB10, name = _('Stores 4 SELECT'), category = _('Weapons Management')},
	{combos = {{key = '5', reformers = {'LCtrl'}}}, down = iCommandPlaneLeftMFD_OSB11, name = _('Stores 5 SELECT'), category = _('Weapons Management')},
	{combos = {{key = 'T'}}, down = iCommandPlaneWingtipSmokeOnOff, name = _('Smoke'), category = _('Weapons Management')}, 
    --PPA
    {down = 3275, up = 3275, cockpit_device_id = 6, value_down = -1, value_up = 0, name = _('PPA Test Switch - Test'), category = _('Weapons Management')},
    {down = 3275, up = 3275, cockpit_device_id = 6, value_down = 1, value_up = 0, name = _('PPA Test Switch - Weapon Loadout'), category = _('Weapons Management')},
	
	-- Weapons Preparation
	{down = 3265, up = 3265, cockpit_device_id = 6, value_down = 1,   name = _('Missile Selector: Fire Left 530D First'), category = _('Weapons Preparation')},
	{down = 3265, up = 3265, cockpit_device_id = 6, value_down = 0,   name = _('Missile Selector: Automatic 530D Fire Selection'), category = _('Weapons Preparation')},
	{down = 3265, up = 3265, cockpit_device_id = 6, value_down = -1,  name = _('Missile Selector: Fire Right 530D First'), category = _('Weapons Preparation')},
	{down = 3266, up = 3266, cockpit_device_id = 6, value_down = 0,   name = _('MIS PREP: Super 530D Standby Toggle'), category = _('Weapons Preparation')},
	{down = 3272, up = 3272, cockpit_device_id = 6, value_down = 0,   name = _('MAG PREP: MAGIC II Standby Toggle'), category = _('Weapons Preparation')},
	{down = 3276, up = 3276, cockpit_device_id = 6, value_down = 1,   name = _('Bomb Fuze: INERT'), category = _('Weapons Preparation')},
	{down = 3276, up = 3276, cockpit_device_id = 6, value_down = 0.5, name = _('Bomb Fuze: RET'), category = _('Weapons Preparation')},
	{down = 3276, up = 3276, cockpit_device_id = 6, value_down = 0,   name = _('Bomb Fuze: INST'), category = _('Weapons Preparation')},
	{down = 3277, up = 3277, cockpit_device_id = 6, value_down = 1,   value_up = 0, name = _('Bomb Qty Increase'), category = _('Weapons Preparation')},
	{down = 3277, up = 3277, cockpit_device_id = 6, value_down = -1,  value_up = 0, name = _('Bomb Qty Decrease'), category = _('Weapons Preparation')},
	{down = 3278, up = 3278, cockpit_device_id = 6, value_down = -1,  value_up = 0, name = _('Bomb Release Interval Increase'), category = _('Weapons Preparation')},
	{down = 3278, up = 3278, cockpit_device_id = 6, value_down = 1,   value_up = 0, name = _('Bomb Release Interval Decrease'), category = _('Weapons Preparation')},
	{down = 3279, up = 3279, cockpit_device_id = 6, value_down = 0,   name = _('530D/Rockets/Guns TOT/PAR Firing Mode Toggle'), category = _('Weapons Preparation')},
	
	-- Communications
	{combos = {{key = 'I', reformers = {'LWin'}}}, down = iCommandAWACSTankerBearing, name = _('Request AWACS Available Tanker'), category = _('Communications')},
	{combos = {{key = '\\', reformers = {'RShift'}}, {key = 'M', reformers = {'RShift'}}}, down = iCommandToggleReceiveMode, name = _('Receive Mode'), category = _('Communications')},
    {down = 3446, up = 3446, cockpit_device_id = 19, value_down = 0, name = _('U/VHF Radio OFF'), category = _('Communications')},
    {down = 3446, up = 3446, cockpit_device_id = 19, value_down = .25, name = _('U/VHF Radio ON'), category = _('Communications')},
    {down = 3448, up = 3448, cockpit_device_id = 19, value_down = 1, name = _('U/VHF Guard Mode'), category = _('Communications')},
    {down = 3448, up = 3448, cockpit_device_id = 19, value_down = 0, name = _('U/VHF Manual Mode'), category = _('Communications')},
    {down = 3448, up = 3448, cockpit_device_id = 19, value_down = 0.5, name = _('U/VHF Preset Mode'), category = _('Communications')},

    -- Cheat
	{combos = {{key = 'Home', reformers = {'LWin'}}} , 	down = iCommandEnginesStart, name = _('Start Procedure'), category = _('Cheat')},
    {combos = {{key = 'End', reformers = {'LWin'}}} , 	down = iCommandEnginesStop,  name = _('Stop Procedure'),  category = _('Cheat')},
	
	-- Engine & Fuel
	{down = 3647, up = 3647, cockpit_device_id = 4, value_down = 1,   name = _('Left Fuel Boost Pump ON'), category = _('Engine & Fuel')},
	{down = 3647, up = 3647, cockpit_device_id = 4, value_down = 0,   name = _('Left Fuel Boost Pump OFF'), category = _('Engine & Fuel')},
	{down = 3648, up = 3648, cockpit_device_id = 4, value_down = 1,   name = _('Right Fuel Boost Pump ON'), category = _('Engine & Fuel')},
	{down = 3648, up = 3648, cockpit_device_id = 4, value_down = 0,   name = _('Right Fuel Boost Pump OFF'), category = _('Engine & Fuel')},
    {down = 3651, up = 3651, cockpit_device_id = 7, value_down = 0,   name = _('Fuel Emergency Cutoff Switch Cover CLOSE'), category = _('Engine & Fuel')},
    {down = 3651, up = 3651, cockpit_device_id = 7, value_down = 1,   name = _('Fuel Emergency Cutoff Switch Cover OPEN'), category = _('Engine & Fuel')},
    {down = 3652, up = 3652, cockpit_device_id = 7, value_down = 0,   name = _('Fuel Emergency Cutoff Switch ON'), category = _('Engine & Fuel')},
    {down = 3652, up = 3652, cockpit_device_id = 7, value_down = 1,   name = _('Fuel Emergency Cutoff Switch OFF'), category = _('Engine & Fuel')},
	{down = 3645, up = 3645, cockpit_device_id = 7, value_down = 0,   name = _('Start Button Safety Cover CLOSED'), category = _('Engine & Fuel')},
	{down = 3645, up = 3645, cockpit_device_id = 7, value_down = 1,   name = _('Start Button Safety Cover OPEN'), category = _('Engine & Fuel')},
	{down = 3646, up = 3646, cockpit_device_id = 7, value_down = 1,   name = _('Starter Fuel Pump ON'), category = _('Engine & Fuel')},
	{down = 3646, up = 3646, cockpit_device_id = 7, value_down = 0,   name = _('Starter Fuel Pump OFF'), category = _('Engine & Fuel')},
	{down = 3650, up = 3650, cockpit_device_id = 7, value_down = 1,   name = _('Ignition Selector Switch RIGHT'), category = _('Engine & Fuel')},
	{down = 3650, up = 3650, cockpit_device_id = 7, value_down = 0.5, name = _('Ignition Selector Switch LEFT'), category = _('Engine & Fuel')},
	{down = 3650, up = 3650, cockpit_device_id = 7, value_down = 0,   name = _('Ignition Selector Switch OFF'), category = _('Engine & Fuel')},
	{down = 3468, up = 3468, cockpit_device_id = 7, value_down = 0,   name = _('In-Flight Start Switch OFF'), category = _('Engine & Fuel')},
	{down = 3468, up = 3468, cockpit_device_id = 7, value_down = 1,   name = _('In-Flight Start Switch ON'), category = _('Engine & Fuel')},
    {down = 3193, up = 3193, cockpit_device_id = 7, value_down = 0,   name = _('Air Refuel Transfer Switch OFF '), category = _('Engine & Fuel')},
	{down = 3193, up = 3193, cockpit_device_id = 7, value_down = 0.5, name = _('Air Refuel Transfer Switch ON (DAY)'), category = _('Engine & Fuel')},
    {down = 3193, up = 3193, cockpit_device_id = 7, value_down = 1,   name = _('Air Refuel Transfer Switch ON (NIGHT)'), category = _('Engine & Fuel')},
    {down = 3471, up = 3471, cockpit_device_id = 4, value_down = 0,   name = _('Afterburner Cutoff Switch Cover CLOSE'), category = _('Engine & Fuel')},
    {down = 3471, up = 3471, cockpit_device_id = 4, value_down = 1,   name = _('Afterburner Cutoff Switch Cover OPEN'), category = _('Engine & Fuel')},
    {down = 3472, up = 3472, cockpit_device_id = 4, value_down = 0,   name = _('Afterburner Cutoff Switch OFF'), category = _('Engine & Fuel')},
    {down = 3472, up = 3472, cockpit_device_id = 4, value_down = 1,   name = _('Afterburner Cutoff Switch ON'), category = _('Engine & Fuel')},
	{combos = {{key = 'Home', reformers = {'RShift'}}},  down = iCommandLeftEngineStart, name = _('Engines START'), category = _('Engine & Fuel')},
	{combos = {{key = 'End', reformers = {'RShift'}}},   down = iCommandLeftEngineStop,  name = _('Engines STOP'), category = _('Engine & Fuel')},
	{combos = {{key = 'R'}}, down = iCommandPlaneFuelOn, up   = iCommandPlaneFuelOff,    name = _('Fuel Dump START'), category = _('Engine & Fuel')},
	
	-- Flight Control
	{combos = {{key = 'Up'}},    pressed = iCommandPlaneUpStart,    up = iCommandPlaneUpStop,    name = _('Aircraft Pitch DOWN'), category = _('Flight Control')},
	{combos = {{key = 'Down'}},  pressed = iCommandPlaneDownStart,  up = iCommandPlaneDownStop,  name = _('Aircraft Pitch UP'),   category = _('Flight Control')},
	{combos = {{key = 'Left'}},  pressed = iCommandPlaneLeftStart,  up = iCommandPlaneLeftStop,  name = _('Aircraft Bank LEFT'),  category = _('Flight Control')},
	{combos = {{key = 'Right'}}, pressed = iCommandPlaneRightStart, up = iCommandPlaneRightStop, name = _('Aircraft Bank RIGHT'), category = _('Flight Control')},
	{combos = {{key = 'Z'}}, pressed = iCommandPlaneLeftRudderStart,  up = iCommandPlaneLeftRudderStop,  name = _('Aircraft Rudder LEFT'),  category = _('Flight Control')},
	{combos = {{key = 'X'}}, pressed = iCommandPlaneRightRudderStart, up = iCommandPlaneRightRudderStop, name = _('Aircraft Rudder RIGHT'), category = _('Flight Control')},
	{combos = {{key = 'Num+'}}, pressed = iCommandThrottleIncrease, up = iCommandThrottleStop,  name = _('Throttle UP'),   category = _('Flight Control')},
	{combos = {{key = 'Num-'}}, pressed = iCommandThrottleDecrease, up = iCommandThrottleStop,  name = _('Throttle DOWN'), category = _('Flight Control')},
	{combos = {{key = 'Z', reformers = {'RCtrl'}}}, pressed = iCommandPlaneTrimLeftRudder,  up = iCommandPlaneTrimStop, name = _('Trim RUDDER LEFT'),  category = _('Flight Control')},
	{combos = {{key = 'X', reformers = {'RCtrl'}}}, pressed = iCommandPlaneTrimRightRudder, up = iCommandPlaneTrimStop, name = _('Trim RUDDER RIGHT'), category = _('Flight Control')},
	{down = 3462, up = 3462, cockpit_device_id = 14, value_down = -1, name = _('Slats RETRACT'), category = _('Flight Control')},
	{down = 3462, up = 3462, cockpit_device_id = 14, value_down = 0,  name = _('Slats AUTO'),    category = _('Flight Control')},
	{down = 3462, up = 3462, cockpit_device_id = 14, value_down = 1,  name = _('Slats EXTEND'),  category = _('Flight Control')},
	{down = 3420, up = 3420, cockpit_device_id = 3, value_down = 0,   name = _('FBW Gain Cover CLOSED'), category = _('Flight Control')},
	{down = 3420, up = 3420, cockpit_device_id = 3, value_down = 1,   name = _('FBW Gain Cover OPEN'),   category = _('Flight Control')},
	{down = 3421, up = 3421, cockpit_device_id = 3, value_down = 0,   name = _('FBW Gain NORM'),         category = _('Flight Control')},
	{down = 3421, up = 3421, cockpit_device_id = 3, value_down = 1,   name = _('FBW Gain EMER'),         category = _('Flight Control')},
	{combos = {{key = 'G', reformers = {'LCtrl','LShift'}}}, down = iCommandPlaneCobra,             name = _('FBW G-Limiter Mode TOGGLE'), category = _('Flight Control')},
	{combos = {{key = 'V', reformers = {'LCtrl','LShift'}}}, down = iCommandPlaneEmerFlightControl, name = _('FBW Spin Switch TOGGLE'),    category = _('Flight Control')},
    {combos = {{key = 'P'}}, down = iCommandPlaneParachute,  name = _('Drag Chute DEPLOY'),         category = _('Flight Control')},
	
	-- External Illumination
	{down = 3449, up = 3449, cockpit_device_id = 16, value_down = 0, name = _('Police Lights Disabled'), category = _('External Illumination')},
	{down = 3449, up = 3449, cockpit_device_id = 16, value_down = 1, name = _('Police Lights Enabled'),  category = _('External Illumination')},
	{combos = {{key = 'L', reformers = {'RAlt'}}},           down = iCommandPlaneHeadLightOnOff,      name = _('Landing Lights TOGGLE'),        category = _('External Illumination')},
	{combos = {{key = 'L', reformers = {'RCtrl'}}},          down = iCommandPlaneFormationLights,     name = _('Formation Lights TOGGLE'),      category = _('External Illumination')},
	{combos = {{key = 'L', reformers = {'RAlt','RCtrl'}}},   down = iCommandPlaneLightsOnOff,         name = _('Navigation Lights TOGGLE'),     category = _('External Illumination')},
	{combos = {{key = 'L', reformers = {'RShift','RCtrl'}}}, down = iCommandPlaneAntiCollisionLights, name = _('Anti-Collision Lights TOGGLE'), category = _('External Illumination')},
	{down = 3450, up = 3450, cockpit_device_id = 16, value_down = 0,   name = _('Landing Lights OFF'),     category = _('External Illumination')},
	{down = 3450, up = 3450, cockpit_device_id = 16, value_down = 0.5, name = _('Landing Lights TAXI'),    category = _('External Illumination')},
	{down = 3450, up = 3450, cockpit_device_id = 16, value_down = 1,   name = _('Landing Lights LANDING'), category = _('External Illumination')},
	{down = 3452, up = 3452, cockpit_device_id = 16, value_down = 0,   name = _('Refuel Lights Disabled'), category = _('External Illumination')},
	{down = 3452, up = 3452, cockpit_device_id = 16, value_down = 1,   name = _('Refuel Lights Enabled'),  category = _('External Illumination')},
	{down = 3453, up = 3453, cockpit_device_id = 16, value_down = 0,   name = _('Anti-Collision Lights OFF'),    category = _('External Illumination')},
    {down = 3453, up = 3453, cockpit_device_id = 16, value_down = 0.5, name = _('Anti-Collision Lights DIM'),    category = _('External Illumination')},
	{down = 3453, up = 3453, cockpit_device_id = 16, value_down = 1,   name = _('Anti-Collision Lights BRIGHT'), category = _('External Illumination')},
	{down = 3454, up = 3454, cockpit_device_id = 16, value_down = 0,   name = _('Navigation Lights OFF'),    category = _('External Illumination')},
    {down = 3454, up = 3454, cockpit_device_id = 16, value_down = 0.5, name = _('Navigation Lights DIM'),    category = _('External Illumination')},
	{down = 3454, up = 3454, cockpit_device_id = 16, value_down = 1,   name = _('Navigation Lights BRIGHT'), category = _('External Illumination')},
	{down = 3455, up = 3455, cockpit_device_id = 16, value_down = 0,   name = _('Formation Lights OFF'),     category = _('External Illumination')},
    {down = 3455, up = 3455, cockpit_device_id = 16, value_down = 0.5, name = _('Formation Lights DIM'),     category = _('External Illumination')},
	{down = 3455, up = 3455, cockpit_device_id = 16, value_down = 1,   name = _('Formation Lights BRIGHT'),  category = _('External Illumination')},
	
	-- Sensors
	--Radar
	{combos = {{key = '-'}}, down = iCommandDecreaseRadarScanArea, name = _('Radar Range DECREASE'), category = _('Sensors')},
	{combos = {{key = '='}}, down = iCommandIncreaseRadarScanArea, name = _('Radar Range INCREASE'), category = _('Sensors')},
	
	{down = iCommandHelicopter_PPR_button_B_up, name = _('PRF Selector Low -> Int -> High'), category = _('Sensors')},
	{down = iCommandHelicopter_PPR_button_B,    name = _('PRF Selector High -> Int -> Low'), category = _('Sensors')},
	{down = 3109, up = 3109, cockpit_device_id = 11, value_down = -1, name = _('PRF Selector Low'), category = _('Sensors')},
	{down = 3109, up = 3109, cockpit_device_id = 11, value_down = 0,  name = _('PRF Selector Int'), category = _('Sensors')},
	{down = 3109, up = 3109, cockpit_device_id = 11, value_down = 1,  name = _('PRF Selector High'), category = _('Sensors')},
	
	{down = 3506, up = 3506, cockpit_device_id = 11, value_down = 0, name = _('Radar Azimuth WIDE'), category = _('Sensors')},
	{down = 3506, up = 3506, cockpit_device_id = 11, value_down = .5, name = _('Radar Azimuth MIDDLE'), category = _('Sensors')},
	{down = 3506, up = 3506, cockpit_device_id = 11, value_down = 1, name = _('Radar Azimuth NARROW'), category = _('Sensors')},
	
	{down = 3502, up = 3502, cockpit_device_id = 11, value_down = 0, name = _('Radar Scan 4-LINE'), category = _('Sensors')},
	{down = 3502, up = 3502, cockpit_device_id = 11, value_down = .5, name = _('Radar Scan 2-LINE'), category = _('Sensors')},
	{down = 3502, up = 3502, cockpit_device_id = 11, value_down = 1, name = _('Radar Scan 1-LINE'), category = _('Sensors')},
	
	{down = 3486, up = 3486, cockpit_device_id = 11, value_down = 0, name = _('Radar OFF'), category = _('Sensors')},
	{down = 3486, up = 3486, cockpit_device_id = 11, value_down = .33, name = _('Radar WARM UP'), category = _('Sensors')},
	{down = 3486, up = 3486, cockpit_device_id = 11, value_down = .67, name = _('Radar STANDBY'), category = _('Sensors')},
	{down = 3486, up = 3486, cockpit_device_id = 11, value_down = 1, name = _('Radar ON'), category = _('Sensors')},
	
	{down = 3499, up = 3499, cockpit_device_id = 11, value_down = 0, name = _('Radar PPI Mode (Radial Top-Down)'), category = _('Sensors')},
	{down = 3499, up = 3499, cockpit_device_id = 11, value_down = 1, name = _('Radar B-Scope Mode (Square Projection)'), category = _('Sensors')},
	
	{down = 3710, up = 3710, cockpit_device_id = 11, value_down = 0, name = _('TDC Mode Switch S'), category = _('Sensors')},
	{down = 3710, up = 3710, cockpit_device_id = 11, value_down = 1, name = _('TDC Mode Switch Z'), category = _('Sensors')},

	--Radar IFF
	{down = 3598, up = 3598, cockpit_device_id = 11, value_down = 0,   name = _('Radar IFF Mode 1'),   category = _('Sensors')},
	{down = 3598, up = 3598, cockpit_device_id = 11, value_down = 0.2, name = _('Radar IFF Mode 4'),   category = _('Sensors')},
	{down = 3598, up = 3598, cockpit_device_id = 11, value_down = 0.4, name = _('Radar IFF Mode 3/2'), category = _('Sensors')},
	{down = 3598, up = 3598, cockpit_device_id = 11, value_down = 0.6, name = _('Radar IFF Mode 3/3'), category = _('Sensors')},
	{down = 3598, up = 3598, cockpit_device_id = 11, value_down = 0.8, name = _('Radar IFF Mode 3/4'), category = _('Sensors')},
	{down = 3598, up = 3598, cockpit_device_id = 11, value_down = 1,   name = _('Radar IFF Mode 2'),   category = _('Sensors')},
	{down = 3599, up = 3599, cockpit_device_id = 11, value_down = 0,   name = _('Radar IFF L Selector'), category = _('Sensors')},
	{down = 3599, up = 3599, cockpit_device_id = 11, value_down = 1,   name = _('Radar IFF R Selector'), category = _('Sensors')},
	{down = 3600, up = 3600, cockpit_device_id = 11, value_down = 0,   name = _('Radar IFF OFF'),     category = _('Sensors')},
	{down = 3600, up = 3600, cockpit_device_id = 11, value_down = 0.5, name = _('Radar IFF SECTOR'), category = _('Sensors')},
	{down = 3600, up = 3600, cockpit_device_id = 11, value_down = 1,   name = _('Radar IFF CONT'),   category = _('Sensors')},
	
	--RWR
	{down = 3607, up = 3607, cockpit_device_id = 13, value_down = 0,   name = _('RWR OFF'),  category = _('Sensors')},
    {down = 3607, up = 3607, cockpit_device_id = 13, value_down = 0.5, name = _('RWR ON'),   category = _('Sensors')},
    {down = 3607, up = 3607, cockpit_device_id = 13, value_down = 1,   name = _('RWR TEST'), category = _('Sensors')},
	
	--D2M
	{down = 3608, up = 3608, cockpit_device_id = 28, value_down = 0,   name = _('D2M OFF'),  category = _('Sensors')},
    {down = 3608, up = 3608, cockpit_device_id = 28, value_down = 0.5, name = _('D2M ON'),   category = _('Sensors')},
    {down = 3608, up = 3608, cockpit_device_id = 28, value_down = 1,   name = _('D2M TEST'), category = _('Sensors')},
	
	--RADALT
    {down = 3205, up = 3205, cockpit_device_id = 5, value_down = 0,   name = _('Radar Altimeter OFF'), category = _('Sensors')},
    {down = 3205, up = 3205, cockpit_device_id = 5, value_down = 0.5, name = _('Radar Altimeter ON'), category = _('Sensors')},
    {down = 3205, up = 3205, cockpit_device_id = 5, value_down = 1,   name = _('Radar Altimeter TEST'), category = _('Sensors')},
	
	-- Countermeasures
	-- DECOYS
	{down = iCommandPlaneCMDChangeRippleQuantity,    value_down = 0.1, name = _('Decoy Release Program Knob Up'),   category = _('Countermeasures')},
	{down = iCommandPlaneCMDChangeRippleQuantityOff, value_down = 0.1, name = _('Decoy Release Program Knob Down'), category = _('Countermeasures')},
	{down = 3609, up = 3609, cockpit_device_id = 13, value_down = 0,   name = _('Decoy Release Mode Manual'),    category = _('Countermeasures')},
    {down = 3609, up = 3609, cockpit_device_id = 13, value_down = 0.5, name = _('Decoy Release Mode Semi-Auto'), category = _('Countermeasures')},
    {down = 3609, up = 3609, cockpit_device_id = 13, value_down = 1,   name = _('Decoy Release Mode Automatic'), category = _('Countermeasures')},
	{down = 3610, up = 3610, cockpit_device_id = 13, value_down = 0,   name = _('Decoy Release Program OFF'), category = _('Countermeasures')},
	{down = 3610, up = 3610, cockpit_device_id = 13, value_down = 0.1, name = _('Decoy Release Program 01'),  category = _('Countermeasures')},
	{down = 3610, up = 3610, cockpit_device_id = 13, value_down = 0.2, name = _('Decoy Release Program 02'),  category = _('Countermeasures')},
	{down = 3610, up = 3610, cockpit_device_id = 13, value_down = 0.3, name = _('Decoy Release Program 03'),  category = _('Countermeasures')},
	{down = 3610, up = 3610, cockpit_device_id = 13, value_down = 0.4, name = _('Decoy Release Program 04'),  category = _('Countermeasures')},
	{down = 3610, up = 3610, cockpit_device_id = 13, value_down = 0.5, name = _('Decoy Release Program 05'),  category = _('Countermeasures')},
	{down = 3610, up = 3610, cockpit_device_id = 13, value_down = 0.6, name = _('Decoy Release Program 06'),  category = _('Countermeasures')},
	{down = 3610, up = 3610, cockpit_device_id = 13, value_down = 0.7, name = _('Decoy Release Program 07'),  category = _('Countermeasures')},
	{down = 3610, up = 3610, cockpit_device_id = 13, value_down = 0.8, name = _('Decoy Release Program 08'),  category = _('Countermeasures')},
	{down = 3610, up = 3610, cockpit_device_id = 13, value_down = 0.9, name = _('Decoy Release Program 09'),  category = _('Countermeasures')},
	{down = 3610, up = 3610, cockpit_device_id = 13, value_down = 1,   name = _('Decoy Release Program 10'),  category = _('Countermeasures')},
	
	-- CM BOX
	{down = 3194, up = 3194, cockpit_device_id = 13, value_down = 0,   name = _('CM Box OFF'),  category = _('Countermeasures')},
	{down = 3194, up = 3194, cockpit_device_id = 13, value_down = 0.5, name = _('CM Box ON'),   category = _('Countermeasures')},
	{down = 3194, up = 3194, cockpit_device_id = 13, value_down = 1,   name = _('CM Box AUTO'), category = _('Countermeasures')},
	{down = 3195, up = 3195, cockpit_device_id = 13, value_down = 0,   name = _('CM Box C/C'),  category = _('Countermeasures')},
	{down = 3195, up = 3195, cockpit_device_id = 13, value_down = 1,   name = _('CM Box PTF'),  category = _('Countermeasures')},
	
	-- JAMMER
	{down = 3606, up = 3606, cockpit_device_id = 13, value_down = 0,   name = _('Jammer OFF'),  category = _('Countermeasures')},
	{down = 3606, up = 3606, cockpit_device_id = 13, value_down = 0.5, name = _('Jammer ON'),   category = _('Countermeasures')},
	{down = 3606, up = 3606, cockpit_device_id = 13, value_down = 1,   name = _('Jammer TEST'), category = _('Countermeasures')},
	{down = 3605, up = 3605, cockpit_device_id = 13, value_down = -1,  name = _('Jammer Mode Veille'), category = _('Countermeasures')},
	{down = 3605, up = 3605, cockpit_device_id = 13, value_down =  0,  name = _('Jammer Mode []'),     category = _('Countermeasures')},
	{down = 3605, up = 3605, cockpit_device_id = 13, value_down =  1,  name = _('Jammer Mode PCM'),    category = _('Countermeasures')},
	
	--Subsystems
    -- Electrical
	{down = 3520, up = 3520, cockpit_device_id = 8, value_down= 0, name = _('Main Battery OFF'), category = _('Electrical')},
	{down = 3520, up = 3520, cockpit_device_id = 8, value_down= 1, name = _('Main Battery ON'), category = _('Electrical')},
	{combos = {{key = 'B', reformers = {'LShift','LCtrl'}}}, down = iCommandBatteryPower, name = _('Main Battery TOGGLE'), category = _('Electrical')},
	{down = 3521, up = 3521, cockpit_device_id = 8, value_down= 0, name = _('Electric Power Transfer OFF'), category = _('Electrical')},
	{down = 3521, up = 3521, cockpit_device_id = 8, value_down= 1, name = _('Electric Power Transfer ON'), category = _('Electrical')},
	{down = 3522, up = 3522, cockpit_device_id = 8, value_down= 0, name = _('Alternator 1 OFF'), category = _('Electrical')},
	{down = 3522, up = 3522, cockpit_device_id = 8, value_down= 1, name = _('Alternator 1 ON'), category = _('Electrical')},
	{down = 3523, up = 3523, cockpit_device_id = 8, value_down= 0, name = _('Alternator 2 OFF'), category = _('Electrical')},
	{down = 3523, up = 3523, cockpit_device_id = 8, value_down= 1, name = _('Alternator 2 ON'), category = _('Electrical')},
	{down = 3658, up = 3658, cockpit_device_id = 16, value_down = 0, name = _('Audio Warning Switch OFF'), category = _('Electrical')},
	{down = 3658, up = 3658, cockpit_device_id = 16, value_down = 0.5, name = _('Audio Warning Switch ON'), category = _('Electrical')},
	{down = 3658, up = 3658, cockpit_device_id = 16, value_down = 1, name = _('Audio Warning Switch Test?'), category = _('Electrical')},
	{down = 3204, up = 3204, cockpit_device_id = 5, value_down = 0, name = _('HUD Altimeter Power Switch OFF'), category = _('Electrical')},
	{down = 3204, up = 3204, cockpit_device_id = 5, value_down = 0.5, name = _('HUD Altimeter Power Switch ON'), category = _('Electrical')},
	{down = 3204, up = 3204, cockpit_device_id = 5, value_down = 1, name = _('HUD Altimeter Power Switch TEST'), category = _('Electrical')},
    
    --Pitot Heat
    {down = 3659, up = 3659, cockpit_device_id = 22, value_down = 0, name = _('Pitot Heat Cover Closed'), category = _('Electrical')},
    {down = 3659, up = 3659, cockpit_device_id = 22, value_down = 1, name = _('Pitot Heat Cover Opened'), category = _('Electrical')},
    {down = 3660, up = 3660, cockpit_device_id = 22, value_down = 1, name = _('Pitot Heat Switch OFF'),   category = _('Electrical')},
    {down = 3660, up = 3660, cockpit_device_id = 22, value_down = 0, name = _('Pitot Heat Switch ON'),    category = _('Electrical')},

    -- Cockpit Displays & Illumination
    {down = iCommandClockElapsedTimeReset, name = _('Elapsed Time Clock START/STOP/RESET'), category = _('Cockpit Displays & Illumination')},
    {combos = {{key = 'C', reformers = {'RShift'}}}, down = iCommandFlightClockReset, name = _('Flight Clock START/STOP/RESET'), category = _('Cockpit Displays & Illumination')},
    {combos = {{key = 'L', reformers = {'LAlt','LCtrl'}}},  down = iCommandPlaneCockpitIlluminationPanels, name = _('Console Flood Lights TOGGLE'), category = _('Cockpit Displays & Illumination')},
    {down = 3639, up = 3639, cockpit_device_id = 16, value_down = 0,   name = _('Dashboard Flood Lights OFF'),    category = _('Cockpit Displays & Illumination')},
    {down = 3639, up = 3639, cockpit_device_id = 16, value_down = .33, name = _('Dashboard Flood Lights LOW'),    category = _('Cockpit Displays & Illumination')},
    {down = 3639, up = 3639, cockpit_device_id = 16, value_down = .67, name = _('Dashboard Flood Lights MEDIUM'), category = _('Cockpit Displays & Illumination')},
    {down = 3639, up = 3639, cockpit_device_id = 16, value_down = 1,   name = _('Dashboard Flood Lights HIGH'),   category = _('Cockpit Displays & Illumination')},
    {down = 3640, up = 3640, cockpit_device_id = 16, value_down = 0,   name = _('Dashboard Panel Lights OFF'),    category = _('Cockpit Displays & Illumination')},
    {down = 3640, up = 3640, cockpit_device_id = 16, value_down = .33, name = _('Dashboard Panel Lights LOW'),    category = _('Cockpit Displays & Illumination')},
    {down = 3640, up = 3640, cockpit_device_id = 16, value_down = .67, name = _('Dashboard Panel Lights MEDIUM'), category = _('Cockpit Displays & Illumination')},
    {down = 3640, up = 3640, cockpit_device_id = 16, value_down = 1,   name = _('Dashboard Panel Lights HIGH'),   category = _('Cockpit Displays & Illumination')},
	{down = 3641, up = 3641, cockpit_device_id = 16, value_down = 0,   name = _('Console Flood Lights OFF'),      category = _('Cockpit Displays & Illumination')},
    {down = 3641, up = 3641, cockpit_device_id = 16, value_down = .33, name = _('Console Flood Lights LOW'),      category = _('Cockpit Displays & Illumination')},
    {down = 3641, up = 3641, cockpit_device_id = 16, value_down = .67, name = _('Console Flood Lights MEDIUM'),   category = _('Cockpit Displays & Illumination')},
    {down = 3641, up = 3641, cockpit_device_id = 16, value_down = 1,   name = _('Console Flood Lights HIGH'),     category = _('Cockpit Displays & Illumination')},
    {down = 3642, up = 3642, cockpit_device_id = 16, value_down = 0,   name = _('Console Panel Lights OFF'),      category = _('Cockpit Displays & Illumination')},
    {down = 3642, up = 3642, cockpit_device_id = 16, value_down = .33, name = _('Console Panel Lights LOW'),      category = _('Cockpit Displays & Illumination')},
    {down = 3642, up = 3642, cockpit_device_id = 16, value_down = .67, name = _('Console Panel Lights MEDIUM'),   category = _('Cockpit Displays & Illumination')},
    {down = 3642, up = 3642, cockpit_device_id = 16, value_down = 1,   name = _('Console Panel Lights HIGH'),     category = _('Cockpit Displays & Illumination')},
	
	-- HUD
    {pressed = iCommandHUDBrightnessUp,   name = _('HUD Brightness UP'),   category = _('Cockpit Displays & Illumination')},
    {pressed = iCommandHUDBrightnessDown, name = _('HUD Brightness DOWN'), category = _('Cockpit Displays & Illumination')},
    {down = 3201, up = 3201, cockpit_device_id = 5, value_down = 0,    name = _('HUD OFF'),  category = _('Cockpit Displays & Illumination')},
    {down = 3201, up = 3201, cockpit_device_id = 5, value_down = .5,   name = _('HUD ON'),   category = _('Cockpit Displays & Illumination')},
    {down = 3201, up = 3201, cockpit_device_id = 5, value_down = 1,    name = _('HUD TEST'), category = _('Cockpit Displays & Illumination')},
	{down = 3203, up = 3203, cockpit_device_id = 5, value_down = 0,    name = _('HUD Declutter Switch OFF'), category = _('Cockpit Displays & Illumination')},
	{down = 3203, up = 3203, cockpit_device_id = 5, value_down = 1,    name = _('HUD Declutter Switch ON'), category = _('Cockpit Displays & Illumination')},
	
	-- VTB
    {down = iCommandPlaneCDU_CLR, name = _('VTB Viewport ON/OFF'), category = _('Cockpit Displays & Illumination')},
    {down = iCommandPlaneZoomIn,  name = _('HDD Zoom IN'),         category = _('Cockpit Displays & Illumination')},
    {down = iCommandPlaneZoomOut, name = _('HDD Zoom OUT'),        category = _('Cockpit Displays & Illumination')},
    {down = 3221, up = 3221, cockpit_device_id = 5, value_down = 0,    name = _('Radar Screen OFF'), category = _('Cockpit Displays & Illumination')},
    {down = 3221, up = 3221, cockpit_device_id = 5, value_down = 1,    name = _('Radar Screen ON'), category = _('Cockpit Displays & Illumination')},
	
	-- MC Panel
    {combos = {{key = 'R', reformers = {'LCtrl'}}},  down = iCommandPlaneResetMasterWarning, up = iCommandPlaneResetMasterWarning, name = _('Master Caution RESET'), category = _('Cockpit Displays & Illumination')},
    {down = 3524, up = 3524, cockpit_device_id = 8, value_up= 0, value_down= 1, name = _('Warning Lights TEST'), category = _('Cockpit Displays & Illumination')},
	
    -- Hydraulic & Mechanical
    {down = 3657, up = 3657, cockpit_device_id = 3, value_down= 0, name = _('Hydraulic Emergency Pump OFF'), category = _('Hydraulic & Mechanical')},
    {down = 3657, up = 3657, cockpit_device_id = 3, value_down= 1, name = _('Hydraulic Emergency Pump ON'), category = _('Hydraulic & Mechanical')},
    {combos = {{key = 'W'}}, down = iCommandPlaneWheelBrakeOn, up = iCommandPlaneWheelBrakeOff, name = _('Wheel Brakes'), category = _('Hydraulic & Mechanical')},
    {combos = {{key = 'W', reformers = {'LShift'}}}, down = iCommandPlaneWheelBrakeLeftOn, up = iCommandPlaneWheelBrakeLeftOff, name = _('Wheel Brake LEFT'), category = _('Hydraulic & Mechanical')},
    {combos = {{key = 'W', reformers = {'LAlt'}}},   down = iCommandPlaneWheelBrakeRightOn, up = iCommandPlaneWheelBrakeRightOff, name = _('Wheel Brake RIGHT'), category = _('Hydraulic & Mechanical')},
    {down = 3666, up = 3666, cockpit_device_id = 22, value_down= 0, name = _('Parking Brake OFF'), category = _('Hydraulic & Mechanical')},
    {down = 3666, up = 3666, cockpit_device_id = 22, value_down= 1, name = _('Parking Brake ON'), category = _('Hydraulic & Mechanical')},
    {combos = {{key = 'G'}}, down = iCommandPlaneGear, name = _('Landing Gear TOGGLE'), category = _('Hydraulic & Mechanical')},
    {combos = {{key = 'G', reformers = {'LCtrl'}}}, down = iCommandPlaneGearUp, name = _('Landing Gear UP'), category = _('Hydraulic & Mechanical')},
    {combos = {{key = 'G', reformers = {'LShift'}}}, down = iCommandPlaneGearDown, name = _('Landing Gear DOWN'), category = _('Hydraulic & Mechanical')},
    {combos = {{key = 'C', reformers = {'LCtrl'}}}, down = iCommandPlaneFonar, name = _('Canopy Position CYCLE'), category = _('Hydraulic & Mechanical')},
	{down = 3456, up = 3456, cockpit_device_id = 14, value_down= 1, name = _('Canopy Jettision'), category = _('Hydraulic & Mechanical')},

    -- Autopilot, Navigation, & INS
    {down = iCommandPlaneNav_PB0, name = ('Next Waypoint, Airfield or Target'),     category = ('Autopilot, Navigation, & INS')},
    {down = iCommandPlaneNav_PB1, name = ('Previous Waypoint, Airfield or Target'), category = ('Autopilot, Navigation, & INS')},
	
    {combos = {{key = '=', reformers = {'RShift'}}}, pressed = iCommandAltimeterPressureIncrease, up = iCommandAltimeterPressureStop, name = _('Alt Pressure INCREASE'), category = _('Autopilot, Navigation, & INS')},
    {combos = {{key = '-', reformers = {'RShift'}}}, pressed = iCommandAltimeterPressureDecrease, up = iCommandAltimeterPressureStop, name = _('Alt Pressure DECREASE'), category = _('Autopilot, Navigation, & INS')},
    {combos = {{key = 'A'}}, down = iCommandPlaneAutopilot, name = _('Autopilot'), category = _('Autopilot, Navigation, & INS')},
    {combos = {{key = 'H'}}, down = iCommandPlaneStabHbar,  name = _('Altitude Hold Mode'), category = _('Autopilot, Navigation, & INS')},
    {combos = {{key = 'H', reformers = {'LShift'}}}, down = iCommandPlaneSAUHBarometric, name = _('Selected Altitude Hold Mode'), category = _('Autopilot, Navigation, & INS')},
    {combos = {{key = 'F'}}, down = iCommandPlaneRouteAutopilot, name = _('Approach Hold Mode'), category = _('Autopilot, Navigation, & INS')},
	{down = 3341, up = 3341, cockpit_device_id = 2, value_down = 0, name = _('HSI Mode 1 - Nav Cv'), category = _('Autopilot, Navigation, & INS')},
	{down = 3341, up = 3341, cockpit_device_id = 2, value_down = 0.1, name = _('HSI Mode 2 - Nav'), category = _('Autopilot, Navigation, & INS')},
	{down = 3341, up = 3341, cockpit_device_id = 2, value_down = 0.2, name = _('HSI Mode 3 - TAC'), category = _('Autopilot, Navigation, & INS')},
	{down = 3341, up = 3341, cockpit_device_id = 2, value_down = 0.3, name = _('HSI Mode 4 - VAD'), category = _('Autopilot, Navigation, & INS')},
	{down = 3341, up = 3341, cockpit_device_id = 2, value_down = 0.4, name = _('HSI Mode 5 - Set VAD distance ρ'), category = _('Autopilot, Navigation, & INS')},
	{down = 3341, up = 3341, cockpit_device_id = 2, value_down = 0.5, name = _('HSI Mode 6 - Set VAD bearing θ'), category = _('Autopilot, Navigation, & INS')},
	{down = 3341, up = 3341, cockpit_device_id = 2, value_down = 0.6, name = _('HSI Mode 7 - TEL'), category = _('Autopilot, Navigation, & INS')},
	
	-- PCN
    {down = iCommandPlaneNav_PB2, name = ('PCN BAD Button'), category = ('Autopilot, Navigation, & INS')},
    {down = iCommandPlaneNav_PB3, name = ('PCN REC Button'), category = ('Autopilot, Navigation, & INS')},
	{down = iCommandPlaneNav_PB4, name = ('PCN MRQ Button'), category = ('Autopilot, Navigation, & INS')},
	{down = iCommandPlaneNav_PB5, name = ('PCN VAL Button'), category = ('Autopilot, Navigation, & INS')},
	{down = iCommandPlaneNav_PB6, name = ('PCN ENC Button'), category = ('Autopilot, Navigation, & INS')},
    {down = 3570, up = 3570, cockpit_device_id = 9, value_up= 0, value_down = 1, name = _('PCN PREP Button'), category = _('Autopilot, Navigation, & INS')},
    {down = 3572, up = 3572, cockpit_device_id = 9, value_up= 0, value_down = 1, name = _('PCN DEST Button'), category = _('Autopilot, Navigation, & INS')},
    {down = 3596, up = 3596, cockpit_device_id = 9, value_up= 0, value_down = 1, name = _('PCN ENTER Button'), category = _('Autopilot, Navigation, & INS')},
    {down = 3594, up = 3594, cockpit_device_id = 9, value_up= 0, value_down = 1, name = _('PCN Clear Button'), category = _('Autopilot, Navigation, & INS')},
    {down = 3593, up = 3593, cockpit_device_id = 9, value_up= 0, value_down = 1, name = _('PCN Button 0'), category = _('Autopilot, Navigation, & INS')},
    {down = 3584, up = 3584, cockpit_device_id = 9, value_up= 0, value_down = 1, name = _('PCN Button 1'), category = _('Autopilot, Navigation, & INS')},
    {down = 3585, up = 3585, cockpit_device_id = 9, value_up= 0, value_down = 1, name = _('PCN Button 2'), category = _('Autopilot, Navigation, & INS')},
    {down = 3586, up = 3586, cockpit_device_id = 9, value_up= 0, value_down = 1, name = _('PCN Button 3'), category = _('Autopilot, Navigation, & INS')},
    {down = 3587, up = 3587, cockpit_device_id = 9, value_up= 0, value_down = 1, name = _('PCN Button 4'), category = _('Autopilot, Navigation, & INS')},
    {down = 3588, up = 3588, cockpit_device_id = 9, value_up= 0, value_down = 1, name = _('PCN Button 5'), category = _('Autopilot, Navigation, & INS')},
    {down = 3589, up = 3589, cockpit_device_id = 9, value_up= 0, value_down = 1, name = _('PCN Button 6'), category = _('Autopilot, Navigation, & INS')},
    {down = 3590, up = 3590, cockpit_device_id = 9, value_up= 0, value_down = 1, name = _('PCN Button 7'), category = _('Autopilot, Navigation, & INS')},
    {down = 3591, up = 3591, cockpit_device_id = 9, value_up= 0, value_down = 1, name = _('PCN Button 8'), category = _('Autopilot, Navigation, & INS')},
    {down = 3592, up = 3592, cockpit_device_id = 9, value_up= 0, value_down = 1, name = _('PCN Button 9'), category = _('Autopilot, Navigation, & INS')},
    {down = 3574, up = 3574, cockpit_device_id = 9, value_down = 0, name = _('PCN Parameter Selector - TR/VS'), category = _('Autopilot, Navigation, & INS')},
    {down = 3574, up = 3574, cockpit_device_id = 9, value_down = 0.1, name = _('PCN Parameter Selector - D/RLT'), category = _('Autopilot, Navigation, & INS')},
    {down = 3574, up = 3574, cockpit_device_id = 9, value_down = 0.2, name = _('PCN Parameter Selector - CP/PD'), category = _('Autopilot, Navigation, & INS')},
    {down = 3574, up = 3574, cockpit_device_id = 9, value_down = 0.3, name = _('PCN Parameter Selector - ALT'), category = _('Autopilot, Navigation, & INS')},
    {down = 3574, up = 3574, cockpit_device_id = 9, value_down = 0.4, name = _('PCN Parameter Selector - L/G'), category = _('Autopilot, Navigation, & INS')},
    {down = 3574, up = 3574, cockpit_device_id = 9, value_down = 0.5, name = _('PCN Parameter Selector - RD/TD'), category = _('Autopilot, Navigation, & INS')},
    {down = 3574, up = 3574, cockpit_device_id = 9, value_down = 0.6, name = _('PCN Parameter Selector - ΔL/ΔG'), category = _('Autopilot, Navigation, & INS')},
    {down = 3574, up = 3574, cockpit_device_id = 9, value_down = 0.7, name = _('PCN Parameter Selector - ΔALT'), category = _('Autopilot, Navigation, & INS')},
    {down = 3574, up = 3574, cockpit_device_id = 9, value_down = 0.8, name = _('PCN Parameter Selector - P/Ө'), category = _('Autopilot, Navigation, & INS')},
    {down = 3574, up = 3574, cockpit_device_id = 9, value_down = 0.9, name = _('PCN Parameter Selector - DEC'), category = _('Autopilot, Navigation, & INS')},
    {down = 3574, up = 3574, cockpit_device_id = 9, value_down = 1, name = _('PCN Parameter Selector - DV/FV'), category = _('Autopilot, Navigation, & INS')},
    
    --PCM
    {down = 3627, up = 3627, cockpit_device_id = 9, value_down = 0,   name = _('INS Mode Selector - OFF (AR)'), category = _('Autopilot, Navigation, & INS')},
    {down = 3627, up = 3627, cockpit_device_id = 9, value_down = 0.1, name = _('INS Mode Selector - VEI'), category = _('Autopilot, Navigation, & INS')},
    {down = 3627, up = 3627, cockpit_device_id = 9, value_down = 0.2, name = _('INS Mode Selector - CAL'), category = _('Autopilot, Navigation, & INS')},
    {down = 3627, up = 3627, cockpit_device_id = 9, value_down = 0.3, name = _('INS Mode Selector - TST'), category = _('Autopilot, Navigation, & INS')},
    {down = 3627, up = 3627, cockpit_device_id = 9, value_down = 0.4, name = _('INS Mode Selector - ALN'), category = _('Autopilot, Navigation, & INS')},
    {down = 3627, up = 3627, cockpit_device_id = 9, value_down = 0.5, name = _('INS Mode Selector - ALCM'), category = _('Autopilot, Navigation, & INS')},
    {down = 3627, up = 3627, cockpit_device_id = 9, value_down = 0.6, name = _('INS Mode Selector - NAV'), category = _('Autopilot, Navigation, & INS')},
    {down = 3627, up = 3627, cockpit_device_id = 9, value_down = 0.7, name = _('INS Mode Selector - SEC'), category = _('Autopilot, Navigation, & INS')},
    {down = 3629, up = 3629, cockpit_device_id = 9, value_down = 0,   name = _('INS Operational Mode - N'), category = _('Autopilot, Navigation, & INS')},
    {down = 3629, up = 3629, cockpit_device_id = 9, value_down = 0.1, name = _('INS Operational Mode - STS'), category = _('Autopilot, Navigation, & INS')},
    {down = 3629, up = 3629, cockpit_device_id = 9, value_down = 0.2, name = _('INS Operational Mode - DCI'), category = _('Autopilot, Navigation, & INS')},
    {down = 3629, up = 3629, cockpit_device_id = 9, value_down = 0.3, name = _('INS Operational Mode - CRV'), category = _('Autopilot, Navigation, & INS')},
    {down = 3629, up = 3629, cockpit_device_id = 9, value_down = 0.4, name = _('INS Operational Mode - MAIN'), category = _('Autopilot, Navigation, & INS')},
	
	-- Pilot & Seat Controls    
	{down = iCommandCockpitShowPilotOnOff,  name = _('Hide/Show Pilot Body'),    category = _('Pilot & Seat Controls')},
	{down = iCommandPlaneCircuitBreaker_10, name = _('Hide/Show Control Stick'), category = _('Pilot & Seat Controls')},
	{down = iCommandPlaneCircuitBreaker_11, name = _('Hide/Show Throttle'),      category = _('Pilot & Seat Controls')},
    {combos={{key='Home',reformers={'LAlt'}}},down=3906, cockpit_device_id = 22,           name=_('Helmet Visor TOGGLE'), category=_('Pilot & Seat Controls')},
	{combos = {{key = 'P', reformers = {'RShift'}}}, down = iCommandCockpitShowPilotOnOff, name = _('Pilot Body TOGGLE'), category = _('Pilot & Seat Controls')},
	{combos = {{key = 'M', reformers = {'LShift'}}}, down = iCommandToggleMirrors,         name = _('Mirrors TOGGLE'),    category = _('Pilot & Seat Controls')},
    {combos = {{key = 'E', reformers = {'LCtrl'}}}, down = iCommandPlaneEject,             name = _('Eject (3 times)'),   category = _('Pilot & Seat Controls')},	
	{combos = {{key = 'S', reformers = {'LShift'}}},        pressed = iCommandPilotSeatAdjustmentUp  ,  up = iCommandPilotSeatAdjustmentStop, name = _('Seat RAISE'), category = _('Pilot & Seat Controls')},
	{combos = {{key = 'S', reformers = {'LShift','LAlt'}}}, pressed = iCommandPilotSeatAdjustmentDown,  up = iCommandPilotSeatAdjustmentStop, name = _('Seat LOWER'), category = _('Pilot & Seat Controls')},
	
	-- Weapon/CMDS Adjustment
	{combos = {{key = '1', reformers = {'RShift','RAlt'}}},	down = device_commands.Button_950, cockpit_device_id = devices.WEAPONS_CONTROL,	value_down = 1,	name = _('Change Matra Type 155 Burst Mode (1/3/6/18)'),	category = {_('Ground Adjustment')}},
	{combos = {{key = '9', reformers = {'RShift','RAlt'}}},	down = device_commands.Button_951, cockpit_device_id = devices.WEAPONS_CONTROL,	value_down = 1,	name = _('Change Laser Code, Hundreds (1..8)'),		        category = {_('Ground Adjustment')}},
	{combos = {{key = '0', reformers = {'RShift','RAlt'}}},	down = device_commands.Button_952, cockpit_device_id = devices.WEAPONS_CONTROL,	value_down = 1,	name = _('Change Laser Code, Tens (1..8)'),			        category = {_('Ground Adjustment')}},
	{combos = {{key = '-', reformers = {'RShift','RAlt'}}},	down = device_commands.Button_953, cockpit_device_id = devices.WEAPONS_CONTROL,	value_down = 1,	name = _('Change Laser Code, Ones (1..8)'),			        category = {_('Ground Adjustment')}},
	{combos = {{key = '2', reformers = {'RShift','RAlt'}}},	down = device_commands.Button_954, cockpit_device_id = devices.WEAPONS_CONTROL,	value_down = 1,	name = _('Change Gun Burst Lenght (0.5 or 1.0)'),	        category = {_('Ground Adjustment')}},
	
	-- NVG MOD
    {combos = {{key = 'H', reformers = {'RShift'}}}    , down = iCommandViewNightVisionGogglesOn , name = _('Night Vision Goggles') , category = _('Sensors')},
    {combos = {{key = 'H', reformers = {'RCtrl','RShift'}}}, pressed = iCommandPlane_Helmet_Brightess_Up , name = _('Night Vision Goggles Gain Up') , category = _('Sensors')},
	{combos = {{key = 'H', reformers = {'RAlt','RShift'}}} , pressed = iCommandPlane_Helmet_Brightess_Down, name = _('Night Vision Goggles Gain Down'), category = _('Sensors')},
 
	
}) return res