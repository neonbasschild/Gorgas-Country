-- RSN-75V

GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_stationary);
set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);

GT.visual.shape = "SNR_75";
GT.visual.shape_dstr = "SNR_75_p_1";

GT.snd.radarRotation = "RadarRotation"; -- �� �������, �� ���� ������

GT.sensor = {};
GT.sensor.max_range_finding_target = 100000;
GT.sensor.min_range_finding_target = 1500;
GT.sensor.max_alt_finding_target = 25000;
GT.sensor.height = 5.5;

--Burning after hit
GT.visual.fire_size = 0.5; --relative burning size
GT.visual.fire_pos[1] = 0; -- center of burn at long axis shift(meters)
GT.visual.fire_pos[2] = 0; -- center of burn shift at vertical shift(meters)
GT.visual.fire_pos[3] = 0; -- center of burn at transverse axis shift(meters)
GT.visual.fire_time = 500; --burning time (seconds)

-- weapon systems

GT.WS = {};
GT.WS.maxTargetDetectionRange = 100000;
GT.WS.radar_type = 103;

local ws = GT_t.inc_ws();
local base = ws;
GT.WS[ws] = {};
GT.WS[ws].pos = {0.0, 5.5, 0.0};
GT.WS[ws].angles = {
					{math.rad(180), math.rad(-180), math.rad(-5), math.rad(80)},
					};
GT.WS[ws].drawArgument1 = 0;
GT.WS[ws].drawArgument2 = 1;
GT.WS[ws].reference_angle_Z = math.rad(0);
GT.WS[ws].omegaY = 0.174533;
GT.WS[ws].omegaZ = 0.174533;
GT.WS[ws].pidY = { p = 10, i = 1, d = 3, inn = 1};
GT.WS[ws].pidZ = { p = 10, i = 1, d = 3, inn = 1};

GT.WS[ws].LN = {};
GT.WS[ws].LN[1] = {};
GT.WS[ws].LN[1].type = 102;
GT.WS[ws].LN[1].depends_on_unit = {{{"self", 2}}, {{"p-19 s-125 sr"}}};
GT.WS[ws].LN[1].distanceMin = 1500;
GT.WS[ws].LN[1].distanceMax = 100000;
GT.WS[ws].LN[1].ECM_K = 0.5;
GT.WS[ws].LN[1].min_trg_alt = 25;
GT.WS[ws].LN[1].max_trg_alt = 20000;
GT.WS[ws].LN[1].reactionTime = 20;
GT.WS[ws].LN[1].reflection_limit = 0.18;
GT.WS[ws].LN[1].max_number_of_missiles_channels = 2;
GT.WS[ws].LN[1].beamWidth = math.rad(90);

-- tracking radar searching capabilities
ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].pos = {0, 0, 0};
GT.WS[ws].base = base;
GT.WS[ws].base_type = 3;
GT.WS[ws].angles = {
					{math.rad(10), math.rad(-10), math.rad(-5), math.rad(80)},
					};
GT.WS[ws].omegaY = 1;
GT.WS[ws].omegaZ = 1;
GT.WS[ws].pidY = {p=10,i=0.1,d=3, inn=3};
GT.WS[ws].pidZ = {p=10,i=0.1,d=3, inn=3};
GT.WS[ws].LN = {};
GT.WS[ws].LN[1] = {};
GT.WS[ws].LN[1].type = 101;
GT.WS[ws].LN[1].max_number_of_missiles_channels = 1;
GT.WS[ws].LN[1].distanceMax = GT.sensor.max_range_finding_target;
GT.WS[ws].LN[1].ECM_K = 0.5;
GT.WS[ws].LN[1].distanceMin = GT.sensor.min_range_finding_target;
GT.WS[ws].LN[1].max_trg_alt = GT.sensor.max_alt_finding_target;
GT.WS[ws].LN[1].min_trg_alt = GT.sensor.min_alt_finding_target;
GT.WS[ws].LN[1].reflection_limit = 0.18;
GT.WS[ws].LN[1].reactionTime = 1;
GT.WS[ws].LN[1].beamWidth = math.rad(90);
GT.WS[ws].LN[1].maxShootingSpeed = 0;

GT.Name = "SNR_75V";
GT.DisplayName = _("SAM SA-2 TR SNR-75 Fan Song");
GT.Rate = 10;

GT.Sensors = { RADAR = "snr s-125 tr" }

GT.DetectionRange  = GT.sensor.max_range_finding_target;
GT.ThreatRange = 0;
GT.mapclasskey = "P0091000083";
GT.attribute = {wsType_Ground,wsType_SAM,wsType_Radar,WSTYPE_PLACEHOLDER,
				"MR SAM",
				"SAM TR",
				"RADAR_BAND1_FOR_ARM",
				"RADAR_BAND2_FOR_ARM",
				};
GT.category = "Air Defence";
GT.Countries = {"Algeria", "Bulgaria", "China", "Czech Republic", "Egypt", "Ethiopia", "Gorgas", "Germany", "Hungary", "Indonesia", "Iran", "Kazakhstan", "Libya", "North Korea", "Pakistan", "Romania", "Russia", "Sudan", "Syria", "Poland", "Ukraine", "USSR", "Vietnam", "Yemen", "Yugoslavia", "Cuba"}