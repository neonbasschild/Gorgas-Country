mount_vfs_model_path	  (LockOn_Options.script_path.."../Shapes")
mount_vfs_texture_path	  (LockOn_Options.script_path.."../Textures")
mount_vfs_texture_path	  (LockOn_Options.script_path.."../Textures/L-39C-CPT-TEXTURES")
mount_vfs_texture_path	  ("Bazar/Textures/AvionicsCommon")

dofile(LockOn_Options.script_path		.."materials.lua")
dofile(LockOn_Options.script_path		.."devices.lua")
dofile(LockOn_Options.script_path		.."config.lua")

MainPanel = {"L39C::ccL39CMainPanel",LockOn_Options.script_path.."mainpanel_init.lua",
			{ {"FM_Proxy", devices.FM_PROXY},
			  {"CLOCK", devices.CLOCK},
			  {"CLOCK_INSTRUCTOR", devices.CLOCK_INSTRUCTOR},
			  {"BARO_ALT_VD20", devices.VD_20},
			  {"BARO_ALT_VD20_INSTRUCTOR", devices.VD_20_INSTRUCTOR},
  			  {"radarAltimeter", devices.RADAR_ALTIMETER},
			  {"VARIOMETER", devices.VARIOMETER},
			  {"VARIOMETER_INSTRUCTOR", devices.VARIOMETER_INSTRUCTOR},
			  {"elec_interface", devices.ELEC_INTERFACE},
			  {"KPP_1273K", devices.KPP_1273K},
			  {"KPP_1273K_INSTRUCTOR", devices.KPP_1273K_INSTRUCTOR},
			  {"NPP", devices.NPP},
			  {"NPP_INSTRUCTOR", devices.NPP_INSTRUCTOR},
			  {"RKL_41", devices.RKL_41},
			  {"TAS_IAS_Mach", devices.AIRSPEED},
			  {"TAS_IAS_Mach_Instructor", devices.AIRSPEED_INSTRUCTOR},
			  {"TURN_IND", devices.TURN_SLIP},
			  {"MRP", devices.MRP_56},
			  {"oxygen_interface", devices.OXYGEN},
			  {"RSBN", devices.RSBN_5},
			  {"accelerometer", devices.ACCELEROMETER},
			  {"Air_Interface", devices.AIR_INTERFACE},
			  {"Cpt_Mech", devices.MECHANICS},
			  {"Hydro_interface", devices.HYDRO_INTERFACE},
			  {"Control_Interface", devices.CTRL_INTERFACE},
			  {"Fuel_Interface", devices.FUEL_INTERFACE},
			  {"Engine_Interface", devices.ENGINE_INTERFACE},
			  {"GMC", devices.GMK1AE},
			  {"lights_sys", devices.LIGHTS},
			  {"Radio_R832M", devices.R_832M},
			 },}

creators   = {}

if not ASP_disabled then
	creators[devices.ASP_3NM]		= {"L39C::avASP_3NMU"			 ,LockOn_Options.script_path.."ASP_3NMU/device/ASP_3N_param.lua"}
end

creators[devices.MECHANICS]		= {
	"L39C::avCockpitMechanics_L39",
	LockOn_Options.script_path.."Devices_specs/CockpitMechanics.lua",
	{{"Air_Interface", devices.AIR_INTERFACE}}
}

creators[devices.CTRL_INTERFACE]	= {
	"L39C::avControlInterface_L39",
	LockOn_Options.script_path.."Devices_specs/ControlSystem.lua",
	{}
}

creators[devices.HYDRO_INTERFACE]	= {"L39C::avHydroInterface_L39",LockOn_Options.script_path.."Devices_specs/Hydro.lua"}
creators[devices.WEAPON_SYSTEM]	= {"L39C::avWeaponSystem_L39"    ,LockOn_Options.script_path.."Devices_specs/WeaponSystem.lua",
									{{"ASP",devices.ASP_3NM,isSoft = true}}
								  }

