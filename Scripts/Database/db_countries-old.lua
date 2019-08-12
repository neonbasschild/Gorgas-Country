coalition = coalition or {
	NEUTRAL = 0,
	RED		= 1,
	BLUE	= 2
}

local _ = _ or function (nm) return nm end

db_path    = db_path or "./Scripts/Database/";
troopsPath = db_path.. 'troops/'

if  db then
	db.Countries = {}
	db.CountriesByName = {}
end

local function cnt_unit(t, name, in_service_, out_of_service_)
	table.insert(t,{
		Name 			= name,
		-- service time limits for that country 
		in_service 		= in_service_ 	  or 0,
		out_of_service 	= out_of_service_ or 40000.0
	})
end

local function make_unit_list(tbl_list)
	local t = {}
	for i,v in ipairs(tbl_list) do
		cnt_unit(t,v)
	end
	return t
end


local function add_unit_list(t,...)
	for i,v in ipairs(arg) do
		cnt_unit(t,v)
	end
end


local default_Fortifications = make_unit_list{
"Locomotive",
"Electric locomotive",
"Coach a tank yellow",
"Coach a tank blue",
"Coach cargo",
"Coach cargo open",
"Coach a platform",
"Coach a passenger",
".Command Center",
"Hangar A",
"Tech hangar A",
"Farm A",
"Farm B",
"Garage A",
"Boiler-house A",
"Restaurant 1",
"Comms tower M",
"Cafe",
"Workshop A",
"Electric power box",
"Supermarket A",
"Water tower A",
"TV tower",
"Shelter",
"Repair workshop",
"Railway station",
"Railway crossing A",
"Railway crossing B",
"WC",
"Small house 1A area",
"Small house 1A",
"Small house 1B area",
"Small house 1B",
"Small house 1C area",
"Small house 2C",
"Shop",
"Tech combine",
"Chemical tank A",
"Small werehouse 1",
"Small werehouse 2",
"Small werehouse 3",
"Small werehouse 4",
"Garage B",
"Garage small A",
"Garage small B",
"Pump station",
"Oil derrick",
"Container red 1",
"Container red 2",
"Container red 3",
"Container white",
"Container brown",
"Barracks 2",
"Military staff",
"Hangar B",
"Fuel tank",
"Shelter B",
"Oil platform",
"Subsidiary structure 1",
"Subsidiary structure 2",
"Subsidiary structure 3",
"Subsidiary structure A",
"Subsidiary structure B",
"Subsidiary structure C",
"Subsidiary structure D",
"Subsidiary structure E",
"Subsidiary structure F",
"Subsidiary structure G",
"Landmine",
"FARP Ammo Dump Coating",
"FARP Tent",
"FARP CP Blindage",
"FARP Fuel Depot",
"GeneratorF",
"Airshow_Cone",
"Airshow_Crowd",
"Red_Flag",
"White_Flag",
"Black_Tyre",
"White_Tyre",
"Black_Tyre_RF",
"Black_Tyre_WF",
"Windsock",
}

local default_Planes = make_unit_list{
"A-10C",
}

local default_Helicopters = make_unit_list{
"Ka-50",
}

local default_Heliports = make_unit_list{
"FARP",
--"SINGLE_HELIPAD",
}

local default_GrassAirfields = make_unit_list{
"GrassAirfield",
}

local default_Cars = make_unit_list{
"Bunker",
"Sandbox",
"house1arm",
"house2arm",
"outpost_road",
"outpost",
"houseA_arm",
}

local default_Ships = make_unit_list{
"speedboat",
}

local default_Warehouses = make_unit_list{
"Warehouse",
"Tank",
".Ammunition depot",
"Tank 2",
"Tank 3",
}

local default_Cargos = make_unit_list{
"uh1h_cargo",
"ammo_cargo",
"barrels_cargo", 
"m117_cargo",
"iso_container",
"iso_container_small",
"f_bar_cargo",
"container_cargo", 
"tetrapod_cargo",
"fueltank_cargo",
"oiltank_cargo",
"pipes_small_cargo",
"pipes_big_cargo",
"trunks_small_cargo",
"trunks_long_cargo",
}

local default_Effects = make_unit_list{
"big_smoke",
"smoky_marker",
"smoking_line",
"dust_smoke",
}

local default_units = {
                Planes 			= { Plane 			= default_Planes 			},
                Heliports		= { Heliport 		= default_Heliports, 		},
                GrassAirfields  = { GrassAirfield 	= default_GrassAirfields,   },
                Ships 			= { Ship 			= default_Ships, 			},
                Cars 			= { Car 			= default_Cars, 			},
                Helicopters 	= { Helicopter 		= default_Helicopters, 		},
                Fortifications 	= { Fortification 	= default_Fortifications, 	},
                Warehouses 		= { Warehouse 		= default_Warehouses, 		},
                Cargos          = { Cargo 		    = default_Cargos, 		    },
                LTAvehicles     = { LTAvehicle 		= {}},
                WWIIstructures  = { WWIIstructure 	= {}},
				Effects         = { Effect 			= default_Effects, 		    },
            }

local function rank	   (name, nativeName, threshold, pictureRect)	return { name = name; nativeName = nativeName; threshold = threshold; pictureRect = pictureRect;}end;
local function award   (name, nativeName, threshold, picture)		return { name = name, nativeName = nativeName, threshold = threshold, picture = picture }	end;
local function squadron(name, nativeName, picture)					return { name = name, nativeName = nativeName, picture = picture}							end;

--for better readbility instead of nil
local use_default_ranks 	= nil
local no_awards 			= nil
local no_squadrons 			= nil


local defaultRanks =
{
	rank('Second lieutenant'	, _('Second lieutenant')	,  0,  {0, 0,   64, 32}),
	rank('First lieutenant'		, _('First lieutenant') 	, 15,  {0, 32,  64, 32}),
	rank('Captain'				, _('Captain')				, 30,  {0, 64,  64, 32}),
	rank('Major'				, _('Major')				, 60,  {0, 96,  64, 32}),
	rank('Lieutenant colonel'	, _('Lieutenant colonel')	, 120, {0, 128, 64, 32}),
	rank('Colonel'				, _('Colonel')				, 240, {0, 160, 64, 32}),
}
-- makes deep copy of all fields from source table to target table
local function copyTable(src,target)
    if not target then
        target = { }
    end
    for i,v in pairs(src) do
        if type(v) == 'table' then
            if not target[i] then
                target[i] = { }
            end
            copyTable(v,target[i])
        else
            target[i] = v
        end
    end
    return target
end

-- TODO: remove oldId after all data in old format will be converted
-- to new format
local function make(displayName, name,shortname,id,ranks, awards, troops)
	local res = {};
  	local short_flag_name = name..".png";

	res.Name 					= displayName;
	res.OldID 					= name;
	res.InternationalName		= name;
	res.ShortName		= shortname;
	res.flag 			= "FUI/Common/Flags/"			    ..short_flag_name
	res.flag_small		= "MissionEditor/data/images/flags/"..short_flag_name
	res.WorldID 		= id;
	res.Ranks 			= ranks     or copyTable(defaultRanks);
	res.Awards 			= awards    or {};
	res.rank_by_name  	= {};
	res.award_by_name 	= {};
	res.troop_by_name 	= {};
	for i = 1, #res.Awards do
		res.Awards[i].picture = name .. '/awards/' .. res.Awards[i].picture;
		res.Awards[i].countryID = id;
		res.award_by_name[res.Awards[i].name] = res.Awards[i];
	end;
	res.Units		   = copyTable(default_units)
    for i = 1, #res.Ranks do
        res.Ranks[i].stripes = name .. '/stripes.png';
        res.rank_by_name[res.Ranks[i].name] = res.Ranks[i];
    end;

	res.Troops = {}
	if db then
		table.insert(db.Countries,res);
	    db.CountriesByName[res.InternationalName]	= res
		if type(troops) == "string" then
			local path = troopsPath .. troops
			local f, err = loadfile(troopsPath .. troops)
			if f then
				local env = {troop = squadron, _ = _}
				setfenv(f, env);
				f();
				res.Troops = env.troops;
			else
				print('error loading troops', err)
			end;
		elseif type(troops) == "table" then
			res.Troops = troops;
		end
	end
	for i = 1, #res.Troops do
		res.Troops[i].picture = name .. '/troops/'..res.Troops[i].picture;
		res.troop_by_name[res.Troops[i].name] = res.Troops[i];
	end
	return res
end

local empty_country = {}

country = {
	next = function(self)
		local idx 			= self.next_index
		self.next_index		= idx  + 1
		self.maxIndex 		= idx
		return				  idx
	end,

	add  = function(self, country, displayName, name, shortname, ranks,awards,troops)
		local idx 			= self:next()
		self[country] 		= idx
		local new_country   = make(displayName,name,shortname,idx,ranks,awards,troops)

		self.names [idx] 	 	 = country
		self.by_idx[idx]	     = new_country
		self.by_country[country] = new_country
	end,

	get = function(self,country)
		return self.by_country[country] or empty_country
	end,
	maxIndex   = 0,
	next_index = 0,
	names	   = {},
	by_idx     = {},
	by_country = {},
}

country:add('RUSSIA' ,_("Russia"), "Russia", "RUS",
  use_default_ranks,
  {
    award('Courage Order', _('Courage Order'), 200, 'RUS-01-CourageOrder.png'),
    award('Medal of Courage',_('Medal of Courage'), 600, 'RUS-02-MeritMedal.png'),
    award('Nesterov Medal',_('Nesterov Medal'), 1000, 'RUS-03-NesterovMedal.png'),
    award('Military Serve Order',_('Military Serve Order'), 1400, 'RUS-04-MilitaryServe.png'),
    award('Georgy Cross-IV',_('Georgy Cross-IV'), 1800, 'RUS-05-GeorgyCross-4.png'),
    award('Medal For Merit To Fatherland-II with swords',_('Medal For Merit To Fatherland-II with swords'), 2200, 'RUS-06-ForMeritToFatherland-2.png'),
    award('Georgy Cross-I',_('Georgy Cross-I'), 2600, 'RUS-07-GeorgyCross-1.png'),
    award('Hero Gold Star',_('Hero Gold Star'), 3000, 'RUS-08-HeroStar.png'),
  },
  'Russia.lua'
);

country:add('UKRAINE',_("Ukraine"), "Ukraine", "UKR",
  use_default_ranks,
  {
    award('Medal "Zakhystnyku Vitchyzny"', _('Medal "Zakhystnyku Vitchyzny"'), 200,  'UKR-01-ForDefenderOfFatherland.png'),
    award('Orden "Za Zaslugy III"', _('Orden "Za Zaslugy III"'), 600,  'UKR-02-ForMerit-III.png'),
    award('Orden "Za Zaslugy II"', _('Orden "Za Zaslugy II"'), 1000, 'UKR-03-ForMerit-II.png'),
    award('Orden "Za Zaslugy I"', _('Orden "Za Zaslugy I"'), 1400, 'UKR-04-ForMerit-I.png'),
    award('Zirka "Za Zaslugy"', _('Zirka "Za Zaslugy"'), 1800, 'UKR-05-ForMerit-Star.png'),
    award('Medal "Za Viyskovu Sluzhbu"', _('Medal "Za Viyskovu Sluzhbu"'), 2200, 'UKR-06-ForMilitaryService.png'),
    award('Orden "Za Muzhnist"', _('Orden "Za Muzhnist"'), 2600, 'UKR-07-OrderForCourage.png'),
    award('Zolota Zirka', _('Zolota Zirka'), 3000, 'UKR-08-GoldStar.png'),
  },
  'Ukraine.lua'
);

country:add('USA'	 ,_("USA"), "USA", "USA",
  use_default_ranks,
  {
    award('Air Medal', _('Air Medal'), 200, 'US-01-AirMedal.png'),
    award('Purple Heart', _('Purple Heart'), 600, 'US-02-PurpleHeart.png'),
    award('Bronze Star', _('Bronze Star'), 1000, 'US-03-BronzeStar.png'),
    award('Airmans Medal', _('Airmans Medal'), 1400, 'US-04-AirmansMedal.png'),
    award('Distinguished Flying Cross', _('Distinguished Flying Cross'), 1800, 'US-05-DistinguishedFlyingCross.png'),
    award('Silver Star', _('Silver Star'), 2200, 'US-06-SilverStar.png'),
    award('Air Force Cross', _('Air Force Cross'), 2600, 'US-07-AirForceCross.png'),
    award('Medal of Honor', _('Medal of Honor'), 3000, 'US-08-AirForceMedalOfHonour.png'),
  },
  'USA.lua'
);

country:add('TURKEY' ,_("Turkey"), "Turkey", "TUR",
  use_default_ranks,
  {
    award('Liakat Medal', _('Liakat Medal'), 200,  'TUR-01-Liakat_Medal.png'),
    award('Success Medal', _('Success Medal'), 600,  'TUR-02-Succes_Medal.png'),
    award('Superior Service Medal', _('Superior Service Medal'), 1200, 'TUR-03-Superior_Service.png'),
    award('Superior Braveness Medal', _('Superior Braveness Medal'), 1800, 'TUR-04-Superior_Braveness_Medal.png'),
    award('Service and Praise Medal', _('Service and Praise Medal'), 2400, 'TUR-05-Service_and_Praise_Medal.png'),
    award('Medal of Honour', _('Medal of Honour'), 3000, 'TUR-06-Honour_Medal.png'),
  },
  'Turkey.lua'
);

country:add('UK'	 ,_("UK"), "UK", "UK",
  use_default_ranks,
  {
    award('British Empire Medal', _('British Empire Medal'), 200,  'UK-01-British_Empire_Medal.png'),
    award('Air Force Medal', _('Air Force Medal'), 600,  'UK-02-Air_Force_Medal.png'),
    award('Distinguished Flying Medal', _('Distinguished Flying Medal'), 1000, 'UK-03-Distinguished_Flying_Medal.png'),
    award('Military Medal', _('Military Medal'), 1400, 'UK-04-Military_Medal.png'),
    award('Distinguished Conduct Medal', _('Distinguished Conduct Medal'), 1800, 'UK-05-Distiguished_Conduct_Medal.png'),
    award('Air Force Cross', _('Air Force Cross'), 2200, 'UK-06-Air_Force_Cross.png'),
    award('Distinguished Flying Cross', _('Distinguished Flying Cross'), 2600, 'UK-07-Distinguished_Flying_Cross.png'),
    award('Military Cross', _('Military Cross'), 3000, 'UK-08-Military_Cross.png'),
  },
  'UK.lua'
);

country:add('FRANCE' ,_("France"), "France", "FRA",
  use_default_ranks,
  {
    award('Croix de la bravoure', _('Croix de la bravoure'), 200,  'FR-01-Cross_of_Valour.png'),
    award('Medaille militaire', _('Medaille militaire'), 600,  'FR-02-Medal_Militaire.png'),
    award('Medaille du merite', _('Medaille du merite'), 1000, 'FR-03-Merit_Medal.png'),
    award('Croix du combattant', _('Croix du combattant'), 1400, 'FR-04-Combatant_Cross.png'),
    award([[Medaille de la defense de l'armee nationale]], _([[Medaille de la defense de l'armee nationale]]), 1800, 'FR-05-Army_National_Defence_Medal.png'),
    award('Ordre du merite', _('Ordre du merite'), 2200, 'FR-06-Merit_Order.png'),
    award('Croix de la liberte', _('Croix de la liberte'), 2600, 'FR-07-Liberty_Cross.png'),
    award([[Legion d'honneur]], _([[Legion d'honneur]]), 3000, 'FR-08-Legion_of_Honor.png'),
  },
  'France.lua'
);

country:add('GERMANY',_("Germany"), "Germany", "GER",
  use_default_ranks,
  {
    award('Ehrenmedaille', _('Ehrenmedaille'), 200,  'DE-01-Ehrenmedaille-Honor.png'),
    award('Ehrenkreuz', _('Ehrenkreuz'), 700,  'DE-02-Ehrenkreuze.png'),
    award('Ehrenkreuz in Silber', _('Ehrenkreuz in Silber'), 1200, 'DE-03-Silbernekreuze.png'),
    award('Ehrenkreuz in Gold', _('Ehrenkreuz in Gold'), 1800, 'DE-04-Goldenekreuze.png'),
    award('Bundesverdienstmedaille', _('Bundesverdienstmedaille'), 2400, 'DE-05-Bundesverdienstmedaille.png'),
    award('Bundesverdienstkreuz', _('Bundesverdienstkreuz'), 3000, 'DE-06-Bundesverdienstkreuz.png'),
  },
  'Germany.lua'
);

country:add('AGGRESSORS' ,_("USAF Aggressors"), "USAF Aggressors", "AUSAF",
  use_default_ranks,
  {
    award('Air Medal', _('Air Medal'), 200, 'US-01-AirMedal.png'),
    award('Purple Heart', _('Purple Heart'), 600, 'US-02-PurpleHeart.png'),
    award('Bronze Star', _('Bronze Star'), 1000, 'US-03-BronzeStar.png'),
    award('Airmans Medal', _('Airmans Medal'), 1400, 'US-04-AirmansMedal.png'),
    award('Distinguished Flying Cross', _('Distinguished Flying Cross'), 1800, 'US-05-DistinguishedFlyingCross.png'),
    award('Silver Star', _('Silver Star'), 2200, 'US-06-SilverStar.png'),
    award('Air Force Cross', _('Air Force Cross'), 2600, 'US-07-AirForceCross.png'),
    award('Medal of Honor', _('Medal of Honor'), 3000, 'US-08-AirForceMedalOfHonour.png'),
  },
  'USA.lua'
);

country:add('CANADA' ,_("Canada"), "Canada", "CAN",
  use_default_ranks,
  {
    award('Medal of Bravery', _('Medal of Bravery'), 200,  'CA_01_Medal_of_Bravery.png'),
    award('Medal of Military Valour', _('Medal of Military Valour'), 600,  'CA_02_Medal_of_Military_Valour.png'),
    award('Meritorious Service Cross', _('Meritorious Service Cross'), 1000, 'CA_03_Meritorious_Service_Cross.png'),
    award('Star of Courage', _('Star of Courage'), 1400, 'CA_04_Star_of_Courage.png'),
    award('Star of Military Valour', _('Star of Military Valour'), 1800, 'CA_05_Star_of_Military_Valour.png'),
    award('The Order of Military Merit', _('The Order of Military Merit'), 2200, 'CA_06_The_Order_of_Military_Merit.png'),
    award('The Order of Canada', _('The Order of Canada'), 2600, 'CA_07_The_Order_of_Canada.png'),
    award('Cross of Valour', _('Cross of Valour'), 3000, 'CA_08_Cross_of_Valour.png'),
  },
  'Canada.lua'
);

country:add('SPAIN'  ,_("Spain"), "Spain", "SPN",
  use_default_ranks,
  {
    award('Cruz del Merito Aeronautico con distintivo azul', _('Cruz del Merito Aeronautico con distintivo azul'), 200,  'SP-01-Aeronautical_Merit_Cross_with_Blue_Ribbon.png'),
    award('Cruz del Merito Aeronautico con distintivo rojo', _('Cruz del Merito Aeronautico con distintivo rojo'), 800,  'SP-02-Aeronautical_Merit_Cross_with_Red_Ribbon.png'),
    award('Cruz de Guerra', _('Cruz de Guerra'), 1500, 'SP-03-War_Cross.png'),
    award('Medalla Militar Individual', _('Medalla Militar Individual'), 2200, 'SP-04-Individual_Military_Medal.png'),
    award('Cruz Laureada de San Fernando', _('Cruz Laureada de San Fernando'), 3000, 'SP-05-Laureate_Cross_of_Saint_Ferdinand.png'),
  },
  'Spain.lua'
);

