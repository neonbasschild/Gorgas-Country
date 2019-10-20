local res = external_profile("Config/Input/Aircrafts/common_joystick_binding.lua")
join(res.keyCommands,{
-- Autopilot
{combos = {{key = 'J'}}, down = 3304, cockpit_device_id = devices.ENGINEPANEL, value_down = 1.0, name = _('Autothrottle mode AFK'), category = _('Autopilot')},
{down = 3402, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down = 1.0, name = _('Autothrottle 12 or 15.5 alpha mode'), category = _('Autopilot')}, 
{combos = {{key = 'A'}}, down = 3302, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down = 1.0,name = _('Autopilot mode ATT (Attitude hold)'), category = _('Autopilot')}, 
{combos = {{key = 'H'}}, down = 3303, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down = 1.0,name = _('Autopilot mode HÖJD (Altitude Hold)'), category = _('Autopilot')}, 
{combos = {{key = 'E'}}, down = 3301, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down = 1.0,name = _('SAS mode SPAK flight stabiliser'), category = _('Autopilot')}, 
{combos = {{key = "O"}}, pressed = 3305, up = 3305, cockpit_device_id  = devices.FLIGHTDATAUNIT, value_pressed = 1.0, value_up = 0.0, name = _('Roll centrering (Roll trim reset)'), category = _('Flight Control')},



--HUD
{down = 3409, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down = 0.1, name = _('HUD Brightness Increase'), category = _('HUD')}, 
{down = 3409, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down = -0.1, name = _('HUD Brightness Decrease'), category = _('HUD')}, 
{down = 3401, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down = 1.0,name = _('HUD shift to lower position'), category = _('Navigation')}, 

-- Flight Control
{down = iCommandPlaneUpStart, up = iCommandPlaneUpStop, name = _('Aircraft Pitch Down'), category = _('Flight Control')},
{down = iCommandPlaneDownStart, up = iCommandPlaneDownStop, name = _('Aircraft Pitch Up'), category = _('Flight Control')},
{down = iCommandPlaneLeftStart, up = iCommandPlaneLeftStop, name = _('Aircraft Bank Left'), category = _('Flight Control')},
{down = iCommandPlaneRightStart, up = iCommandPlaneRightStop, name = _('Aircraft Bank Right'), category = _('Flight Control')},
{down = iCommandPlaneLeftRudderStart, up = iCommandPlaneLeftRudderStop, name = _('Aircraft Rudder Left'), category = _('Flight Control')},
{down = iCommandPlaneRightRudderStart, up = iCommandPlaneRightRudderStop, name = _('Aircraft Rudder Right'), category = _('Flight Control')},

{pressed = iCommandPlaneTrimUp, up = iCommandPlaneTrimStop, name = _('Trim: Nose Up'), category = _('Flight Control')},
{pressed = iCommandPlaneTrimDown, up = iCommandPlaneTrimStop, name = _('Trim: Nose Down'), category = _('Flight Control')},
{pressed = iCommandPlaneTrimLeft, up = iCommandPlaneTrimStop, name = _('Trim: Left Wing Down'), category = _('Flight Control')},
{pressed = iCommandPlaneTrimRight, up = iCommandPlaneTrimStop, name = _('Trim: Right Wing Down'), category = _('Flight Control')},
{pressed = iCommandPlaneTrimLeftRudder, up = iCommandPlaneTrimStop, name = _('Trim: Rudder Left'), category = _('Flight Control')},
{pressed = iCommandPlaneTrimRightRudder, up = iCommandPlaneTrimStop, name = _('Trim: Rudder Right'), category = _('Flight Control')},
{combos = {{key = 'G'}}, down = 3723,value_down =1.0,  cockpit_device_id = devices.FLIGHTDATAUNIT,  name = _('Landing Gear Up/Down'), category = _('Flight Control')},
{cockpit_device_id = devices.FLIGHTDATAUNIT,  down = 3712, up = 3712, value_down =-1.0, value_up =0.0, name = _('Autopilot yaw trim Left'), category = _('Autopilot')},
{cockpit_device_id = devices.FLIGHTDATAUNIT, down = 3712, up = 3712, value_down =1.0, value_up =0.0, name = _('Autopilot yaw trim Right'), category = _('Autopilot')},
--{combos = {{key = "O"}}, pressed = device_commands.Button_4, cockpit_device_id  = devices.SPAK, value_pressed = 1.0, name = _('Centrera trim'), category = _('Flight Control')},

{combos = {{key = 'P', reformers = {'RAlt'}}}, down = 3001, cockpit_device_id = 7, value_down =1.0, name = _('Reversal on'), category = _('Flight Control')},
{combos = {{key = 'P', reformers = {'RShift'}}}, down = 3001, cockpit_device_id = 7, value_down =0.0, name = _('Reversal off'), category = _('Flight Control')},

{combos = {{key = "B"}}, down = 3600, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down =1.0, name = _('Airbrake out/in/force out'), category = _('Flight Control')},
{combos = {{key = 'B', reformers = {'RAlt'}}}, down = 3601, up = 3601,cockpit_device_id = devices.FLIGHTDATAUNIT, value_down =1.0, value_up = 0.0, name = _('Airbrake out (force)'), category = _('Flight Control')},
{combos = {{key = 'B', reformers = {'RShift'}}}, down = 3602, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down =1.0, name = _('Airbrake in'), category = _('Flight Control')},

{combos = {{key = 'E', reformers = {'RShift', 'RCtrl'}}}, down = 3405, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down =1.0, name = _('Ejection seat arm'), category = _('Flight Control')},
{combos = {{key = 'C', reformers = {'RShift', 'RCtrl'}}}, down = 3406, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down =1.0, name = _('Canopy close'), category = _('Flight Control')},
{combos = {{key = 'C', reformers = {'RAlt', 'RCtrl'}}}, down = 3406, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down =-1.0, name = _('Canopy open'), category = _('Flight Control')},

--Navigation
{combos = {{key = "N", reformers = {"LCtrl"}}}, down = 3001, cockpit_device_id = devices.NAVIGATION, value_down = 1.0, name = _("Datapanel IN/UT Input / Output switch IN"), category = _("Navigation")},
{combos = {{key = "N", reformers = {"LShift"}}}, down = 3002, cockpit_device_id = devices.NAVIGATION, value_down = 1.0, name = _("Datapanel IN/UT Input / Output  Switch OUT (UT)"), category = _("Navigation")},
{down = 3011, cockpit_device_id = devices.NAVIGATION, value_down = 1.0, value_up = 0, name = _("Navigationpanel Waypoint 1"), category = _("Navigation")},
{down = 3012, cockpit_device_id = devices.NAVIGATION, value_down = 1.0, value_up = 0, name = _("Navigationpanel Waypoint 2"), category = _("Navigation")},
{down = 3013, cockpit_device_id = devices.NAVIGATION, value_down = 1.0, value_up = 0, name = _("Navigationpanel Waypoint 3"), category = _("Navigation")},
{down = 3014, cockpit_device_id = devices.NAVIGATION, value_down = 1.0, value_up = 0, name = _("Navigationpanel Waypoint 4"), category = _("Navigation")},
{down = 3015, cockpit_device_id = devices.NAVIGATION, value_down = 1.0, value_up = 0, name = _("Navigationpanel Waypoint 5"), category = _("Navigation")},
{down = 3016, cockpit_device_id = devices.NAVIGATION, value_down = 1.0, value_up = 0, name = _("Navigationpanel Waypoint 6"), category = _("Navigation")},
{down = 3017, cockpit_device_id = devices.NAVIGATION, value_down = 1.0, value_up = 0, name = _("Navigationpanel Waypoint 7"), category = _("Navigation")},
{down = 3018, cockpit_device_id = devices.NAVIGATION, value_down = 1.0, value_up = 0, name = _("Navigationpanel Waypoint 8"), category = _("Navigation")},
{down = 3019, cockpit_device_id = devices.NAVIGATION, value_down = 1.0, value_up = 0, name = _("Navigationpanel Waypoint 9"), category = _("Navigation")},
{down = 3020, cockpit_device_id = devices.NAVIGATION, value_down = 1.0, value_up = 0, name = _("Datapanel Digit 0"), category = _("Navigation")},
{down = 3021, cockpit_device_id = devices.NAVIGATION, value_down = 1.0, value_up = 0, name = _("Datapanel Digit 1"), category = _("Navigation")},
{down = 3022, cockpit_device_id = devices.NAVIGATION, value_down = 1.0, value_up = 0, name = _("Datapanel Digit 2"), category = _("Navigation")},
{down = 3023, cockpit_device_id = devices.NAVIGATION, value_down = 1.0, value_up = 0, name = _("Datapanel Digit 3"), category = _("Navigation")},
{down = 3024, cockpit_device_id = devices.NAVIGATION, value_down = 1.0, value_up = 0, name = _("Datapanel Digit 4"), category = _("Navigation")},
{down = 3025, cockpit_device_id = devices.NAVIGATION, value_down = 1.0, value_up = 0, name = _("Datapanel Digit 5"), category = _("Navigation")},
{down = 3026, cockpit_device_id = devices.NAVIGATION, value_down = 1.0, value_up = 0, name = _("Datapanel Digit 6"), category = _("Navigation")},
{down = 3027, cockpit_device_id = devices.NAVIGATION, value_down = 1.0, value_up = 0, name = _("Datapanel Digit 7"), category = _("Navigation")},
{down = 3028, cockpit_device_id = devices.NAVIGATION, value_down = 1.0, value_up = 0, name = _("Datapanel Digit 8"), category = _("Navigation")},
{down = 3029, cockpit_device_id = devices.NAVIGATION, value_down = 1.0, value_up = 0, name = _("Datapanel Digit 9"), category = _("Navigation")},
{down = 3001, cockpit_device_id = devices.NAVIGATIONPANEL, value_down = 1.0, value_up = 0, name = _("Datapanel RENSA (Clear)"), category = _("Navigation")},
{down = 3002, cockpit_device_id = devices.NAVIGATIONPANEL, value_down = 1.0, name = _("A0 Mode"), category = _("Radar")},
{down = 3003, cockpit_device_id = devices.NAVIGATIONPANEL, value_down = 1.0, name = _("A1 Mode"), category = _("Radar")},
{down = 3004, cockpit_device_id = devices.NAVIGATIONPANEL, value_down = 1.0, name = _("A2 Mode"), category = _("Radar")},
{down = 3208, cockpit_device_id = devices.RADAR, value_down = 0.0, name = _("Radar AS0"), category = _("Radar")},
{down = 3208, cockpit_device_id = devices.RADAR, value_down = 0.1, name = _("Radar AS1"), category = _("Radar")},
{down = 3208, cockpit_device_id = devices.RADAR, value_down = 0.2, name = _("Radar AS2"), category = _("Radar")},
{down = 3208, cockpit_device_id = devices.RADAR, value_down = 0.3, name = _("Radar AS3"), category = _("Radar")},
{down = 3208, cockpit_device_id = devices.RADAR, value_down = 0.4, name = _("Radar AS4"), category = _("Radar")},
{down = 3208, cockpit_device_id = devices.RADAR, value_down = 0.5, name = _("Radar AS5"), category = _("Radar")},
{down = 3208, cockpit_device_id = devices.RADAR, value_down = 0.6, name = _("Radar AS6"), category = _("Radar")},
{down = 3208, cockpit_device_id = devices.RADAR, value_down = 0.7, name = _("Radar AS7"), category = _("Radar")},
{down = 3209, cockpit_device_id = devices.RADAR, value_down = 0.0, name = _("Radar LIN"), category = _("Radar")},
{down = 3209, cockpit_device_id = devices.RADAR, value_down = 1.0, name = _("Radar LOG"), category = _("Radar")},
{down = 3323, cockpit_device_id = devices.RADAR, value_down = 1.0, name = _('Radar Range Increase'), category = _('Radar')}, 
{down = 3324, cockpit_device_id = devices.RADAR, value_down = 1.0, name = _('Radar Range Decrease'), category = _('Radar')}, 
{down = 3325, cockpit_device_id = devices.RADAR, value_down = 1.0, name = _('Radar MKR Gain increase'), category = _('Radar')},
{down = 3326, cockpit_device_id = devices.RADAR, value_down = 1.0, name = _('Radar MKR Gain decrease'), category = _('Radar')},

{combos = {{key = "A", reformers = {"LCtrl","LShift"}}}, pressed = 3307, cockpit_device_id = devices.FLIGHTDATAUNIT, value_pressed = 1.0, name = _("Altimeter setting up"), category = _("Flight Data")},
{combos = {{key = "A", reformers = {"LCtrl","LAlt"}}}, pressed = 3307, cockpit_device_id = devices.FLIGHTDATAUNIT, value_pressed = -1.0, name = _("Altimeter setting down"), category = _("Flight Data")},
{combos = {{key = "Q", reformers = {"LCtrl"}}}, down = 3100, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down = 1.0, name = _("Mode select - FK"), category = _("Mode selector")},
{combos = {{key = "Q", reformers = {"LAlt"}}}, down = 3101, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down = 1.0, name = _("Mode select - BER"), category = _("Mode selector")},
{combos = {{key = "Q", reformers = {"RAlt"}}}, down = 3102, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down = 1.0, name = _("Mode select - NAV"), category = _("Mode selector")},
{combos = {{key = "Q", reformers = {"RCtrl"}}}, down = 3103, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down = 1.0, name = _("Mode select - ANF"), category = _("Mode selector")},
{combos = {{key = "Q", reformers = {"RShift"}}}, down = 3104, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down = 1.0, name = _("Mode select - SPA"), category = _("Mode selector")},
{combos = {{key = "W", reformers = {"RCtrl"}}}, down = 3105, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down = 1.0, name = _("Mode select - LANDNAV"), category = _("Mode selector")},
{combos = {{key = "W", reformers = {"RShift"}}}, down = 3106, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down = 1.0, name = _("Mode select - LANDPO"), category = _("Mode selector")},
{combos = {{key = "X", reformers = {"RShift","RCtrl"}}}, down = 3200, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down = 1.0, name = _("HÖJD CISI"), category = _("Navigation")},
{combos = {{key = "Z", reformers = {"RShift","RCtrl"}}}, down = 3201, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down = 1.0, name = _("SLAV SI"), category = _("Navigation")},
{combos = {{key = "T", reformers = {"RShift","RCtrl"}}}, down = 3210, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down = 1.0, name = _("Pitch gearing Automatic/Landing"), category = _("Flight Control")},
--{combos = {{key = "S", reformers = {"RShift","RCtrl"}}}, down = 3300, cockpit_device_id = devices.WEAPON_SYSTEM, value_down = 1.0, name = _("Trigger safety bracket"), category = _("Weapöns")},
-- {combos = {{key = "O", reformers = {"RShift","RCtrl"}}}, down = 3315, cockpit_device_id = devices.WEAPON_SYSTEM, value_down = 1.0, name = _("Trigger"), category = _("Weapons")},
-- {combos = {{key = "W", reformers = {"LAlt"}}}, down = 3030, cockpit_device_id = 14, value_down = 1.0, name = _("Datapanel Rotary Clockwise"), category = _("Navigation")},
-- {combos = {{key = "Q", reformers = {"LAlt"}}}, down = 3031, cockpit_device_id = 14, value_down = 1.0, name = _("Datapanel Rotary Counterclockwise"), category = _("Navigation")},

-- Motor kontroll
{combos = {{key = "F", reformers = {"LAlt"}}}, down = 3040, cockpit_device_id = 15, value_down = 1.0, name = _("Low pressure fuel valve LT Kran"), category = _("Motor")},
{combos = {{key = "I", reformers = {"LAlt"}}}, down = 3005, cockpit_device_id = devices.ENGINEPANEL, value_down = 1.0, name = _("High-pressure fuel valve (throttle to idle)"), category = _("Motor")},
{combos = {{key = "I", reformers = {"LAlt"}}}, pressed = 3004, up= 3004, cockpit_device_id = devices.ENGINEPANEL, value_pressed = 1.0, value_up = 0.0, name = _("High-pressure fuel valve (For HOTAS, Off if pressed)"), category = _("Motor")},
{combos = {{key = "S", reformers = {"LAlt"}}}, down = 3042, up = 3043, cockpit_device_id = 15, value_down = 1.0, value_up = 1.0, name = _("Startknapp"), category = _("Motor")},
{combos = {{key = "A", reformers = {"RAlt"}}}, down = 3006, cockpit_device_id = devices.ENGINEPANEL, value_down = 1.0, name = _("Afterburner fuel valve (LTkran EBK)"), category = _("Motor")},
{combos = {{key = "M", reformers = {"RAlt"}}}, down = 3007, cockpit_device_id = devices.ENGINEPANEL, value_down = 1.0, name = _("Manual fuel regulator switch"), category = _("Motor")},
{combos = {{key = "+"}}, down = 3301, up = 3301, cockpit_device_id = devices.ENGINEPANEL, value_down = 1.0, value_up = 0.0, name = _("Throttle down"), category = _("Motor")},
{combos = {{key = "-"}}, down = 3302, up = 3302, cockpit_device_id = devices.ENGINEPANEL, value_down = 1.0, value_up = 0.0, name = _("Throttle up"), category = _("Motor")},

-- Weapons                                                                        
--{combos = {{key = 'C', reformers = {'LShift'}}}, down = iCommandChangeGunRateOfFire, name = _('Cannon Rate Of Fire / Cut Of Burst select'), category = _('Weapons')},

-- RADAR
-- Weapons                                                                        
{combos = {{key = 'JOY_BTN1'}}, down = iCommandPlanePickleOn,	up = iCommandPlanePickleOff, name = _('Weapon Release'), category = _('Weapons')},
{down = 3321, up = 3321, value_down = -1.0, value_up = 0.0, cockpit_device_id = devices.WEAPON_SYSTEM, name = _('Rb05 stick yaw left'), category = _('Weapons')},
{down = 3321, up = 3321, value_down = 1.0, value_up = 0.0, cockpit_device_id = devices.WEAPON_SYSTEM, name = _('Rb05 stick yaw right'), category = _('Weapons')},
{down = 3322, up = 3322, value_down = 1.0, value_up = 0.0, cockpit_device_id = devices.WEAPON_SYSTEM, name = _('Rb05 stick pitch up'), category = _('Weapons')},
{down = 3322, up = 3322, value_down = -1.0, value_up = 0.0, cockpit_device_id = devices.WEAPON_SYSTEM, name = _('Rb05 stick pitch down'), category = _('Weapons')},
{down = 3323, up = 3323, value_down = 1.0, value_up = 0.0, cockpit_device_id = devices.WEAPON_SYSTEM, name = _("Rb05 switch input with flight stick (hold)"), category = _('Weapons')},
{down = 3300, up = 3300, value_down = 1.0, value_up = 0.0, cockpit_device_id = devices.WEAPON_SYSTEM, name = _('Trigger safety bracket (hold)'), category = _('Weapons')},
{down = 3300, value_down = 1.0, cockpit_device_id = devices.WEAPON_SYSTEM, name = _('Trigger safety bracket ARM'), category = _('Weapons')},
{down = 3300, value_down = 0.0, cockpit_device_id = devices.WEAPON_SYSTEM, name = _('Trigger safety bracket SAFE'), category = _('Weapons')},
{down = 3314, cockpit_device_id = devices.WEAPON_SYSTEM, value_down = 1.0, name = _("IR-missile uncage"), category = _("Weapons")},
{down = 3311, cockpit_device_id = devices.WEAPON_SYSTEM, value_down = 1.0, name = _("Autothrottle disconnect / IR-missile fast select"), category = _("Weapons")},
-- countermeasures
{down = 3001, value_down = 1.0, cockpit_device_id = devices.COUNTERMEASURE, name = _('Fast countermeasure dispense'), category = _('Countermeasures')},
{down = 3004, value_down = 1.0, cockpit_device_id = devices.COUNTERMEASURE, name = _('Countermeasure dispense OFF'), category = _('Countermeasures')},
{down = 3003, up = 3004, value_down = 1.0, value_up = 1.0, cockpit_device_id = devices.COUNTERMEASURE, name = _('Countermeasure dispense INT'), category = _('Countermeasures')},
{down = 3002, value_down = 1.0, cockpit_device_id = devices.COUNTERMEASURE, name = _('Countermeasure dispense KONT'), category = _('Countermeasures')},
{down = 3005, value_down = 1.0, cockpit_device_id = devices.COUNTERMEASURE, name = _('Countermeasure KB Mod A'), category = _('Countermeasures')},
{down = 3006, value_down = 1.0, cockpit_device_id = devices.COUNTERMEASURE, name = _('Countermeasure KB Mod 0'), category = _('Countermeasures')},
{down = 3007, value_down = 1.0, cockpit_device_id = devices.COUNTERMEASURE, name = _('Countermeasure KB Mod 1'), category = _('Countermeasures')},
{down = 3008, value_down = 1.0, cockpit_device_id = devices.COUNTERMEASURE, name = _('Countermeasure KB Mod 2'), category = _('Countermeasures')},
{down = 3009, value_down = 1.0, cockpit_device_id = devices.COUNTERMEASURE, name = _('Countermeasure KB Mod 3'), category = _('Countermeasures')},
{down = 3010, value_down = 0.0, cockpit_device_id = devices.COUNTERMEASURE, name = _('Countermeasure KB Stråk Mod 0'), category = _('Countermeasures')},
{down = 3010, value_down = 1.0, cockpit_device_id = devices.COUNTERMEASURE, name = _('Countermeasure KB Stråk Mod 4'), category = _('Countermeasures')},
{down = 3011, value_down = 1.0, cockpit_device_id = devices.COUNTERMEASURE, name = _('Countermeasure U22 Jammer Mod 0'), category = _('Countermeasures')},
{down = 3012, value_down = 1.0, cockpit_device_id = devices.COUNTERMEASURE, name = _('Countermeasure U22 Jammer Mod A'), category = _('Countermeasures')},
{down = 3013, value_down = 1.0, cockpit_device_id = devices.COUNTERMEASURE, name = _('Countermeasure U22 Jammer Mod B'), category = _('Countermeasures')},
{down = 3014, value_down = 1.0, cockpit_device_id = devices.COUNTERMEASURE, name = _('Countermeasure U22 Jammer Mod D'), category = _('Countermeasures')},
{down = 3015, value_down = 1.0, cockpit_device_id = devices.COUNTERMEASURE, name = _('Countermeasure U22 Jammer Mod E'), category = _('Countermeasures')},
{down = 3016, value_down = 1.0, cockpit_device_id = devices.COUNTERMEASURE, name = _('Countermeasure U22 Jammer Band F'), category = _('Countermeasures')},
{down = 3017, value_down = 1.0, cockpit_device_id = devices.COUNTERMEASURE, name = _('Countermeasure U22 Jammer Band G'), category = _('Countermeasures')},
{down = 3018, value_down = 1.0, cockpit_device_id = devices.COUNTERMEASURE, name = _('Countermeasure U22 Jammer Band H'), category = _('Countermeasures')},
{down = 3019, value_down = 1.0, cockpit_device_id = devices.COUNTERMEASURE, name = _('Countermeasure U22 Jammer Band J'), category = _('Countermeasures')},
{down = 3020, value_down = 1.0, cockpit_device_id = devices.COUNTERMEASURE, name = _('Countermeasure U22 Jammer Band K'), category = _('Countermeasures')},


-- RADAR
{pressed = 3101, up = 3100, cockpit_device_id = devices.RADAR, value_pressed = 1.0, value_up = 1.0,name = _('Radarstick Up'), category = _('Radar')},
{pressed = 3102, up = 3100, cockpit_device_id = devices.RADAR, value_pressed = 1.0, value_up = 1.0, name = _('Radarstick Down'), category = _('Radar')},
{pressed = 3103, up = 3100, cockpit_device_id = devices.RADAR, value_pressed = 1.0, value_up = 1.0,name = _('Radarstick Left'), category = _('Radar')},
{pressed = 3104, up = 3100, cockpit_device_id = devices.RADAR, value_pressed = 1.0, value_up = 1.0, name = _('Radarstick Right'), category = _('Radar')},
{down = 3010, cockpit_device_id = devices.RADAR, value_down = 1.0, name = _('Radar range 120km'), category = _('Radar')},
{down = 3011, cockpit_device_id = devices.RADAR, value_down = 1.0, name = _('Radar range 60km'), category = _('Radar')},
{down = 3012, cockpit_device_id = devices.RADAR, value_down = 1.0, name = _('Radar range 30km'), category = _('Radar')},
{down = 3013, cockpit_device_id = devices.RADAR, value_down = 1.0, name = _('Radar range 15km'), category = _('Radar')},
{down = 3212, cockpit_device_id = devices.RADAR, value_down = 1.0, name = _("Memory mode"), category = _("Radar")},
{down = 3213, cockpit_device_id = devices.RADAR, value_down = 1.0, name = _("Obstacle detection mode"), category = _("Radar")},
{down = 3214, cockpit_device_id = devices.RADAR, value_down = 1.0, name = _("Passive radar mode"), category = _("Radar")},
{pressed = 3215, up = 3215, cockpit_device_id = devices.RADAR, value_pressed = 1.0, value_up = 0.0, name = _("Radar elevation up"), category = _("Radar")},
{pressed = 3215, up = 3215, cockpit_device_id = devices.RADAR, value_pressed = -1.0, value_up = 0.0, name = _("Radar elevation down"), category = _("Radar")},
{down = 3002, cockpit_device_id = devices.NAVIGATIONPANEL, value_down = 1.0, name = _("A0 Mode"), category = _("Radar")},
{down = 3002, up = 3003, cockpit_device_id = devices.NAVIGATIONPANEL, value_down = 1.0, value_up = 1.0, name = _("A0 Mode (Three position switch)"), category = _("Radar")},
{down = 3003, cockpit_device_id = devices.NAVIGATIONPANEL, value_down = 1.0, name = _("A1 Mode"), category = _("Radar")},
{down = 3004, cockpit_device_id = devices.NAVIGATIONPANEL, value_down = 1.0, name = _("A2 Mode"), category = _("Radar")},
{down = 3004, up = 3003, cockpit_device_id = devices.NAVIGATIONPANEL, value_down = 1.0, value_up = 1.0, name = _("A2 Mode (Three position switch)"), category = _("Radar")},

{down = 3924, cockpit_device_id = devices.RADAR, value_down = 1.0, name = _('Radar Increase Brightness'), category = _('Radar')},  
{down = 3924, cockpit_device_id = devices.RADAR, value_down = 0.0, name = _('Radar Decrease Brightness'), category = _('Radar')}, 

{down = 3005, cockpit_device_id = devices.NAVIGATIONPANEL, value_down = 1.0, name = _("T0 Fix"), category = _("Radar")},
{down = 3005, up = 3006, cockpit_device_id = devices.NAVIGATIONPANEL, value_down = 1.0, value_up = 1.0, name = _("T0 Fix (three position switch)"), category = _("Radar")},
{down = 3006, cockpit_device_id = devices.NAVIGATIONPANEL, value_down = 1.0, name = _("T1 Fix"), category = _("Radar")},
{down = 3007, cockpit_device_id = devices.NAVIGATIONPANEL, value_down = 1.0, name = _("TV Fix"), category = _("Radar")},
{down = 3007, up = 3006, cockpit_device_id = devices.NAVIGATIONPANEL, value_down = 1.0, value_up = 1.0, name = _("TV Fix (Three position switch)"), category = _("Radar")},
{down = 3090, up = 3090, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down = 1.0, value_up = 0.0, name = _("Reference button"), category = _("Navigation")},

-- Lights panel
{down = 3001, cockpit_device_id = devices.LIGHTS, value_down = 1.0, name = _('Anti collision lights switch'), category = _('Lights panel')},
{down = 3002, cockpit_device_id = devices.LIGHTS, value_down = 1.0, name = _('Navigation lights switch'), category = _('Lights panel')},
{down = 3003, cockpit_device_id = devices.LIGHTS, value_down = 1.0, name = _('Formation lights switch'), category = _('Lights panel')},
{down = 3004, cockpit_device_id = devices.LIGHTS, value_down = 1.0, name = _('Taxi/landing lights switch'), category = _('Lights panel')},


-- Walkman
{down=3001, cockpit_device_id=devices.WALKMAN, value_down=1.0, name = _('Play'), category = _('Tape Player')},
{down=3002, cockpit_device_id=devices.WALKMAN, value_down=1.0, name = _('Stop'), category = _('Tape Player')},
{down=3003, cockpit_device_id=devices.WALKMAN, value_down=1.0, name = _('Fast Forward'), category = _('Tape Player')},
{down=3004, cockpit_device_id=devices.WALKMAN, value_down=1.0, name = _('Fast Backward'), category = _('Tape Player')},
{down=3005, cockpit_device_id=devices.WALKMAN, value_down=1.0, name = _('Volume Up'), category = _('Tape Player')},
{down=3006, cockpit_device_id=devices.WALKMAN, value_down=1.0, name = _('Volume Down'), category = _('Tape Player')},

-- Wheel brake
{down = 3698, up = 3698, cockpit_device_id = devices.FLIGHTDATAUNIT, value_down =1.0, value_up = 0.0, name = _('Wheelbrake'), category = _('Flight Control')},

})
-- joystick axes 
join(res.axisCommands,{
-- {action = 3008, cockpit_device_id = devices.TEST, name = _('Radio command missile yaw')},
-- {action = 3009, cockpit_device_id = devices.TEST, name = _('Radio command missile pitch')},
{action = 3321, cockpit_device_id = devices.WEAPON_SYSTEM, name = _('Rb05 stick yaw')},
{action = 3322, cockpit_device_id = devices.WEAPON_SYSTEM, name = _('Rb05 stick pitch')},
{action = 3321, cockpit_device_id = devices.RADAR, name = _('Radar stick horizontal')},
{action = 3322, cockpit_device_id = devices.RADAR, name = _('Radar stick vertical')},
{action = 3327, cockpit_device_id = devices.RADAR, name = _('Radar MKR Gain')},


{action = iCommandWheelBrake,		name = _('Wheel Brake')},
{action = iCommandLeftWheelBrake,	name = _('Wheel Brake Left')},
{action = iCommandRightWheelBrake,	name = _('Wheel Brake Right')},

{combos = defaultDeviceAssignmentFor("roll")  ,  action = iCommandPlaneRoll		   , name = _('Roll')},
{combos = defaultDeviceAssignmentFor("pitch") ,  action = iCommandPlanePitch	   , name = _('Pitch')},
{combos = defaultDeviceAssignmentFor("rudder"),  action = iCommandPlaneRudder	   , name = _('Rudder')},
{combos = defaultDeviceAssignmentFor("thrust"),  action = iCommandPlaneThrustCommon, name = _('Thrust')},
})
return res