creators[devices.ELEC_INTERFACE] = {
	"L39C::avElectricInterface_L39",
	LockOn_Options.script_path.."Devices_specs/ElectricSystem.lua",
	{},
	LockOn_Options.script_path.."Devices_commands/Elec_commands.lua"
}


creators[devices.FM_PROXY] = {"L39C::avFMProxy_L39","",{}}
creators[devices.FUEL_INTERFACE] = {
	"L39C::avFuelInterface_L39",
	LockOn_Options.script_path.."Devices_specs/FuelSys.lua",
	{}
}

creators[devices.ENGINE_INTERFACE] = {
	"L39C::avEngineInterface_L39",
	LockOn_Options.script_path.."Devices_specs/EngineSys.lua",
	{}
}

creators[devices.AIR_INTERFACE] = { 
	"L39C::avAirInterface_L39",
	LockOn_Options.script_path.."Devices_specs/AirSys.lua",
	{}
}	

creators[devices.AIRSPEED]	= {
	"L39C::avAirSpeedIndFwd",
	LockOn_Options.script_path .. "Devices_specs/Instruments/AirSpeedInd.lua",
	{{"FM_Proxy",devices.FM_PROXY}}
}

creators[devices.AIRSPEED_INSTRUCTOR]	= {
	"L39C::avAirSpeedIndAft",
	LockOn_Options.script_path .. "Devices_specs/Instruments/AirSpeedInd.lua",
	{{"FM_Proxy",devices.FM_PROXY}}
}

creators[devices.VD_20]	= {
	"L39C::avVD_20",
	LockOn_Options.script_path.."Devices_specs/Instruments/Bar_Alt_VD20.lua",
	{{"FM_Proxy",devices.FM_PROXY}},
}

creators[devices.VD_20_INSTRUCTOR]	= {
	"L39C::avVD_20_Instructor",
	LockOn_Options.script_path.."Devices_specs/Instruments/Bar_Alt_VD20.lua",
	{{"FM_Proxy",devices.FM_PROXY}},
}

creators[devices.VD_20_INPUT]	= {
	"L39C::avVDsInput_L39",
	"",
	{{"FwdVD",devices.VD_20},
	{"AftVD",devices.VD_20_INSTRUCTOR}},
}

creators[devices.STANDBY_COMPASS] = { 
	"avMechCompass",
	LockOn_Options.script_path .. "Devices_specs/Instruments/StandbyCompass.lua",
	{}
}

creators[devices.CLOCK]	= {
	"L39C::avAChS_1_Fwd",
	"",
	{},
	LockOn_Options.script_path.."Devices_commands/clock_commands.lua"}
	
creators[devices.CLOCK_INSTRUCTOR]	= {
	"L39C::avAChS_1_Aft",
	"",
	{},
	LockOn_Options.script_path.."Devices_commands/clock_commands.lua"}	
	
creators[devices.RADAR_ALTIMETER] = {
	"L39C::avRV_5",
	LockOn_Options.script_path.."Devices_specs/Instruments/RAlt_RV_5.lua",
	{},
	LockOn_Options.script_path.."Devices_commands/RV_5_commands.lua"
}

creators[devices.VARIOMETER]	= {
	"L39C::avVariometer_L39",
	LockOn_Options.script_path.."Devices_specs/Instruments/Variometer.lua",
	{{"FM_Proxy",devices.FM_PROXY}},
}

creators[devices.VARIOMETER_INSTRUCTOR]	= {
	"avAdjustableVariometer",
	LockOn_Options.script_path.."Devices_specs/Instruments/Variometer.lua",
	{{"FM_Proxy",devices.FM_PROXY}},
}

creators[devices.VARIOMETERS_INPUT]	= {
	"L39C::avVariometersInput_L39",
	"",
	{{"FwdVariometer",devices.VARIOMETER},
	{"AftVariometer",devices.VARIOMETER_INSTRUCTOR}},
}

creators[devices.TURN_SLIP]	= {
	"L39C::avTurnSlipIndicator",
	LockOn_Options.script_path.."Devices_specs/Instruments/Turn_Slip_ind.lua",
	{{"FM_Proxy",devices.FM_PROXY}}}