country:add('THE_NETHERLANDS',_("The Netherlands"), "The Netherlands", "NETH",
  use_default_ranks,
  {
    award('Aviators Cross', _('Aviators Cross'), 200,  'NED-01-Aviators_Cross.png'),
    award('Hasselt Cross', _('Hasselt Cross'), 600,  'NED-02-Hasselt_Cross.png'),
    award('Lion III Class', _('Lion III Class'), 1000, 'NED-03-Lion_III_Class.png'),
    award('Long Service Decoration Bronze', _('Long Service Decoration Bronze'), 1400, 'NED-04-Long_Service_Decoration_Bronze.png'),
    award('Long Service Decoration Silver', _('Long Service Decoration Silver'), 1800, 'NED-05-Long_Service_Decoration_Silver.png'),
    award('Military Order of William Knight', _('Military Order of William Knight'), 2200, 'NED-06-Military_Order_of_William_Knight.png'),
    award('Order of the House of Nassau', _('Order of the House of Nassau'), 2600, 'NED-07-Order_of_the_House_of_Nassau.png'),
    award('Order of the House of Nassau-2', _('Order of the House of Nassau-2'), 3000, 'NED-08-Order_of_the_House_of_Nassau-2.png'),
  },
  'The Netherlands.lua'
);

country:add('BELGIUM',_("Belgium"), "Belgium", "BEL",
  use_default_ranks,
  {
    award('Medaille van militaire verdienste ', _('Medaille van militaire verdienste '), 200,  'BEL-01-Officer_of_the_Order_of_Leopold-1.png'),
    award('Erekruis voor militaire dienst in het buitenland ', _('Erekruis voor militaire dienst in het buitenland '), 600,  'BEL-02-Officer_of_the_Order_of_the_Crown.png'),
    award('Militair Kruis 2de Klas', _('Militair Kruis 2de Klas'), 1000, 'BEL-03-Officer_of_the_Order_of_Leopold-2.png'),
    award('Militair Kruis 1ste Klas', _('Militair Kruis 1ste Klas'), 1400, 'BEL-04-Knight_of_the_Order_of_Leopold.png'),
    award('Ridder in de Leopoldsorde', _('Ridder in de Leopoldsorde'), 1800, 'BEL-05-Military_Cross_1st_Class.png'),
    award('Officier in de Orde van Leopold II', _('Officier in de Orde van Leopold II'), 2200, 'BEL-06-Military_Cross_2nd_Class.png'),
    award('Officier in de Kroonorde', _('Officier in de Kroonorde'), 2600, 'BEL-07-Military_Cross_for_Foreign_Service.png'),
    award('Officier in de Leopoldsorde', _('Officier in de Leopoldsorde'), 3000, 'BEL-08-Medal_for_Military_Merit.png'),
  },
  'Belgium.lua'
);

country:add('NORWAY',_("Norway"), "Norway", "NOR",
  use_default_ranks,
  {
    award('Vernedyktighetsmedaljen', _('Vernedyktighetsmedaljen'), 200,  'NOR-01-AirForceServiceMedal.png'),
    award('Forsvarets Medalje for Internasjonale Operasjoner', _('Forsvarets Medalje for Internasjonale Operasjoner'), 600,  'NOR-02-Armed_Forces_medal_for_international_operations.png'),
    award('Forsvarsmedaljen', _('Forsvarsmedaljen'), 1000, 'NOR-03-Armed_Forces_medal.png'),
    award('Forsvarsmedaljen m Laurbargren', _('Forsvarsmedaljen m Laurbargren'), 1400, 'NOR-04-Armed_Forces_medal_with_Laureat.png'),
    award('Krigskorset', _('Krigskorset'), 1800, 'NOR-05-War_Cross.png'),
    award('St Olavsmedaljen', _('St Olavsmedaljen'), 2200, 'NOR-06-StOlaf_Medal.png'),
    award('Krigsmedaljen', _('Krigsmedaljen'), 2600, 'NOR-07-War_Medal.png'),
    award('Den kongelige Norske St Olavs orden', _('Den kongelige Norske St Olavs orden'), 3000, 'NOR-08-StOlaf_Knight.png'),
  },
  'Norway.lua'
);

country:add('DENMARK',_("Denmark"), "Denmark", "DEN",
  use_default_ranks,
  {
    award('Medaljen for udmarket lufttjeneste', _('Medaljen for udmarket lufttjeneste'), 200,  'DEN-01-Distinguished_Flying_Medal.png'),
    award('Dannebrogordenen Storkors', _('Dannebrogordenen Storkors'), 600,  'DEN-02-Silver_Cross_of_the_Order_of_Dannebrog.png'),
    award('Dannebrogordenen Ridderkors', _('Dannebrogordenen Ridderkors'), 1000, 'DEN-03-Order_of_Denneborg_Knight.png'),
    award('Dannebrogordenen Ridderkors af 1. grad', _('Dannebrogordenen Ridderkors af 1. grad'), 1400, 'DEN-04-Order_of_Danneburg_Knight_1st_Degree.png'),
    award('Hadertegnet for god tjeneste ved flyvevabnet', _('Hadertegnet for god tjeneste ved flyvevabnet'), 1800, 'DEN-05-Air_Force_Long_Service_Medal-25_years.png'),
    award('Forsvarets Medalje', _('Forsvarets Medalje'), 2200, 'DEN-06-Medal_of_the_Defence.png'),
    award('Dannebrogordenen Kommandorkors af 1. grad', _('Dannebrogordenen Kommandorkors af 1. grad'), 2600, 'DEN-07-Order_of_Danneburg_Commander_1st_Degree_Cross.png'),
    award('Forsvarets Medalje for Tapperhed', _('Forsvarets Medalje for Tapperhed'), 3000, 'DEN-08-Medal_for_Heroic_Deeds.png'),
  },
  'Denmark.lua'
);

country:next() --index 14 is free

country:add('ISRAEL',_("Israel"), "Israel", "ISR",
  use_default_ranks,
  {
    award('ITUR HAGVURA', _('ITUR HAGVURA'), 1000,  'Distinguished_Service_Medal.png'),
    award([[ITUR HA'OZ]], _([[ITUR HA'OZ]]), 2000,  'Gallantry_Medal.png'),
    award('ITUR HAMOFET', _('ITUR HAMOFET'), 3000,  'Valor_Medal.png'),
  },
  'Israel.lua'
);

country:add('GEORGIA',_("Georgia"), "Georgia", "GRG",
  use_default_ranks,
  {
    award('Medali "Sabrdzolo Damsakhurebisatvis"', _('Medali "Sabrdzolo Damsakhurebisatvis"'), 200,  'GR-01-Medal_for_the_Service_in_Battle.png'),
    award('Medali "Mkhedruli Mamatsobisatvis"', _('Medali "Mkhedruli Mamatsobisatvis"'), 600,  'GR-02-Medal_for_Military_Courage.png'),
    award('Vakhtang Gorgasalis Ordeni III', _('Vakhtang Gorgasalis Ordeni III'), 1000, 'GR-03-Order_of_Vakhtang_Gorgasali_III.png'),
    award('Vakhtang Gorgasalis Ordeni II', _('Vakhtang Gorgasalis Ordeni II'), 1400, 'GR-04-Order_of_Vakhtang_Gorgasali_II.png'),
    award('Vakhtang Gorgasalis Ordeni I', _('Vakhtang Gorgasalis Ordeni I'), 1800, 'GR-05-Order_of_Vakhtang_Gorgasali_I.png'),
    award('Girsebis Ordeni', _('Girsebis Ordeni'), 2200, 'GR-06-Order_of_Honour.png'),
    award('Girsebis Medali', _('Girsebis Medali'), 2600, 'GR-07-Medal_of_Valour.png'),
    award('Okros Satsmisis Ordeni', _('Okros Satsmisis Ordeni'), 3000, 'GR-08-Order_of_the_Gold_Fleece.png'),
  },
  'Georgia.lua'
);

country:add('INSURGENTS',_("Insurgents"), "Insurgents", "INS",
  use_default_ranks,
  {
  },
  'Insurgents.lua'
);

country:add('ABKHAZIA',_("Abkhazia"), "Abkhazia", "ABH",
  use_default_ranks,
  {
    award('Medal for Bravery', _('Medal for Bravery'), 400,  'ABH-01-Bravery.png'),
    award('Orden Leon', _('Orden "Leon"'), 1800,  'ABH-02-Leon.png'),
    award('Orden Glory III', _('Orden "Akhdz Apsha"'), 2600, 'ABH-03-Glory-III.png'),
    award('Hero of Abkhazia', _('Hero of Abkhazia'), 3000, 'ABH-04-Hero.png'),
  },
  'Abkhazia.lua'
);

country:add('SOUTH_OSETIA',_("South Ossetia"), "South Ossetia", "RSO",
  use_default_ranks,
  {
    award('Defender of the Fatherland', _('Defender of the Fatherland'), 1800,  'SOS-01-Defenders_of_the_Fatherland.png'),
    award('Uatsamonga', _('Hero of Osetia'), 3000, 'SOS-02-Uatsamonga.png'),
  },
  'South Ossetia.lua'
);

country:add('ITALY',_("Italy"), "Italy", "ITA",
  use_default_ranks,
  {
    award('Commemorative Medal of Peace Operations', _('Commemorative Medal of Peace Operations'), 200,  'IT-01-Commemorative_Medal_of_Peace_Operations.png'),
    award('Honor Decoration Interforce', _('Honor Decoration Interforce'), 600,  'IT-02-Honor_Decoration_Interforce.png'),
    award('NATO Medal for Merits', _('NATO Medal for Merits'), 1000, 'IT-03-NATO_Medal_for_Merits.png'),
    award('Dannebrogordenen Ridderkors af 1. grad', _('Dannebrogordenen Ridderkors af 1. grad'), 1400, 'DEN-04-Order_of_Danneburg_Knight_1st_Degree.png'),
    award('Bronze Medal for Military Valour', _('Bronze Medal for Military Valour'), 1800, 'IT-04-Bronze_Medal_for_Military_Valour.png'),
    award('Silver Medal for Military Valor', _('Silver Medal for Military Valor'), 2200, 'IT-05-Silver_Medal_for_Military_Valor.png'),
    award('Cross of Aeronautical Merit Bronze', _('Cross of Aeronautical Merit Bronze'), 2600, 'IT-06-Cross_of_Aeronautical_Merit_Bronze.png'),
    award('Silver Cross of Merit Air Force', _('Silver Cross of Merit Air Force'), 3000, 'IT-07-Silver_Cross_of_Merit_Air_Force.png'),
	award('Gold Cros of Merit Aeronautical', _('Gold Cros of Merit Aeronautical'), 4000, 'IT-8-Gold_Cros_of_Merit_Aeronautical.png'),
  },
  'Italy.lua'
);

country:add('AUSTRALIA',_("Australia"), "Australia", "AUS",
  {
    rank('Second lieutenant', _('Pilot Officer'), 0, {0, 0, 64, 32}),
    rank('First lieutenant', _('Flying Officer'), 15, {0, 32, 64, 32}),
    rank('Captain', _('Flight Lieutenant'), 30, {0, 64, 64, 32}),
    rank('Major', _('Squadron Leader'), 60, {0, 96, 64, 32}),
    rank('Lieutenant colonel', _('Wing Commander'), 120, {0, 128, 64, 32}),
    rank('Colonel', _('Group Captain'), 240, {0, 160, 64, 32}),
  },
  {
    award('Victoria Cross', _('Victoria Cross'), 3000, 'AUS01_Victoria_Cross.png'),
	award('Cross of Valour', _('Cross of Valour'),2600, 'AUS02_Cross_of_Valour.png'),
	award('Star of Gallantry', _('Star of Gallantry'), 2200, 'AUS03_The_Star_of_Gallantry.png'),
	award('Star of Courage', _('Star of Courage'), 1600, 'AUS04_Star_of_Courage.png'),
    award('Distinguished Service Cross', _('Distinguished Service Cross'), 800, 'AUS05_Distinguished_Service_Cross.png'),
  },
  'Australia.lua'
);

country:add('SWITZERLAND',_("Switzerland"), "Switzerland", "SUI",
  use_default_ranks,
  {
    award('90 Diensttage', _('90 Diensttage'), 200,  'CH-01-90Diensttage.png'),
    award('170 Diensttage', _('170 Diensttage'), 400, 'CH-02-170Diensttage.png'),
    award('250 Diensttage', _('250 Diensttage'), 700, 'CH-03-250Diensttage.png'),
    award('350 Diensttage', _('350 Diensttage'), 1000, 'CH-04-350Diensttage.png'),
    award('450 Diensttage', _('450 Diensttage'), 1300, 'CH-05-450Diensttage.png'),
    award('550 Diensttage', _('550 Diensttage'), 1600, 'CH-06-550Diensttage.png'),
    award('650 Diensttage', _('650 Diensttage'), 1900, 'CH-07-650Diensttage.png'),
    award('750 Diensttage', _('750 Diensttage'), 2200, 'CH-08-750Diensttage.png'),
    award('850 Diensttage', _('850 Diensttage'), 2500, 'CH-09-850Diensttage.png'),
    award('950 Diensttage', _('950 Diensttage'), 2700, 'CH-10-950Diensttage.png'),
    award('Lange Ausland-Abkommandierung', _('Lange Ausland-Abkommandierung'), 3000, 'CH-11-LangeAuslandAbkommandierung.png'),
  },
  'Switzerland.lua'
);

country:add("AUSTRIA" ,_("Austria") , "Austria", "AUT", use_default_ranks,	no_awards,
{
    squadron('Austrian Federal Army', _('Austrian Federal Army'),'Bundesheer.png'),
})

country:add("BELARUS" ,_("Belarus") , 		"Belarus"			, "BLR", use_default_ranks,	no_awards,
{
    squadron('206th Assault Air Base', _('206th Assault Air Base'),'206.png'),
	squadron('181th Helicopter Air Base', _('181th Helicopter Air Base'),'181.png'),
	squadron('927th Fighter Air Base', _('927th Fighter Air Base'),'927.png'),
})

country:add("BULGARIA",_("Bulgaria"), 		"Bulgaria"			, "BGR", use_default_ranks,	no_awards,
{
    squadron('Bulgarian Air Force', _('Bulgarian Air Force'),'VVS.png'),
})

country:add("CHEZH_REPUBLIC",_("Czech Republic"),"Czech Republic"	, "CZE", use_default_ranks,	no_awards,
{
    squadron('Czech Air Force', _('Czech Air Force'),'CzechAirForce.png'),
    squadron('22nd Helicopter Base', _('22nd Helicopter Base'),'znak22zl.png'),
    squadron('213th Training Squadron', _('213th Training Squadron'),'213n.png'),
})

-- China
country:add("CHINA", 		_("China"), 		"China"				, "CHN", use_default_ranks,	
{
    award('3rd-Class Merit',_('3rd-Class Merit'), 200, '3rd-Class-Merit.png'),
    award('2nd-Class Merit',_('2nd-Class Merit'), 1400, '2nd-Class-Merit.png'),
    award('1st-Class Merit', _('1st-Class Merit'), 3000, '1st-Class-Merit.png'),
}, 
'China.lua')

country:add("CROATIA", 		_("Croatia"), 		"Croatia"			, "HRV", use_default_ranks,	no_awards, no_squadrons )
country:add("EGYPT", 		_("Egypt"), 		"Egypt"				, "EGY", use_default_ranks,	no_awards, no_squadrons )
country:add("FINLAND", 		_("Finland"), 		"Finland"			, "FIN", use_default_ranks,	no_awards, no_squadrons )
country:add("GREECE", 		_("Greece"), 		"Greece"			, "GRC", use_default_ranks,
-- as we cannot push greek symbols to _( ) function  ,  source commented
--[[
  {
    rank('Second lieutenant' , _('Бнихрпумзнбгьт'), 0,   {0, 0, 64, 32}),
    rank('First lieutenant'	 , _('Хрпумзнбгьт')   , 15,  {0, 32, 64, 32}),
    rank('Captain'			 , _('Умзнбгьт')	  , 30,  {0, 64, 64, 32}),
    rank('Major'			 , _('Ерйумзнбгьт')   , 60,  {0, 96, 64, 32}),
    rank('Lieutenant colonel', _('БнфйумЮнбсчпт') , 120, {0, 128, 64, 32}),
    rank('Colonel'			 , _('УмЮнбсчпт')     , 240, {0, 160, 64, 32}),
  },
--]] 
  {
    award('Medal for Outstanding Acts', _('Medal for Outstanding Acts'), 800,  'GR-01-Medal_for_Outstanding_Acts.png'), -- _('МефЬллйп ЕобйсЭфщн РсЬоещн')
    award('War Cross 3rd Class'       , _('War Cross 3rd Class'       ), 1200, 'GR-02-War_Cross_C_Class.png'),          -- _('Рплемйкьт Уфбхсьт Г ФЬоещт')
    award('War Cross 2nd Class'       , _('War Cross 2nd Class'       ), 1600, 'GR-03-War_Cross_B_Class.png'),          -- _('Рплемйкьт Уфбхсьт В ФЬоещт')
    award('Silver Medal for Valour'   , _('Silver Medal for Valour'   ), 2200, 'GR-04-Silver_Medal_for_Valour.png'),    -- _('Бсгхсь БсйуфеЯп БндсеЯбт')
    award('Golden Medal for Valour'   , _('Golden Medal for Valour'   ), 2600, 'GR-05-Golden_Medal_for_Valour.png'),    -- _('Чсхуь БсйуфеЯп БндсеЯбт')
    award('Medal for Gallandry'       , _('Medal for Gallandry'       ), 3000, 'GR-06-Medal_for_Gallandry.png'),        -- _('БсйуфеЯп БндсбгбиЯбт')
  },
  {
    squadron('330 SQN HAF', 				_('330 SQN HAF'), '330sqn.png'),		-- _('330 МПЙСБ'	),
  	squadron('331 SQN HAF', 				_('331 SQN HAF'), '331mpk.png'),       -- _('331 МРК'		),
  	squadron('332 SQN HAF', 				_('332 SQN HAF'), '332mpk.png'),       -- _('332 МРК'		),
  	squadron('335 SQN HAF', 				_('335 SQN HAF'), '335mb.png'),        -- _('335 MB'		),
  	squadron('336 SQN HAF', 				_('336 SQN HAF'), '336mb.png'),        -- _('336 MB'		),
  	squadron('337 SQN HAF', 				_('337 SQN HAF'), '337sqn.png'),       -- _('337 МПЙСБ'	),
  	squadron('338 SQN HAF', 				_('338 SQN HAF'), '338mdb.png'),       -- _('338 МДВ'		),
  	squadron('339 SQN HAF', 				_('339 SQN HAF'), '339mpk.png'),       -- _('339 МРК'		),
  	squadron('340 SQN HAF', 				_('340 SQN HAF'), '340sqn.png'),       -- _('340 МПЙСБ'	),
  	squadron('341 SQN HAF', 				_('341 SQN HAF'), '341mpk.png'),       -- _('341 МРК'		),
  	squadron('343 SQN HAF', 				_('343 SQN HAF'), '343m.png'),         -- _('343 МПЙСБ'	),
  	squadron('343 STAR HAF',				_('343 STAR HAF'), 'star.png'),         -- _('343 STAR'	),
  	squadron('347 SQN HAF', 				_('347 SQN HAF'), '347sqn.png'),       -- _('347 МПЙСБ'	),
  	squadron('348 SQN HAF', 				_('348 SQN HAF'), '348mta.png'),       -- _('348 МФБ'		),
  	squadron('356 SQN HAF', 				_('356 SQN HAF'), '356mtm.png'),       -- _('356 МФМ'		),
  	squadron('358 SQN HAF', 				_('358 SQN HAF'), '358sar.png'),       -- _('358 МЕД'		),
  	squadron('361 SQN HAF', 				_('361 SQN HAF'), '361mea.png'),       -- _('361 МЕБ'		),
  	squadron('362 SQN HAF', 				_('362 SQN HAF'), '362mea.png'),       -- _('362 MEA'		),
  	squadron('363 SQN HAF', 				_('363 SQN HAF'), '363mea.png'),       -- _('363 MEA'		),
  	squadron('364 SQN HAF', 				_('364 SQN HAF'), '364mea.png'),       -- _('364 MEA'		),
  	squadron('380 SQN HAF', 				_('380 SQN HAF'), '380sqn.png'),       -- _('380 БУЕРЕ'	),
  	squadron('384 SQN HAF', 				_('384 SQN HAF'), '384sar.png'),       -- _('384 МЕД'		),
  	squadron('1ST ATTACK HELICOPTER SQN', 	_('1ST ATTACK HELICOPTER SQN'), '1teep.png'),        -- _('1o ФЕЕР'		),
  	squadron('2ND ATTACK HELICOPTER SQN', 	_('2ND ATTACK HELICOPTER SQN'), '2teep.png'),        -- _('2o ФЕЕР'		),
  	squadron('2ND HELICOPTER SQN', 			_('2ND HELICOPTER SQN'), '2teas.png'),        -- _('2o ФЕБУ'		),
  	squadron('4TH HELICOPTER SQN', 			_('4TH HELICOPTER SQN'), '4teas.png'),        -- _('4o ФЕБУ'		),
  	squadron('ARMOUR TRAINING CENTER', 		_('ARMOUR TRAINING CENTER'), 'ket8.png'),         -- _('КЕФИ'		),
  	squadron('21ST ARMORED BRIGADE', 		_('21ST ARMORED BRIGADE'), '21tt.png'),         -- _('21 ФИФ'		),
  	squadron('24TH ARMORED BRIGADE', 		_('24TH ARMORED BRIGADE'), '24tt.png'),         -- _('24 ФИФ'		),
})


