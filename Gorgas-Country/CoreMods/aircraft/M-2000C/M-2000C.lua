--mounting 3d model paths and texture paths

dofile(current_mod_path.."/WEAPONS/M2KC_BLG66.lua")
dofile(current_mod_path.."/WEAPONS/M2KC_Weapons.luac")

M_2000C =  {

	--Name 				=   'Mirage 2000C',
	Name 				=   'M-2000C',
	DisplayName			= _('M-2000C'),
	ViewSettings		= ViewSettings,

	Picture 			= "M-2000C.png",
	Rate 				= 50, -- RewardPoint in Multiplayer
	Shape 				= "m-2000c",

	shape_table_data 	=
	{
		{
			file  	 = 'M-2000C';
			life  	 = 18; -- lifebar
			vis   	 = 3; -- visibility gain.
			desrt    = 'M-2000C_destr'; -- Name of destroyed object file name
			fire  	 = { 300, 2}; -- Fire on the ground after destoyed: 300sec 2m
			username = 'M-2000C';
			index    =  WSTYPE_PLACEHOLDER;
			classname = "lLandPlane";
			positioning = "BYNORMAL";
		},
		{
			name  = "M-2000C_destr";
			file  = "M-2000C_destr";
			fire  = { 240, 2};
		},

	},
	-------------------------
	-- add model draw args for network transmitting to this draw_args table (32 limit)
	net_animation = 
	{
		21,  --  1 DRAG_CHUTE_UNLOCK
		35,  --  2 DRAG_CHUTE
		38,  --  3 CANOPY ANGLE
		49,  --  4 NAV_LIGHTS
		51,  --  5 LANDING_LIGHTS
		83,  --  6 STROBE_LIGHT_TOP
		88,  --  7 FORM_LIGHTS
		99,  --  8 HEAD UP/DOWN
		190, --  9 LEFT_NAV_LIGHT
		191, -- 10 TAIL_NAV_LIGHT
		192, -- 11 RIGHT_NAV_LIGHT
		200, -- 12 FORM_LIGHT_FRONT
		201, -- 13 FORM_LIGHT_AFT
		208, -- 14 LANDING_LIGHT
		209, -- 15 TAXI_LIGHT
		334, -- 16 DRAG_CHUTE_VERTICAL
		335, -- 17 DRAG_CHUTE_HORIZONTAL
		336, -- 18 DRAG_CHUTE_CAP
		373, -- 19 INTERNAL AB GLOW
		802, -- 20 STRONG_LIGHT_BOTTOM
		902, -- 21 REFUEL LIGHT MOVE
		903, -- 22 REFUEL LIGHT SIDE LOW
		904, -- 23 REFUEL LIGHT NOSE LOW
		905, -- 24 POLICE LIGHT
		906, -- 25 PILOT VISOR
		907, -- 26 REFUEL LIGHT SIDE HIGH
		908, -- 27 REFUEL LIGHT NOSE HIGH
        182, -- 28 LEFT_AIRBRAKE
        184, -- 29 RIGHT_AIRBRAKE
        900, -- 30 LEFT_INTAKE_SCOOP
        901, -- 32 RIGHT_INTAKE_SCOOP
	},
	
	-------------------------
	mapclasskey	= "P0091000024",
	attribute	= {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER, "Multirole fighters", "Refuelable" },
	Categories 	= {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor",},
	-------------------------
	M_empty 					= 7600.0,	-- with pilot and nose load, kg
	M_nominal 					= 10650.0,	-- kg (Empty Plus Full Internal Fuel)
	M_max 						= 16500.0,	-- kg (Maximum Take Off Weight)
	M_fuel_max 					= 3165.0,	-- kg (Internal Fuel Only)
	H_max 			 			= 17526,	-- m  (Maximum Operational Ceiling)
	average_fuel_consumption 	= 0.25,  	-- this is highly relative, but good estimates are 36-40l/min = 28-31kg/min = 0.47-0.52kg/s -- 45l/min = 35kg/min = 0.583kg/s
	CAS_min 					= 30.0,   	-- Other documents state this is minimum Loiter Time
	V_opt 						= 250.0,	-- Cruise speed (m/s) (for AI)
	V_take_off 					= 81.3,    	-- Take off speed in m/s (for AI)
	V_land 						= 82.3,    	-- Land speed in m/s (for AI)
	V_max_sea_level 			= 400,   	-- Max speed at sea level in m/s (for AI)
	V_max_h 					= 660,   	-- Max speed at max altitude in m/s (for AI)
	Vy_max 						= 304,    	-- Max climb speed in m/s (for AI)
	Mach_max 					= 2.2,   	-- Max speed in Mach (for AI)
	Ny_min 						= -3.0,  	-- Min G (for AI)
	Ny_max 						= 8.0,     	-- Max G (for AI)
	Ny_max_e 					= 8.0,     	-- Max G (for AI)
	AOA_take_off 				= 0.175,  	-- AoA in take off (for AI)
	bank_angle_max 				= 60,    	-- Max bank angle (for AI)
	has_afteburner 				= true,  	-- AFB yes/no
	has_speedbrake 				= true,  	-- Speedbrake yes/no
	has_differential_stabilizer = false,
	radar_can_see_ground		= false,
	stores_number				= 9,
	brakeshute_name				= 2,		-- Landing - brake chute visual shape after separation
	-----------------------------------------------------------------------
	----------------- SUSPENSION CODE BEGINS
	-----------------------------------------------------------------------

	tand_gear_max 							 = 2.1445,	-- tangent on maximum yaw angle of front wheel, 65 degrees tan(64deg)

	nose_gear_pos 							 = {2.9,-1.5, 0.0},		-- nosegear coord
	nose_gear_wheel_diameter				 =  0.35 * 2.0,		-- in m
	nose_gear_amortizer_direct_stroke        =  0.220,  	    -- down from nose_gear_pos !!!
	nose_gear_amortizer_reversal_stroke      = -0.015,		-- up
	nose_gear_amortizer_normal_weight_stroke =  0.1,		-- down from nose_gear_pos
	
	main_gear_pos 							 = {-1.9,-1.5, 1.75},	-- main gear coords
	main_gear_wheel_diameter				 =  0.45 * 2.0,				-- in m
	main_gear_amortizer_direct_stroke        =  0.21,		-- down from main_gear_pos !!!
	main_gear_amortizer_reversal_stroke      = -0.01, 		-- up
	main_gear_amortizer_normal_weight_stroke =  0.0,				-- down from main_gear_pos

	-----------------------------------------------------------------------
	----------------- SUSPENSION CODE ENDS
	-----------------------------------------------------------------------

	tanker_type 				= 4,		-- Tanker type if the plane is airrefuel capable (same type as F-14, aka drogue basket)
	is_tanker 					= false,	-- Tanker yes/no
	air_refuel_receptacle_pos 	= {5.436, 1.027, 0.409}, -- refuel coords

	wing_area 					= 41.4,		-- wing area in m2
	wing_span 					= 9.13,		-- wing spain in m
	wing_type 					= 0,		-- Fixed wing
	flaps_maneuver 				= 0.5,		-- Max flaps in take-off and maneuver (0.5 = 1st stage; 1.0 = 2nd stage) (for AI)

	thrust_sum_max 				= 6556.77,	-- thrust in kgf (64.3 kN)
	thrust_sum_ab 				= 9697.50,	-- thrust in kgf (95.1 kN)

	length 						= 14.36,	-- full lenght in m
	height 						= 5.20,		-- height in m
	range 						= 1550,		-- Max range in km (for AI)
	RCS 						= 4.0,		-- Radar Cross Section m2
	IR_emission_coeff 			= 0.8,		-- Normal engine -- IR_emission_coeff = 1 is Su-27 without afterburner. It is reference.
	IR_emission_coeff_ab 		= 1.62,		-- With afterburner
	wing_tip_pos 				= { -5.0, -0.100, 4.565}, -- wingtip coords for visual effects

	engines_count				= 1, -- Engines count
	engines_nozzles = {
		[1] =
		{
			pos 		=  {-6.585, 0.525, 0.000}, -- nozzle coords
			elevation   =  0, -- AFB cone elevation
			diameter	 = 1.30, -- AFB cone diameter
			exhaust_length_ab   = 9, -- lenght in m
			exhaust_length_ab_K = 0.7, -- AB animation
			smokiness_level = 0.2,
		}, -- end of [1]
	}, -- end of engines_nozzles
	
	crew_size	 = 1,
	crew_members =
	{
		[1] =
		{
			bailout_arg 			= -1,
			ejection_seat_name		= "M-2000C_pilotseat",
			pilot_name		   		= "M-2000C_pilot",
			drop_canopy_name		= "M-2000c_canopy",
			drop_parachute_name 	= "M-2000C_parachute",
			pos						= {2.679, 0.512, 0.0, },
			canopy_pos				= {2.739, 0.677, 0.0},
			g_suit 			    	=  5
		}, -- end of [1]
	}, -- end of crew_members

    mechanimations = {
        Door0 = {
            {Transition = {"Close", "Open"},  Sequence = {{C = {{"VelType", 3}, {"Arg", 38, "to", 0.9, "in", 5.0},},},}, Flags = {"Reversible"},},
            {Transition = {"Open", "Close"},  Sequence = {{C = {{"VelType", 3}, {"Arg", 38, "to", 0.0, "in", 3.0},},},}, Flags = {"Reversible", "StepsBackwards"},},
            {Transition = {"Any", "Bailout"}, Sequence = {{C = {{"Arg", 909, "set", 1.0},},},},},
        },
        ServiceHatches = {
            {Transition = {"Close", "Open"}, Sequence = {{C = {{"PosType", 3}, {"Sleep", "for", 30.0}}}, {C = {{"Arg", 24, "set", 1.0}}}}},
            {Transition = {"Open", "Close"}, Sequence = {{C = {{"PosType", 6}, {"Sleep", "for", 5.0}}}, {C = {{"Arg", 24, "set", 0.0}}}}},
        },
        CrewLadder = {
            {Transition = {"Dismantle", "Erect"}, Sequence = {
                {C = {{"PosType", 6}, {"Sleep", "for", 10.0}}},
                {C = {{"Arg", 91, "set", 1.0}}},
                {C = {{"PosType", 6}, {"Sleep", "for", 10.0}}},
            }},
            {Transition = {"Erect", "Dismantle"}, Sequence = {
                {C = {{"PosType", 6}, {"Sleep", "for", 10.0}}},
                {C = {{"Arg", 91, "set", 0.0}}},
                {C = {{"PosType", 6}, {"Sleep", "for", 10.0}}},
            }},
        },
    }, -- end of mechanimations

	fires_pos =
		{
			[1] = 	{-3.484, -0.004, -0.149}, -- After maingear, fuselage bottom
			[2] = 	{-2.518,  0.055,  1.216}, -- Wing inner Left
			[3] = 	{-2.518,  0.055, -1.216}, -- Wing inner Right
			[4] = 	{-6.250,  0.525,  0.000}, -- Engine damage big
			[5] = 	{-6.750,  0.525,  0.000}, -- Engine damage small
			[6] = 	{-2.346, -0.448,  0.000}, -- Air intake bottom L
			[7] = 	{ 2.346, -0.448,  0.000}, -- Air intake bottom R
		}, -- end of fires_pos
        
    effects_presets = {		
		{effect = "OVERWING_VAPOR", file = current_mod_path.."/Effects/M-2000C_overwingVapor.lua"},
	},

	-- Countermeasures
	Countermeasures = {
		ECM = "AN/ALQ-135"
	},

	passivCounterm = {
		CMDS_Edit = true,
		SingleChargeTotal = 162,
		chaff = {default = 112, increment = 112, chargeSz = 1},
		flare = {default = 16,  increment = 16, chargeSz = 1},
	},

	chaff_flare_dispenser 	= {
		{ dir =  {0, -1, -1}, pos =  {-5.827,   0.108, -0.835}, }, -- 0 Chaff L
		{ dir =  {0, -1, -1}, pos =  {-5.232,   0.170, -0.573}, }, -- 1 Flares L
		{ dir =  {0, -1,  1}, pos =  {-5.827,   0.108,  0.835}, }, -- 2 Chaff R
		{ dir =  {0, -1,  1}, pos =  {-5.232,   0.170,  0.573}, }, -- 3 Flares R
		{ dir =  {0, -1,  1}, pos =  {-4.854,  -0.333,  0.000}, }, -- 4 Eclair Flares 1
		{ dir =  {0, -1,  1}, pos =  {-4.987,  -0.307,  0.000}, }, -- 5 Eclair Flares 2
		{ dir =  {0, -1,  1}, pos =  {-5.117,  -0.301,  0.000}, }, -- 6 Eclair Chaff
	},

	--sensors
	detection_range_max		 = 120,
	radar_can_see_ground 	 = true, -- this should be examined (what is this exactly?)
	
	CanopyGeometry = {
		azimuth   = {-160.0, 160.0}, -- pilot view horizontal (AI)
		elevation = {-50.0, 90.0} -- pilot view vertical (AI)
	},

	Sensors = {
		RWR = "Abstract RWR", -- RWR type
		RADAR = "RDY",        -- Radar type
	},

	Guns = {
		--gun_mount("DEFA_554", { count = 125 },{muzzle_pos_connector = "GUN_POINT_L", muzzle_pos = {1.389,  0.325, -0.241}}),
		--gun_mount("DEFA_554", { count = 125 },{muzzle_pos_connector = "GUN_POINT_R", muzzle_pos = {1.389, -0.325, -0.241}})
		defa554({muzzle_pos = { 0.0, -1.0,  0.325 },muzzle_pos_connector = "GUN_POINT_R"}), --right 
		defa554({muzzle_pos = { 0.0, -1.0, -0.325 },muzzle_pos_connector = "GUN_POINT_L"}), --left 
	},

	Pylons = {
		-- LEFT WING
		pylon(1, 0, -3.086, -0.587, 3.311, {use_full_connector_position=true, connector = "str_pnt_001", arg = 308, arg_value = 0},
			{	
				--Air-to-Air
				{CLSID = "{MMagicII}", arg_value = 0.15, required = {{station = 9,loadout = {"{MMagicII}"}}} }, -- Matra Magic R.550
				{CLSID = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}", arg_value = 0.15 }, -- AIM-9M
				{CLSID = "{Matra155RocketPod}", arg_value = 0.15, required = {{station = 9,loadout = {"{Matra155RocketPod}"}}} }, -- Matra Type 155 Rocket pod
				
				-- Smoke Generators
				{CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}", arg_value = 0.15,arg_increment = -0.1,
							forbidden = {{station = 2}, {station = 3}, {station = 4}, {station = 6}, {station = 7}, {station = 8}}},-- Smokewinder red
				{CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}", arg_value = 0.15,arg_increment = -0.1,
							forbidden = {{station = 2}, {station = 3}, {station = 4}, {station = 6}, {station = 7}, {station = 8}}},-- Smokewinder green
				{CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}", arg_value = 0.15,arg_increment = -0.1,
							forbidden = {{station = 2}, {station = 3}, {station = 4}, {station = 6}, {station = 7}, {station = 8}}},-- Smokewinder blue
				{CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}", arg_value = 0.15,arg_increment = -0.1,
							forbidden = {{station = 2}, {station = 3}, {station = 4}, {station = 6}, {station = 7}, {station = 8}}},-- Smokewinder white
				{CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}", arg_value = 0.15,arg_increment = -0.1,
							forbidden = {{station = 2}, {station = 3}, {station = 4}, {station = 6}, {station = 7}, {station = 8}}},-- Smokewinder yellow
				{CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}", arg_value = 0.15,arg_increment = -0.1,
							forbidden = {{station = 2}, {station = 3}, {station = 4}, {station = 6}, {station = 7}, {station = 8}}},-- Smokewinder orange
			}
		),
		
		pylon(2, 0, -1.809, -0.556, 2.333, {use_full_connector_position=true, connector = "str_pnt_002", arg = 309, arg_value = 0},
			{
				--Air-to-Air
				{CLSID = "{MMagicII}", arg_value = 0.15, required = {{station = 8,loadout = {"{MMagicII}"}}} }, -- Matra Magic R.550
				{CLSID = "{Matra_S530D}", arg_value = 0.15, required = {{station = 8,loadout = {"{Matra_S530D}"}}} }, -- Matra Super 530D
				{CLSID = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}", arg_value = 0.15 }, -- AIM-9M
				
				--Air-to-Ground
				{CLSID = "{Matra155RocketPod}", arg_value = 0.25, required = {{station = 8,loadout = {"{Matra155RocketPod}"}}} }, -- Matra Type 155 Rocket pod
				{CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}", arg_value = 0.35, attach_point_position = {-0.13, -0.14,  0.0}, required = {{station = 8, loadout = {"{BCE4E030-38E9-423E-98ED-24BE3DA87C32}"}}} }, -- MK-82
				{CLSID = "{Mk82SNAKEYE}", arg_value = 0.35, attach_point_position = {-0.13, -0.14,  0.0}, required = {{station = 8,loadout = {"{Mk82SNAKEYE}"}}} }, -- MK-82 Snakeye
				{CLSID = "{BLG66_BELOUGA_AC}", arg_value = 0.35, required = {{station = 8,loadout = {"{BLG66_BELOUGA_AC}"}}} }, -- BLG-66 Belouga
				{CLSID = "{M2KC_RAFAUT_MK82}", arg_value = 0.35, attach_point_position = {0.015,  0.036,  0.0},  required = {{station = 8, loadout = {"{M2KC_RAFAUT_MK82}"}}} }, -- MK-82 x2
				{CLSID = "{M2KC_RAFAUT_MK82S}", arg_value = 0.35, attach_point_position = {0.015,  0.036,  0.0}, required = {{station = 8, loadout = {"{M2KC_RAFAUT_MK82S}"}}} }, -- MK-82S x2
				{CLSID = "{M2KC_RAFAUT_BLG66}", arg_value = 0.35, attach_point_position = {0.015,  0.036,  0.0}, required = {{station = 8, loadout = {"{M2KC_RAFAUT_BLG66}"}}} }, -- Belouga x2 (now loads MK-20s)
				
				--Fuel tanks
				{CLSID = "{M2KC_02_RPL541}", arg_value = 0.0, required = {{station = 8,loadout = {"{M2KC_08_RPL541}"}}} }, -- RPL 541 Fuel Tank
                {CLSID = "{M2KC_02_RPL541_EMPTY}", arg_value = 0.0, required = {{station = 8,loadout = {"{M2KC_08_RPL541_EMPTY}"}}} }, -- RPL 541 Fuel Tank
			}
		),
		
		-- LEFT WING ROOT
		pylon(3, 0,  0.870,  -0.467, 0.779,{use_full_connector_position=true, connector = "str_pnt_003", arg = 310, arg_value = 0},
			{
				{CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}", arg_value = 0.15, attach_point_position = {-0.13, -0.14,  0.0}, required = {
							{station = 4, loadout = {"{BCE4E030-38E9-423E-98ED-24BE3DA87C32}"}}, 
							{station = 6, loadout = {"{BCE4E030-38E9-423E-98ED-24BE3DA87C32}"}}, 
							{station = 7, loadout = {"{BCE4E030-38E9-423E-98ED-24BE3DA87C32}"}}} }, -- MK-82
				{CLSID = "{Mk82SNAKEYE}", arg_value = 0.15, attach_point_position = {-0.13, -0.14,  0.0}, required = {
							{station = 4, loadout = {"{Mk82SNAKEYE}"}}, 
							{station = 6, loadout = {"{Mk82SNAKEYE}"}}, 
							{station = 7, loadout = {"{Mk82SNAKEYE}"}}} }, -- MK-82 Snakeye
				{CLSID = "{BLG66_BELOUGA_AC}", arg_value = 0.15, attach_point_position = {-0.005,  0.021,  0.0}, required = {
							{station = 4, loadout = {"{BLG66_BELOUGA_AC}"}}, 
							{station = 6, loadout = {"{BLG66_BELOUGA_AC}"}}, 
							{station = 7, loadout = {"{BLG66_BELOUGA_AC}"}}} }, -- BLG-66 Belouga Cluster bomb
				{CLSID = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}", arg_value = 0.15,attach_point_position = {0.30,  -0.14,  0.0}, 
							required = {{station = 7, loadout = {"{DB769D48-67D7-42ED-A2BE-108D566C8B1E}"}}},
							forbidden = {{station = 4}, {station = 6}} }, -- GBU-12
			}
		), 
		
		pylon(4, 0, -3.115, -0.467, 1.080, {use_full_connector_position=true, connector = "str_pnt_004", arg = 311, arg_value = 0},
			{
				{CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}", arg_value = 0.15, attach_point_position = {-0.13, -0.14,  0.0}, required = {
							{station = 3, loadout = {"{BCE4E030-38E9-423E-98ED-24BE3DA87C32}"}}, 
							{station = 6, loadout = {"{BCE4E030-38E9-423E-98ED-24BE3DA87C32}"}}, 
							{station = 7, loadout = {"{BCE4E030-38E9-423E-98ED-24BE3DA87C32}"}}} }, -- MK-82
				{CLSID = "{Mk82SNAKEYE}", arg_value = 0.15, attach_point_position = {-0.13, -0.14,  0.0}, required = {
							{station = 3, loadout = {"{Mk82SNAKEYE}"}}, 
							{station = 6, loadout = {"{Mk82SNAKEYE}"}}, 
							{station = 7, loadout = {"{Mk82SNAKEYE}"}}} }, -- MK-82 Snakeye
				{CLSID = "{BLG66_BELOUGA_AC}", arg_value = 0.15, attach_point_position = {-0.04,  0.02,  0.0}, required = {
							{station = 3, loadout = {"{BLG66_BELOUGA_AC}"}}, 
							{station = 6, loadout = {"{BLG66_BELOUGA_AC}"}}, 
							{station = 7, loadout = {"{BLG66_BELOUGA_AC}"}}} }, -- BLG-66 Belouga
			}
		),
		
		-- CENTER FUSELAGE
		pylon(5, 0, -1.075, -0.589, 0.000, {use_full_connector_position=true, connector = "str_pnt_005", arg = 312, arg_value = 0},
			{
				{CLSID = "{BLG66_BELOUGA_AC}", arg_value = 0.25 }, -- BLG-66 Belouga
				{CLSID = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}", arg_value = 0.25 }, -- GBU-12
				{CLSID = "{0D33DDAE-524F-4A4E-B5B8-621754FE3ADE}", arg_value = 0.25 }, -- GBU-16
				{CLSID = "{34759BBC-AF1E-4AEE-A581-498FF7A6EBCE}", arg_value = 0.25 }, -- GBU-24
				{CLSID = "{M2KC_RAFAUT_GBU12}", arg_value = 0.25, attach_point_position = {-0.07,  0.02,  0.0} }, -- GBU-12 x2

				{CLSID = "{M2KC_RPL_522}", arg_value = 0.15 }, -- RPL 522 FUEL TANK
                {CLSID = "{M2KC_RPL_522_EMPTY}", arg_value = 0.15 }, -- RPL 522 FUEL TANK
				
				-- Smoke Generators
				{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}", arg_value = 0.15,arg_increment = -0.1,
							forbidden = {{station = 2}, {station = 3}, {station = 4}, {station = 6}, {station = 7}, {station = 8}}},-- Smokewinder red
				{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}", arg_value = 0.15,arg_increment = -0.1,
							forbidden = {{station = 2}, {station = 3}, {station = 4}, {station = 6}, {station = 7}, {station = 8}}},-- Smokewinder green
				{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}", arg_value = 0.15,arg_increment = -0.1,
							forbidden = {{station = 2}, {station = 3}, {station = 4}, {station = 6}, {station = 7}, {station = 8}}},-- Smokewinder blue
				{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}", arg_value = 0.15,arg_increment = -0.1,
							forbidden = {{station = 2}, {station = 3}, {station = 4}, {station = 6}, {station = 7}, {station = 8}}},-- Smokewinder white
				{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}", arg_value = 0.15,arg_increment = -0.1,
							forbidden = {{station = 2}, {station = 3}, {station = 4}, {station = 6}, {station = 7}, {station = 8}}},-- Smokewinder yellow
				{ CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}", arg_value = 0.15,arg_increment = -0.1,
							forbidden = {{station = 2}, {station = 3}, {station = 4}, {station = 6}, {station = 7}, {station = 8}}},-- Smokewinder orange
			}
		),
		
		-- RIGHT WING ROOT
		pylon(6, 0, -3.115, -0.467, -1.080, {use_full_connector_position=true, connector = "str_pnt_007", arg = 314, arg_value = 0},
			{
				{CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}", arg_value = 0.15, attach_point_position = {-0.13, -0.14,  0.0}, required = {
							{station = 3, loadout = {"{BCE4E030-38E9-423E-98ED-24BE3DA87C32}"}}, 
							{station = 4, loadout = {"{BCE4E030-38E9-423E-98ED-24BE3DA87C32}"}}, 
							{station = 7, loadout = {"{BCE4E030-38E9-423E-98ED-24BE3DA87C32}"}}} }, -- MK-82
				{CLSID = "{Mk82SNAKEYE}", arg_value = 0.15, attach_point_position = {-0.13, -0.14,  0.0}, required = {
							{station = 3, loadout = {"{Mk82SNAKEYE}"}}, 
							{station = 4, loadout = {"{Mk82SNAKEYE}"}}, 
							{station = 7, loadout = {"{Mk82SNAKEYE}"}}} }, -- MK-82 Snakeye
				{CLSID = "{BLG66_BELOUGA_AC}", arg_value = 0.15, attach_point_position = {-0.04,  0.02,  0.0}, required = {
							{station = 3, loadout = {"{BLG66_BELOUGA_AC}"}}, 
							{station = 4, loadout = {"{BLG66_BELOUGA_AC}"}}, 
							{station = 7, loadout = {"{BLG66_BELOUGA_AC}"}}} }, -- BLG-66 Belouga
			}
		),
		
		pylon(7, 0,  0.870, -0.467, -0.779,{use_full_connector_position=true, connector = "str_pnt_006", arg = 313, arg_value = 0},
			{
				{CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}", arg_value = 0.15, attach_point_position = {-0.13, -0.14,  0.0}, required = {
							{station = 3, loadout = {"{BCE4E030-38E9-423E-98ED-24BE3DA87C32}"}}, 
							{station = 4, loadout = {"{BCE4E030-38E9-423E-98ED-24BE3DA87C32}"}}, 
							{station = 6, loadout = {"{BCE4E030-38E9-423E-98ED-24BE3DA87C32}"}}} }, -- MK-82
				{CLSID = "{Mk82SNAKEYE}", arg_value = 0.15, attach_point_position = {-0.13, -0.14,  0.0}, required = {
							{station = 3, loadout = {"{Mk82SNAKEYE}"}}, 
							{station = 4, loadout = {"{Mk82SNAKEYE}"}}, 
							{station = 6, loadout = {"{Mk82SNAKEYE}"}}} }, -- MK-82 Snakeye
				{CLSID = "{BLG66_BELOUGA_AC}", arg_value = 0.15, attach_point_position = {-0.005,  0.021,  0.0}, required = {
							{station = 3, loadout = {"{BLG66_BELOUGA_AC}"}}, 
							{station = 4, loadout = {"{BLG66_BELOUGA_AC}"}}, 
							{station = 6, loadout = {"{BLG66_BELOUGA_AC}"}}} }, -- BLG-66 Belouga
				{CLSID = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}", arg_value = 0.15,attach_point_position = {0.30,  -0.14,  0.0}, 
							required = {{station = 3, loadout = {"{DB769D48-67D7-42ED-A2BE-108D566C8B1E}"}}},
							forbidden = {{station = 4}, {station = 6}} }, -- GBU-12
			}
		),
		
		-- RIGHT WING
		pylon(8, 0, -1.809, -0.556, -2.333, {use_full_connector_position=true, connector = "str_pnt_008", arg = 315, arg_value = 0},
			{
				--Air-to-Air
				{CLSID = "{MMagicII}", arg_value = 0.15, required = {{station = 2,loadout = {"{MMagicII}"}}} }, -- Matra Magic R.550
				{CLSID = "{Matra_S530D}", arg_value = 0.15, required = {{station = 2,loadout = {"{Matra_S530D}"}}} }, -- Matra Super 530D
				{CLSID = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}", arg_value = 0.15 }, -- AIM-9M
				
				--Air-to-Ground
				{CLSID = "{Matra155RocketPod}", arg_value = 0.25, required = {{station = 2,loadout = {"{Matra155RocketPod}"}}} }, -- Matra Type 155 Rocket pod
				{CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}", arg_value = 0.35, attach_point_position = {-0.13, -0.14,  0.0}, required = {{station = 2, loadout = {"{BCE4E030-38E9-423E-98ED-24BE3DA87C32}"}}} }, -- MK-82
				{CLSID = "{Mk82SNAKEYE}", arg_value = 0.35, attach_point_position = {-0.13, -0.14,  0.0}, required = {{station = 2,loadout = {"{Mk82SNAKEYE}"}}} }, -- MK-82 Snakeye
				{CLSID = "{BLG66_BELOUGA_AC}", arg_value = 0.35, required = {{station = 2,loadout = {"{BLG66_BELOUGA_AC}"}}} }, -- BLG-66 Belouga
				{CLSID = "{M2KC_RAFAUT_MK82}", arg_value = 0.35, attach_point_position = {0.015,  0.036,  0.0},  required = {{station = 2,loadout = {"{M2KC_RAFAUT_MK82}"}}} }, -- MK-82 x2
				{CLSID = "{M2KC_RAFAUT_MK82S}", arg_value = 0.35, attach_point_position = {0.015,  0.036,  0.0}, required = {{station = 2,loadout = {"{M2KC_RAFAUT_MK82S}"}}} }, -- MK-82S x2
				{CLSID = "{M2KC_RAFAUT_BLG66}", arg_value = 0.35, attach_point_position = {0.015,  0.036,  0.0}, required = {{station = 2,loadout = {"{M2KC_RAFAUT_BLG66}"}}} }, -- Belouga x2 (now loads MK-20s)
				
				--Fuel Tanks
				{CLSID = "{M2KC_08_RPL541}", arg_value = 0.0, required = {{station = 2,loadout = {"{M2KC_02_RPL541}"}}} }, -- RPL 541 Fuel Tank
                {CLSID = "{M2KC_08_RPL541_EMPTY}", arg_value = 0.0, required = {{station = 2,loadout = {"{M2KC_02_RPL541_EMPTY}"}}} }, -- RPL 541 Fuel Tank
			}
		),
		
		pylon(9, 0,  -3.086, -0.587, -3.311, {use_full_connector_position=true, connector = "str_pnt_009", arg = 316, arg_value = 0},
			{
				--Air-to-Air
				{CLSID = "{MMagicII}", arg_value = 0.15, required = {{station = 1,loadout = {"{MMagicII}"}}} }, -- Matra Magic R.550
				{CLSID = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}", arg_value = 0.15 }, -- AIM-9M
				{CLSID = "{Matra155RocketPod}", arg_value = 0.15, required = {{station = 1,loadout = {"{Matra155RocketPod}"}}} }, -- Matra Type 155 Rocket pod
				
				-- Smoke Generators
				{CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E741}", arg_value = 0.15,arg_increment = -0.1,
							forbidden = {{station = 2}, {station = 3}, {station = 4}, {station = 6}, {station = 7}, {station = 8}}},-- Smokewinder red
				{CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E742}", arg_value = 0.15,arg_increment = -0.1,
							forbidden = {{station = 2}, {station = 3}, {station = 4}, {station = 6}, {station = 7}, {station = 8}}},-- Smokewinder green
				{CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E743}", arg_value = 0.15,arg_increment = -0.1,
							forbidden = {{station = 2}, {station = 3}, {station = 4}, {station = 6}, {station = 7}, {station = 8}}},-- Smokewinder blue
				{CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E744}", arg_value = 0.15,arg_increment = -0.1,
							forbidden = {{station = 2}, {station = 3}, {station = 4}, {station = 6}, {station = 7}, {station = 8}}},-- Smokewinder white
				{CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E745}", arg_value = 0.15,arg_increment = -0.1,
							forbidden = {{station = 2}, {station = 3}, {station = 4}, {station = 6}, {station = 7}, {station = 8}}},-- Smokewinder yellow
				{CLSID = "{A4BCC903-06C8-47bb-9937-A30FEDB4E746}", arg_value = 0.15,arg_increment = -0.1,
							forbidden = {{station = 2}, {station = 3}, {station = 4}, {station = 6}, {station = 7}, {station = 8}}},-- Smokewinder orange
			}
		),
		pylon(10, 0,  -5.086, -0.587, 0.0, {use_full_connector_position=true, connector = "str_pnt_010", arg = 317, arg_value = 0},
			{	{CLSID = "{Eclair}", arg_value = 0.40},	} -- Eclair Pod
		),
	},

	Tasks = {
        aircraft_task(GroundAttack),
        aircraft_task(RunwayAttack),
        aircraft_task(PinpointStrike),
        aircraft_task(CAS),
		aircraft_task(AFAC),
		aircraft_task(CAP),
        aircraft_task(Escort),
        aircraft_task(FighterSweep),
        aircraft_task(Intercept),
    },

	DefaultTask = aircraft_task(CAP),

	SFM_Data = {
		aerodynamics =
		{
		---------------------------------------------------------------------------
		----- SFM Basic Data
		---------------------------------------------------------------------------
			Cy0	=	0,			--- This makes more sense, prevents odd pitch up, that flight controller would normally handle
			Mzalfa	=	6.6,	--- 
			Mzalfadt	=	1,	--- pitch agility mine 5.23
			kjx	=	2.85,       --- roll inertia
			kjz	=	0.00125,    --- pitch inertia
			Czbe	=	-0.012, --- 
			cx_gear	=	0.02,   --- 
			cx_flap	=	0.05,   --- 
			cy_flap	=	0.6,  	--- 
			cx_brk	=	0.025, 	--- 

			-------------------- Drag Polar Coefficients:
			-- Cx = Cx_0 + Cy^2*B2 +Cy^4*B4
			-- It appears this really provides us with a good way to tune turn rate performance
			-- and provides us with how much drag we build up for a given amount of lift we make
			-- Drag polars were tuned from the flight manual and testing with correct max sustained
			-- turn rate
			-------------------- Roll rate taken directly from performance charts
			table_data =
			{
			--	M		Cx0			Cya		B		B4		Omxmax	Aldop		Cymax
				{0,	 	0.0100,		0.081,	0.1500,	0.1100,	0.500,	24.0,	1.280},
				{0.05, 	0.0100,		0.079,	0.1500,	0.1000,	1.000,	29.0,	1.140},
				{0.1,	0.0100,		0.074,	0.1500,	0.0900,	2.800,	17.0,	1.070},
				{0.2,	0.0100,		0.069,	0.1500,	0.0750,	3.280,	17.0,	0.980},
				{0.3,	0.0100,		0.067,	0.1442,	0.3897,	3.400,	17.0,	0.950},
				{0.4,	0.0110,		0.064,	0.1383,	0.7044,	4.363,	17.0,	0.950},
				{0.6,	0.0110,		0.065,	0.1265,	1.3339,	4.854,	17.0,	0.950},
				{0.7,	0.0120,		0.065,	0.1206,	1.6486,	4.829,	17.0,	0.930},
				{0.8,	0.0130,		0.066,	0.1148,	1.9633,	4.803,	17.0,	0.925},
				{0.85,	0.0130,		0.067,	0.1118,	2.1206,	4.778,	17.0,	0.920},
				{0.9,	0.0140,		0.071,	0.1089,	2.2780,	4.752,	17.0,	0.915},
				{1,		0.0150,		0.082,	0.1030,	2.5927,	4.726,	17.0,	0.910},
				{1.05,	0.0160,		0.085,	0.1000,	2.7500,	4.713,	17.0,	0.905},
				{1.1,	0.0160,		0.086,	0.1035,	2.7586,	4.701,	17.0,	0.900},
				{1.2,	0.0165,		0.083,	0.1104,	2.7759,	4.675,	17.0,	0.900},
				{1.3,	0.0170,		0.077,	0.1173,	2.7931,	4.650,	16.0,	0.900},
				{1.5,	0.0180,		0.062,	0.1311,	2.8276,	4.598,	13.0,	0.900},
				{1.7,	0.0200,		0.051,  0.1449,	2.8621,	4.547,	12.0,	0.700},
				{1.8,	0.0210,		0.046,	0.1518,	2.8793,	4.522,	11.4,	0.640},
				{2,		0.0230,		0.039,	0.1656,	2.9138,	4.470,	10.2,	0.520},
				{2.1,	0.0240,		0.034,	0.1725,	2.9310,	4.445,	 9.0,	0.400},
				{2.2,	0.0245,		0.034,	0.1794,	2.9483,	4.419,	 9.0,	0.400},
				{2.5,	0.0300,		0.033,	0.2000,	3.0000,	3.500,	 9.0,	0.400},
			}, -- end of table_data
			-- M - Mach number
			-- Cx0 - Coefficient, drag, profile, of the airplane
			-- Cya - Normal force coefficient of the wing and body of the aircraft in the normal direction to that of flight. Inversely proportional to the available G-loading at any Mach value. (lower the Cya value, higher G available) per 1 degree AOA
			-- B - Polar quad coeff
			-- B4 - Polar 4th power coeff
			-- Omxmax - roll rate, rad/s
			-- Aldop - Alfadop Max AOA at current M - departure threshold
			-- Cymax - Coefficient, lift, maximum possible (ignores other calculations if current Cy > Cymax)

		}, -- end of aerodynamics
		engine =
		{
			Nmg	    =	51.0,
			MinRUD	=	0,
			MaxRUD	=	1,
			MaksRUD	=	0.85,
			ForsRUD	=	0.91,
			typeng	=	1,
			hMaxEng	=	19.0,
			dcx_eng	=	0.0144, -- Affects drag of engine when shutdown
			-- cemax/cefor affect sponginess of elevator/inertia at slow speed
			-- affects available g load apparently
			cemax	=	1.24,
			cefor	=	2.56, 
			-- following affect thrust/max alt
			--
			dpdh_m	=	4100, --  altitude coefficient for max thrust
			dpdh_f	=	11800, --  altitude coefficient for AB thrust  -- affects thrust?? Apparently makes no diff. between 1000 and 20000
			table_data =
			{
				{0,		64300,		95000},
				{0.2,	67000,		96000},
				{0.4,	67000,		96000},
				{0.6,	67000,		102000},
				{0.7,	67000,		111000},
				{0.8,	75000,		126000},
				{0.9,	75000,		145000},
				{1,		75000,		164000},
				{1.1,	75000,		177000},
				{1.2,	80000,		187000},
				{1.3,	82000,		194000},
				{1.5,	76000,		213000},
				{1.8,	69246,		229000},
				{2,		71719,		233000},
				{2.2,	70483,		240000},
				{2.5,	68009,		237000},
				{3,		61827,		117436},
			}, -- end of table_data
			-- M - Mach number
			-- Pmax - Engine thrust at military power - kilo Newtons
			-- Pfor - Engine thrust at AFB
		}, -- end of engine
	},
	
	Failures = {
		{ id = 'HYD_PUMP_1_FAIL_100',		  	  label = _('Hydraulic Pump 1 Fail'),			enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'HYD_PUMP_2_FAIL_100',		  	  label = _('Hydraulic Pump 2 Fail'),			enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'HYD_PUMP_3_FAIL_100',		  	  label = _('Hydraulic Aux Pump Fail'),			enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'OIL_SYSTEM_FAIL_050',		  	  label = _('Oil System Leak'),					enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'OIL_SYSTEM_FAIL_100',		  	  label = _('Oil System Fail'),					enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'BATT_FAIL',		  	              label = _('Battery Fail'),					enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'TRN_FAIL',		  	              label = _('Main Transformer Fail'),			enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'TRN_FAIL_AUX',	  	              label = _('Aux Transformer Fail'),			enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'ENG_ALT_1_FAIL',		  	      label = _('Engine Alternator 1 Fail'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'ENG_ALT_2_FAIL',		  	      label = _('Engine Alternator 2 Fail'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'HYD_ALT_1_FAIL',		  	      label = _('Hydraulic Alternator 1 Fail'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'HYD_ALT_2_FAIL',		  	      label = _('Hydraulic Alternator 1 Fail'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'INS_PART_FAIL',		  	          label = _('INS Partial Failure'),				enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'INS_GYROS_FAIL',		  	      label = _('INS Gyros Fail'),					enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'INS_TOTAL_FAIL',		  	      label = _('INS Total Failure'),				enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'RWR_FAILURE_SENSOR_RIGHT',		  label = _('RWR Right Wing Sensor Fail'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'RWR_FAILURE_SENSOR_LEFT',		  label = _('RWR Left Wing Sensor Fail'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'RWR_FAILURE_SENSOR_TAIL_F',		  label = _('RWR Tail Front Sensor Fail'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'RWR_FAILURE_SENSOR_TAIL_R',		  label = _('RWR Tail Rear Sensor Fail'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
	},

	Damage = {
		-- NOSE, COCKPIT & AVIONICS
		[0]	 = {critical_damage =  3, args = {82}},		-- NOSE_CENTER
		[1]	 = {critical_damage =  5, args = {150}},	-- NOSE_LEFT_SIDE
		[2]	 = {critical_damage =  5, args = {149}},	-- NOSE_RIGHT_SIDE
		[3]	 = {critical_damage =  2, args = {65}},		-- COCKPIT
		[4]	 = {critical_damage =  5, args = {298}},	-- CABIN_LEFT_SIDE
		[5]	 = {critical_damage =  5, args = {299}},	-- CABIN_RIGHT_SIDE
		[90] = {critical_damage =  5},					-- PILOT
		[86] = {critical_damage =  4, args = {300}},	-- AVIONICS BAY 1 (PYLON1)
		[87] = {critical_damage =  4, args = {301}},	-- AVIONICS BAY 2 (PYLON2)
		[88] = {critical_damage =  4, args = {302}},	-- JAMMER (PYLON3)

		-- CONTROL SURFACES
		[53] = {critical_damage =  3, args = {248}},	-- RUDDER
		[25] = {critical_damage =  3, args = {226}},	-- AILERON L
		[51] = {critical_damage =  4, args = {240}},	-- ELEVATOR L IN
		[52] = {critical_damage =  4, args = {238}},	-- ELEVATOR R IN
		[26] = {critical_damage =  3, args = {216}},	-- AILERON R
		[21] = {critical_damage =  3, args = {232}},	-- SLAT L OUT
		[33] = {critical_damage =  4, args = {230}},	-- SLAT L IN
		[22] = {critical_damage =  3, args = {222}},	-- SLAT R OUT
		[34] = {critical_damage =  4, args = {220}},	-- SLAT R IN
		[19] = {critical_damage =  2, args = {183}},	-- AIRBRAKE LEFT
		[20] = {critical_damage =  2, args = {185}},	-- AIRBRAKE RIGHT

		-- ENGINE & FUEL TANKS
		[11] = {critical_damage = 8,  args = {271}},	-- ENGINE
		[61] = {critical_damage = 7,  args = {224}},	-- FUEL_TANK_LEFT_SIDE
		[62] = {critical_damage = 7,  args = {214}},	-- FUEL_TANK_RIGHT_SIDE
		[65] = {critical_damage = 7,  args = {155}},	-- FUEL_TANK_CENTER (BLADE_1_CENTER)
		[66] = {critical_damage = 3               },	-- BATTERY (BLADE_1_OUT)
		[67] = {critical_damage = 3               },	-- ALTERNATOR 1 (BLADE_2_IN)
		[68] = {critical_damage = 3               },	-- ALTERNATOR 2 (BLADE_2_CENTER)
		[69] = {critical_damage = 3               },	-- CONVERTER 1 (BLADE_2_OUT)
		[70] = {critical_damage = 3               },	-- CONVERTER 2 (BLADE_3_IN)
		[71] = {critical_damage = 3               },	-- HYD PUMP 1 (BLADE_3_CENTER)
		[72] = {critical_damage = 3               },	-- HYD PUMP 2 (BLADE_3_OUT)

		-- FUSELAGE & WINGS
		[39] = {critical_damage = 3,  args = {244}},								-- FIN L TOP
		[41] = {critical_damage = 4,  args = {245}, deps_cells = {39,53}},			-- FIN L CENTER
		[43] = {critical_damage = 5,  args = {246}, deps_cells = {41,88}},			-- FIN L BOTTOM
		[23] = {critical_damage = 3,  args = {223}, deps_cells = {21}},				-- WING_L_OUT
		[29] = {critical_damage = 5,  args = {224}, deps_cells = {19,23,84}},	    -- WING_L_CENTER
		[35] = {critical_damage = 7,  args = {225}, deps_cells = {23,21,29,33,61,15,84}},	-- WING_L_IN
		[36] = {critical_damage = 7,  args = {215}, deps_cells = {24,22,30,34,62,16,85}},	-- WING_R_IN
		[30] = {critical_damage = 5,  args = {214}, deps_cells = {20,24,85}},	    -- WING_R_CENTER
		[24] = {critical_damage = 3,  args = {213}, deps_cells = {22}},				-- WING_R_OUT
		[9]	 = {critical_damage = 5,  args = {154}},								-- FUSELAGE_LEFT_SIDE
		[82] = {critical_damage = 5,  args = {152}, deps_cells = {11}},				-- FUSELAGE_BOTTOM
		[10] = {critical_damage = 5,  args = {153}},								-- FUSELAGE_RIGHT_SIDE
		[55] = {critical_damage = 4,  args = {159}, deps_cells = {11}},				-- TAIL PIPE
		[56] = {critical_damage = 4,  args = {158}},								-- TAIL LEFT
		[57] = {critical_damage = 4,  args = {157}},								-- TAIL RIGHT
		[58] = {critical_damage = 4,  args = {156}, deps_cells = {11}}, 			-- TAIL BOTTOM

		-- LANDING GEAR
		[8]  = {critical_damage = 6, args = {265}, deps_cells = {83}},	-- FRONT_GEAR_BOX
		[15] = {critical_damage = 6, args = {267}, deps_cells = {84}},	-- LEFT_GEAR_BOX
		[16] = {critical_damage = 6, args = {266}, deps_cells = {85}},	-- RIGHT_GEAR_BOX
		[83] = {critical_damage = 3, args = {134}},						-- WHEEL F
		[84] = {critical_damage = 3, args = {135}},						-- WHEEL L
		[85] = {critical_damage = 3, args = {136}},						-- WHEEL R

		-- WEAPONS
		[7]  = {critical_damage = 3, args = {296}},						-- GUNS

	},

	--oblomok = russian for splinter
	--must create models for damaged parts
	DamageParts =
	{
		[1000 + 0]  = "M2KC-fragment-nose",
		[1000 + 1]  = "M2KC-fragment-nose-1",
		[1000 + 35] = "M-2000c-oblomok-wing-L",
		[1000 + 29] = "M-2000c-oblomok-wing-L",
		[1000 + 23] = "M-2000c-oblomok-wing-L",
		[1000 + 35] = "M-2000c-oblomok-wing-R",
		[1000 + 29] = "M-2000c-oblomok-wing-R",
		[1000 + 23] = "M-2000c-oblomok-wing-R",
		[1000 + 47] = "M2KC-fragment-stabilizador-L",
		[1000 + 48] = "M2KC-fragment-stabilizador-R",
		[1000 + 55] = "M2KC-fragment-tail",
		[1000 + 41] = "M2KC-fragment-fin-center",
		[1000 + 5]  = "M2KC-fragment-canopy",
		[1000 + 3]  = "M2KC-fragment-canopy-back",
	},

	-- Must create the connectors in the exernal model for the external lights
	--[[ LIGHT COLLECTION DATA
		WOLALIGHT_STROBES 		   = 1--must be collection
		WOLALIGHT_SPOTS  		   = 2--must be collection
		WOLALIGHT_NAVLIGHTS 	   = 3--must be collection
		WOLALIGHT_FORMATION_LIGHTS = 4--must be collection
		WOLALIGHT_TIPS_LIGHTS      = 5--must be collection
	]]--
	
	lights_data = 	{
		typename = "collection",
		lights = 	{
			--[[NATO STROBE LIGHTS]]--
			[1] = {
				typename = "collection",
				lights ={
					{typename = "argnatostrobelight",  argument = 83,  period = 1.333,  phase_shift = 0.0}, -- Top Strobe
					{typename = "argnatostrobelight",  argument = 802, period = 1.333,  phase_shift = 0.5}, -- Bottom Strobe
				}
			},
			
			--[[TAXI Lights]]--
			[2] = {
				typename = "collection",
				lights ={
					--Taxi Spotlights
					{typename = "argumentlight", argument = 209, dir_correction = {elevation = math.rad(3)}, speed = 1.0},
					{typename = "argumentlight", argument = 209, dir_correction = {elevation = math.rad(3)}, speed = 1.0},
				}
			},
			
			--[[LANDING Lights]]--
			[3] = {
				typename = "collection",
				lights ={
					--Landing Spot Lights
					{typename = "argumentlight", argument = 208, dir_correction = {elevation = math.rad(3)}, speed = 1.0},
					{typename = "argumentlight", argument = 208, dir_correction = {elevation = math.rad(3)}, speed = 1.0},
				}
			},
			
			--[[NAVIGATION LIGHTS]]--
			[4] = {
				typename = "collection",
				lights ={
					{typename = "argumentlight",  argument  = 190}, --Red Position
					{typename = "argumentlight",  argument  = 192}, --Green Position
					{typename = "argumentlight",  argument  = 191}, --White Position
				}
			},
			
			--[[FORMATION LIGHTS]]--
			[5] = {
				typename = "collection",
				lights ={
					{typename = "argumentlight",argument = 200}, -- form front
					{typename = "argumentlight",argument = 201}, -- form aft
				}
			},	
			
			--[[REFUEL LIGHTS]]--
			[6] = {
				typename = "collection",
				lights ={
					{typename = "argumentlight", connector = "CNT_RF1", color = {0.99, 0.99, 0.99}, pos_correction  = {0, 0, 0.0}, argument  = 903}, -- Right Side Low
					--{typename = "argumentlight", connector = "CNT_RF4", color = {0.99, 0.99, 0.99}, pos_correction  = {0, 0, 0.0}, argument  = 904}, -- Nose Low
					{typename = "argumentlight", connector = "CNT_RF2", color = {0.99, 0.99, 0.99}, pos_correction  = {0, 0, 0.0}, argument  = 907, speed = 1.0}, -- Right Side High
					{typename = "argumentlight", connector = "CNT_RF3", color = {0.99, 0.99, 0.99}, pos_correction  = {0, 0, 0.0}, argument  = 908, speed = 1.0}, -- Nose High
				}
			},	
			
			--[[POLICE LIGHTS]]--
			[7] = {
				typename = "collection",
				lights ={
					{typename = "argumentlight", connector = "CTN_POL1", color = {0.99, 0.99, 0.99}, pos_correction  = {0, 0, 0.0}, argument  = 905, speed = 1.0}, -- Police
				}
			},	
		},
	},
	-- end lights_data
	
	panelRadio = {
       [1] = {
           name = _("UHF Radio"),		   
           range = {	
						{min = 225.0, max = 400.0}
			},
            channels = {
                [1] = { name = _("Channel 1"),		default = 305.0, modulation = _("AM"), connect = true}, -- default
                [2] = { name = _("Channel 2"),		default = 264.0, modulation = _("AM")},	-- min. water : 135.0, 264.0
                [3] = { name = _("Channel 3"),		default = 265.0, modulation = _("AM")},	-- nalchik : 136.0, 265.0
                [4] = { name = _("Channel 4"),		default = 256.0, modulation = _("AM")},	-- sochi : 127.0, 256.0
                [5] = { name = _("Channel 5"),		default = 254.0, modulation = _("AM")},	-- maykop : 125.0, 254.0
                [6] = { name = _("Channel 6"),		default = 250.0, modulation = _("AM")},	-- anapa : 121.0, 250.0
                [7] = { name = _("Channel 7"),		default = 270.0, modulation = _("AM")},	-- beslan : 141.0, 270.0
                [8] = { name = _("Channel 8"),		default = 257.0, modulation = _("AM")},	-- krasnodar-pashk. : 128.0, 257.0
                [9] = { name = _("Channel 9"),		default = 255.0, modulation = _("AM")},	-- gelenjik : 126.0, 255.0
                [10] = { name = _("Channel 10"),	default = 262.0, modulation = _("AM")},	-- kabuleti : 133.0, 262.0
                [11] = { name = _("Channel 11"),	default = 259.0, modulation = _("AM")},	-- gudauta : 130.0, 259.0
                [12] = { name = _("Channel 12"),	default = 268.0, modulation = _("AM")},	-- soginlug : 139.0, 268.0
                [13] = { name = _("Channel 13"),	default = 269.0, modulation = _("AM")},	-- vaziani : 140.0, 269.0
                [14] = { name = _("Channel 14"),	default = 260.0, modulation = _("AM")},	-- batumi : 131.0, 260.0
                [15] = { name = _("Channel 15"),	default = 263.0, modulation = _("AM")},	-- kutaisi : 134.0, 263.0
                [16] = { name = _("Channel 16"),	default = 261.0, modulation = _("AM")},	-- senaki : 132.0, 261.0
                [17] = { name = _("Channel 17"),	default = 267.0, modulation = _("AM")},	-- lochini : 138.0, 267.0
                [18] = { name = _("Channel 18"),	default = 251.0, modulation = _("AM")},	-- krasnodar-center : 122.0, 251.0
                [19] = { name = _("Channel 19"),	default = 253.0, modulation = _("AM")},	-- krymsk : 124.0, 253.0
                [20] = { name = _("Channel 20"),	default = 266.0, modulation = _("AM")}, -- mozdok : 137.0, 266.0
            }
       },
	   [2] = {
           name = _("V/UHF Radio"),		   
           range = {	{min = 118.0, max = 140.0},
						{min = 225.0, max = 400.0}
			},
            channels = {
                [1] = { name = _("Channel 1"),		default = 129.0, modulation = _("AM")}, -- default
                [2] = { name = _("Channel 2"),		default = 135.0, modulation = _("AM")},	-- min. water : 135.0, 264.0
                [3] = { name = _("Channel 3"),		default = 136.0, modulation = _("AM")},	-- nalchik : 136.0, 265.0
                [4] = { name = _("Channel 4"),		default = 127.0, modulation = _("AM")},	-- sochi : 127.0, 256.0
                [5] = { name = _("Channel 5"),		default = 125.0, modulation = _("AM")},	-- maykop : 125.0, 254.0
                [6] = { name = _("Channel 6"),		default = 121.0, modulation = _("AM")},	-- anapa : 121.0, 250.0
                [7] = { name = _("Channel 7"),		default = 141.0, modulation = _("AM")},	-- beslan : 141.0, 270.0
                [8] = { name = _("Channel 8"),		default = 128.0, modulation = _("AM")},	-- krasnodar-pashk. : 128.0, 257.0
                [9] = { name = _("Channel 9"),		default = 126.0, modulation = _("AM")},	-- gelenjik : 126.0, 255.0
                [10] = { name = _("Channel 10"),	default = 133.0, modulation = _("AM")},	-- kabuleti : 133.0, 262.0
                [11] = { name = _("Channel 11"),	default = 130.0, modulation = _("AM")},	-- gudauta : 130.0, 259.0
                [12] = { name = _("Channel 12"),	default = 139.0, modulation = _("AM")},	-- soginlug : 139.0, 268.0
                [13] = { name = _("Channel 13"),	default = 140.0, modulation = _("AM")},	-- vaziani : 140.0, 269.0
                [14] = { name = _("Channel 14"),	default = 131.0, modulation = _("AM")},	-- batumi : 131.0, 260.0
                [15] = { name = _("Channel 15"),	default = 134.0, modulation = _("AM")},	-- kutaisi : 134.0, 263.0
                [16] = { name = _("Channel 16"),	default = 132.0, modulation = _("AM")},	-- senaki : 132.0, 261.0
                [17] = { name = _("Channel 17"),	default = 138.0, modulation = _("AM")},	-- lochini : 138.0, 267.0
                [18] = { name = _("Channel 18"),	default = 122.0, modulation = _("AM")},	-- krasnodar-center : 122.0, 251.0
                [19] = { name = _("Channel 19"),	default = 124.0, modulation = _("AM")},	-- krymsk : 124.0, 253.0
                [20] = { name = _("Channel 20"),	default = 137.0, modulation = _("AM")}, -- mozdok : 137.0, 266.0
            }
       },
   },	
   
   -- Aircraft Additional Properties
	AddPropAircraft = {
		{ id = "NoDDMSensor", control = 'checkbox', label = _('Do not mount the DDM sensors'), defValue = false, weightWhenOn = -80},
		{ id = "RocketBurst", control = 'comboList', label = _('Rocket Burst Count'),
			values = {
				{id =  1, dispName = _("1 Rocket")},
				{id =  3, dispName = _("3 Rockets")},
				{id =  6, dispName = _("6 Rockets")},
				{id = 18, dispName = _("18 Rockets")}
			},
			defValue  = 6,
			wCtrl     = 150
		},
		{ id = "GunBurst", control = 'comboList', label = _('Gun Burst Length (Seconds)'),
			values = {
				{id =  1, dispName = _("0.5 Second")},
				{id =  2, dispName = _("1.0 Second")}
			},
			defValue  = 1,
			wCtrl     = 150
		},
        { id = "LaserCode100",  control = 'spinbox',  label = _('Laser code for GBUs, 1x11'), defValue = 6, min = 1, max = 8, dimension = ' ' },
        { id = "LaserCode10",   control = 'spinbox',  label = _('Laser code for GBUs, 11x1'), defValue = 8, min = 1, max = 8, dimension = ' ' },
        { id = "LaserCode1",    control = 'spinbox',  label = _('Laser code for GBUs, 111x'), defValue = 8, min = 1, max = 8, dimension = ' ' },
        { id = "WpBullseye",    control = 'spinbox',  label = _('Waypoint Bullseye'),   defValue = 0, min = 0, max = 20, dimension = ' ' },
        { id = "ForceINSRules", control = 'checkbox', label = _('Enforce INS Alignment and drift'), defValue = false, weightWhenOn = -80},
	}
}

add_aircraft(M_2000C)