creators[devices.GMK1AE] = {
	"L39C::avGMK1AE",
	LockOn_Options.script_path .. "Devices_specs/Instruments/GMK1AE.lua",
	{{"RemoteCompass",devices.REMOTE_COMPASS},
	}}
	
creators[devices.REMOTE_COMPASS]	= {
	"L39C::avRemoteCompassL39",
	LockOn_Options.script_path.."Devices_specs/Instruments/MagneticDetector.lua",
	{}}

creators[devices.R_832M]	=  {
	"L39C::avR_832M",
	LockOn_Options.script_path.."Devices_specs/Radio/R_832M.lua",
	{--{"ARC_UD",devices.ARC_UD}
	},
	LockOn_Options.script_path.."Devices_specs/Radio/Radio_commands.lua"}

creators[devices.LIGHTS] = {
	"L39C::avLightsSystem_L39",
	LockOn_Options.script_path.."Devices_specs/LightsSystem.lua",
	{}}
	
creators[devices.AGD1] = {
	"L39C::avAGD1_L39",
	LockOn_Options.script_path.."Devices_specs/Instruments/AGD1.lua",
	{},
}

creators[devices.KPP_1273K] = {
	"L39C::avKPP_1273K",
	LockOn_Options.script_path.."Devices_specs/Instruments/KPP_1273K.lua",
	 {{"AGD", devices.AGD1},
	 {"RSBN", devices.RSBN_5},
	 {"SDU", devices.SDU}},
	}
	
creators[devices.KPP_1273K_INSTRUCTOR] = {
	"L39C::avKPP_1273K",
	LockOn_Options.script_path.."Devices_specs/Instruments/KPP_1273K.lua",
	 {{"AGD", devices.AGD1},
	 {"RSBN", devices.RSBN_5},
	 {"SDU", devices.SDU}},
	}	

creators[devices.KPP_INPUT]	= {
	"L39C::avKPPsInput_L39",
	"",
	{{"FwdKPP",devices.KPP_1273K},
	{"AftKPP",devices.KPP_1273K_INSTRUCTOR}},
}

creators[devices.NPP]	= {
	"L39C::avNPP",
	LockOn_Options.script_path.."Devices_specs/Instruments/NPP.lua",
    {{"pGMK", devices.GMK1AE},
	 {"RSBN", devices.RSBN_5}},
	LockOn_Options.script_path.."Devices_commands/NPP_commands.lua"
	}	

creators[devices.NPP_INSTRUCTOR]	= {
	"L39C::avNPP_Instructor",
	LockOn_Options.script_path.."Devices_specs/Instruments/NPP.lua",
    {{"pGMK", devices.GMK1AE},
	 {"RSBN", devices.RSBN_5},
	 {"NPP", devices.NPP}},
	LockOn_Options.script_path.."Devices_commands/NPP_commands.lua"
	}	

	
creators[devices.RKL_41]	=  {
	"L39C::avRKL_41",
	LockOn_Options.script_path.."Devices_specs/Radio/RKL_41.lua",
	{{"MRP", devices.MRP_56},},
	}

creators[devices.MRP_56]	    =  {
	"L39C::avMRP_56",
	LockOn_Options.script_path.."Devices_specs/Radio/MRP.lua",
	{}
	}
	
	
creators[devices.SPU_9]	=  {
	"L39C::avSPU_9",
	LockOn_Options.script_path.."Devices_specs/Radio/SPU_9.lua",
	{{"R_832M",devices.R_832M},
	{"ARC_RKL_41",devices.RKL_41},
	{"accelerometer",devices.ACCELEROMETER},
	{"RV5",devices.RADAR_ALTIMETER},
	{"MRP",devices.MRP_56},
	{"RSBN",devices.RSBN_5}
	}
	}

creators[devices.OXYGEN]	= {
	"L39C::avOxygenInterface_L39",
	LockOn_Options.script_path.."Devices_specs/OxygenSystem.lua",
	{{"HEARING_SENS", devices.HEARING_SENS}}
}


