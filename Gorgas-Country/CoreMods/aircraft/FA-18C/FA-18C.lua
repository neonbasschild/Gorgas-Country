local tips 		= {
	{ CLSID = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}"	, 					Cx_gain = 0.24}, --AIM-9M
--	{ CLSID = "{AIM-9P5}"								, 					Cx_gain = 0.24}, --AIM-9P5
	{ CLSID = "CATM-9M"									, 					Cx_gain = 0.24}, --CATM-9M
	{ CLSID = "{AIM-9L}"								, 					Cx_gain = 0.24}, --AIM-9L
	{ CLSID = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}"	, 					Cx_gain = 0.24}, --AIM-9X
	{ CLSID = "{AIS_ASQ_T50}", attach_point_position = {0.25,  0.0,  0.0} , Cx_gain = 0.24}, --ACMI pod
}

local outboard 	= {
	{ CLSID = "LAU-115_2*LAU-127_AIM-9M"				},	-- 2xAIM-9M
	{ CLSID = "LAU-115_2*LAU-127_CATM-9M"				},	-- 2xCATM-9M
	{ CLSID = "LAU-115_2*LAU-127_AIM-9L"				},	-- 2xAIM-9L
	{ CLSID = "LAU-115_2*LAU-127_AIM-9X"				},	-- 2xAIM-9X
	{ CLSID = "LAU-115_LAU-127_AIM-9X"					},	-- AIM-9X
	{ CLSID = "LAU-115_LAU-127_CATM-9M"					},	-- CATM-9M
	{ CLSID = "LAU-115_LAU-127_AIM-9L"					},	-- AIM-9L
	{ CLSID = "LAU-115_LAU-127_AIM-9M"					},	-- AIM-9M
	{ CLSID = "{LAU-115 - AIM-7M}"						},	-- AIM-7M on LAU-115
--	{ CLSID = "{LAU-115 - AIM-7E}"						},	-- AIM-7E on LAU-115
	{ CLSID = "{LAU-115 - AIM-7F}"						},	-- AIM-7F on LAU-115
	{ CLSID = "{LAU-115 - AIM-7H}"						},	-- AIM-7H on LAU-115
	{ CLSID = "{LAU-115 - AIM-120B}"					},	-- AIM-120
	{ CLSID = "{LAU-115 - AIM-120C}"					},	-- AIM-120
	{ CLSID = "LAU-115_2*LAU-127_AIM-120B"				},
	{ CLSID = "LAU-115_2*LAU-127_AIM-120C"				},
	{ CLSID = "{F16A4DE0-116C-4A71-97F0-2CF85B0313EC}"	},	-- AGM-65E on LAU-117
--	{ CLSID = "LAU_117_AGM_65G"							},
	{ CLSID = "LAU_117_AGM_65F"							},
	{ CLSID = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}"	},	-- AGM-88 on LAU-118
	{ CLSID = "{BRU33_LAU68}"							},	-- BRU-33 1*LAU-68-M151
	{ CLSID = "{BRU33_2*LAU68}"							},	-- BRU-33 2*LAU-68-M151
	{ CLSID = "{BRU33_LAU68_MK5}"						},	-- BRU-33 1*LAU-68-MK5
	{ CLSID = "{BRU33_2*LAU68_MK5}"						},	-- BRU-33 2*LAU-68-MK5
	{ CLSID = "{BRU33_LAU10}"							},	-- BRU-33 1*LAU-10
	{ CLSID = "{BRU33_2*LAU10}"							},	-- BRU-33 2*LAU-10
	{ CLSID = "{BRU33_LAU61}"							},	-- BRU-33 1*LAU-61
	{ CLSID = "{BRU33_2*LAU61}"							},	-- BRU-33 2*LAU-61
--	{ CLSID = "{174C6E6D-0C3D-42ff-BCB3-0853CB371F5C}"	},	-- LAU-68-MK5
--	{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}"	},
	{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}"	},  -- Mk-82
	{ CLSID	= "{Mk82SNAKEYE}", 							}, 	-- Mk-82 SNAKEYE
	{ CLSID	= "{Mk_82Y}", 								}, 	-- Mk-82 Y
	{ CLSID	= "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}"	},  -- Mk-83
	{ CLSID	=	"{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}"},	-- Mk-84
	{ CLSID = "{BRU33_2X_MK-82}"						},	-- BRU-33 2*Mk-82
	{ CLSID = "{BRU33_2X_MK-82_Snakeye}"				},	-- BRU-33 2*Mk-82SE
	{ CLSID = "{BRU33_2X_MK-82Y}"						},	-- BRU-33 2*Mk-82Y
	{ CLSID = "{BRU33_2X_ROCKEYE}"						},	-- BRU-33 2*Mk-20
	{ CLSID = "{BRU33_2X_MK-83}", 						},	-- BRU-33 2*Mk-83
--	{ CLSID = "{BRU41_6X_MK-82}"						},	-- BRU-41 6*Mk-82
	{ CLSID = "{BRU41_6X_BDU-33}"						},	-- BRU-41 6*BDU-33
	{ CLSID = "{51F9AAE5-964F-4D21-83FB-502E3BFE5F8A}"  },  -- GBU-10
	{ CLSID	= "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}"	},  -- GBU-12
    { CLSID = "{0D33DDAE-524F-4A4E-B5B8-621754FE3ADE}"  },  -- GBU-16
	{ CLSID = "{CBU_99}"								},  -- GBU-99
	{ CLSID	= "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}"  },  -- MK-20
	{ CLSID = "{BRU33_2X_CBU-99}", 						},	-- BRU-33 2*CBU-99
	{ CLSID = "{BRU33_2X_GBU-12}", 						},	--BRU-33 2*GBU-12
	{ CLSID = "<CLEAN>",	arg_value = 1				},
	{ CLSID = "{AGM-154A}", Type = 1 },								-- AGM-154A
	{ CLSID = "{BRU55_2*AGM-154A}", Type = 1 },
	{ CLSID = "{9BCC2A2B-5708-4860-B1F1-053A18442067}", Type = 1 },
	{ CLSID = "{BRU55_2*AGM-154C}", Type = 1 },
	{ CLSID = "{GBU-31}" },
	{ CLSID = "{GBU-31V3B}"},				
	{ CLSID = "{GBU-38}" },
	{ CLSID = "{BRU55_2*GBU-38}"},
	{ CLSID	= "{AGM_84D}", Type = 1},					 -- AGM-84D Harpoon 
--	{ CLSID = "{AF42E6DF-9A60-46D8-A9A0-1708B241AADB}"}, --SLAM
--	{ CLSID = "{AGM_84H}"},--SLAM-ER
	{ CLSID = "{C40A1E3A-DD05-40D9-85A4-217729E37FAE}"}, --WALLEYE
	{ CLSID = "{AWW-13}",	arg_value = 0.1}, 				-- AWW-13
}