local units  = country:get("GREECE").Units
	cnt_unit( units.Planes.Plane, "C-130");
	cnt_unit( units.Planes.Plane, "F-4E");
	cnt_unit( units.Planes.Plane, "F-16C bl.50");
	cnt_unit( units.Planes.Plane, "F-16C bl.52d");
	cnt_unit( units.Planes.Plane, "Mirage 2000-5");
	cnt_unit( units.Planes.Plane, "Yak-40");
	cnt_unit( units.Planes.Plane, "F-15C");--fictional
	cnt_unit( units.Planes.Plane, "MiG-29A");--fictional
	cnt_unit( units.Planes.Plane, "MiG-29S");--fictional
	cnt_unit( units.Planes.Plane, "Su-33");--fictional
	cnt_unit( units.Planes.Plane, "Su-27");--fictional
	cnt_unit( units.Planes.Plane, "Su-25T");--fictional
	cnt_unit( units.Planes.Plane, "Su-25");-- fictional
	cnt_unit( units.Planes.Plane, "P-51D");--fictional
	cnt_unit( units.Planes.Plane, "TF-51D");--fictional
	cnt_unit( units.Planes.Plane, "A-10A");--fictional

	cnt_unit( units.Cars.Car, "M-109");
	cnt_unit( units.Cars.Car, "BMP-1");
	cnt_unit( units.Cars.Car, "M-113");
	cnt_unit( units.Cars.Car, "M1043 HMMWV Armament");
	cnt_unit( units.Cars.Car, "M1045 HMMWV TOW");
	cnt_unit( units.Cars.Car, "Soldier M4");
	cnt_unit( units.Cars.Car, "Soldier M249");
	cnt_unit( units.Cars.Car, "MLRS");
	cnt_unit( units.Cars.Car, "MLRS FDDM");
	cnt_unit( units.Cars.Car, "Leopard1A3");
	cnt_unit( units.Cars.Car, "Leopard-2");
	cnt_unit( units.Cars.Car, "Hummer");
	cnt_unit( units.Cars.Car, "M 818");

	cnt_unit( units.Cars.Car, "Osa 9A33 ln");
	cnt_unit( units.Cars.Car, "Tor 9A331");
	cnt_unit( units.Cars.Car, "Soldier stinger");
	cnt_unit( units.Cars.Car, "Stinger comm");
	cnt_unit( units.Cars.Car, "ZU-23 Emplacement Closed");
	cnt_unit( units.Cars.Car, "ZU-23 Emplacement");
	cnt_unit( units.Cars.Car, "Patriot AMG");
	cnt_unit( units.Cars.Car, "Patriot ECS");
	cnt_unit( units.Cars.Car, "Patriot ln");
	cnt_unit( units.Cars.Car, "Patriot EPP");
	cnt_unit( units.Cars.Car, "Patriot cp");
	cnt_unit( units.Cars.Car, "Patriot str");
	cnt_unit( units.Cars.Car, "Hawk tr");
	cnt_unit( units.Cars.Car, "Hawk sr");
	cnt_unit( units.Cars.Car, "Hawk ln");
	cnt_unit( units.Cars.Car, "Hawk cwar");
	cnt_unit( units.Cars.Car, "Hawk pcp");
	cnt_unit( units.Cars.Car, "S-300PS 40B6M tr");
	cnt_unit( units.Cars.Car, "S-300PS 40B6MD sr");
	cnt_unit( units.Cars.Car, "S-300PS 64H6E sr");
	cnt_unit( units.Cars.Car, "S-300PS 5P85C ln");
	cnt_unit( units.Cars.Car, "S-300PS 5P85D ln");
	cnt_unit( units.Cars.Car, "S-300PS 54K6 cp");

	cnt_unit( units.Helicopters.Helicopter, "AH-64A");
	cnt_unit( units.Helicopters.Helicopter, "AH-64D");
	cnt_unit( units.Helicopters.Helicopter, "CH-47D");
	cnt_unit( units.Helicopters.Helicopter, "UH-1H");
	cnt_unit( units.Helicopters.Helicopter, "SH-60B");
	cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");--fictional




country:add("HUNGARY",		_("Hungary"),		"Hungary"			, "HUN", use_default_ranks,	no_awards, no_squadrons )
country:add("INDIA",		_("India"),			"India"				, "IND", use_default_ranks,	no_awards, no_squadrons )
country:add("IRAN",			_("Iran"),			"Iran"				, "IRN", use_default_ranks,	no_awards, no_squadrons )
country:add("IRAQ",			_("Iraq"),			"Iraq"				, "IRQ", use_default_ranks,	no_awards, no_squadrons )
country:add("JAPAN",		_("Japan"),			"Japan"				, "JPN", use_default_ranks,	no_awards, no_squadrons )
country:add("KAZAKHSTAN",	_("Kazakhstan"),	"Kazakhstan"		, "KAZ", use_default_ranks,	no_awards, no_squadrons )
country:add("NORTH_KOREA",	_("North Korea"),	"North Korea"		, "PRK", use_default_ranks,	no_awards, no_squadrons )
country:add("PAKISTAN",		_("Pakistan"),		"Pakistan"			, "PAK", use_default_ranks,	no_awards, no_squadrons )
country:add("POLAND",		_("Poland"),		"Poland"			, "POL", use_default_ranks,	no_awards, no_squadrons )
country:add("ROMANIA",		_("Romania"),		"Romania"			, "ROU", use_default_ranks,	no_awards, no_squadrons )
country:add("SAUDI_ARABIA",	_("Saudi Arabia"),	"Saudi Arabia"		, "SAU", use_default_ranks,	no_awards, no_squadrons )
country:add("SERBIA",		_("Serbia"),		"Serbia"			, "SRB", use_default_ranks,	no_awards, no_squadrons )
country:add("SLOVAKIA",		_("Slovakia"),		"Slovakia"			, "SVK", use_default_ranks,	no_awards, no_squadrons )
country:add("SOUTH_KOREA",	_("South Korea"),	"South Korea"		, "KOR", use_default_ranks,	no_awards, no_squadrons )
country:add("SWEDEN",		_("Sweden"),		"Sweden"			, "SWE", use_default_ranks,	no_awards, no_squadrons )
country:add("SYRIA",		_("Syria"),			"Syria"				, "SYR", use_default_ranks,	no_awards, no_squadrons )


country:add("YEMEN",		_("Yemen"),			"Yemen"				, "YEM", use_default_ranks,	no_awards, no_squadrons )
country:add("VIETNAM",		_("Vietnam"),		"Vietnam"			, "VNM", use_default_ranks,	no_awards, no_squadrons )
country:add("VENEZUELA",	_("Venezuela"),		"Venezuela"			, "VEN", use_default_ranks,	no_awards, no_squadrons )
country:add("TUNISIA",		_("Tunisia"),		"Tunisia"			, "TUN", use_default_ranks,	no_awards, no_squadrons )
country:add("THAILAND",		_("Thailand"),		"Thailand"			, "THA", use_default_ranks,	no_awards, no_squadrons )
country:add("SUDAN",		_("Sudan"),			"Sudan"				, "SDN", use_default_ranks,	no_awards, no_squadrons )
country:add("PHILIPPINES",	_("Philippines"),	"Philippines"		, "PHL", use_default_ranks,	no_awards, no_squadrons )
country:add("MOROCCO",		_("Morocco"),		"Morocco"			, "MAR", use_default_ranks,	no_awards, no_squadrons )
country:add("MEXICO",		_("Mexico"),		"Mexico"			, "MEX", use_default_ranks,	no_awards, no_squadrons )
country:add("MALAYSIA",		_("Malaysia"),		"Malaysia"			, "MYS", use_default_ranks,	no_awards, no_squadrons )
country:add("LIBYA",		_("Libya"),			"Libya"				, "LBY", use_default_ranks,	no_awards, no_squadrons )
country:add("JORDAN",		_("Jordan"),		"Jordan"			, "JOR", use_default_ranks,	no_awards, no_squadrons )
country:add("INDONESIA",	_("Indonesia"),		"Indonesia"			, "IDN", use_default_ranks,	no_awards, no_squadrons )
country:add("HONDURAS",		_("Honduras"),		"Honduras"			, "HND", use_default_ranks,	no_awards, no_squadrons )
country:add("ETHIOPIA",		_("Ethiopia"),		"Ethiopia"			, "ETH", use_default_ranks,	no_awards, no_squadrons )
country:add("CHILE",		_("Chile"),			"Chile"				, "CHL", use_default_ranks,	no_awards, no_squadrons )
country:add("BRAZIL",		_("Brazil"),		"Brazil"			, "BRA", use_default_ranks,	no_awards, no_squadrons ) 
country:add("BAHRAIN",		_("Bahrain"),		"Bahrain"			, "BHR", use_default_ranks,	no_awards, no_squadrons )
--<WWII/ 
country:add("THIRDREICH",				_("Third Reich")	,"Third Reich"								, "NZG", use_default_ranks,	no_awards, no_squadrons )
country:add("YUGOSLAVIA",				_("Yugoslavia")		,"Yugoslavia"								, "YUG", use_default_ranks,	no_awards, no_squadrons )
country:add("USSR"		,				_("USSR")	 	 	,"USSR"										, "SUN", use_default_ranks,	no_awards, no_squadrons )
country:add("ITALIAN_SOCIAL_REPUBLIC",	_("Italian Social Republic")	,"Italian Social Republic"		, "RSI", use_default_ranks,	no_awards, no_squadrons )
--/WWII>

country:add('ALGERIA',_("Algeria"), "Algeria", "DZA",
{
    rank('Second lieutenant', _('Second lieutenant'), 0, {0, 0, 64, 32}),
    rank('Lieutenant', _('Lieutenant'), 15, {0, 32, 64, 32}),
    rank('Captain', _('Captain'), 30, {0, 64, 64, 32}),
    rank('Commandant', _('Commandant'), 60, {0, 96, 64, 32}),
    rank('Lieutenant colonel', _('Lieutenant colonel'), 120, {0, 128, 64, 32}),
    rank('Colonel', _('Colonel'), 240, {0, 160, 64, 32}),
  },
  {
    award('Medal of Military Merit',_('Medal of Military Merit'), 200, 'Medal of Military Merit.png'),
    award('Medal of the National Peoples Army',_('Medal of the National Peoples Army'), 600, 'Medal of the National Peoples Army.png'),
	award('Medal of the National Peoples Army  II',_('Medal of the National Peoples Army II'), 1000, 'Medal of the National Peoples Army II.png'),
	award('Medal of the Resistance',_('Medal of the Resistance'), 1400, 'Medal of the Resistance.png'),                                                                                                                            award('Medal of the National Peoples ArmyII',_('Medal of the National Peoples ArmyII'), 1000, 'Medal of the National Peoples ArmyII.png'),                                                                                                                     award('Medal of the Resistance',_('Medal of the Resistance'), 1400, 'Medal of the Resistance.png'),
    award('Combat Wounded Medal',_('Combat Wounded Medal'), 1800, 'Combat Wounded Medal.png'),
    award('Medal of the National Liberation Army',_('Medal of the National Liberation Army'), 2200, 'Medal of the National Liberation Army.png'),
    award('Medal of Veterans of the Revolution',_('Medal of Veterans of the Revolution'), 2600, 'Medal of Veterans of the Revolution.png'),
  },
  'Algeria.lua'
);

country:add("KUWAIT",				_("Kuwait"),				"Kuwait",				"KWT", use_default_ranks,	no_awards, no_squadrons )
country:add("QATAR",				_("Qatar"),					"Qatar",				"QAT", use_default_ranks,	no_awards, no_squadrons )															   
country:add("OMAN",					_("Oman"),					"Oman",					"OMN", use_default_ranks,	no_awards, no_squadrons )															   
country:add("UNITED_ARAB_EMIRATES",	_("United Arab Emirates"),	"United Arab Emirates",	"ARE", use_default_ranks,	no_awards, no_squadrons )
country:add("GORGAS", _("Gorgas"),  "Gorgas", "GOR", use_default_ranks, no_awards, no_squadrons )

															   
-- RUSSIA
local units =  country:get("RUSSIA").Units
	cnt_unit( units.Planes.Plane, "Su-33");
	cnt_unit( units.Planes.Plane, "Su-25");
	cnt_unit( units.Planes.Plane, "MiG-29S");
	cnt_unit( units.Planes.Plane, "MiG-29A");
	cnt_unit( units.Planes.Plane, "Su-27");
	cnt_unit( units.Planes.Plane, "Su-25TM");
	cnt_unit( units.Planes.Plane, "Su-25T");
	cnt_unit( units.Planes.Plane, "MiG-31");
	cnt_unit( units.Planes.Plane, "MiG-27K");
	cnt_unit( units.Planes.Plane, "Su-30");
	cnt_unit( units.Planes.Plane, "Tu-160");
	cnt_unit( units.Planes.Plane, "Su-34");
	cnt_unit( units.Planes.Plane, "Tu-95MS");
	cnt_unit( units.Planes.Plane, "Tu-142");
	cnt_unit( units.Planes.Plane, "MiG-25PD");
	cnt_unit( units.Planes.Plane, "Tu-22M3");
	cnt_unit( units.Planes.Plane, "A-50");
	cnt_unit( units.Planes.Plane, "Yak-40");
	cnt_unit( units.Planes.Plane, "An-26B");
	cnt_unit( units.Planes.Plane, "An-30M");
	cnt_unit( units.Planes.Plane, "Su-17M4");
	cnt_unit( units.Planes.Plane, "MiG-23MLD");
	cnt_unit( units.Planes.Plane, "MiG-25RBT");
	cnt_unit( units.Planes.Plane, "Su-24M");
	cnt_unit( units.Planes.Plane, "Su-24MR");
	cnt_unit( units.Planes.Plane, "IL-78M");
	cnt_unit( units.Planes.Plane, "IL-76MD");
	cnt_unit( units.Planes.Plane, "L-39ZA");
	cnt_unit( units.Planes.Plane, "P-51D");

	cnt_unit( units.Ships.Ship, "KUZNECOW");
	cnt_unit( units.Ships.Ship, "MOSCOW");
	cnt_unit( units.Ships.Ship, "PIOTR");
	cnt_unit( units.Ships.Ship, "ELNYA");
	cnt_unit( units.Ships.Ship, "ALBATROS");
	cnt_unit( units.Ships.Ship, "REZKY");
	cnt_unit( units.Ships.Ship, "MOLNIYA");
	cnt_unit( units.Ships.Ship, "KILO");
	cnt_unit( units.Ships.Ship, "SOM");
	cnt_unit( units.Ships.Ship, "ZWEZDNY");
	cnt_unit( units.Ships.Ship, "NEUSTRASH");
	cnt_unit( units.Ships.Ship, "Dry-cargo ship-1");
	cnt_unit( units.Ships.Ship, "Dry-cargo ship-2");

	cnt_unit( units.Cars.Car, "BTR-80");
	cnt_unit( units.Cars.Car, "1L13 EWR");
	cnt_unit( units.Cars.Car, "55G6 EWR");
	cnt_unit( units.Cars.Car, "S-300PS 40B6M tr");
	cnt_unit( units.Cars.Car, "S-300PS 40B6MD sr");
	cnt_unit( units.Cars.Car, "S-300PS 64H6E sr");
	cnt_unit( units.Cars.Car, "S-300PS 5P85C ln");
	cnt_unit( units.Cars.Car, "S-300PS 5P85D ln");
	cnt_unit( units.Cars.Car, "SA-11 Buk SR 9S18M1");
	cnt_unit( units.Cars.Car, "SA-11 Buk CC 9S470M1");
	cnt_unit( units.Cars.Car, "SA-11 Buk LN 9A310M1");
	cnt_unit( units.Cars.Car, "Kub 1S91 str");
	cnt_unit( units.Cars.Car, "Kub 2P25 ln");
	cnt_unit( units.Cars.Car, "Osa 9A33 ln");
	cnt_unit( units.Cars.Car, "Strela-1 9P31");
	cnt_unit( units.Cars.Car, "Strela-10M3");
	cnt_unit( units.Cars.Car, "Dog Ear radar");
	cnt_unit( units.Cars.Car, "Tor 9A331");
	cnt_unit( units.Cars.Car, "2S6 Tunguska");
	cnt_unit( units.Cars.Car, "ZSU-23-4 Shilka");
	cnt_unit( units.Cars.Car, "SAU Msta");
	cnt_unit( units.Cars.Car, "SAU Akatsia");
	cnt_unit( units.Cars.Car, "SAU 2-C9");
	cnt_unit( units.Cars.Car, "ATMZ-5");
	cnt_unit( units.Cars.Car, "ATZ-10");
	cnt_unit( units.Cars.Car, "BMD-1");
	cnt_unit( units.Cars.Car, "BMP-1");
	cnt_unit( units.Cars.Car, "BMP-2");
	cnt_unit( units.Cars.Car, "BRDM-2");
	cnt_unit( units.Cars.Car, "Grad-URAL");
	cnt_unit( units.Cars.Car, "Uragan_BM-27");
	cnt_unit( units.Cars.Car, "Smerch");
	cnt_unit( units.Cars.Car, "T-80UD");
	cnt_unit( units.Cars.Car, "UAZ-469");
	cnt_unit( units.Cars.Car, "Ural-375");
	cnt_unit( units.Cars.Car, "Ural-375 PBU");
	cnt_unit( units.Cars.Car, "IKARUS Bus");
	cnt_unit( units.Cars.Car, "VAZ Car");
	cnt_unit( units.Cars.Car, "Trolley bus");
	cnt_unit( units.Cars.Car, "KAMAZ Truck");
	cnt_unit( units.Cars.Car, "LAZ Bus");
	cnt_unit( units.Cars.Car, "SAU Gvozdika");
	cnt_unit( units.Cars.Car, "BMP-3");
	cnt_unit( units.Cars.Car, "BTR_D");
	cnt_unit( units.Cars.Car, "S-300PS 54K6 cp");
	cnt_unit( units.Cars.Car, "GAZ-3307");
	cnt_unit( units.Cars.Car, "GAZ-66");
	cnt_unit( units.Cars.Car, "GAZ-3308");
	cnt_unit( units.Cars.Car, "MAZ-6303");
	cnt_unit( units.Cars.Car, "ZIL-4331");
	cnt_unit( units.Cars.Car, "SKP-11");
	cnt_unit( units.Cars.Car, "Ural-4320T");
	cnt_unit( units.Cars.Car, "Ural-4320-31");
	cnt_unit( units.Cars.Car, "Ural ATsP-6");
	cnt_unit( units.Cars.Car, "ZiL-131 APA-80");
	cnt_unit( units.Cars.Car, "ZIL-131 KUNG");
	cnt_unit( units.Cars.Car, "Ural-4320 APA-5D");
	cnt_unit( units.Cars.Car, "ZU-23 Emplacement");
	cnt_unit( units.Cars.Car, "ZU-23 Emplacement Closed");
	cnt_unit( units.Cars.Car, "Ural-375 ZU-23");
	cnt_unit( units.Cars.Car, "MTLB");
	cnt_unit( units.Cars.Car, "T-72B");
	cnt_unit( units.Cars.Car, "SA-18 Igla-S manpad");
	cnt_unit( units.Cars.Car, "SA-18 Igla-S comm");
	cnt_unit( units.Cars.Car, "T-55");
	cnt_unit( units.Cars.Car, "Paratrooper RPG-16");
	cnt_unit( units.Cars.Car, "Paratrooper AKS-74");
	cnt_unit( units.Cars.Car, "Boman");
	cnt_unit( units.Cars.Car, "2B11 mortar");
	cnt_unit( units.Cars.Car, "5p73 s-125 ln");
	cnt_unit( units.Cars.Car, "snr s-125 tr");
	cnt_unit( units.Cars.Car, "p-19 s-125 sr");
    cnt_unit( units.Cars.Car, "Infantry AK");
	cnt_unit( units.Cars.Car, "T-90");
	cnt_unit( units.Cars.Car, "Tigr_233036");

	cnt_unit( units.Helicopters.Helicopter, "Mi-24V");
	cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");
	cnt_unit( units.Helicopters.Helicopter, "Mi-26");
	cnt_unit( units.Helicopters.Helicopter, "Ka-27");
	cnt_unit( units.Helicopters.Helicopter, "Mi-28N");
	cnt_unit( units.Helicopters.Helicopter, "UH-1H");
	--cnt_unit( units.Helicopters.Helicopter, "Ka-52");