creators[devices.RSBN_5]	= {
	"L39C::avRSBN",
	LockOn_Options.script_path.."Devices_specs/Radio/RSBN.lua",
	{{"RSBN_ILS",devices.RSBN_ILS},
	{"pGMK", devices.GMK1AE},
	{"LIGHTS", devices.LIGHTS}}
	}	


creators[devices.RSBN_ILS]	= {	
	"L39C::avRSBN_ILS",
	LockOn_Options.script_path.."Devices_specs/Radio/RSBN_ILS.lua",
	{}}
	
creators[devices.ACCELEROMETER] = {"L39C::avAccelerometer_L39",
									LockOn_Options.script_path.."Devices_specs/Instruments/Accelerometer.lua",
									{{"FM_Proxy",devices.FM_PROXY}}
									}
									
creators[devices.SARPP] = {"L39C::avSARPP_12_L39"}


creators[devices.SYNC_CONTROLLER]	=  {"L39C::avNetworkSyncController",nil,
										{{"mechanics",devices.MECHANICS},
										 {"weapon"   ,devices.WEAPON_SYSTEM},
										 {"controls" ,devices.CTRL_INTERFACE},
										 {"lights_sys", devices.LIGHTS},
										 {"hydro_sys", devices.HYDRO_INTERFACE},
										 {"elec_sys", devices.ELEC_INTERFACE},
										 {"oxygen_sys", devices.OXYGEN},
										 {"engine_sys", devices.ENGINE_INTERFACE},
										 {"radio", devices.R_832M},
										 {"spu", devices.SPU_9},
										 {"rkl", devices.RKL_41},
										 {"rsbn", devices.RSBN_5},
										 {"sdu", devices.SDU},
										 {"npp", devices.NPP},
										 {"air", devices.AIR_INTERFACE},
										 {"fuel", devices.FUEL_INTERFACE},
										 {"kpp_fwd", devices.KPP_1273K},
										 {"failures_panel", devices.FAILURES_PANEL},
										 {"gmc", devices.GMK1AE},
										 {"agd", devices.AGD1},
										 }
										}
										
creators[devices.FAILURES_PANEL]	=  {"L39C::avFailuresPanel"}

creators[devices.MACROS]    =  {"L39C::avAutostartDevice_L39",
                                LockOn_Options.common_script_path.."Macro_handler.lua",
                                {},
                                "",
                                }

creators[devices.SDU]	= {
	"L39C::avSDU_L39",
	LockOn_Options.script_path.."Devices_specs/SDU.lua",
	{{"RSBN",devices.RSBN_5},
	{"GMK", devices.GMK1AE},
	{"NPP", devices.NPP},
	{"KPP", devices.KPP_1273K}}
	}	

creators[devices.HEARING_SENS] = {
	"avBasicHearingSensitivityInterface", 
	LockOn_Options.script_path.."Devices_specs/HearingSensitivity.lua",
	{{"OXYGEN",	devices.OXYGEN}}
}

creators[devices.HELMET_DEVICE]    = {"avNightVisionGoggles"}  --BKS NVG MOD	

-- Indicators
indicators = {}

if not ASP_disabled then

indicators[#indicators + 1] = {
	"ccBaseASP_3",  
	LockOn_Options.script_path.."ASP_3NMU/Indicator/ASP_3N_init.lua",
	devices.ASP_3NM,{{},{rz_l = ASP_3N_mirror_adjusting,sx = 0.6 - 1.0}}
}

indicators[#indicators + 1] = {"ccGunCamera"			,LockOn_Options.script_path.."GunCamera/init.lua"}
end

indicators[#indicators + 1] = {"ccControlsIndicatorBase",
								LockOn_Options.script_path.."ControlsIndicator/ControlsIndicator.lua", 
								nil,
								nil,
								{{"FM_proxy",devices.FM_PROXY}}
								}
---------------------------------------------
dofile(LockOn_Options.common_script_path.."KNEEBOARD/declare_kneeboard_device.lua")
---------------------------------------------