local inboard 	= {
	{ CLSID = "{LAU-115 - AIM-7M}"						},	-- AIM-7M on LAU-115
--	{ CLSID = "{LAU-115 - AIM-7E}"						},	-- AIM-7E on LAU-115
	{ CLSID = "{LAU-115 - AIM-7F}"						},	-- AIM-7F on LAU-115
	{ CLSID = "{LAU-115 - AIM-7H}"						},	-- AIM-7H on LAU-115
	{ CLSID = "{LAU-115 - AIM-120B}"					},	-- AIM-120
	{ CLSID = "{LAU-115 - AIM-120C}"					},	-- AIM-120
	{ CLSID = "LAU-115_2*LAU-127_AIM-120B"				},	-- AIM-120
	{ CLSID = "LAU-115_2*LAU-127_AIM-120C"				},
	{ CLSID = "{F16A4DE0-116C-4A71-97F0-2CF85B0313EC}"	},	-- AGM-65E on LAU-117
--	{ CLSID = "LAU_117_AGM_65G"							},
	{ CLSID = "LAU_117_AGM_65F"							},
	{ CLSID = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}"	},	-- AGM-88 on LAU-118
	{ CLSID = "{BRU33_LAU68}"							},	-- BRU-33 1*LAU-68-M151
	{ CLSID = "{BRU33_2*LAU68}"							},	-- BRU-33 2*LAU-68-M151
	{ CLSID = "{BRU33_LAU10}"							},	-- BRU-33 1*LAU-10
	{ CLSID = "{BRU33_2*LAU10}"							},	-- BRU-33 2*LAU-10
	{ CLSID = "{BRU33_LAU61}"							},	-- BRU-33 1*LAU-61
	{ CLSID = "{BRU33_2*LAU61}"							},	-- BRU-33 2*LAU-61
	
--	{ CLSID = "{174C6E6D-0C3D-42ff-BCB3-0853CB371F5C}"	},	-- LAU-68-MK5
--	{ CLSID = "{A021F29D-18AB-4d3e-985C-FC9C60E35E9E}"	},
	{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}"	},  -- Mk-82
	{ CLSID	= "{Mk82SNAKEYE}", 							}, 	-- Mk-82 SNAKEYE
	{ CLSID	= "{Mk_82Y}", 								}, 	-- Mk-82 Y
	{ CLSID	= "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}"	},  -- Mk-83
	{ CLSID	=	"{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}"},	-- Mk-84
--	{ CLSID	= "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}"	},  -- GBU-12
	{ CLSID = "{BRU33_2X_MK-82}"						},	-- BRU-33 2*Mk-82
	{ CLSID = "{BRU33_2X_MK-82_Snakeye}"				},	-- BRU-33 2*Mk-82SE
	{ CLSID = "{BRU33_2X_MK-82Y}"						},	-- BRU-33 2*Mk-82Y
	{ CLSID = "{BRU33_2X_ROCKEYE}"						},	-- BRU-33 2*Mk-20
	{ CLSID = "{BRU33_2X_MK-83}", 						},	--BRU-33 2*Mk-83
--	{ CLSID = "{BRU41_6X_MK-82}"						},	-- BRU-41 6*Mk-82
	{ CLSID = "{BRU41_6X_BDU-33}"						},	-- BRU-41 6*BDU-33
	{ CLSID = "{FPU_8A_FUEL_TANK}"						},	-- Fuel tank
	{ CLSID = "{51F9AAE5-964F-4D21-83FB-502E3BFE5F8A}"  },  -- GBU-10
	{ CLSID	= "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}"	},  -- GBU-12
	{ CLSID = "{0D33DDAE-524F-4A4E-B5B8-621754FE3ADE}"  },  -- GBU-16
	{ CLSID = "{CBU_99}"								},  -- GBU-99
	{ CLSID = "{BRU33_2X_CBU-99}", 						},	-- BRU-33 2*CBU-99
	{ CLSID	= "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}"  },  -- MK-20
	{ CLSID = "{BRU33_2X_GBU-12}", 						},	--BRU-33 2*GBU-12
	{ CLSID = "<CLEAN>",	arg_value = 1				},
	{ CLSID = "{AGM-154A}", Type = 1 },						-- AGM-154A
	{ CLSID = "{BRU55_2*AGM-154A}", Type = 1 },
	{ CLSID = "{9BCC2A2B-5708-4860-B1F1-053A18442067}", Type = 1 },
	{ CLSID = "{BRU55_2*AGM-154C}", Type = 1 },
	{ CLSID = "{GBU-31}" },
	{ CLSID = "{GBU-31V3B}"},				
	{ CLSID = "{GBU-38}" },
	{ CLSID = "{BRU55_2*GBU-38}"},
	{ CLSID	= "{AGM_84D}", Type = 1},					 -- AGM-84D Harpoon 
--	{ CLSID = "{AF42E6DF-9A60-46D8-A9A0-1708B241AADB}"}, --SLAM
--	{ CLSID = "{AGM_84H}"},--SLAM-ER
	{ CLSID = "{AWW-13}",	arg_value = 0.1}, 				-- AWW-13
}

local fuselageLeft	= {
	{ CLSID = "{8D399DDA-FF81-4F14-904D-099B34FE7918}"	},	-- AIM-7M
	{ CLSID = "{AIM-7F}"	},
	{ CLSID = "{AIM-7H}"	},
	{ CLSID = "{C8E06185-7CD6-4C90-959F-044679E90751}"	},	-- AIM-120
	{ CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}"	},	-- AIM-120C
}