--UKRAINE
local units  = country:get("UKRAINE").Units

	cnt_unit( units.Planes.Plane, "Su-27");
	cnt_unit( units.Planes.Plane, "MiG-29A");
	cnt_unit( units.Planes.Plane, "MiG-29S");
	cnt_unit( units.Planes.Plane, "Su-17M4");
	cnt_unit( units.Planes.Plane, "Tu-95MS");
	cnt_unit( units.Planes.Plane, "Su-24M");
	cnt_unit( units.Planes.Plane, "Su-24MR");
	cnt_unit( units.Planes.Plane, "Su-25");
	cnt_unit( units.Planes.Plane, "MiG-25PD");
	cnt_unit( units.Planes.Plane, "An-26B");
	cnt_unit( units.Planes.Plane, "An-30M");
	cnt_unit( units.Planes.Plane, "MiG-23MLD");
	cnt_unit( units.Planes.Plane, "IL-78M");
	cnt_unit( units.Planes.Plane, "IL-76MD");
	cnt_unit( units.Planes.Plane, "MiG-27K");
	cnt_unit( units.Planes.Plane, "Tu-22M3");
	cnt_unit( units.Planes.Plane, "MiG-25RBT");
	cnt_unit( units.Planes.Plane, "Yak-40");
	cnt_unit( units.Planes.Plane, "L-39ZA");
	cnt_unit( units.Planes.Plane, "P-51D");
			
	cnt_unit( units.Ships.Ship, "ELNYA");
	cnt_unit( units.Ships.Ship, "ALBATROS");
	cnt_unit( units.Ships.Ship, "MOLNIYA");
	cnt_unit( units.Ships.Ship, "KILO");
	cnt_unit( units.Ships.Ship, "ZWEZDNY");
	cnt_unit( units.Ships.Ship, "Dry-cargo ship-1");
	cnt_unit( units.Ships.Ship, "Dry-cargo ship-2");
	cnt_unit( units.Ships.Ship, "REZKY");

	cnt_unit( units.Cars.Car, "BTR-80");
	cnt_unit( units.Cars.Car, "1L13 EWR");
	cnt_unit( units.Cars.Car, "55G6 EWR");
	cnt_unit( units.Cars.Car, "S-300PS 40B6M tr");
	cnt_unit( units.Cars.Car, "S-300PS 40B6MD sr");
	cnt_unit( units.Cars.Car, "S-300PS 64H6E sr");
	cnt_unit( units.Cars.Car, "S-300PS 5P85C ln");
	cnt_unit( units.Cars.Car, "S-300PS 5P85D ln");
	cnt_unit( units.Cars.Car, "SA-11 Buk SR 9S18M1");
	cnt_unit( units.Cars.Car, "SA-11 Buk CC 9S470M1");
	cnt_unit( units.Cars.Car, "SA-11 Buk LN 9A310M1");
	cnt_unit( units.Cars.Car, "Kub 1S91 str");
	cnt_unit( units.Cars.Car, "Kub 2P25 ln");
	cnt_unit( units.Cars.Car, "Osa 9A33 ln");
	cnt_unit( units.Cars.Car, "Strela-10M3");
	cnt_unit( units.Cars.Car, "Dog Ear radar");
	cnt_unit( units.Cars.Car, "Tor 9A331");
	cnt_unit( units.Cars.Car, "ZSU-23-4 Shilka");
	cnt_unit( units.Cars.Car, "SAU Msta");
	cnt_unit( units.Cars.Car, "SAU Akatsia");
	cnt_unit( units.Cars.Car, "SAU 2-C9");
	cnt_unit( units.Cars.Car, "ATMZ-5");
	cnt_unit( units.Cars.Car, "ATZ-10");
	cnt_unit( units.Cars.Car, "BMD-1");
	cnt_unit( units.Cars.Car, "BMP-1");
	cnt_unit( units.Cars.Car, "BMP-2");
	cnt_unit( units.Cars.Car, "BMP-3");
	cnt_unit( units.Cars.Car, "BRDM-2");
	cnt_unit( units.Cars.Car, "Grad-URAL");
	cnt_unit( units.Cars.Car, "T-80UD");
	cnt_unit( units.Cars.Car, "UAZ-469");
	cnt_unit( units.Cars.Car, "Ural-375");
	cnt_unit( units.Cars.Car, "Ural-375 PBU");
	cnt_unit( units.Cars.Car, "IKARUS Bus");
	cnt_unit( units.Cars.Car, "VAZ Car");
	cnt_unit( units.Cars.Car, "Trolley bus");
	cnt_unit( units.Cars.Car, "KAMAZ Truck");
	cnt_unit( units.Cars.Car, "LAZ Bus");
	cnt_unit( units.Cars.Car, "SAU Gvozdika");
	cnt_unit( units.Cars.Car, "BTR_D");
	cnt_unit( units.Cars.Car, "S-300PS 54K6 cp");
	cnt_unit( units.Cars.Car, "GAZ-3307");
	cnt_unit( units.Cars.Car, "GAZ-3308");
	cnt_unit( units.Cars.Car, "GAZ-66");
	cnt_unit( units.Cars.Car, "ZIL-4331");
	cnt_unit( units.Cars.Car, "MAZ-6303");
	cnt_unit( units.Cars.Car, "SKP-11");
	cnt_unit( units.Cars.Car, "Ural-4320T");
	cnt_unit( units.Cars.Car, "Ural ATsP-6");
	cnt_unit( units.Cars.Car, "ZiL-131 APA-80");
	cnt_unit( units.Cars.Car, "ZIL-131 KUNG");
	cnt_unit( units.Cars.Car, "Ural-4320 APA-5D");
	cnt_unit( units.Cars.Car, "ZU-23 Emplacement");
	cnt_unit( units.Cars.Car, "ZU-23 Emplacement Closed");
	cnt_unit( units.Cars.Car, "Ural-375 ZU-23");
	cnt_unit( units.Cars.Car, "2S6 Tunguska");
	cnt_unit( units.Cars.Car, "Smerch");
	cnt_unit( units.Cars.Car, "Strela-1 9P31");
	cnt_unit( units.Cars.Car, "MTLB");
	cnt_unit( units.Cars.Car, "T-72B");
	cnt_unit( units.Cars.Car, "SA-18 Igla-S manpad");
	cnt_unit( units.Cars.Car, "SA-18 Igla-S comm");
	cnt_unit( units.Cars.Car, "T-55");
	cnt_unit( units.Cars.Car, "2B11 mortar");
	cnt_unit( units.Cars.Car, "Paratrooper RPG-16");
	cnt_unit( units.Cars.Car, "Paratrooper AKS-74");
	cnt_unit( units.Cars.Car, "KrAZ6322");

	cnt_unit( units.Helicopters.Helicopter, "Mi-24V");
	cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");
	cnt_unit( units.Helicopters.Helicopter, "Mi-26");
	cnt_unit( units.Helicopters.Helicopter, "Ka-27");
	cnt_unit( units.Helicopters.Helicopter, "UH-1H");


-- USA
local units = country:get("USA").Units

	cnt_unit( units.Planes.Plane, "A-10A");
	cnt_unit( units.Planes.Plane, "F-117A");
	cnt_unit( units.Planes.Plane, "C-17A");
	cnt_unit( units.Planes.Plane, "F-15C");
	cnt_unit( units.Planes.Plane, "F-15E");
	cnt_unit( units.Planes.Plane, "F-16C bl.52d");
	cnt_unit( units.Planes.Plane, "B-1B");
	cnt_unit( units.Planes.Plane, "B-52H");
	cnt_unit( units.Planes.Plane, "E-3A");
	cnt_unit( units.Planes.Plane, "KC-135");
	cnt_unit( units.Planes.Plane, "C-130");
	cnt_unit( units.Planes.Plane, "F-14A");
	cnt_unit( units.Planes.Plane, "S-3B");
	cnt_unit( units.Planes.Plane, "S-3B Tanker");
	cnt_unit( units.Planes.Plane, "F/A-18C");
	cnt_unit( units.Planes.Plane, "E-2C");
	cnt_unit( units.Planes.Plane, "F-16A");
	cnt_unit( units.Planes.Plane, "F-5E");
	cnt_unit( units.Planes.Plane, "RQ-1A Predator");
	cnt_unit( units.Planes.Plane, "P-51D");
	cnt_unit( units.Planes.Plane, "L-39ZA");
	cnt_unit( units.Planes.Plane, "Su-33");
	cnt_unit( units.Planes.Plane, "Su-25");
	cnt_unit( units.Planes.Plane, "MiG-29S");
	cnt_unit( units.Planes.Plane, "MiG-29A");
	cnt_unit( units.Planes.Plane, "Su-27");
	cnt_unit( units.Planes.Plane, "Su-25TM");
	cnt_unit( units.Planes.Plane, "Su-25T");
	cnt_unit( units.Planes.Plane, "MiG-31");
	cnt_unit( units.Planes.Plane, "MiG-27K");
	cnt_unit( units.Planes.Plane, "Su-30");
	cnt_unit( units.Planes.Plane, "Tu-160");
	cnt_unit( units.Planes.Plane, "Su-34");
	cnt_unit( units.Planes.Plane, "Tu-95MS");
	cnt_unit( units.Planes.Plane, "Tu-142");
	cnt_unit( units.Planes.Plane, "MiG-25PD");
	cnt_unit( units.Planes.Plane, "Tu-22M3");
	cnt_unit( units.Planes.Plane, "A-50");
	cnt_unit( units.Planes.Plane, "Yak-40");
	cnt_unit( units.Planes.Plane, "An-26B");
	cnt_unit( units.Planes.Plane, "An-30M");
	cnt_unit( units.Planes.Plane, "Su-17M4");
	cnt_unit( units.Planes.Plane, "MiG-23MLD");
	cnt_unit( units.Planes.Plane, "MiG-25RBT");
	cnt_unit( units.Planes.Plane, "Su-24M");
	cnt_unit( units.Planes.Plane, "Su-24MR");
	cnt_unit( units.Planes.Plane, "IL-78M");
	cnt_unit( units.Planes.Plane, "IL-76MD");
	cnt_unit( units.Planes.Plane, "TF-51D");
	cnt_unit( units.Planes.Plane, "MQ-9 Reaper");

	cnt_unit( units.Ships.Ship, "VINSON");
	cnt_unit( units.Ships.Ship, "PERRY");
	cnt_unit( units.Ships.Ship, "TICONDEROG");
	cnt_unit( units.Ships.Ship, "KUZNECOW");
	cnt_unit( units.Ships.Ship, "MOSCOW");
	cnt_unit( units.Ships.Ship, "PIOTR");
	cnt_unit( units.Ships.Ship, "ELNYA");
	cnt_unit( units.Ships.Ship, "ALBATROS");
	cnt_unit( units.Ships.Ship, "REZKY");
	cnt_unit( units.Ships.Ship, "MOLNIYA");
	cnt_unit( units.Ships.Ship, "KILO");
	cnt_unit( units.Ships.Ship, "SOM");
	cnt_unit( units.Ships.Ship, "ZWEZDNY");
	cnt_unit( units.Ships.Ship, "NEUSTRASH");
	cnt_unit( units.Ships.Ship, "Dry-cargo ship-1");
	cnt_unit( units.Ships.Ship, "Dry-cargo ship-2");
	cnt_unit( units.Ships.Ship, "ELNYA");
    cnt_unit( units.Ships.Ship, "ALBATROS");
    cnt_unit( units.Ships.Ship, "MOLNIYA");
    cnt_unit( units.Ships.Ship, "Dry-cargo ship-1");
    cnt_unit( units.Ships.Ship, "Dry-cargo ship-2");
    cnt_unit( units.Ships.Ship, "ZWEZDNY");

	cnt_unit( units.Cars.Car, "M-2 Bradley");
	cnt_unit( units.Cars.Car, "M1097 Avenger");
	cnt_unit( units.Cars.Car, "Patriot str");
	cnt_unit( units.Cars.Car, "Patriot ln");
	cnt_unit( units.Cars.Car, "Patriot AMG");
	cnt_unit( units.Cars.Car, "Patriot EPP");
	cnt_unit( units.Cars.Car, "Patriot ECS");
	cnt_unit( units.Cars.Car, "Patriot cp");
	cnt_unit( units.Cars.Car, "Hawk sr");
	cnt_unit( units.Cars.Car, "Hawk cwar");
	cnt_unit( units.Cars.Car, "Hawk pcp");
	cnt_unit( units.Cars.Car, "Hawk tr");
	cnt_unit( units.Cars.Car, "Hawk ln");
	cnt_unit( units.Cars.Car, "Vulcan");
	cnt_unit( units.Cars.Car, "Hummer");
	cnt_unit( units.Cars.Car, "LAV-25");
	cnt_unit( units.Cars.Car, "AAV7");
	cnt_unit( units.Cars.Car, "M-113");
	cnt_unit( units.Cars.Car, "M-109");
	cnt_unit( units.Cars.Car, "M-1 Abrams");
	cnt_unit( units.Cars.Car, "MLRS");
	cnt_unit( units.Cars.Car, "MLRS FDDM");
	cnt_unit( units.Cars.Car, "M 818");
	cnt_unit( units.Cars.Car, "M48 Chaparral");
	cnt_unit( units.Cars.Car, "M1126 Stryker ICV");
	cnt_unit( units.Cars.Car, "M1128 Stryker MGS");
	cnt_unit( units.Cars.Car, "M1134 Stryker ATGM");
	cnt_unit( units.Cars.Car, "M6 Linebacker");
	cnt_unit( units.Cars.Car, "Soldier stinger");
	cnt_unit( units.Cars.Car, "Stinger comm");
	cnt_unit( units.Cars.Car, "Predator GCS");
	cnt_unit( units.Cars.Car, "Predator TrojanSpirit");
	cnt_unit( units.Cars.Car, "M1043 HMMWV Armament");
	cnt_unit( units.Cars.Car, "M1045 HMMWV TOW");
	cnt_unit( units.Cars.Car, "M978 HEMTT Tanker");
	cnt_unit( units.Cars.Car, "HEMTT TFFT");
	cnt_unit( units.Cars.Car, "Soldier M4");
	cnt_unit( units.Cars.Car, "Soldier M249");
	cnt_unit( units.Cars.Car, "2B11 mortar");
	
	cnt_unit( units.Cars.Car, "BTR-80");
	cnt_unit( units.Cars.Car, "1L13 EWR");
	cnt_unit( units.Cars.Car, "55G6 EWR");
	cnt_unit( units.Cars.Car, "S-300PS 40B6M tr");
	cnt_unit( units.Cars.Car, "S-300PS 40B6MD sr");
	cnt_unit( units.Cars.Car, "S-300PS 64H6E sr");
	cnt_unit( units.Cars.Car, "S-300PS 5P85C ln");
	cnt_unit( units.Cars.Car, "S-300PS 5P85D ln");
	cnt_unit( units.Cars.Car, "SA-11 Buk SR 9S18M1");
	cnt_unit( units.Cars.Car, "SA-11 Buk CC 9S470M1");
	cnt_unit( units.Cars.Car, "SA-11 Buk LN 9A310M1");
	cnt_unit( units.Cars.Car, "Kub 1S91 str");
	cnt_unit( units.Cars.Car, "Kub 2P25 ln");
	cnt_unit( units.Cars.Car, "Osa 9A33 ln");
	cnt_unit( units.Cars.Car, "Strela-1 9P31");
	cnt_unit( units.Cars.Car, "Strela-10M3");
	cnt_unit( units.Cars.Car, "Dog Ear radar");
	cnt_unit( units.Cars.Car, "Tor 9A331");
	cnt_unit( units.Cars.Car, "2S6 Tunguska");
	cnt_unit( units.Cars.Car, "ZSU-23-4 Shilka");
	cnt_unit( units.Cars.Car, "SAU Msta");
	cnt_unit( units.Cars.Car, "SAU Akatsia");
	cnt_unit( units.Cars.Car, "SAU 2-C9");
	cnt_unit( units.Cars.Car, "ATMZ-5");
	cnt_unit( units.Cars.Car, "ATZ-10");
	cnt_unit( units.Cars.Car, "BMD-1");
	cnt_unit( units.Cars.Car, "BMP-1");
	cnt_unit( units.Cars.Car, "BMP-2");
	cnt_unit( units.Cars.Car, "BRDM-2");
	cnt_unit( units.Cars.Car, "Grad-URAL");
	cnt_unit( units.Cars.Car, "Uragan_BM-27");
	cnt_unit( units.Cars.Car, "Smerch");
	cnt_unit( units.Cars.Car, "T-80UD");
	cnt_unit( units.Cars.Car, "UAZ-469");
	cnt_unit( units.Cars.Car, "Ural-375");
	cnt_unit( units.Cars.Car, "Ural-375 PBU");
	cnt_unit( units.Cars.Car, "IKARUS Bus");
	cnt_unit( units.Cars.Car, "VAZ Car");
	cnt_unit( units.Cars.Car, "Trolley bus");
	cnt_unit( units.Cars.Car, "KAMAZ Truck");
	cnt_unit( units.Cars.Car, "LAZ Bus");
	cnt_unit( units.Cars.Car, "SAU Gvozdika");
	cnt_unit( units.Cars.Car, "BMP-3");
	cnt_unit( units.Cars.Car, "BTR_D");
	cnt_unit( units.Cars.Car, "S-300PS 54K6 cp");
	cnt_unit( units.Cars.Car, "GAZ-3307");
	cnt_unit( units.Cars.Car, "GAZ-66");
	cnt_unit( units.Cars.Car, "GAZ-3308");
	cnt_unit( units.Cars.Car, "MAZ-6303");
	cnt_unit( units.Cars.Car, "ZIL-4331");
	cnt_unit( units.Cars.Car, "SKP-11");
	cnt_unit( units.Cars.Car, "Ural-4320T");
	cnt_unit( units.Cars.Car, "Ural-4320-31");
	cnt_unit( units.Cars.Car, "Ural ATsP-6");
	cnt_unit( units.Cars.Car, "ZiL-131 APA-80");
	cnt_unit( units.Cars.Car, "ZIL-131 KUNG");
	cnt_unit( units.Cars.Car, "Ural-4320 APA-5D");
	cnt_unit( units.Cars.Car, "ZU-23 Emplacement");
	cnt_unit( units.Cars.Car, "ZU-23 Emplacement Closed");
	cnt_unit( units.Cars.Car, "Ural-375 ZU-23");
	cnt_unit( units.Cars.Car, "MTLB");
	cnt_unit( units.Cars.Car, "T-72B");
	cnt_unit( units.Cars.Car, "SA-18 Igla-S manpad");
	cnt_unit( units.Cars.Car, "SA-18 Igla-S comm");
	cnt_unit( units.Cars.Car, "T-55");
	cnt_unit( units.Cars.Car, "Paratrooper RPG-16");
	cnt_unit( units.Cars.Car, "Paratrooper AKS-74");
	cnt_unit( units.Cars.Car, "Boman");
	cnt_unit( units.Cars.Car, "2B11 mortar");
	cnt_unit( units.Cars.Car, "5p73 s-125 ln");
	cnt_unit( units.Cars.Car, "snr s-125 tr");
	cnt_unit( units.Cars.Car, "p-19 s-125 sr");
    cnt_unit( units.Cars.Car, "Infantry AK");
	cnt_unit( units.Cars.Car, "T-90");
	cnt_unit( units.Cars.Car, "Tigr_233036");
	cnt_unit( units.Cars.Car, "M-113");
    cnt_unit( units.Cars.Car, "Patriot str");
    cnt_unit( units.Cars.Car, "Patriot ln");
	cnt_unit( units.Cars.Car, "Patriot AMG");
	cnt_unit( units.Cars.Car, "Patriot EPP");
	cnt_unit( units.Cars.Car, "Patriot ECS");
	cnt_unit( units.Cars.Car, "Patriot cp");
    cnt_unit( units.Cars.Car, "Hawk sr");
	cnt_unit( units.Cars.Car, "Hawk cwar");
	cnt_unit( units.Cars.Car, "Hawk pcp");
    cnt_unit( units.Cars.Car, "Hawk tr");
    cnt_unit( units.Cars.Car, "Hawk ln");
    cnt_unit( units.Cars.Car, "Roland ADS");
    cnt_unit( units.Cars.Car, "Roland Radar");
    cnt_unit( units.Cars.Car, "Gepard");
    cnt_unit( units.Cars.Car, "Leopard-2");
    cnt_unit( units.Cars.Car, "Leopard1A3");
    cnt_unit( units.Cars.Car, "M-109");
    cnt_unit( units.Cars.Car, "Marder");
	cnt_unit( units.Cars.Car, "TPZ");
	cnt_unit( units.Cars.Car, "MLRS");
	cnt_unit( units.Cars.Car, "Soldier stinger");
	cnt_unit( units.Cars.Car, "Stinger comm");
	cnt_unit( units.Cars.Car, "M 818");
	
	cnt_unit( units.Helicopters.Helicopter, "AH-64A");
	cnt_unit( units.Helicopters.Helicopter, "AH-64D");
	cnt_unit( units.Helicopters.Helicopter, "AH-1W");
	cnt_unit( units.Helicopters.Helicopter, "UH-60A");
	cnt_unit( units.Helicopters.Helicopter, "CH-47D");
	cnt_unit( units.Helicopters.Helicopter, "SH-60B");
	cnt_unit( units.Helicopters.Helicopter, "CH-53E");
	cnt_unit( units.Helicopters.Helicopter, "OH-58D");
	cnt_unit( units.Helicopters.Helicopter, "UH-1H");
	cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");
	cnt_unit( units.Helicopters.Helicopter, "Mi-24V");
	cnt_unit( units.Helicopters.Helicopter, "Mi-26");
	cnt_unit( units.Helicopters.Helicopter, "Ka-27");
	cnt_unit( units.Helicopters.Helicopter, "Mi-28N");
	cnt_unit( units.Helicopters.Helicopter, "UH-1H");
	cnt_unit( units.Helicopters.Helicopter, "Ka-52");
	cnt_unit( units.Helicopters.Helicopter, "Ka-50");

-- TURKEY
local units = country:get("TURKEY").Units

        cnt_unit( units.Planes.Plane, "F-16C bl.50");
        cnt_unit( units.Planes.Plane, "F-4E");
    --    cnt_unit( units.Planes.Plane, "F-5E");
        cnt_unit( units.Planes.Plane, "C-130");
		cnt_unit( units.Planes.Plane, "P-51D");

        cnt_unit( units.Ships.Ship, "PERRY");

        cnt_unit( units.Cars.Car, "M-113");
		cnt_unit( units.Cars.Car, "Cobra");
        cnt_unit( units.Cars.Car, "Hawk sr");
		cnt_unit( units.Cars.Car, "Hawk cwar");
		cnt_unit( units.Cars.Car, "Hawk pcp");
        cnt_unit( units.Cars.Car, "Hawk tr");
        cnt_unit( units.Cars.Car, "Hawk ln");
        cnt_unit( units.Cars.Car, "Hummer");
        cnt_unit( units.Cars.Car, "M 818");
        cnt_unit( units.Cars.Car, "M-60");
        cnt_unit( units.Cars.Car, "MLRS");
		cnt_unit( units.Cars.Car, "MLRS FDDM");
        cnt_unit( units.Cars.Car, "M1097 Avenger");
        cnt_unit( units.Cars.Car, "M-109");
        cnt_unit( units.Cars.Car, "AAV7");
        cnt_unit( units.Cars.Car, "BTR-80");
        cnt_unit( units.Cars.Car, "Soldier stinger");
        cnt_unit( units.Cars.Car, "Stinger comm");
        cnt_unit( units.Cars.Car, "M978 HEMTT Tanker");
		cnt_unit( units.Cars.Car, "HEMTT TFFT");
        cnt_unit( units.Cars.Car, "Leopard1A3");
        cnt_unit( units.Cars.Car, "Leopard-2");

        cnt_unit( units.Helicopters.Helicopter, "UH-60A");
        cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");
        cnt_unit( units.Helicopters.Helicopter, "AH-1W");
		cnt_unit( units.Helicopters.Helicopter, "UH-1H");

-- GERMANY
local units  = country:get("GERMANY").Units

        cnt_unit( units.Planes.Plane, "MiG-29G");
        cnt_unit( units.Planes.Plane, "F-4E");
        cnt_unit( units.Planes.Plane, "Tornado IDS");
		cnt_unit( units.Planes.Plane, "P-51D");
		
        cnt_unit( units.Cars.Car, "M-113");
        cnt_unit( units.Cars.Car, "Patriot str");
        cnt_unit( units.Cars.Car, "Patriot ln");
		cnt_unit( units.Cars.Car, "Patriot AMG");
		cnt_unit( units.Cars.Car, "Patriot EPP");
		cnt_unit( units.Cars.Car, "Patriot ECS");
		cnt_unit( units.Cars.Car, "Patriot cp");
        cnt_unit( units.Cars.Car, "Hawk sr");
		cnt_unit( units.Cars.Car, "Hawk cwar");
		cnt_unit( units.Cars.Car, "Hawk pcp");
        cnt_unit( units.Cars.Car, "Hawk tr");
        cnt_unit( units.Cars.Car, "Hawk ln");
        cnt_unit( units.Cars.Car, "Roland ADS");
        cnt_unit( units.Cars.Car, "Roland Radar");
        cnt_unit( units.Cars.Car, "Gepard");
        cnt_unit( units.Cars.Car, "Hummer");
        cnt_unit( units.Cars.Car, "Leopard-2");
        cnt_unit( units.Cars.Car, "Leopard1A3");
        cnt_unit( units.Cars.Car, "M-109");
        cnt_unit( units.Cars.Car, "Marder");
        cnt_unit( units.Cars.Car, "TPZ");
        cnt_unit( units.Cars.Car, "MLRS");
		cnt_unit( units.Cars.Car, "MLRS FDDM");
        cnt_unit( units.Cars.Car, "Soldier stinger");
        cnt_unit( units.Cars.Car, "Stinger comm");
        cnt_unit( units.Cars.Car, "M 818");
        cnt_unit( units.Cars.Car, "M978 HEMTT Tanker");
		cnt_unit( units.Cars.Car, "HEMTT TFFT");
		
		cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");
		cnt_unit( units.Helicopters.Helicopter, "UH-1H");

-- CANADA
local units  = country:get("CANADA").Units

        cnt_unit( units.Planes.Plane, "C-130");
		cnt_unit( units.Planes.Plane, "P-51D");
		cnt_unit( units.Planes.Plane, "F/A-18C");
			
        cnt_unit( units.Cars.Car, "M-113");
        cnt_unit( units.Cars.Car, "Hummer");
        cnt_unit( units.Cars.Car, "LAV-25");
        cnt_unit( units.Cars.Car, "Soldier stinger");
        cnt_unit( units.Cars.Car, "Stinger comm");
        cnt_unit( units.Cars.Car, "M 818");
        cnt_unit( units.Cars.Car, "M978 HEMTT Tanker");
		cnt_unit( units.Cars.Car, "HEMTT TFFT");
        cnt_unit( units.Cars.Car, "Leopard1A3");
        cnt_unit( units.Cars.Car, "Leopard-2");
        cnt_unit( units.Cars.Car, "M-109");
		
		cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");
		cnt_unit( units.Helicopters.Helicopter, "UH-1H");

-- UK
local units  = country:get("UK").Units

        cnt_unit( units.Planes.Plane, "Tornado GR4");
        cnt_unit( units.Planes.Plane, "C-130");
		cnt_unit( units.Planes.Plane, "P-51D");

        cnt_unit( units.Cars.Car, "MCV-80");
        cnt_unit( units.Cars.Car, "Challenger2");
        cnt_unit( units.Cars.Car, "Hummer");
        cnt_unit( units.Cars.Car, "MLRS");
		cnt_unit( units.Cars.Car, "MLRS FDDM");
        cnt_unit( units.Cars.Car, "M 818");
        cnt_unit( units.Cars.Car, "TPZ");

        cnt_unit( units.Helicopters.Helicopter, "AH-64A");
        cnt_unit( units.Helicopters.Helicopter, "AH-64D");
        cnt_unit( units.Helicopters.Helicopter, "CH-47D");
		cnt_unit( units.Helicopters.Helicopter, "UH-1H");
		cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");

-- FRANCE
local units  = country:get("FRANCE").Units

        cnt_unit( units.Planes.Plane, "Mirage 2000-5");
        cnt_unit( units.Planes.Plane, "C-130");
		cnt_unit( units.Planes.Plane, "P-51D");
		
        cnt_unit( units.Cars.Car, "Leclerc");
        cnt_unit( units.Cars.Car, "MLRS");
		cnt_unit( units.Cars.Car, "MLRS FDDM");
        cnt_unit( units.Cars.Car, "Hawk sr");
		cnt_unit( units.Cars.Car, "Hawk cwar");
		cnt_unit( units.Cars.Car, "Hawk pcp");
        cnt_unit( units.Cars.Car, "Hawk tr");
        cnt_unit( units.Cars.Car, "Hawk ln");
        cnt_unit( units.Cars.Car, "M 818");
		
		cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");
		cnt_unit( units.Helicopters.Helicopter, "UH-1H");

-- SPAIN
local units  = country:get("SPAIN").Units

        cnt_unit( units.Planes.Plane, "C-130");
		cnt_unit( units.Planes.Plane, "P-51D");
		cnt_unit( units.Planes.Plane, "F/A-18C");
			
        cnt_unit( units.Cars.Car, "M-113");
        cnt_unit( units.Cars.Car, "Hawk sr");
		cnt_unit( units.Cars.Car, "Hawk cwar");
		cnt_unit( units.Cars.Car, "Hawk pcp");
        cnt_unit( units.Cars.Car, "Hawk tr");
        cnt_unit( units.Cars.Car, "Hawk ln");
        cnt_unit( units.Cars.Car, "Hummer");
        cnt_unit( units.Cars.Car, "Leopard-2");
        cnt_unit( units.Cars.Car, "M-60");
        cnt_unit( units.Cars.Car, "M-109");
        cnt_unit( units.Cars.Car, "Soldier stinger");
        cnt_unit( units.Cars.Car, "Stinger comm");
        cnt_unit( units.Cars.Car, "M 818");
        cnt_unit( units.Cars.Car, "Roland ADS");
        cnt_unit( units.Cars.Car, "Roland Radar");
		cnt_unit( units.Cars.Car, "2B11 mortar");

		cnt_unit( units.Helicopters.Helicopter, "CH-47D");
		cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");
		cnt_unit( units.Helicopters.Helicopter, "UH-1H");

-- THE NETHERLANDS
local units  = country:get("THE_NETHERLANDS").Units

        cnt_unit( units.Planes.Plane, "C-130");
        cnt_unit( units.Planes.Plane, "F-16A MLU");
		cnt_unit( units.Planes.Plane, "P-51D");
			
        cnt_unit( units.Cars.Car, "Hummer");
        cnt_unit( units.Cars.Car, "Patriot str");
        cnt_unit( units.Cars.Car, "Patriot ln");
		cnt_unit( units.Cars.Car, "Patriot AMG");
		cnt_unit( units.Cars.Car, "Patriot EPP");
		cnt_unit( units.Cars.Car, "Patriot ECS");
        cnt_unit( units.Cars.Car, "Patriot cp");
        cnt_unit( units.Cars.Car, "Hawk sr");
		cnt_unit( units.Cars.Car, "Hawk cwar");
		cnt_unit( units.Cars.Car, "Hawk pcp");
        cnt_unit( units.Cars.Car, "Hawk tr");
        cnt_unit( units.Cars.Car, "Hawk ln");
        cnt_unit( units.Cars.Car, "Soldier stinger");
        cnt_unit( units.Cars.Car, "Stinger comm");
        cnt_unit( units.Cars.Car, "M 818");
        cnt_unit( units.Cars.Car, "Leopard-2");
        cnt_unit( units.Cars.Car, "Leopard1A3");
        cnt_unit( units.Cars.Car, "TPZ");
        cnt_unit( units.Cars.Car, "M-109");
		
        cnt_unit( units.Helicopters.Helicopter, "AH-64A");
        cnt_unit( units.Helicopters.Helicopter, "AH-64D");
        cnt_unit( units.Helicopters.Helicopter, "CH-47D");
		cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");
		cnt_unit( units.Helicopters.Helicopter, "UH-1H");


-- BELGIUM
local units  = country:get("BELGIUM").Units

        cnt_unit( units.Planes.Plane, "C-130");
        cnt_unit( units.Planes.Plane, "F-16A MLU");
		cnt_unit( units.Planes.Plane, "P-51D");
			
        cnt_unit( units.Cars.Car, "M-113");
        cnt_unit( units.Cars.Car, "Hawk sr");
		cnt_unit( units.Cars.Car, "Hawk cwar");
		cnt_unit( units.Cars.Car, "Hawk pcp");
        cnt_unit( units.Cars.Car, "Hawk tr");
        cnt_unit( units.Cars.Car, "Hawk ln");
        cnt_unit( units.Cars.Car, "Hummer");
        cnt_unit( units.Cars.Car, "Soldier stinger");
        cnt_unit( units.Cars.Car, "Stinger comm");
        cnt_unit( units.Cars.Car, "M 818");
        cnt_unit( units.Cars.Car, "M-109");
        cnt_unit( units.Cars.Car, "Leopard1A3");
		
		cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");
		cnt_unit( units.Helicopters.Helicopter, "UH-1H");

-- NORWAY
local units  = country:get("NORWAY").Units

		cnt_unit( units.Planes.Plane, "C-130");
		cnt_unit( units.Planes.Plane, "F-16A MLU");
		cnt_unit( units.Planes.Plane, "P-51D");

        cnt_unit( units.Cars.Car, "M-113");
        cnt_unit( units.Cars.Car, "Hawk sr");
		cnt_unit( units.Cars.Car, "Hawk cwar");
		cnt_unit( units.Cars.Car, "Hawk pcp");
        cnt_unit( units.Cars.Car, "Hawk tr");
        cnt_unit( units.Cars.Car, "Hawk ln");
        cnt_unit( units.Cars.Car, "Hummer");
        cnt_unit( units.Cars.Car, "M-109");
        cnt_unit( units.Cars.Car, "MLRS");
		cnt_unit( units.Cars.Car, "MLRS FDDM");
        cnt_unit( units.Cars.Car, "Soldier stinger");
        cnt_unit( units.Cars.Car, "Stinger comm");
        cnt_unit( units.Cars.Car, "M 818");
        cnt_unit( units.Cars.Car, "Leopard-2");
        cnt_unit( units.Cars.Car, "Leopard1A3");
        cnt_unit( units.Cars.Car, "TPZ");
		
		cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");
		cnt_unit( units.Helicopters.Helicopter, "UH-1H");