local fuselageRight	= {
	{ CLSID = "{8D399DDA-FF81-4F14-904D-099B34FE7918}"	},	-- AIM-7M
	{ CLSID = "{AIM-7F}"	},
	{ CLSID = "{AIM-7H}"	},
	{ CLSID = "{C8E06185-7CD6-4C90-959F-044679E90751}"	},	-- AIM-120
	{ CLSID = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}"	},	-- AIM-120C
	{ CLSID = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",	arg_value = 0.1},	--Litening
}

local centerline 	= {
--	{ CLSID = "{BRU41_6X_BDU-33}"						},	-- BRU-41 6*BDU-33
	{ CLSID = "{FPU_8A_FUEL_TANK}"						},	-- Fuel tank
	{ CLSID = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}"	},  -- Mk-82
	{ CLSID	= "{Mk82SNAKEYE}", 							}, 	-- Mk-82 SNAKEYE
	{ CLSID	= "{Mk_82Y}", 								}, 	-- Mk-82 Y
	{ CLSID	= "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}"	},  -- Mk-83
	{ CLSID	= "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}"	},	-- Mk-84
	{ CLSID = "{BRU33_2X_MK-82}"						},	-- BRU-33 2*Mk-82
	{ CLSID = "{BRU33_2X_MK-82_Snakeye}"				},	-- BRU-33 2*Mk-82SE
	{ CLSID = "{BRU33_2X_MK-82Y}"						},	-- BRU-33 2*Mk-82Y
	{ CLSID = "{BRU33_2X_ROCKEYE}"						},	-- BRU-33 2*Mk-20
--	{ CLSID = "{BRU33_2X_MK-83}", 						},	-- BRU-33 2*Mk-83
	{ CLSID = "{CBU_99}"								},  -- GBU-99
	{ CLSID = "{BRU33_2X_CBU-99}", 						},	-- BRU-33 2*CBU-99
	{ CLSID	= "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}"  },  -- MK-20
	{ CLSID = "{A111396E-D3E8-4b9c-8AC9-2432489304D5}",	arg_value = 0.1},	--Litening
	{ CLSID = "{AWW-13}",	arg_value = 0.1}, 				-- AWW-13
	{ CLSID = "<CLEAN>",	arg_value = 1				},
}

local F_18C =  {
	Name 				=   'FA-18C_hornet',

	shape_table_data 	= 
	{
		{
			file  	    = "fa-18c";
			username    = "FA-18C_hornet";
			index       = WSTYPE_PLACEHOLDER;
			life  	    = 20; -- прочность объекта (методом lifebar*) -- The strength of the object (ie. lifebar *)
			vis   	    = 3; -- множитель видимости (для маленьких объектов лучше ставить поменьше). Visibility factor (For a small objects is better to put lower nr).
			desrt       = "F_A-18C_destr"; --Name of destroyed object file name
			fire  	    = { 300, 2}; -- Fire on the ground after destoyed: 300sec 4m
			classname   = "lLandPlane";
			positioning = "BYNORMAL";
		},
		{
			name  = "F_A-18C_destr";
	        file  = "f-18c-oblomok";
			fire  = { 0, 1};
		}
	},

	Picture = "FA-18A.png",
	DisplayName			=	_("F/A-18C Lot 20"),
	mapclasskey			=	"P0091000024",
	WorldID				=   WSTYPE_PLACEHOLDER,
	attribute 			= 	{wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER, "Multirole fighters", "Refuelable", "Datalink", "Link16"},
	Categories			=	{"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor",},
	CanopyGeometry		=	makeAirplaneCanopyGeometry(LOOK_AVERAGE, LOOK_AVERAGE, LOOK_GOOD),
	Rate				=	50,	

	-- database/planes
	LandRWCategories = {
		[1] = 
		{
			Name = "AircraftCarrier",
		}, -- end of [1]
	}, -- end of LandRWCategories
	TakeOffRWCategories = {
		[1] = 
		{
			Name = "AircraftCarrier With Catapult",
		}, -- end of [1]
	}, -- end of TakeOffRWCategories
	
	-- Countermeasures, 
	passivCounterm = {
		CMDS_Edit = true,
		SingleChargeTotal = 120,
		-- RR-170
		chaff = {default = 60, increment = 10, chargeSz = 1},
		-- MJU-7
		flare = {default = 30, increment = 5,  chargeSz = 2}
	},
	Sensors = {
		RADAR = "AN/APG-73",
		RWR = "Abstract RWR"
	},
	Countermeasures = {
		ECM = {"AN/ALQ-165"}
	},
	EPLRS = true,

	Pylons =	{
		pylon(1, 0, -2.218, -0.063, -5.779,
			{
  				use_full_connector_position = true,
				connector = "Pylon1",
			},
			tips
		),
		pylon(2, 0, -1.212, -0.487, -3.369,
			{
				arg = 309,
				arg_value = 0,
				use_full_connector_position = true,
				connector = "Pylon2",
			},
			outboard
		),
		pylon(3, 0, -1.069, -0.42, -2.212,
			{
				arg = 310,
				arg_value = 0,
				use_full_connector_position = true,
				connector = "Pylon3",
			},
			inboard
		),
		pylon(4, 1, -2.321, -0.654, -1.044,
			{
				arg = 311,
				arg_value = 0,
				use_full_connector_position = true,
				connector = "Pylon4",
			},
			fuselageLeft
		),
		pylon(5, 1, 0, -0.652, 0.000000,
			{
				arg = 312,
				arg_value = 0,
				use_full_connector_position = true,
				connector = "Pylon5",
			},
			centerline
		),
		pylon(6, 1, -2.321, -0.654, 1.044,
			{
				arg = 313,
				arg_value = 0,
				use_full_connector_position = true,
				connector = "Pylon6",
			},
			fuselageRight
		),
		pylon(7, 0, -1.069, -0.42, 2.212,
			{
				arg = 314,
				arg_value = 0,
				use_full_connector_position = true,
				connector = "Pylon7",
			},
			inboard
		),
		pylon(8, 0, -1.212, -0.487, 3.369,
			{
				arg = 315,
				arg_value = 0,
				use_full_connector_position = true,
				connector = "Pylon8",
			},
			outboard
		),
		pylon(9, 0, -2.218, -0.063, 5.779,
			{
				use_full_connector_position = true,
				connector = "Pylon9",
			},
			tips
		),
        pylon(
            10,
            2,-- make it "hatch" station , it will be invisible until hatch is closed , it is always closed on hornet
            -8.1, 0.1, -0.49,
            {
                connector = "disable",
                DisplayName = _("SMK")
            },
            {{CLSID = "{INV-SMOKE-RED}"},		--Smoke Generator - red
			 {CLSID = "{INV-SMOKE-GREEN}"},		--Smoke Generator - green
			 {CLSID = "{INV-SMOKE-BLUE}"},		--Smoke Generator - blue
			 {CLSID = "{INV-SMOKE-WHITE}"},		--Smoke Generator - white
			 {CLSID = "{INV-SMOKE-YELLOW}"},	--Smoke Generator - yellow
			 {CLSID = "{INV-SMOKE-ORANGE}"},	--Smoke Generator - orange
			}
        ),
	},
	
	--0043552: Hornet: Gun should not have tracers
	--Tracers are an option but not often used. My suggestion is to keep them by default because they look awesome, and make it a load option or a menu option to not use tracers.
	ammo_type ={ _("Default"),
                 _("No Tracers"),
				},
	Guns = {
		gun_mount("M_61", {count = 578}, {muzzle_pos_connector = "Gun_point_00"})
	},

	HumanRadio	= {
		frequency	= 305.0,
		editable	= true,
		minFrequency	= 118.000,
		maxFrequency	= 399.975,
	    rangeFrequency = {
			{min = 118.0, max = 155.995},
			{min = 225.0, max = 399.975}
		},
		modulation	= MODULATION_AM,
	},
	panelRadio	= {
		[1] = {  
		    name = _("COMM 1: ARC-210"),
		    range = {
				{min = 30.0, max = 87.995},
				{min = 108.0, max = 173.995},
				{min = 225.0, max = 399.975}
			},
			channels = {
				[1] = { name = _("Channel 1"),		default = 305.0, modulation = _("AM/FM"), connect = true}, -- default
				[2] = { name = _("Channel 2"),		default = 264.0, modulation = _("AM/FM")},	-- min. water : 135.0, 264.0
				[3] = { name = _("Channel 3"),		default = 265.0, modulation = _("AM/FM")},	-- nalchik : 136.0, 265.0
				[4] = { name = _("Channel 4"),		default = 256.0, modulation = _("AM/FM")},	-- sochi : 127.0, 256.0
				[5] = { name = _("Channel 5"),		default = 254.0, modulation = _("AM/FM")},	-- maykop : 125.0, 254.0
				[6] = { name = _("Channel 6"),		default = 250.0, modulation = _("AM/FM")},	-- anapa : 121.0, 250.0
				[7] = { name = _("Channel 7"),		default = 270.0, modulation = _("AM/FM")},	-- beslan : 141.0, 270.0
				[8] = { name = _("Channel 8"),		default = 257.0, modulation = _("AM/FM")},	-- krasnodar-pashk. : 128.0, 257.0
				[9] = { name = _("Channel 9"),		default = 255.0, modulation = _("AM/FM")},	-- gelenjik : 126.0, 255.0
				[10] = { name = _("Channel 10"),	default = 262.0, modulation = _("AM/FM")},	-- kabuleti : 133.0, 262.0
				[11] = { name = _("Channel 11"),	default = 259.0, modulation = _("AM/FM")},	-- gudauta : 130.0, 259.0
				[12] = { name = _("Channel 12"),	default = 268.0, modulation = _("AM/FM")},	-- soginlug : 139.0, 268.0
				[13] = { name = _("Channel 13"),	default = 269.0, modulation = _("AM/FM")},	-- vaziani : 140.0, 269.0
				[14] = { name = _("Channel 14"),	default = 260.0, modulation = _("AM/FM")},	-- batumi : 131.0, 260.0
				[15] = { name = _("Channel 15"),	default = 263.0, modulation = _("AM/FM")},	-- kutaisi : 134.0, 263.0
				[16] = { name = _("Channel 16"),	default = 261.0, modulation = _("AM/FM")},	-- senaki : 132.0, 261.0
				[17] = { name = _("Channel 17"),	default = 267.0, modulation = _("AM/FM")},	-- lochini : 138.0, 267.0
				[18] = { name = _("Channel 18"),	default = 251.0, modulation = _("AM/FM")},	-- krasnodar-center : 122.0, 251.0
				[19] = { name = _("Channel 19"),	default = 253.0, modulation = _("AM/FM")},	-- krymsk : 124.0, 253.0
				[20] = { name = _("Channel 20"),	default = 266.0, modulation = _("AM/FM")},	-- mozdok : 137.0, 266.0
			}
		},
		[2] = {  
			name = _("COMM 2: ARC-210"),
			range = {
				{min = 30.0, max = 87.995},
				{min = 108.0, max = 173.995},
				{min = 225.0, max = 399.975}
			},
			channels = {
				[1] = { name = _("Channel 1"),		default = 305.0, modulation = _("AM/FM")},	-- default
				[2] = { name = _("Channel 2"),		default = 264.0, modulation = _("AM/FM")},	-- min. water : 135.0, 264.0
				[3] = { name = _("Channel 3"),		default = 265.0, modulation = _("AM/FM")},	-- nalchik : 136.0, 265.0
				[4] = { name = _("Channel 4"),		default = 256.0, modulation = _("AM/FM")},	-- sochi : 127.0, 256.0
				[5] = { name = _("Channel 5"),		default = 254.0, modulation = _("AM/FM")},	-- maykop : 125.0, 254.0
				[6] = { name = _("Channel 6"),		default = 250.0, modulation = _("AM/FM")},	-- anapa : 121.0, 250.0
				[7] = { name = _("Channel 7"),		default = 270.0, modulation = _("AM/FM")},	-- beslan : 141.0, 270.0
				[8] = { name = _("Channel 8"),		default = 257.0, modulation = _("AM/FM")},	-- krasnodar-pashk. : 128.0, 257.0
				[9] = { name = _("Channel 9"),		default = 255.0, modulation = _("AM/FM")},	-- gelenjik : 126.0, 255.0
				[10] = { name = _("Channel 10"),	default = 262.0, modulation = _("AM/FM")},	-- kabuleti : 133.0, 262.0
				[11] = { name = _("Channel 11"),	default = 259.0, modulation = _("AM/FM")},	-- gudauta : 130.0, 259.0
				[12] = { name = _("Channel 12"),	default = 268.0, modulation = _("AM/FM")},	-- soginlug : 139.0, 268.0
				[13] = { name = _("Channel 13"),	default = 269.0, modulation = _("AM/FM")},	-- vaziani : 140.0, 269.0
				[14] = { name = _("Channel 14"),	default = 260.0, modulation = _("AM/FM")},	-- batumi : 131.0, 260.0
				[15] = { name = _("Channel 15"),	default = 263.0, modulation = _("AM/FM")},	-- kutaisi : 134.0, 263.0
				[16] = { name = _("Channel 16"),	default = 261.0, modulation = _("AM/FM")},	-- senaki : 132.0, 261.0
				[17] = { name = _("Channel 17"),	default = 267.0, modulation = _("AM/FM")},	-- lochini : 138.0, 267.0
				[18] = { name = _("Channel 18"),	default = 251.0, modulation = _("AM/FM")},	-- krasnodar-center : 122.0, 251.0
				[19] = { name = _("Channel 19"),	default = 253.0, modulation = _("AM/FM")},	-- krymsk : 124.0, 253.0
				[20] = { name = _("Channel 20"),	default = 266.0, modulation = _("AM/FM")},	-- mozdok : 137.0, 266.0
			}
		},
	},
	TACAN_AA	= true,
	
	Tasks		= {
		aircraft_task(CAP),
		aircraft_task(Escort),
		aircraft_task(FighterSweep),
		aircraft_task(Intercept),
		aircraft_task(PinpointStrike),
		aircraft_task(CAS),
		aircraft_task(GroundAttack),
		aircraft_task(RunwayAttack),
		aircraft_task(SEAD),
		aircraft_task(AFAC),
		aircraft_task(AntishipStrike),
		aircraft_task(Reconnaissance),
	},-- end of Tasks
	DefaultTask	=   aircraft_task(CAP),

	-------------------------
	M_empty					=	11631,
	M_nominal				=	16651,
	M_max					=	23541,
	M_fuel_max				=	4900,
	H_max					=	18200,
	CAS_min					=	62,
	V_opt					=	180,
	V_take_off				=	69,
	V_land					=	65,
	V_max_sea_level			=	361.1,
	V_max_h					=	541.7,
	Mach_max				=	1.8,
	Vy_max					=	254,
	Ny_min					=	-3,
	Ny_max					=	7,
	Ny_max_e				=	7.5,
	bank_angle_max			=	60,
	AOA_take_off			=	0.16,
	range					=	1520,
	average_fuel_consumption =	0.85,
	thrust_sum_max			=	12000,
	thrust_sum_ab			=	19580,

	wing_area	=	37,
	wing_span	=	11.43,
	wing_type	= FOLDED_WING,
	length		=	17.07,
	height		=	4.66,

	flaps_maneuver			=	0.5,
	stores_number			=	10,
	has_afteburner			=	true,
	has_speedbrake			=	true,
	brakeshute_name			=	0,
	radar_can_see_ground	=	true,
	RCS						=	5,
	detection_range_max		=	160,
	IR_emission_coeff		=	0.75,
	IR_emission_coeff_ab	=	4.0,
	air_refuel_receptacle_pos =	{6.731,	0.825,	0.492},
	tanker_type				=	2,

	wing_tip_pos			= 	{-2.466,	0.115,	5.73},

	tand_gear_max								=	3.73,
	nose_gear_pos								= 	{2.9851,	-2.221,	0},
	nose_gear_amortizer_direct_stroke			= 	0.0,			-- down from nose_gear_pos !!!
	nose_gear_amortizer_reversal_stroke			= 	-0.54,			-- up
	nose_gear_amortizer_normal_weight_stroke	= 	-0.4,	-- down from nose_gear_pos
	nose_gear_wheel_diameter					=	0.5385,
	nose_gear_door_close_after_retract			=	false,

	main_gear_pos								= 	{-2.4378,	-2.383,	1.55},
	main_gear_amortizer_direct_stroke			=	0.0,			-- down from main_gear_pos !!!
	main_gear_amortizer_reversal_stroke			= 	-0.64258,			-- up
	main_gear_amortizer_normal_weight_stroke	= 	-0.50,	-- down from main_gear_pos
	main_gear_wheel_diameter					=	0.68,
	main_gear_door_close_after_retract			=	false,

	launch_bar_connected_arg_value	= 0.815,

	engines_count	=	2,
	engines_nozzles = 
	{
		[1] = 
		{
			pos = 	{-8.005,	-0.003,	-0.48},
			elevation	=	-1.5,
			diameter	=	0.765,
			exhaust_length_ab	=	4,
			exhaust_length_ab_K	=	0.707,
			smokiness_level     = 	0.05, 
			afterburner_effect_texture = "afterburner_f-18c",
		}, -- end of [1]
		[2] = 
		{
			pos = 	{-8.005,	-0.003,	0.48},
			elevation	=	-1.5,
			diameter	=	0.765,
			exhaust_length_ab	=	4,
			exhaust_length_ab_K	=	0.707,
			smokiness_level     = 	0.05, 
			afterburner_effect_texture = "afterburner_f-18c",
		}, -- end of [2]
	}, -- end of engines_nozzles

	crew_members = 
	{
		[1] = 
		{
			ejection_seat_name	=	17,
			drop_canopy_name	=	"fa-18c_fonar",
            canopy_pos = {0, 0, 0},
			pos = 	{3.755,	0.4,	0},
		}, -- end of [1]
	}, -- end of crew_members

    mechanimations = {
        Door0 = {
            {Transition = {"Close", "Open"},  Sequence = {{C = {{"Arg", 38, "to", 0.9, "in", 9.0},},},}, Flags = {"Reversible"},},
            {Transition = {"Open", "Close"},  Sequence = {{C = {{"Arg", 38, "to", 0.0, "in", 6.0},},},}, Flags = {"Reversible", "StepsBackwards"},},
            {Transition = {"Any", "Bailout"}, Sequence = {{C = {{"JettisonCanopy", 0},},},},},
        },
        FoldableWings = {
            {Transition = {"Retract", "Extend"}, Sequence = {{C = {{"Arg", 8, "to", 0.0, "in", 5.0}}}}, Flags = {"Reversible"}},
            {Transition = {"Extend", "Retract"}, Sequence = {{C = {{"Arg", 8, "to", 1.0, "in", 15.0}}}}, Flags = {"Reversible", "StepsBackwards"}},
        },
        ServiceHatches = {
            {Transition = {"Close", "Open"}, Sequence = {{C = {{"PosType", 3}, {"Sleep", "for", 30.0}}}, {C = {{"Arg", 24, "set", 1.0}}}}},
            {Transition = {"Open", "Close"}, Sequence = {{C = {{"PosType", 6}, {"Sleep", "for", 5.0}}}, {C = {{"Arg", 24, "set", 0.0}}}}},
        },
        CrewLadder = {
            {Transition = {"Dismantle", "Erect"}, Sequence = {
                {C = {{"PosType", 7}, {"Sleep", "for", 10.0}}},
                {C = {{"Arg", 323, "to", 0.03, "speed", (0.03 - 0.00) / 0.2, "sign", 1.0}}},
                {C = {{"Arg", 323, "to", 0.09, "speed", (0.09 - 0.03) / 0.2, "sign", 1.0}}},
                {C = {{"Arg", 323, "to", 0.18, "speed", (0.18 - 0.09) / 0.2, "sign", 1.0}}},
                {C = {{"Arg", 323, "to", 0.31, "speed", (0.31 - 0.18) / 0.2, "sign", 1.0}}},
                {C = {{"Arg", 323, "to", 0.42, "speed", (0.42 - 0.31) / 0.1, "sign", 1.0}}},
                {C = {{"Arg", 323, "to", 0.60, "speed", (0.60 - 0.42) / 0.1}}},
                {C = {{"VelType", 3}, {"Arg", 323, "from", 0.6, "to", 0.8, "time", 2.25}}},
                {C = {{"PosType", 2}, {"Sleep", "for", 3.5}}},
                {C = {{"VelType", 8}, {"Arg", 323, "from", 0.8, "to", 1.0, "time", 2.0}}},
                {C = {{"PosType", 6}, {"Sleep", "for", 4.0}}},
            }},
            {Transition = {"Erect", "Dismantle"}, Sequence = {
                {C = {{"VelType", 8}, {"Arg", 323, "from", 1.0, "to", 0.8, "in", 2.7}}},
                {C = {{"PosType", 2}, {"Sleep", "for", 3.5}}},
                {C = {{"VelType", 3}, {"Arg", 323, "from", 0.8, "to", 0.6, "in", 2.25}}},
                {C = {{"PosType", 1}, {"Sleep", "for", 2.0}}},
                {C = {{"VelType", 3}, {"Arg", 323, "from", 0.6, "to", 0.0, "in", 4.0}}},
            }},
        },
        LaunchBar = {
            {Transition = {"Retract", "Extend"}, Sequence = {{C = {{"ChangeDriveTo", "HydraulicGravityAssisted"}, {"VelType", 3}, {"Arg", 85, "to", 0.881, "in", 4.4}}}}},
            {Transition = {"Extend", "Retract"}, Sequence = {{C = {{"ChangeDriveTo", "Hydraulic"}, {"VelType", 2}, {"Arg", 85, "to", 0.000, "in", 4.5}}}}},
            {Transition = {"Retract", "Stage"},  Sequence = {{C = {{"ChangeDriveTo", "HydraulicGravityAssisted"}, {"VelType", 3}, {"Arg", 85, "to", 0.815, "in", 4.4}}}}},
            {Transition = {"Stage", "Retract"},  Sequence = {{C = {{"ChangeDriveTo", "Hydraulic"}, {"VelType", 2}, {"Arg", 85, "to", 0.000, "in", 4.5}}}}},
            {Transition = {"Extend", "Stage"},   Sequence = {
                    {C = {{"ChangeDriveTo", "Mechanical"}, {"Sleep", "for", 0.000}}},
                    {C = {{"Arg", 85, "from", 0.881, "to", 0.766, "in", 0.600}}},
                    {C = {{"Arg", 85, "from", 0.766, "to", 0.753, "in", 0.300}}},
                    {C = {{"Sleep", "for", 1.800}}},
                    {C = {{"Sleep", "for", 0.150}}},
                    {C = {{"Arg", 85, "from", 0.753, "to", 0.784, "in", 0.100, "sign", 1}}},
                    {C = {{"Arg", 85, "from", 0.784, "to", 0.845, "in", 0.200}}},
                    {C = {{"PosType", 6}, {"Sleep", "for", 3.3}}},
                    {C = {{"Arg", 85, "from", 0.854, "to", 0.815, "in", 1.25}}},
                },
            },
            {Transition = {"Stage", "Extend"},   Sequence = {{C = {{"ChangeDriveTo", "HydraulicGravityAssisted"}, {"VelType", 3}, {"Arg", 85, "from", 0.815, "to", 0.881, "in", 0.2}}}}},
        },
    }, -- end of mechanimations

	-- add model draw args for network transmitting to this draw_args table (16 limit)
	net_animation = 
	{
		2,--[[nws]]
		13, --[[right LE flap]]
		14, --[[left LE flap]]
		25, --[[hook]]
		84,
		85, --[[launch bar]]
		89,--[[nozzle]]
		90,
		274,
		336,--[[Cabin RAM Air Inlet Door]]
	},

	fires_pos = 
	{
		[1] = 	{-0.232,	0.262,	0},
		[2] = 	{-2.508,	0.08,	3.094},
		[3] = 	{-2.815,	0.056,	-3.639},
		[4] = 	{-0.82,	0.265,	2.774},
		[5] = 	{-0.82,	0.265,	-2.774},
		[6] = 	{-0.82,	0.255,	4.274},
		[7] = 	{-0.82,	0.255,	-4.274},
		[8] = 	{-7.128,	0.039,	0.5},
		[9] = 	{-7.728,	0.039,	-0.5},
		[10] = 	{-7.728,	0.039,	0.5},
		[11] = 	{-7.728,	0.039,	-0.5},
	}, -- end of fires_pos
	
	effects_presets = {
		{effect = "APU_STARTUP_BLAST", preset = "F18", ttl = 3.0},
		{effect = "OVERWING_VAPOR", file = current_mod_path.."/Effects/FA-18C_overwingVapor.lua"},
	},
	chaff_flare_dispenser = 
	{
		[1] = 
		{
			dir = 	{0,	-1,	0},
			pos = 	{-1.185,	-1.728,	-0.878},
		}, -- end of [1]
		[2] = 
		{
			dir = 	{0,	-1,	0},
			pos = 	{-1.185,	-1.728,	0.878},
		}, -- end of [2]
	}, -- end of chaff_flare_dispenser
	
	Failures =
	{
		-- electric system
		{ id = 'Failure_Elec_UtilityBattery',					label = _('Utility Battery FAILURE'), 								enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Elec_EmergencyBattery',					label = _('Emergency Battery FAILURE'), 							enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Elec_LeftGenerator',					label = _('Left Generator FAILURE'),								enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Elec_RightGenerator',					label = _('Right Generator FAILURE'), 								enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Elec_LeftTransformerRectifier',			label = _('Left Transformer-Rectifier FAILURE'), 					enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Elec_RightTransformerRectifier',		label = _('Right Transformer-Rectifier FAILURE'), 					enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- hydraulic system
		{ id = 'Failure_Hyd_HYD1A_Leak',						label = _('HYD 1A LEAKAGE'),										enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Hyd_HYD1B_Leak',						label = _('HYD 1B LEAKAGE'), 										enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Hyd_HYD2A_Leak',						label = _('HYD 2A LEAKAGE'), 										enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Hyd_HYD2B_Leak',						label = _('HYD 2B LEAKAGE'), 										enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Hyd_IsolatedHYD2BSystem_Leak',			label = _('Isolated HYD 2B System LEAKAGE'), 						enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- power plant
		{ id = 'Failure_PP_EngL_Main_FFCS',						label = _('Left Engine: Main Fuel Flow Control System FAILURE'),	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_PP_EngR_Main_FFCS',						label = _('Right Engine: Main Fuel Flow Control System FAILURE'),	enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_PP_EngL_AB_FFCS',						label = _('Left Engine: AB Fuel Flow Control System FAILURE'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_PP_EngR_AB_FFCS',						label = _('Right Engine: AB Fuel Flow Control System FAILURE'),		enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_PP_EngL_Nozzle_CS',						label = _('Left Engine: Nozzle Control System FAILURE'),			enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_PP_EngR_Nozzle_CS',						label = _('Right Engine: Nozzle Control System FAILURE'),			enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_PP_EngL_OilLeak',						label = _('Left Engine: Oil LEAKAGE'),								enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_PP_EngR_OilLeak',						label = _('Right Engine: Oil LEAKAGE'),								enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_PP_LeftPTS',							label = _('Left PTS FAILURE'),										enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_PP_RightPTS',							label = _('Right PTS FAILURE'),										enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_PP_LeftAMAD_OilLeak',					label = _('Left AMAD Oil LEAKAGE'),									enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_PP_RightAMAD_OilLeak',					label = _('Right AMAD Oil LEAKAGE'),								enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- fuel system
		{ id = 'Failure_Fuel_LeftBoostPump',					label = _('Left Boost Pump FAILURE'),								enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Fuel_RightBoostPump',					label = _('Right Boost Pump FAILURE'),								enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Fuel_Tank1Transfer',					label = _('Tank 1 Transfer FAILURE'),								enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Fuel_Tank4Transfer',					label = _('Tank 4 Transfer FAILURE'),								enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Fuel_ExtTankTransferL',					label = _('External Left Wing Tank Transfer FAILURE'),				enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Fuel_ExtTankTransferR',					label = _('External Right Wing Tank Transfer FAILURE'),				enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Fuel_ExtTankTransferC',					label = _('External Centerline Tank Transfer FAILURE'),				enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Fuel_QuantityGaging',					label = _('Fuel Quantity Gaging System FAILURE'),					enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- gear system
		{ id = 'Failure_Gear_WOW',								label = _('WOW System FAILURE'),									enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Gear_NWS',								label = _('NWS FAILURE'),											enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- ECS
		{ id = 'Failure_ECS_Valve',								label = _('ECS Valve FAILURE'),										enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_ECS_OBOGS',								label = _('OBOGS FAILURE'),											enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- control system
		{ id = 'Failure_Ctrl_LEF',								label = _('LEF FAILURE'),											enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Ctrl_Aileron',							label = _('Aileron FAILURE'),										enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Ctrl_FCS_Ch1',							label = _('FCS Channel 1 FAILURE'),									enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Ctrl_FCS_Ch2',							label = _('FCS Channel 2 FAILURE'),									enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Ctrl_FCS_Ch3',							label = _('FCS Channel 3 FAILURE'),									enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Ctrl_FCS_Ch4',							label = _('FCS Channel 4 FAILURE'),									enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- computers
		{ id = 'Failure_Comp_ADC',								label = _('ADC FAILURE'),											enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Comp_MC1',								label = _('MC 1 FAILURE'),											enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Comp_MC2',								label = _('MC 2 FAILURE'),											enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		--{ id = 'Failure_Comp_CSC_Mux',							label = _('CSC MUX FAILURE'),										enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		-- sensors
		{ id = 'Failure_Sens_LeftPitotHeater',					label = _('Left PITOT Heater FAILURE'),								enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
		{ id = 'Failure_Sens_RightPitotHeater',					label = _('Right PITOT Heater FAILURE'),							enable = false, hh = 0, mm = 0, mmint = 1, prob = 100 },
	},

	Damage = verbose_to_dmg_properties(
	{
		["NOSE_CENTER"]				= {args = {146}, critical_damage = 3, deps_cells = {"NOSE_CENTER"}},-- NOSE_CENTER
		["NOSE_BOTTOM"]				= {args = {148}, critical_damage = 3},-- NOSE_BOTTOM
		["NOSE_LEFT_SIDE"]			= {args = {150}, critical_damage = 3},-- NOSE_LEFT_SIDE
		["NOSE_RIGHT_SIDE"]			= {args = {149}, critical_damage = 3},-- NOSE_RIGHT_SIDE
		
		["COCKPIT"]					= {args = {65},  critical_damage = 1},-- COCKPIT
		["CABIN_BOTTOM"]			= {args = {152}, critical_damage = 3},-- CABIN_BOTTOM
		["CABIN_LEFT_SIDE"]			= {args = {298}, critical_damage = 3},-- CABIN_LEFT_SIDE
		["CABIN_RIGHT_SIDE"]		= {args = {299}, critical_damage = 3},-- CABIN_RIGHT_SIDE
		["FRONT_GEAR_BOX"]			= {args = {265}, critical_damage = 2},
		["WHEEL_F"]					= {args = {135}, critical_damage = 3},-- WHEEL_F

		["FUSELAGE_LEFT_SIDE"]		= {args = {154}, critical_damage = 3},-- FUSELAGE_LEFT_SIDE
		["FUSELAGE_RIGHT_SIDE"]		= {args = {153}, critical_damage = 3},-- FUSELAGE_RIGHT_SIDE
		["FUSELAGE_BOTTOM"]			= {args = {152}, critical_damage = 4},-- FUSELAGE_BOTTOM
		["LEFT_GEAR_BOX"]			= {args = {267}, critical_damage = 3},
		["WHEEL_L"]					= {args = {137}, critical_damage = 3},-- WHEEL_L
		["RIGHT_GEAR_BOX"]			= {args = {266}, critical_damage = 3},
		["WHEEL_R"]					= {args = {136}, critical_damage = 3},-- WHEEL_R

		["TAIL_LEFT_SIDE"]			= {args = {158}, critical_damage = 3},-- TAIL_LEFT_SIDE
		["TAIL_RIGHT_SIDE"]			= {args = {157}, critical_damage = 3},-- TAIL_RIGHT_SIDE
		["TAIL_BOTTOM"]				= {args = {156}, critical_damage = 3},-- 
		["HOOK"]					= {critical_damage = 2},
		["AIR_BRAKE"]				= {args = {183}, critical_damage = 1},-- 

		["ENGINE_L"]				= {args = {177}, critical_damage = 2},-- ENGINE_L	-- 178,179
		["ENGINE_R"]				= {args = {160}, critical_damage = 2},-- ENGINE_R	-- 161,162

		["WING_L_IN"]				= {args = {225}, critical_damage = 5, deps_cells = {"WING_L_CENTER", "WING_L_OUT", "WING_L_PART_IN", "WING_L_PART_OUT", "ELERON_L", "FLAP_L_IN"}},-- WING_L_IN
		["WING_L_CENTER"]			= {args = {224}, critical_damage = 4, deps_cells = {"WING_L_OUT", "WING_L_PART_IN", "WING_L_PART_OUT", "ELERON_L"}},-- WING_L_CENTER
		["WING_L_OUT"]				= {args = {223}, critical_damage = 3},		-- WING_L_OUT
		["WING_L_PART_IN"]			= {args = {230}, critical_damage = 1.5},	-- WING_L_PART_IN  -- inboard slat
		["WING_L_PART_OUT"]			= {args = {232}, critical_damage = 1.5},	-- WING_L_PART_OUT -- outboard slat
		["FLAP_L_IN"]				= {args = {227}, critical_damage = 2},		-- FLAP_L_IN -- flap
		["ELERON_L"]				= {args = {226}, critical_damage = 1},		-- ELERON_L

		["WING_R_IN"]				= {args = {215}, critical_damage = 5,deps_cells = {"WING_R_CENTER", "WING_R_OUT", "WING_R_PART_IN", "WING_R_PART_OUT", "ELERON_R", "FLAP_R_IN"}},-- WING_R_IN
		["WING_R_CENTER"]			= {args = {214}, critical_damage = 4,deps_cells = {"WING_R_OUT", "WING_R_PART_IN", "WING_R_PART_OUT", "ELERON_R"}},-- WING_R_CENTER
		["WING_R_OUT"]				= {args = {213}, critical_damage = 3},		-- WING_R_OUT
		["WING_R_PART_IN"]			= {args = {220}, critical_damage = 1.5},	-- WING_R_PART_IN  -- inboard slat
		["WING_R_PART_OUT"]			= {args = {222}, critical_damage = 1.5},	-- WING_R_PART_OUT -- outboard slat
		["FLAP_R_IN"]				= {args = {217}, critical_damage = 2},		-- FLAP_R_IN -- flap
		["ELERON_R"]				= {args = {216}, critical_damage = 1},		-- ELERON_R

		["FIN_L_BOTTOM"]			= {args = {245}, critical_damage = 4, deps_cells = {"RUDDER_L"}},
		["FIN_L_CENTER"]			= {args = {245}, critical_damage = 4, deps_cells = {"RUDDER_L"}},	-- ??
		["FIN_L_TOP"]				= {args = {244}, critical_damage = 4},
		["RUDDER_L"]				= {args = {248}, critical_damage = 1},-- RUDDER_L

		["FIN_R_BOTTOM"]			= {args = {242}, critical_damage = 4, deps_cells = {"RUDDER_R"}},
		["FIN_R_CENTER"]			= {args = {242}, critical_damage = 4, deps_cells = {"RUDDER_R"}},	-- ??
		["FIN_R_TOP"]				= {args = {241}, critical_damage = 4},
		["RUDDER_R"]				= {args = {247}, critical_damage = 1},-- RUDDER_R

		["STABILIZER_L_IN"]			= {args = {235}, critical_damage = 2},-- STABILIZER_L_IN
		["STABILIZER_R_IN"]			= {args = {233}, critical_damage = 2},-- STABILIZER_R_IN

		["LAUNCH_BAR"]				= {critical_damage = 2},-- LAUNCH BAR
	}),-- end of Damage
	
	AddPropAircraft = {
		{ id = "OuterBoard",			control = 'comboList', label = _('Outerboard rockets mode'),
			values = {
				{id =  0, dispName = _("Single")},
				{id =  1, dispName = _("Ripple")},
			},
			defValue  = 0,
			wCtrl     = 150,
			playerOnly = true
		},
		{ id = "InnerBoard",			control = 'comboList', label = _('Innerboard rockets mode'),
			values = {
				{id =  0, dispName = _("Single")},
				{id =  1, dispName = _("Ripple")},
			},
			defValue  = 0,
			wCtrl     = 150,
			playerOnly = true
		} 
	},
	
	DamageParts 	=
 	{
		[1] = "FA-18C_oblomok_wing_R",
		[2] = "FA-18C_oblomok_wing_L",
	},
	
	SFM_Data = {
		aerodynamics = 
		{
			Cy0	=	0,
			Mzalfa	=	4.355,
			Mzalfadt	=	0.8,
			kjx	=	2.75,
			kjz	=	0.00125,
			Czbe	=	-0.016,
			cx_gear	=	0.0268,
			cx_flap	=	0.05,
			cy_flap	=	0.52,
			cx_brk	=	0.06,
			table_data = 
			{
				[1] = 	{0,	0.0151,	0.07,	0.134,	0.0567,	0.5,	30,	1.2},
				[2] = 	{0.2,	0.0154,	0.07,	0.134,	0.056,	1.5,	30,	1.2},
				[3] = 	{0.4,	0.0156,	0.07,	0.134,	0.0549,	2.5,	30,	1.2},
				[4] = 	{0.6,	0.0164,	0.073,	0.134,	0.0474,	3.5,	30,	1.2},
				[5] = 	{0.7,	0.0172,	0.076,	0.134,	0.052,	3.5,	28.666666666667,	1.18},
				[6] = 	{0.8,	0.0201,	0.079,	0.144,	0.0607,	3.5,	27.333333333333,	1.16},
				[7] = 	{0.9,	0.0284,	0.083,	0.159,	0.0666,	3.5,	26,	1.14},
				[8] = 	{1,	0.0538,	0.085,	0.219,	0.0812,	3.5,	24.666666666667,	1.12},
				[9] = 	{1.05,	0.053618181818182,	0.085454545454545,	0.24854545454545,	0.080972727272727,	3.5,	24,	1.11},
				[10] = 	{1.1,	0.053436363636364,	0.085909090909091,	0.27809090909091,	0.080745454545455,	3.15,	18,	1.1},
				[11] = 	{1.11,	0.0534,	0.086,	0.284,	0.0807,	3.08,	17.9,	1.095},
				[12] = 	{1.2,	0.0493,	0.083,	0.35,	0.0784,	2.45,	17,	1.05},
				[13] = 	{1.3,	0.04536,	0.077,	0.4,	0.078,	1.75,	16,	1},
				[14] = 	{1.4,	0.0432,	0.062,	0.468,	0.0751,	1.625,	14.5,	0.95},
				[15] = 	{1.5,	0.0429,	0.054,	0.545,	0.0708,	1.5,	13,	0.9},
				[16] = 	{1.6,	0.0426,	0.046,	0.622,	0.0665,	1.2,	12.5,	0.8},
				[17] = 	{1.7,	0.04145,	0.0425,	0.743,	0.0618,	0.9,	12,	0.7},
				[18] = 	{1.8,	0.0403,	0.039,	0.864,	0.0571,	0.86,	11.4,	0.64},
				[19] = 	{2.2,	0.0377,	0.034,	1,	0.048,	0.7,	9,	0.4},
				[20] = 	{2.35,	0.0377,	0.033,	1,	0.0448,	0.7,	9,	0.4},
				[21] = 	{3.9,	0.0377,	0.033,	1,	0.0448,	0.7,	9,	0.4},
			}, -- end of table_data
		}, -- end of aerodynamics
		engine = 
		{
			Nmg	=	67.5,
			MinRUD	=	0.1,
			MaxRUD	=	1,
			MaksRUD	=	0.85,
			ForsRUD	=	0.91,
			type	=	"TurboJet",
			hMaxEng	=	19,
			dcx_eng	=	0.0144,
			cemax	=	1.24,
			cefor	=	2.56,
			dpdh_m	=	3500,
			dpdh_f	=	6500,
			table_data = 
			{
				[1] = 	{0,	68000,	140000},
				[2] = 	{0.2,	68000,	140000},
				[3] = 	{0.4,	73000,	140000},
				[4] = 	{0.6,	80000,	137000},
				[5] = 	{0.7,	92000,	140000},
				[6] = 	{0.8,	90000,	145000},
				[7] = 	{0.9,	86000,	143000},
				[8] = 	{1,	60000,	143000},
				[9] = 	{1.11,	27000,	145000},
				[10] = 	{1.2,	13000,	149000},
				[11] = 	{1.3,	7000,	145000},
				[12] = 	{1.4,	5000,	147000},
				[13] = 	{1.6,	3000,	149000},
				[14] = 	{1.8,	2000,	145000},
				[15] = 	{2.2,	1500,	113000},
				[16] = 	{2.35,	1000,	94000},
				[17] = 	{3.9,	0,	30000},
			}, -- end of table_data
		}, -- end of engine
	},
	
	lights_data =
	{
		typename =	"collection",
		lights 	 = 
		{
			[1]	= {
				typename	=	"collection",
				lights 		= {	{typename = "argnatostrobelight", argument = 193, period = 1.2, phase_shift = 0},		-- beacon lights
				},
			},--must be collection
			[2]	= {
				typename	= 	"collection",
				lights		= {	{typename  = "argumentlight",	argument  = 210},},
			},--must be collection
			[3]	= {
				typename 	= "collection",
				lights 		= {	{typename  = "argumentlight", argument  = 190},				-- red
								{typename  = "argumentlight", argument  = 191},				-- green
								{typename  = "argumentlight", argument  = 192},				-- white
				},
			},--must be collection
			[4]	= {
				typename	= "collection",
				lights		= {	{typename  = "argumentlight",	argument  = 88},	},		-- green bars
			},--must be collection
			[5]	= {},--must be collection
		}, -- end of lights
	},-- end of lights_data
	
	ColdStartDefaultControls = {
		[15] 	= -1.0,		-- [15] = Elevators
		[16] 	= -1.0,		-- [16] = Elevators
		[9]		=  1,		-- [9]  = Flaps
		[10]	=  1,		-- [10] = Flaps
		[17]	=  0.5,		-- [17] = Right rudder
		[18]	= -0.5,		-- [18] = Left rudder
		[11]	= -0.2,		-- [17] = Right aileron
		[12]	= -0.2,		-- [18] = Left aileron
	}

}

add_aircraft(F_18C)

local function fpu_8a_fuel_tank(clsid, center)
	local data = {
		category	= CAT_FUEL_TANKS,
		CLSID		= clsid,
		attribute	=  {wsType_Air,wsType_Free_Fall,wsType_FuelTank,WSTYPE_PLACEHOLDER},
		Picture		= "PTB.png",
		displayName	= _("FPU-8A Fuel Tank 330 gallons"),
		Weight_Empty	= 132,
		Weight			= 132 + 1018,	-- 330 gallons, 6.8 lb/gal 
		Cx_pil		= 0.00141885432,		--1.2*0.001313754,			-- TODO
		shape_table_data = 
		{
			{
				name	= "FPU_8A";
				file	= "FPU_8A";
				life	= 1;
				fire	= { 0, 1};
				username	= "FPU_8A";
				index	= WSTYPE_PLACEHOLDER;
			},
		},
		Elements	= 
		{
			{
				ShapeName	= "FPU_8A",
			}, 
		}, 
	}
	declare_loadout(data)
end

fpu_8a_fuel_tank("{FPU_8A_FUEL_TANK}")