-- DENMARK
local units = country:get("DENMARK").Units

        cnt_unit( units.Planes.Plane, "C-130");
        cnt_unit( units.Planes.Plane, "F-16A MLU");
		cnt_unit( units.Planes.Plane, "P-51D");
			
        cnt_unit( units.Cars.Car, "M-113");
        cnt_unit( units.Cars.Car, "Hawk sr");
		cnt_unit( units.Cars.Car, "Hawk cwar");
		cnt_unit( units.Cars.Car, "Hawk pcp");
        cnt_unit( units.Cars.Car, "Hawk tr");
        cnt_unit( units.Cars.Car, "Hawk ln");
        cnt_unit( units.Cars.Car, "Hummer");
        cnt_unit( units.Cars.Car, "M-109");
        cnt_unit( units.Cars.Car, "MLRS");
		cnt_unit( units.Cars.Car, "MLRS FDDM");
        cnt_unit( units.Cars.Car, "Soldier stinger");
        cnt_unit( units.Cars.Car, "Stinger comm");
        cnt_unit( units.Cars.Car, "M 818");
        cnt_unit( units.Cars.Car, "Leopard1A3");
        cnt_unit( units.Cars.Car, "Leopard-2");
		
		cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");
		cnt_unit( units.Helicopters.Helicopter, "UH-1H");


-- GEORGIA
local units = country:get("GEORGIA").Units

        cnt_unit( units.Planes.Plane, "Su-25");
        cnt_unit( units.Planes.Plane, "An-26B");
        cnt_unit( units.Planes.Plane, "Su-25T");
		cnt_unit( units.Planes.Plane, "L-39ZA");
		cnt_unit( units.Planes.Plane, "Yak-40");
		cnt_unit( units.Planes.Plane, "P-51D");
			
        cnt_unit( units.Ships.Ship, "ELNYA");
        cnt_unit( units.Ships.Ship, "ALBATROS");
        cnt_unit( units.Ships.Ship, "MOLNIYA");
        cnt_unit( units.Ships.Ship, "Dry-cargo ship-1");
        cnt_unit( units.Ships.Ship, "Dry-cargo ship-2");
        cnt_unit( units.Ships.Ship, "ZWEZDNY");
		
        cnt_unit( units.Cars.Car, "BTR-80");
		cnt_unit( units.Cars.Car, "Strela-1 9P31");
        cnt_unit( units.Cars.Car, "Strela-10M3");
        cnt_unit( units.Cars.Car, "ZSU-23-4 Shilka");
        cnt_unit( units.Cars.Car, "SA-11 Buk SR 9S18M1");
		cnt_unit( units.Cars.Car, "SA-11 Buk CC 9S470M1");
        cnt_unit( units.Cars.Car, "SA-11 Buk LN 9A310M1");
        cnt_unit( units.Cars.Car, "SAU Akatsia");
		cnt_unit( units.Cars.Car, "SAU Msta");
		cnt_unit( units.Cars.Car, "SpGH_Dana");
        cnt_unit( units.Cars.Car, "ATMZ-5");
        cnt_unit( units.Cars.Car, "ATZ-10");
        cnt_unit( units.Cars.Car, "Ural-4320 APA-5D");
        cnt_unit( units.Cars.Car, "BMD-1");
        cnt_unit( units.Cars.Car, "BMP-1");
        cnt_unit( units.Cars.Car, "BMP-2");
        cnt_unit( units.Cars.Car, "BRDM-2");
        cnt_unit( units.Cars.Car, "Grad-URAL");
        cnt_unit( units.Cars.Car, "UAZ-469");
        cnt_unit( units.Cars.Car, "Ural-375");
        cnt_unit( units.Cars.Car, "Ural-375 PBU");
        cnt_unit( units.Cars.Car, "IKARUS Bus");
        cnt_unit( units.Cars.Car, "VAZ Car");
        cnt_unit( units.Cars.Car, "Trolley bus");
        cnt_unit( units.Cars.Car, "KAMAZ Truck");
        cnt_unit( units.Cars.Car, "LAZ Bus");
        cnt_unit( units.Cars.Car, "GAZ-3307");
        cnt_unit( units.Cars.Car, "GAZ-3308");
        cnt_unit( units.Cars.Car, "GAZ-66");
        cnt_unit( units.Cars.Car, "MAZ-6303");
        cnt_unit( units.Cars.Car, "ZIL-4331");
        cnt_unit( units.Cars.Car, "Osa 9A33 ln");
        cnt_unit( units.Cars.Car, "SKP-11");
        cnt_unit( units.Cars.Car, "Ural ATsP-6");
        cnt_unit( units.Cars.Car, "ZiL-131 APA-80");
        cnt_unit( units.Cars.Car, "ZIL-131 KUNG");
        cnt_unit( units.Cars.Car, "ZU-23 Emplacement");
        cnt_unit( units.Cars.Car, "ZU-23 Emplacement Closed");
        cnt_unit( units.Cars.Car, "Ural-375 ZU-23");
        cnt_unit( units.Cars.Car, "Dog Ear radar");
        cnt_unit( units.Cars.Car, "1L13 EWR");
        cnt_unit( units.Cars.Car, "MTLB");
        cnt_unit( units.Cars.Car, "T-72B");
        cnt_unit( units.Cars.Car, "SA-18 Igla manpad");
        cnt_unit( units.Cars.Car, "SA-18 Igla comm");
        cnt_unit( units.Cars.Car, "T-55");
        cnt_unit( units.Cars.Car, "Soldier stinger");
        cnt_unit( units.Cars.Car, "Stinger comm");
        cnt_unit( units.Cars.Car, "Soldier M4 GRG");
        cnt_unit( units.Cars.Car, "Soldier RPG");
        cnt_unit( units.Cars.Car, "5p73 s-125 ln");
        cnt_unit( units.Cars.Car, "snr s-125 tr");
        cnt_unit( units.Cars.Car, "p-19 s-125 sr");
		cnt_unit( units.Cars.Car, "M 818");
		cnt_unit( units.Cars.Car, "2B11 mortar");
		cnt_unit( units.Cars.Car, "Cobra");
		cnt_unit( units.Cars.Car, "KrAZ6322");

        cnt_unit( units.Helicopters.Helicopter, "UH-1H");
        cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");
        cnt_unit( units.Helicopters.Helicopter, "Mi-24V");


-- ISRAEL
local units = country:get("ISRAEL").Units
        cnt_unit( units.Planes.Plane, "F-15C");
        cnt_unit( units.Planes.Plane, "F-15E");
        cnt_unit( units.Planes.Plane, "F-16C bl.52d");
        cnt_unit( units.Planes.Plane, "C-130");
        cnt_unit( units.Planes.Plane, "F-4E");
		cnt_unit( units.Planes.Plane, "P-51D");
			
        cnt_unit( units.Cars.Car, "M-113");
        cnt_unit( units.Cars.Car, "M1097 Avenger");
        cnt_unit( units.Cars.Car, "Patriot str");
        cnt_unit( units.Cars.Car, "Patriot ln");
		cnt_unit( units.Cars.Car, "Patriot AMG");
		cnt_unit( units.Cars.Car, "Patriot EPP");
		cnt_unit( units.Cars.Car, "Patriot ECS");
        cnt_unit( units.Cars.Car, "Patriot cp");
        cnt_unit( units.Cars.Car, "Hawk sr");
		cnt_unit( units.Cars.Car, "Hawk cwar");
		cnt_unit( units.Cars.Car, "Hawk pcp");
        cnt_unit( units.Cars.Car, "Hawk tr");
        cnt_unit( units.Cars.Car, "Hawk ln");
        cnt_unit( units.Cars.Car, "Vulcan");
        cnt_unit( units.Cars.Car, "Hummer");
        cnt_unit( units.Cars.Car, "TPZ");
		cnt_unit( units.Cars.Car, "ZSU-23-4 Shilka");
        cnt_unit( units.Cars.Car, "M-109");
        cnt_unit( units.Cars.Car, "M-60");
        cnt_unit( units.Cars.Car, "M 818");
        cnt_unit( units.Cars.Car, "M48 Chaparral");
        cnt_unit( units.Cars.Car, "MLRS");
		cnt_unit( units.Cars.Car, "MLRS FDDM");
        cnt_unit( units.Cars.Car, "Soldier stinger");
        cnt_unit( units.Cars.Car, "Stinger comm dsr");
        cnt_unit( units.Cars.Car, "ZU-23 Emplacement");
        cnt_unit( units.Cars.Car, "ZU-23 Emplacement Closed");
		cnt_unit( units.Cars.Car, "T-55");
		cnt_unit( units.Cars.Car, "Merkava_Mk4");
		
        cnt_unit( units.Helicopters.Helicopter, "AH-64A");
        cnt_unit( units.Helicopters.Helicopter, "AH-1W");
        cnt_unit( units.Helicopters.Helicopter, "UH-60A");
        cnt_unit( units.Helicopters.Helicopter, "AH-64D");
		cnt_unit( units.Helicopters.Helicopter, "UH-1H");
		cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");


-- INSURGENTS
local units = country:get("INSURGENTS").Units
    units.Helicopters.Helicopter = {}
    units.Planes.Plane = {}
	
		cnt_unit( units.Planes.Plane, "P-51D");

        cnt_unit( units.Ships.Ship, "ELNYA");
        cnt_unit( units.Ships.Ship, "MOLNIYA");
        cnt_unit( units.Ships.Ship, "Dry-cargo ship-1");
        cnt_unit( units.Ships.Ship, "Dry-cargo ship-2");
        cnt_unit( units.Ships.Ship, "ZWEZDNY");
			
        cnt_unit( units.Cars.Car, "BTR-80");
        cnt_unit( units.Cars.Car, "Strela-1 9P31");
        cnt_unit( units.Cars.Car, "Strela-10M3");
        cnt_unit( units.Cars.Car, "ZSU-23-4 Shilka");
        cnt_unit( units.Cars.Car, "SAU Akatsia");
        cnt_unit( units.Cars.Car, "SAU 2-C9");
        cnt_unit( units.Cars.Car, "ATMZ-5");
        cnt_unit( units.Cars.Car, "ATZ-10");
        cnt_unit( units.Cars.Car, "BMD-1");
        cnt_unit( units.Cars.Car, "BMP-1");
        cnt_unit( units.Cars.Car, "BMP-2");
        cnt_unit( units.Cars.Car, "BRDM-2");
        cnt_unit( units.Cars.Car, "Grad-URAL");
        cnt_unit( units.Cars.Car, "UAZ-469");
        cnt_unit( units.Cars.Car, "Ural-375");
        cnt_unit( units.Cars.Car, "Ural-375 PBU");
        cnt_unit( units.Cars.Car, "IKARUS Bus");
        cnt_unit( units.Cars.Car, "VAZ Car");
        cnt_unit( units.Cars.Car, "Trolley bus");
        cnt_unit( units.Cars.Car, "KAMAZ Truck");
        cnt_unit( units.Cars.Car, "LAZ Bus");
        cnt_unit( units.Cars.Car, "GAZ-3307");
        cnt_unit( units.Cars.Car, "GAZ-3308");
        cnt_unit( units.Cars.Car, "GAZ-66");
        cnt_unit( units.Cars.Car, "MAZ-6303");
        cnt_unit( units.Cars.Car, "ZIL-4331");
        cnt_unit( units.Cars.Car, "ZU-23 Insurgent");
        cnt_unit( units.Cars.Car, "ZU-23 Closed Insurgent");
        cnt_unit( units.Cars.Car, "Ural-375 ZU-23 Insurgent");
        cnt_unit( units.Cars.Car, "ZiL-131 APA-80");
        cnt_unit( units.Cars.Car, "ZIL-131 KUNG");
        cnt_unit( units.Cars.Car, "MTLB");
        cnt_unit( units.Cars.Car, "Igla manpad INS");
        cnt_unit( units.Cars.Car, "SA-18 Igla comm");
        cnt_unit( units.Cars.Car, "T-55");
        cnt_unit( units.Cars.Car, "Soldier stinger");
        cnt_unit( units.Cars.Car, "Stinger comm");
        cnt_unit( units.Cars.Car, "Soldier AK");
		cnt_unit( units.Cars.Car, "Infantry AK Ins");
        cnt_unit( units.Cars.Car, "Soldier RPG");
		cnt_unit( units.Cars.Car, "2B11 mortar");
			
        cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");
		cnt_unit( units.Helicopters.Helicopter, "UH-1H");

country:get("INSURGENTS").Units = units

-- ABKHAZIA
local units = country:get("ABKHAZIA").Units
    units.Helicopters.Helicopter = {}
    units.Planes.Plane = {}

		cnt_unit( units.Planes.Plane, "Su-25");
        cnt_unit( units.Planes.Plane, "An-26B");
		cnt_unit( units.Planes.Plane, "L-39ZA");
		cnt_unit( units.Planes.Plane, "P-51D");

        cnt_unit( units.Ships.Ship, "ELNYA");
        cnt_unit( units.Ships.Ship, "MOLNIYA");
        cnt_unit( units.Ships.Ship, "ZWEZDNY");
        cnt_unit( units.Ships.Ship, "Dry-cargo ship-1");
        cnt_unit( units.Ships.Ship, "Dry-cargo ship-2");

        cnt_unit( units.Cars.Car, "BTR-80");
        cnt_unit( units.Cars.Car, "SA-11 Buk SR 9S18M1");
		cnt_unit( units.Cars.Car, "SA-11 Buk CC 9S470M1");
        cnt_unit( units.Cars.Car, "SA-11 Buk LN 9A310M1");
        cnt_unit( units.Cars.Car, "Kub 1S91 str");
        cnt_unit( units.Cars.Car, "Kub 2P25 ln");
        cnt_unit( units.Cars.Car, "Osa 9A33 ln");
        cnt_unit( units.Cars.Car, "Strela-10M3");
        cnt_unit( units.Cars.Car, "Dog Ear radar");
        cnt_unit( units.Cars.Car, "ZSU-23-4 Shilka");
        cnt_unit( units.Cars.Car, "SAU Akatsia");
        cnt_unit( units.Cars.Car, "SAU 2-C9");
        cnt_unit( units.Cars.Car, "ATMZ-5");
        cnt_unit( units.Cars.Car, "ATZ-10");
        cnt_unit( units.Cars.Car, "BMD-1");
        cnt_unit( units.Cars.Car, "BMP-1");
        cnt_unit( units.Cars.Car, "BMP-2");
        cnt_unit( units.Cars.Car, "BRDM-2");
        cnt_unit( units.Cars.Car, "Grad-URAL");
        cnt_unit( units.Cars.Car, "UAZ-469");
        cnt_unit( units.Cars.Car, "Ural-375");
        cnt_unit( units.Cars.Car, "Ural-375 PBU");
        cnt_unit( units.Cars.Car, "IKARUS Bus");
        cnt_unit( units.Cars.Car, "VAZ Car");
        cnt_unit( units.Cars.Car, "Trolley bus");
        cnt_unit( units.Cars.Car, "KAMAZ Truck");
        cnt_unit( units.Cars.Car, "LAZ Bus");
        cnt_unit( units.Cars.Car, "SAU Gvozdika");
        cnt_unit( units.Cars.Car, "BTR_D");
        cnt_unit( units.Cars.Car, "GAZ-3307");
        cnt_unit( units.Cars.Car, "GAZ-3308");
        cnt_unit( units.Cars.Car, "GAZ-66");
        cnt_unit( units.Cars.Car, "ZIL-4331");
        cnt_unit( units.Cars.Car, "MAZ-6303");
        cnt_unit( units.Cars.Car, "SKP-11");
        cnt_unit( units.Cars.Car, "Ural-4320T");
        cnt_unit( units.Cars.Car, "Ural ATsP-6");
        cnt_unit( units.Cars.Car, "ZiL-131 APA-80");
        cnt_unit( units.Cars.Car, "ZIL-131 KUNG");
        cnt_unit( units.Cars.Car, "Ural-4320 APA-5D");
        cnt_unit( units.Cars.Car, "ZU-23 Emplacement");
        cnt_unit( units.Cars.Car, "ZU-23 Emplacement Closed");
        cnt_unit( units.Cars.Car, "Ural-375 ZU-23");
        cnt_unit( units.Cars.Car, "2S6 Tunguska");
        cnt_unit( units.Cars.Car, "Strela-1 9P31");
        cnt_unit( units.Cars.Car, "MTLB");
        cnt_unit( units.Cars.Car, "T-72B");
        cnt_unit( units.Cars.Car, "SA-18 Igla manpad");
        cnt_unit( units.Cars.Car, "SA-18 Igla comm");
        cnt_unit( units.Cars.Car, "T-55");
		cnt_unit( units.Cars.Car, "2B11 mortar");
		
        cnt_unit( units.Helicopters.Helicopter, "Mi-24V");
        cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");
		cnt_unit( units.Helicopters.Helicopter, "Ka-50");
		cnt_unit( units.Helicopters.Helicopter, "UH-1H");


-- SOUTH OSSETIA
local   units = country:get("SOUTH_OSETIA").Units
		units.Helicopters.Helicopter = {}
		units.Planes.Plane = {}
		units.Ships.Ship = {}
        cnt_unit( units.Cars.Car, "BTR-80");
        cnt_unit( units.Cars.Car, "Osa 9A33 ln");
        cnt_unit( units.Cars.Car, "Strela-10M3");
        cnt_unit( units.Cars.Car, "ZSU-23-4 Shilka");
        cnt_unit( units.Cars.Car, "SAU Akatsia");
        cnt_unit( units.Cars.Car, "SAU 2-C9");
        cnt_unit( units.Cars.Car, "ATMZ-5");
        cnt_unit( units.Cars.Car, "ATZ-10");
        cnt_unit( units.Cars.Car, "BMD-1");
        cnt_unit( units.Cars.Car, "BMP-1");
        cnt_unit( units.Cars.Car, "BMP-2");
        cnt_unit( units.Cars.Car, "BRDM-2");
        cnt_unit( units.Cars.Car, "Grad-URAL");
        cnt_unit( units.Cars.Car, "UAZ-469");
        cnt_unit( units.Cars.Car, "Ural-375");
        cnt_unit( units.Cars.Car, "Ural-375 PBU");
        cnt_unit( units.Cars.Car, "IKARUS Bus");
        cnt_unit( units.Cars.Car, "VAZ Car");
        cnt_unit( units.Cars.Car, "KAMAZ Truck");
        cnt_unit( units.Cars.Car, "LAZ Bus");
        cnt_unit( units.Cars.Car, "SAU Gvozdika");
        cnt_unit( units.Cars.Car, "BTR_D");
        cnt_unit( units.Cars.Car, "GAZ-3307");
        cnt_unit( units.Cars.Car, "GAZ-3308");
        cnt_unit( units.Cars.Car, "GAZ-66");
        cnt_unit( units.Cars.Car, "ZIL-4331");
        cnt_unit( units.Cars.Car, "MAZ-6303");
        cnt_unit( units.Cars.Car, "SKP-11");
        cnt_unit( units.Cars.Car, "Ural-4320T");
        cnt_unit( units.Cars.Car, "Ural ATsP-6");
        cnt_unit( units.Cars.Car, "ZiL-131 APA-80");
        cnt_unit( units.Cars.Car, "ZIL-131 KUNG");
        cnt_unit( units.Cars.Car, "Ural-4320 APA-5D");
        cnt_unit( units.Cars.Car, "ZU-23 Emplacement");
        cnt_unit( units.Cars.Car, "ZU-23 Emplacement Closed");
        cnt_unit( units.Cars.Car, "Ural-375 ZU-23");
        cnt_unit( units.Cars.Car, "2S6 Tunguska");
        cnt_unit( units.Cars.Car, "Strela-1 9P31");
        cnt_unit( units.Cars.Car, "MTLB");
        cnt_unit( units.Cars.Car, "T-72B");
        cnt_unit( units.Cars.Car, "SA-18 Igla manpad");
        cnt_unit( units.Cars.Car, "SA-18 Igla comm");
        cnt_unit( units.Cars.Car, "T-55");
		cnt_unit( units.Cars.Car, "2B11 mortar");

        cnt_unit( units.Helicopters.Helicopter, "Mi-24V");
        cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");
		cnt_unit( units.Helicopters.Helicopter, "Ka-50");
		cnt_unit( units.Helicopters.Helicopter, "UH-1H");
		
country:get("SOUTH_OSETIA").Units = units			

-- ITALY
local units = country:get("ITALY").Units
        cnt_unit( units.Planes.Plane, "C-130");
        cnt_unit( units.Planes.Plane, "F-16A MLU");
		cnt_unit( units.Planes.Plane, "P-51D");
		cnt_unit( units.Planes.Plane, "Tornado IDS");
        cnt_unit( units.Cars.Car, "M-113");
		cnt_unit( units.Cars.Car, "AAV7")
        cnt_unit( units.Cars.Car, "Hawk sr");
		cnt_unit( units.Cars.Car, "Hawk cwar");
		cnt_unit( units.Cars.Car, "Hawk pcp");
        cnt_unit( units.Cars.Car, "Hawk tr");
        cnt_unit( units.Cars.Car, "Hawk ln");
        cnt_unit( units.Cars.Car, "Hummer");
        cnt_unit( units.Cars.Car, "M-109");
        cnt_unit( units.Cars.Car, "MLRS");
		cnt_unit( units.Cars.Car, "MLRS FDDM");
        cnt_unit( units.Cars.Car, "Soldier stinger");
        cnt_unit( units.Cars.Car, "Stinger comm");
        cnt_unit( units.Cars.Car, "M 818");
        cnt_unit( units.Cars.Car, "Leopard1A3");
		cnt_unit( units.Cars.Car, "M978 HEMTT Tanker");
		cnt_unit( units.Cars.Car, "HEMTT TFFT");
		cnt_unit( units.Cars.Car, "2B11 mortar");
		cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");
		cnt_unit( units.Helicopters.Helicopter, "UH-1H");

-- Australia
local units = country:get("AUSTRALIA").Units
	cnt_unit( units.Planes.Plane, "C-130");
	cnt_unit( units.Planes.Plane, "P-51D");
	cnt_unit( units.Planes.Plane, "F/A-18C");

	cnt_unit( units.Cars.Car, "M-1 Abrams");
    cnt_unit( units.Cars.Car, "Leopard1A3");
	cnt_unit( units.Cars.Car, "LAV-25");
	cnt_unit( units.Cars.Car, "Hummer");
	cnt_unit( units.Cars.Car, "M-113");

	cnt_unit( units.Helicopters.Helicopter, "CH-47D");
	cnt_unit( units.Helicopters.Helicopter, "UH-1H");
	cnt_unit( units.Helicopters.Helicopter, "UH-60A");


-- Switzerland
local units = country:get("SWITZERLAND").Units
	cnt_unit( units.Planes.Plane, "F/A-18C");
--	cnt_unit( units.Planes.Plane, "F-5E");
	cnt_unit( units.Planes.Plane, "P-51D");
	cnt_unit( units.Cars.Car, "Leopard-2");
	cnt_unit( units.Cars.Car, "M-109");
	cnt_unit( units.Cars.Car, "M-113");
	cnt_unit( units.Cars.Car, "Soldier stinger");
	cnt_unit( units.Cars.Car, "Stinger comm");
	
-- Algeria
local units = country:get("ALGERIA").Units
cnt_unit( units.Planes.Plane, "MiG-21Bis");
cnt_unit( units.Planes.Plane, "MiG-23MLD");
cnt_unit( units.Planes.Plane, "MiG-25RBT");
cnt_unit( units.Planes.Plane, "MiG-25PD");
cnt_unit( units.Planes.Plane, "MiG-29S");
cnt_unit( units.Planes.Plane, "MiG-27K");
cnt_unit( units.Planes.Plane, "Su-24M");
cnt_unit( units.Planes.Plane, "Su-24MR");
cnt_unit( units.Planes.Plane, "Su-25");
cnt_unit( units.Planes.Plane, "Su-25T");
cnt_unit( units.Planes.Plane, "Su-27");
cnt_unit( units.Planes.Plane, "Su-30");
cnt_unit( units.Planes.Plane, "Su-30MK");
cnt_unit( units.Planes.Plane, "Su-33");
cnt_unit( units.Planes.Plane, "A-10A");
cnt_unit( units.Planes.Plane, "L-39ZA");
cnt_unit( units.Planes.Plane, "P-51D");
cnt_unit( units.Planes.Plane, "IL-78M");
cnt_unit( units.Planes.Plane, "IL-76MD");
cnt_unit( units.Planes.Plane, "C-130");
cnt_unit( units.Planes.Plane, "KC-135");
cnt_unit( units.Planes.Plane, "Yak-40");


cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");
cnt_unit( units.Helicopters.Helicopter, "Mi-24V");	
cnt_unit( units.Helicopters.Helicopter, "Mi-26");
cnt_unit( units.Helicopters.Helicopter, "Mi-28N");
cnt_unit( units.Helicopters.Helicopter, "Ka-27");
cnt_unit( units.Helicopters.Helicopter, "Ka-50");
cnt_unit( units.Helicopters.Helicopter, "UH-1H");
			
cnt_unit( units.Ships.Ship, "ELNYA");
cnt_unit( units.Ships.Ship, "ALBATROS");
cnt_unit( units.Ships.Ship, "MOLNIYA");
cnt_unit( units.Ships.Ship, "KILO");
cnt_unit( units.Ships.Ship, "ZWEZDNY");
cnt_unit( units.Ships.Ship, "Dry-cargo ship-1");
cnt_unit( units.Ships.Ship, "Dry-cargo ship-2");
cnt_unit( units.Ships.Ship, "REZKY");

cnt_unit( units.Cars.Car, "T-55");
cnt_unit( units.Cars.Car, "T-72B");
cnt_unit( units.Cars.Car, "T-90");
cnt_unit( units.Cars.Car, "BMP-1");
cnt_unit( units.Cars.Car, "BMP-2");
cnt_unit( units.Cars.Car, "MTLB");
cnt_unit( units.Cars.Car, "TPZ");
cnt_unit( units.Cars.Car, "BTR-80");
cnt_unit( units.Cars.Car, "BRDM-2");
cnt_unit( units.Cars.Car, "UAZ-469");
cnt_unit( units.Cars.Car, "Hummer");
cnt_unit( units.Cars.Car, "M 818");
cnt_unit( units.Cars.Car, "Tigr_233036");
cnt_unit( units.Cars.Car, "SAU Akatsia");
cnt_unit( units.Cars.Car, "SAU Gvozdika");
cnt_unit( units.Cars.Car, "Smerch");
cnt_unit( units.Cars.Car, "Grad-URAL");
cnt_unit( units.Cars.Car, "Boman");
cnt_unit( units.Cars.Car, "2B11 mortar");	
cnt_unit( units.Cars.Car, "1L13 EWR");
cnt_unit( units.Cars.Car, "55G6 EWR");
cnt_unit( units.Cars.Car, "Dog Ear radar");
cnt_unit( units.Cars.Car, "S-300PS 40B6M tr");
cnt_unit( units.Cars.Car, "S-300PS 40B6MD sr");
cnt_unit( units.Cars.Car, "S-300PS 64H6E sr");
cnt_unit( units.Cars.Car, "S-300PS 5P85C ln");
cnt_unit( units.Cars.Car, "S-300PS 5P85D ln");
cnt_unit( units.Cars.Car, "S-300PS 54K6 cp");
cnt_unit( units.Cars.Car, "SA-11 Buk SR 9S18M1");
cnt_unit( units.Cars.Car, "SA-11 Buk CC 9S470M1");
cnt_unit( units.Cars.Car, "SA-11 Buk LN 9A310M1");
cnt_unit( units.Cars.Car, "5p73 s-125 ln");
cnt_unit( units.Cars.Car, "snr s-125 tr");
cnt_unit( units.Cars.Car, "p-19 s-125 sr");
cnt_unit( units.Cars.Car, "Kub 1S91 str");
cnt_unit( units.Cars.Car, "Kub 2P25 ln");
cnt_unit( units.Cars.Car, "SA-18 Igla-S manpad");
cnt_unit( units.Cars.Car, "SA-18 Igla-S comm");
cnt_unit( units.Cars.Car, "Osa 9A33 ln");
cnt_unit( units.Cars.Car, "Strela-10M3");
cnt_unit( units.Cars.Car, "Strela-1 9P31");
cnt_unit( units.Cars.Car, "ZSU-23-4 Shilka");
cnt_unit( units.Cars.Car, "ZU-23 Emplacement");
cnt_unit( units.Cars.Car, "ZU-23 Emplacement Closed");
cnt_unit( units.Cars.Car, "IKARUS Bus");
cnt_unit( units.Cars.Car, "VAZ Car");
cnt_unit( units.Cars.Car, "Trolley bus");
cnt_unit( units.Cars.Car, "KAMAZ Truck");
cnt_unit( units.Cars.Car, "LAZ Bus");
cnt_unit( units.Cars.Car, "MAZ-6303");
cnt_unit( units.Cars.Car, "SKP-11");
cnt_unit( units.Cars.Car, "GAZ-3307");
cnt_unit( units.Cars.Car, "GAZ-3308");
cnt_unit( units.Cars.Car, "GAZ-66");
cnt_unit( units.Cars.Car, "ZiL-131 APA-80");
cnt_unit( units.Cars.Car, "ZIL-131 KUNG");
cnt_unit( units.Cars.Car, "ZIL-4331");
cnt_unit( units.Cars.Car, "Ural-4320T");
cnt_unit( units.Cars.Car, "Ural ATsP-6");
cnt_unit( units.Cars.Car, "Ural-4320 APA-5D");
cnt_unit( units.Cars.Car, "Ural-375");
cnt_unit( units.Cars.Car, "Ural-375 PBU");
cnt_unit( units.Cars.Car, "Ural-375 ZU-23");
cnt_unit( units.Cars.Car, "ATMZ-5");
cnt_unit( units.Cars.Car, "ATZ-10");
cnt_unit( units.Cars.Car, "Infantry AK");
cnt_unit( units.Cars.Car, "Paratrooper RPG-16");
cnt_unit( units.Cars.Car, "Paratrooper AKS-74");

	
-- CHINA assets
local units = country:get("CHINA").Units
 cnt_unit( units.Planes.Plane, "Su-27");
 cnt_unit( units.Planes.Plane, "IL-76MD");
 cnt_unit( units.Planes.Plane, "IL-78M");
 cnt_unit( units.Planes.Plane, "An-26B");
 cnt_unit( units.Planes.Plane, "An-30M");
 
 cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");
 cnt_unit( units.Helicopters.Helicopter, "Mi-26");
 cnt_unit( units.Helicopters.Helicopter, "Ka-27");
 
 cnt_unit( units.Cars.Car, "Tor 9A331");
 cnt_unit( units.Cars.Car, "S-300PS 40B6M tr");
 cnt_unit( units.Cars.Car, "S-300PS 40B6MD sr");
 cnt_unit( units.Cars.Car, "S-300PS 64H6E sr");
 cnt_unit( units.Cars.Car, "S-300PS 5P85C ln");
 cnt_unit( units.Cars.Car, "S-300PS 5P85D ln");
 cnt_unit( units.Cars.Car, "S-300PS 54K6 cp");
 

local units = country:get("AUSTRIA").Units

local units = country:get("BELARUS").Units
	cnt_unit( units.Planes.Plane, "Su-25");
	cnt_unit( units.Planes.Plane, "MiG-29S");
	cnt_unit( units.Planes.Plane, "MiG-29A");
	cnt_unit( units.Planes.Plane, "Su-27");
	cnt_unit( units.Planes.Plane, "Yak-40");
	cnt_unit( units.Planes.Plane, "An-26B");
	cnt_unit( units.Planes.Plane, "An-30M");
	cnt_unit( units.Planes.Plane, "Su-24M");
	cnt_unit( units.Planes.Plane, "Su-24MR");
	cnt_unit( units.Planes.Plane, "IL-76MD");
	cnt_unit( units.Planes.Plane, "L-39C");

	cnt_unit( units.Cars.Car, "BTR-80");
	cnt_unit( units.Cars.Car, "1L13 EWR");
	cnt_unit( units.Cars.Car, "55G6 EWR");
	cnt_unit( units.Cars.Car, "S-300PS 40B6M tr");
	cnt_unit( units.Cars.Car, "S-300PS 40B6MD sr");
	cnt_unit( units.Cars.Car, "S-300PS 64H6E sr");
	cnt_unit( units.Cars.Car, "S-300PS 5P85C ln");
	cnt_unit( units.Cars.Car, "S-300PS 5P85D ln");
	cnt_unit( units.Cars.Car, "SA-11 Buk SR 9S18M1");
	cnt_unit( units.Cars.Car, "SA-11 Buk CC 9S470M1");
	cnt_unit( units.Cars.Car, "SA-11 Buk LN 9A310M1");
	cnt_unit( units.Cars.Car, "Kub 1S91 str");
	cnt_unit( units.Cars.Car, "Kub 2P25 ln");
	cnt_unit( units.Cars.Car, "Osa 9A33 ln");
	cnt_unit( units.Cars.Car, "Strela-1 9P31");
	cnt_unit( units.Cars.Car, "Strela-10M3");
	cnt_unit( units.Cars.Car, "Dog Ear radar");
	cnt_unit( units.Cars.Car, "Tor 9A331");
	cnt_unit( units.Cars.Car, "2S6 Tunguska");
	cnt_unit( units.Cars.Car, "ZSU-23-4 Shilka");
	cnt_unit( units.Cars.Car, "SAU Msta");
	cnt_unit( units.Cars.Car, "SAU Akatsia");
	cnt_unit( units.Cars.Car, "SAU 2-C9");
	cnt_unit( units.Cars.Car, "ATMZ-5");
	cnt_unit( units.Cars.Car, "ATZ-10");
	cnt_unit( units.Cars.Car, "BMD-1");
	cnt_unit( units.Cars.Car, "BMP-1");
	cnt_unit( units.Cars.Car, "BMP-2");
	cnt_unit( units.Cars.Car, "BRDM-2");
	cnt_unit( units.Cars.Car, "Grad-URAL");
	cnt_unit( units.Cars.Car, "Uragan_BM-27");
	cnt_unit( units.Cars.Car, "Smerch");
	cnt_unit( units.Cars.Car, "UAZ-469");
	cnt_unit( units.Cars.Car, "Ural-375");
	cnt_unit( units.Cars.Car, "Ural-375 PBU");
	cnt_unit( units.Cars.Car, "IKARUS Bus");
	cnt_unit( units.Cars.Car, "VAZ Car");
	cnt_unit( units.Cars.Car, "Trolley bus");
	cnt_unit( units.Cars.Car, "KAMAZ Truck");
	cnt_unit( units.Cars.Car, "LAZ Bus");
	cnt_unit( units.Cars.Car, "SAU Gvozdika");
	cnt_unit( units.Cars.Car, "BMP-3");
	cnt_unit( units.Cars.Car, "BTR_D");
	cnt_unit( units.Cars.Car, "S-300PS 54K6 cp");
	cnt_unit( units.Cars.Car, "GAZ-3307");
	cnt_unit( units.Cars.Car, "GAZ-66");
	cnt_unit( units.Cars.Car, "GAZ-3308");
	cnt_unit( units.Cars.Car, "MAZ-6303");
	cnt_unit( units.Cars.Car, "ZIL-4331");
	cnt_unit( units.Cars.Car, "SKP-11");
	cnt_unit( units.Cars.Car, "Ural-4320T");
	cnt_unit( units.Cars.Car, "Ural-4320-31");
	cnt_unit( units.Cars.Car, "Ural ATsP-6");
	cnt_unit( units.Cars.Car, "ZiL-131 APA-80");
	cnt_unit( units.Cars.Car, "ZIL-131 KUNG");
	cnt_unit( units.Cars.Car, "Ural-4320 APA-5D");
	cnt_unit( units.Cars.Car, "ZU-23 Emplacement");
	cnt_unit( units.Cars.Car, "ZU-23 Emplacement Closed");
	cnt_unit( units.Cars.Car, "Ural-375 ZU-23");
	cnt_unit( units.Cars.Car, "MTLB");
	cnt_unit( units.Cars.Car, "T-72B");
	cnt_unit( units.Cars.Car, "SA-18 Igla-S manpad");
	cnt_unit( units.Cars.Car, "SA-18 Igla-S comm");
	cnt_unit( units.Cars.Car, "T-55");
	cnt_unit( units.Cars.Car, "Paratrooper RPG-16");
	cnt_unit( units.Cars.Car, "Paratrooper AKS-74");
	cnt_unit( units.Cars.Car, "Boman");
	cnt_unit( units.Cars.Car, "2B11 mortar");
	cnt_unit( units.Cars.Car, "5p73 s-125 ln");
	cnt_unit( units.Cars.Car, "snr s-125 tr");
	cnt_unit( units.Cars.Car, "p-19 s-125 sr");
    cnt_unit( units.Cars.Car, "Infantry AK");

	cnt_unit( units.Helicopters.Helicopter, "Mi-24V");
	cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");
	cnt_unit( units.Helicopters.Helicopter, "Mi-26");

local units = country:get("BULGARIA").Units
	cnt_unit( units.Planes.Plane, "L-39ZA");
local units = country:get("CHEZH_REPUBLIC").Units
	cnt_unit( units.Planes.Plane, "L-39ZA");
	cnt_unit( units.Cars.Car, "SpGH_Dana");

local units = country:get("CROATIA").Units
local units = country:get("EGYPT").Units
local units = country:get("FINLAND").Units
local units = country:get("GREECE").Units
local units = country:get("HUNGARY").Units
	cnt_unit( units.Planes.Plane, "L-39ZA");
local units = country:get("INDIA").Units
local units = country:get("IRAN").Units
local units = country:get("IRAQ").Units
local units = country:get("JAPAN").Units

--KAZAKHSTAN
local units = country:get("KAZAKHSTAN").Units
	cnt_unit( units.Planes.Plane, "Su-25");
	cnt_unit( units.Planes.Plane, "MiG-29S");
	cnt_unit( units.Planes.Plane, "MiG-29A");
	cnt_unit( units.Planes.Plane, "Su-27");
	cnt_unit( units.Planes.Plane, "MiG-31");
	cnt_unit( units.Planes.Plane, "Su-30");
	cnt_unit( units.Planes.Plane, "Yak-40");
	cnt_unit( units.Planes.Plane, "An-26B");
	cnt_unit( units.Planes.Plane, "An-30M");
	cnt_unit( units.Planes.Plane, "Su-24M");
	cnt_unit( units.Planes.Plane, "Su-24MR");
	cnt_unit( units.Planes.Plane, "IL-76MD");
	cnt_unit( units.Planes.Plane, "L-39C");

	cnt_unit( units.Cars.Car, "BTR-80");
	cnt_unit( units.Cars.Car, "1L13 EWR");
	cnt_unit( units.Cars.Car, "55G6 EWR");
	cnt_unit( units.Cars.Car, "S-300PS 40B6M tr");
	cnt_unit( units.Cars.Car, "S-300PS 40B6MD sr");
	cnt_unit( units.Cars.Car, "S-300PS 64H6E sr");
	cnt_unit( units.Cars.Car, "S-300PS 5P85C ln");
	cnt_unit( units.Cars.Car, "S-300PS 5P85D ln");
	cnt_unit( units.Cars.Car, "SA-11 Buk SR 9S18M1");
	cnt_unit( units.Cars.Car, "SA-11 Buk CC 9S470M1");
	cnt_unit( units.Cars.Car, "SA-11 Buk LN 9A310M1");
	cnt_unit( units.Cars.Car, "Kub 1S91 str");
	cnt_unit( units.Cars.Car, "Kub 2P25 ln");
	cnt_unit( units.Cars.Car, "Osa 9A33 ln");
	cnt_unit( units.Cars.Car, "Strela-1 9P31");
	cnt_unit( units.Cars.Car, "Strela-10M3");
	cnt_unit( units.Cars.Car, "Dog Ear radar");
	cnt_unit( units.Cars.Car, "Tor 9A331");
	cnt_unit( units.Cars.Car, "2S6 Tunguska");
	cnt_unit( units.Cars.Car, "ZSU-23-4 Shilka");
	cnt_unit( units.Cars.Car, "SAU Msta");
	cnt_unit( units.Cars.Car, "SAU Akatsia");
	cnt_unit( units.Cars.Car, "SAU 2-C9");
	cnt_unit( units.Cars.Car, "ATMZ-5");
	cnt_unit( units.Cars.Car, "ATZ-10");
	cnt_unit( units.Cars.Car, "BMD-1");
	cnt_unit( units.Cars.Car, "BMP-1");
	cnt_unit( units.Cars.Car, "BMP-2");
	cnt_unit( units.Cars.Car, "BRDM-2");
	cnt_unit( units.Cars.Car, "Grad-URAL");
	cnt_unit( units.Cars.Car, "Uragan_BM-27");
	cnt_unit( units.Cars.Car, "Smerch");
	cnt_unit( units.Cars.Car, "T-80UD");
	cnt_unit( units.Cars.Car, "UAZ-469");
	cnt_unit( units.Cars.Car, "Ural-375");
	cnt_unit( units.Cars.Car, "Ural-375 PBU");
	cnt_unit( units.Cars.Car, "IKARUS Bus");
	cnt_unit( units.Cars.Car, "VAZ Car");
	cnt_unit( units.Cars.Car, "Trolley bus");
	cnt_unit( units.Cars.Car, "KAMAZ Truck");
	cnt_unit( units.Cars.Car, "LAZ Bus");
	cnt_unit( units.Cars.Car, "SAU Gvozdika");
	cnt_unit( units.Cars.Car, "BMP-3");
	cnt_unit( units.Cars.Car, "BTR_D");
	cnt_unit( units.Cars.Car, "S-300PS 54K6 cp");
	cnt_unit( units.Cars.Car, "GAZ-3307");
	cnt_unit( units.Cars.Car, "GAZ-66");
	cnt_unit( units.Cars.Car, "GAZ-3308");
	cnt_unit( units.Cars.Car, "MAZ-6303");
	cnt_unit( units.Cars.Car, "ZIL-4331");
	cnt_unit( units.Cars.Car, "SKP-11");
	cnt_unit( units.Cars.Car, "Ural-4320T");
	cnt_unit( units.Cars.Car, "Ural-4320-31");
	cnt_unit( units.Cars.Car, "Ural ATsP-6");
	cnt_unit( units.Cars.Car, "ZiL-131 APA-80");
	cnt_unit( units.Cars.Car, "ZIL-131 KUNG");
	cnt_unit( units.Cars.Car, "Ural-4320 APA-5D");
	cnt_unit( units.Cars.Car, "ZU-23 Emplacement");
	cnt_unit( units.Cars.Car, "ZU-23 Emplacement Closed");
	cnt_unit( units.Cars.Car, "Ural-375 ZU-23");
	cnt_unit( units.Cars.Car, "MTLB");
	cnt_unit( units.Cars.Car, "T-72B");
	cnt_unit( units.Cars.Car, "SA-18 Igla-S manpad");
	cnt_unit( units.Cars.Car, "SA-18 Igla-S comm");
	cnt_unit( units.Cars.Car, "T-55");
	cnt_unit( units.Cars.Car, "Paratrooper RPG-16");
	cnt_unit( units.Cars.Car, "Paratrooper AKS-74");
	cnt_unit( units.Cars.Car, "Boman");
	cnt_unit( units.Cars.Car, "2B11 mortar");
	cnt_unit( units.Cars.Car, "5p73 s-125 ln");
	cnt_unit( units.Cars.Car, "snr s-125 tr");
	cnt_unit( units.Cars.Car, "p-19 s-125 sr");
    cnt_unit( units.Cars.Car, "Infantry AK");

	cnt_unit( units.Helicopters.Helicopter, "Mi-24V");
	cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");
	cnt_unit( units.Helicopters.Helicopter, "Mi-26");
	cnt_unit( units.Helicopters.Helicopter, "UH-1H");

local units = country:get("NORTH_KOREA").Units
local units = country:get("PAKISTAN").Units
local units = country:get("POLAND").Units
	cnt_unit( units.Cars.Car, "SpGH_Dana");
	cnt_unit( units.Planes.Plane, "F-16C bl.50");
	cnt_unit( units.Planes.Plane, "MiG-29A");
	cnt_unit( units.Planes.Plane, "Su-17M4");
        
local units = country:get("ROMANIA").Units
local units = country:get("SAUDI_ARABIA").Units
local units = country:get("SERBIA").Units
local units = country:get("SLOVAKIA").Units
	cnt_unit( units.Planes.Plane, "L-39ZA");
	cnt_unit( units.Cars.Car, "SpGH_Dana");
local units = country:get("SOUTH_KOREA").Units
local units = country:get("SWEDEN").Units

local units = country:get("SYRIA").Units
	cnt_unit( units.Planes.Plane, "L-39ZA");
local units = country:get("LIBYA").Units
	cnt_unit( units.Cars.Car, "SpGH_Dana");

local units = country:get("KUWAIT").Units
local units = country:get("QATAR").Units
local units = country:get("OMAN").Units
local units = country:get("UNITED_ARAB_EMIRATES").Units	
local units =  country:get("GORGAS").Units
  cnt_unit( units.Planes.Plane, "Su-33");
  cnt_unit( units.Planes.Plane, "Su-25");
  cnt_unit( units.Planes.Plane, "MiG-29S");
  cnt_unit( units.Planes.Plane, "MiG-29A");
  cnt_unit( units.Planes.Plane, "Su-27");
  cnt_unit( units.Planes.Plane, "Su-25TM");
  cnt_unit( units.Planes.Plane, "Su-25T");
  cnt_unit( units.Planes.Plane, "MiG-31");
  cnt_unit( units.Planes.Plane, "MiG-27K");
  cnt_unit( units.Planes.Plane, "Su-30");
  cnt_unit( units.Planes.Plane, "Tu-160");
  cnt_unit( units.Planes.Plane, "Su-34");
  cnt_unit( units.Planes.Plane, "Tu-95MS");
  cnt_unit( units.Planes.Plane, "Tu-142");
  cnt_unit( units.Planes.Plane, "MiG-25PD");
  cnt_unit( units.Planes.Plane, "Tu-22M3");
  cnt_unit( units.Planes.Plane, "A-50");
  cnt_unit( units.Planes.Plane, "Yak-40");
  cnt_unit( units.Planes.Plane, "An-26B");
  cnt_unit( units.Planes.Plane, "An-30M");
  cnt_unit( units.Planes.Plane, "Su-17M4");
  cnt_unit( units.Planes.Plane, "MiG-23MLD");
  cnt_unit( units.Planes.Plane, "MiG-25RBT");
  cnt_unit( units.Planes.Plane, "Su-24M");
  cnt_unit( units.Planes.Plane, "Su-24MR");
  cnt_unit( units.Planes.Plane, "IL-78M");
  cnt_unit( units.Planes.Plane, "IL-76MD");
  cnt_unit( units.Planes.Plane, "L-39ZA");
  cnt_unit( units.Planes.Plane, "P-51D");
  cnt_unit( units.Planes.Plane, "TF-51D");
  
  cnt_unit( units.Planes.Plane, "RQ-1A Predator");
  cnt_unit( units.Planes.Plane, "MQ-9 Reaper");

    cnt_unit( units.Ships.Ship, "ELNYA");
    cnt_unit( units.Ships.Ship, "ALBATROS");
    cnt_unit( units.Ships.Ship, "MOLNIYA");
    cnt_unit( units.Ships.Ship, "Dry-cargo ship-1");
    cnt_unit( units.Ships.Ship, "Dry-cargo ship-2");
    cnt_unit( units.Ships.Ship, "ZWEZDNY");

  cnt_unit( units.Cars.Car, "BTR-80");
  cnt_unit( units.Cars.Car, "1L13 EWR");
  cnt_unit( units.Cars.Car, "55G6 EWR");
  cnt_unit( units.Cars.Car, "S-300PS 40B6M tr");
  cnt_unit( units.Cars.Car, "S-300PS 40B6MD sr");
  cnt_unit( units.Cars.Car, "S-300PS 64H6E sr");
  cnt_unit( units.Cars.Car, "S-300PS 5P85C ln");
  cnt_unit( units.Cars.Car, "S-300PS 5P85D ln");
  cnt_unit( units.Cars.Car, "SA-11 Buk SR 9S18M1");
  cnt_unit( units.Cars.Car, "SA-11 Buk CC 9S470M1");
  cnt_unit( units.Cars.Car, "SA-11 Buk LN 9A310M1");
  cnt_unit( units.Cars.Car, "Kub 1S91 str");
  cnt_unit( units.Cars.Car, "Kub 2P25 ln");
  cnt_unit( units.Cars.Car, "Osa 9A33 ln");
  cnt_unit( units.Cars.Car, "Strela-1 9P31");
  cnt_unit( units.Cars.Car, "Strela-10M3");
  cnt_unit( units.Cars.Car, "Dog Ear radar");
  cnt_unit( units.Cars.Car, "Tor 9A331");
  cnt_unit( units.Cars.Car, "2S6 Tunguska");
  cnt_unit( units.Cars.Car, "ZSU-23-4 Shilka");
  cnt_unit( units.Cars.Car, "SAU Msta");
  cnt_unit( units.Cars.Car, "SAU Akatsia");
  cnt_unit( units.Cars.Car, "SAU 2-C9");
  cnt_unit( units.Cars.Car, "ATMZ-5");
  cnt_unit( units.Cars.Car, "ATZ-10");
  cnt_unit( units.Cars.Car, "BMD-1");
  cnt_unit( units.Cars.Car, "BMP-1");
  cnt_unit( units.Cars.Car, "BMP-2");
  cnt_unit( units.Cars.Car, "BRDM-2");
  cnt_unit( units.Cars.Car, "Grad-URAL");
  cnt_unit( units.Cars.Car, "Uragan_BM-27");
  cnt_unit( units.Cars.Car, "Smerch");
  cnt_unit( units.Cars.Car, "T-80UD");
  cnt_unit( units.Cars.Car, "UAZ-469");
  cnt_unit( units.Cars.Car, "Ural-375");
  cnt_unit( units.Cars.Car, "Ural-375 PBU");
  cnt_unit( units.Cars.Car, "IKARUS Bus");
  cnt_unit( units.Cars.Car, "VAZ Car");
  cnt_unit( units.Cars.Car, "Trolley bus");
  cnt_unit( units.Cars.Car, "KAMAZ Truck");
  cnt_unit( units.Cars.Car, "LAZ Bus");
  cnt_unit( units.Cars.Car, "SAU Gvozdika");
  cnt_unit( units.Cars.Car, "BMP-3");
  cnt_unit( units.Cars.Car, "BTR_D");
  cnt_unit( units.Cars.Car, "S-300PS 54K6 cp");
  cnt_unit( units.Cars.Car, "GAZ-3307");
  cnt_unit( units.Cars.Car, "GAZ-66");
  cnt_unit( units.Cars.Car, "GAZ-3308");
  cnt_unit( units.Cars.Car, "MAZ-6303");
  cnt_unit( units.Cars.Car, "ZIL-4331");
  cnt_unit( units.Cars.Car, "SKP-11");
  cnt_unit( units.Cars.Car, "Ural-4320T");
  cnt_unit( units.Cars.Car, "Ural-4320-31");
  cnt_unit( units.Cars.Car, "Ural ATsP-6");
  cnt_unit( units.Cars.Car, "ZiL-131 APA-80");
  cnt_unit( units.Cars.Car, "ZIL-131 KUNG");
  cnt_unit( units.Cars.Car, "Ural-4320 APA-5D");
  cnt_unit( units.Cars.Car, "ZU-23 Emplacement");
  cnt_unit( units.Cars.Car, "ZU-23 Emplacement Closed");
  cnt_unit( units.Cars.Car, "Ural-375 ZU-23");
  cnt_unit( units.Cars.Car, "MTLB");
  cnt_unit( units.Cars.Car, "T-72B");
  cnt_unit( units.Cars.Car, "SA-18 Igla-S manpad");
  cnt_unit( units.Cars.Car, "SA-18 Igla-S comm");
  cnt_unit( units.Cars.Car, "T-55");
  cnt_unit( units.Cars.Car, "Paratrooper RPG-16");
  cnt_unit( units.Cars.Car, "Paratrooper AKS-74");
  cnt_unit( units.Cars.Car, "Boman");
  cnt_unit( units.Cars.Car, "2B11 mortar");
  cnt_unit( units.Cars.Car, "5p73 s-125 ln");
  cnt_unit( units.Cars.Car, "snr s-125 tr");
  cnt_unit( units.Cars.Car, "p-19 s-125 sr");
    cnt_unit( units.Cars.Car, "Infantry AK");
  cnt_unit( units.Cars.Car, "T-90");
  cnt_unit( units.Cars.Car, "Tigr_233036");

    cnt_unit( units.Cars.Car, "M-113");
    cnt_unit( units.Cars.Car, "Patriot str");
    cnt_unit( units.Cars.Car, "Patriot ln");
  cnt_unit( units.Cars.Car, "Patriot AMG");
  cnt_unit( units.Cars.Car, "Patriot EPP");
  cnt_unit( units.Cars.Car, "Patriot ECS");
  cnt_unit( units.Cars.Car, "Patriot cp");
    cnt_unit( units.Cars.Car, "Hawk sr");
  cnt_unit( units.Cars.Car, "Hawk cwar");
  cnt_unit( units.Cars.Car, "Hawk pcp");
    cnt_unit( units.Cars.Car, "Hawk tr");
    cnt_unit( units.Cars.Car, "Hawk ln");
    cnt_unit( units.Cars.Car, "Roland ADS");
    cnt_unit( units.Cars.Car, "Roland Radar");
    cnt_unit( units.Cars.Car, "Gepard");
    cnt_unit( units.Cars.Car, "Hummer");
    cnt_unit( units.Cars.Car, "Leopard-2");
    cnt_unit( units.Cars.Car, "Leopard1A3");
    cnt_unit( units.Cars.Car, "M-109");
    cnt_unit( units.Cars.Car, "Marder");
    cnt_unit( units.Cars.Car, "TPZ");
    cnt_unit( units.Cars.Car, "MLRS");
  cnt_unit( units.Cars.Car, "MLRS FDDM");
    cnt_unit( units.Cars.Car, "Soldier stinger");
    cnt_unit( units.Cars.Car, "Stinger comm");
    cnt_unit( units.Cars.Car, "M 818");
    cnt_unit( units.Cars.Car, "M978 HEMTT Tanker");
  cnt_unit( units.Cars.Car, "HEMTT TFFT");

  cnt_unit( units.Helicopters.Helicopter, "Mi-24V");
  cnt_unit( units.Helicopters.Helicopter, "Mi-8MT");
  cnt_unit( units.Helicopters.Helicopter, "Ka-50");
  cnt_unit( units.Helicopters.Helicopter, "UH-1H");
  --cnt_unit( units.Helicopters.Helicopter, "Ka-52");
	
cache = {}
local function build_cache(t)
	if  cache[t] == nil then
		local c = {}
		cache[t] = c
		for i,o in ipairs(t) do
			c[o.Name] = true
		end
	end
end
local function add_to_unit_list(t,tbl)
	local c =  cache[t]
	if 	c[tbl.Name] == nil then 
	    cnt_unit(t,tbl.Name,tbl.in_service,tbl.out_of_service)
		c[tbl.Name] = true
	end
end

local function merge_unit_list(src_list,target_list)
	build_cache(target_list)
	for i,o in ipairs (src_list) do
		add_to_unit_list(target_list,o)
	end
end

local function merge_unit_list_coutry(country_src,country_target)
	merge_unit_list(country_src.Units.Planes.Plane					,country_target.Units.Planes.Plane)
	merge_unit_list(country_src.Units.Heliports.Heliport			,country_target.Units.Heliports.Heliport)
    merge_unit_list(country_src.Units.GrassAirfields.GrassAirfield	,country_target.Units.GrassAirfields.GrassAirfield)
	merge_unit_list(country_src.Units.Ships.Ship 					,country_target.Units.Ships.Ship)
	merge_unit_list(country_src.Units.Cars.Car 						,country_target.Units.Cars.Car)
	merge_unit_list(country_src.Units.Helicopters.Helicopter		,country_target.Units.Helicopters.Helicopter)
	merge_unit_list(country_src.Units.Fortifications.Fortification	,country_target.Units.Fortifications.Fortification)
	merge_unit_list(country_src.Units.Warehouses.Warehouse 			,country_target.Units.Warehouses.Warehouse)
	merge_unit_list(country_src.Units.Cargos.Cargo 					,country_target.Units.Cargos.Cargo)
    merge_unit_list(country_src.Units.LTAvehicles.LTAvehicle 		,country_target.Units.LTAvehicles.LTAvehicle)
    merge_unit_list(country_src.Units.WWIIstructures.WWIIstructure 	,country_target.Units.WWIIstructures.WWIIstructure)
	merge_unit_list(country_src.Units.Effects.Effect 				,country_target.Units.Effects.Effect)
end

function merge_all_units_to_AGGRESSORS()
	local AGGRESSORS = country:get("AGGRESSORS")
	for i,o in pairs(country.by_country) do
		if o ~= AGGRESSORS then
			merge_unit_list_coutry(o,AGGRESSORS)
		end
	end
	cache = nil
end