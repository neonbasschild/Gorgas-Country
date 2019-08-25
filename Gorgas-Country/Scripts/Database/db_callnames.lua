local function packToTable(v,id)
	local ret_val = {WorldID = id}
	
	if type(v) == "table" then	
		ret_val.Name 	     = v[1]
		ret_val.soundFile 	 = v[2]
	else
		ret_val.Name 	     = v
	end
	return ret_val
end

local function makeTable(...)
	local tbl		  = {}
	local input_table = {...}
	for i, v in pairs(input_table) do
		table.insert(tbl,packToTable(v,i))
	end
	return tbl
end

db.Callnames = {}

local function callnames(countryId, category, callsignList)
	assert(countryId ~= nil)
	assert(category ~= nil)
	if not db.Callnames[countryId] then
		   db.Callnames[countryId] = {}
	end
	db.Callnames[countryId][category] = callsignList
end

local callsignsAircraft = makeTable({_('Enfield'),		'Enfield',	},
									{_('Springfield'),'Springfield',},
									{_('Uzi'),			'Uzi',		},
									{_('Colt'),			'Colt',		},
									{_('Dodge'),		'Dodge',	},
									{_('Ford'),			'Ford',		},
									{_('Chevy'),		'Chevy',	},
									{_('Backy'),		'Backy',	},
									{_('Dagger'),		'Dagger',	},
									{_('Janet'),		'Janet',	},
									{_('Ace'),			'Ace',		},
									{_('Air Force'),	'Air Force',},
									{_('American'),		'American',	},
									{_('Angel'),		'Angel',	},
									{_('Apache'),		'Apache',	},
									{_('Badger'),		'Badger',	},
									{_('Bandit'),		'Bandit',	},
									{_('Bogey'),		'Bogey',	},
									{_('Cannon'),		'Cannon',	},
									{_('Chaos'),		'Chaos',    },
									{_('Charger'),		'Charger',	},
									{_('Cheetah'),		'Cheetah',	},
									{_('Chicago'),		'Chicago',	},
									{_('Chief'),		'Chief',	},
									{_('Chinook'),		'Chinook',	},
									{_('Coast Guard'),'Coast Guard',},
									{_('Cobra'),            'Cobra',},
									{_('Cocky'),            'Cocky',},
									{_('Commando'),      'Commando',},
									{_('Cowboy'),          'Cowboy',},
									{_('Crate'),            'Crate',},
									{_('Delta'),            'Delta',},
									{_('Devil'),            'Devil',},
									{_('Dracula'),        'Dracula',},
									{_('Eagle'),            'Eagle',},
									{_('Falcon'),          'Falcon',},
									{_('Fedex'),            'Fedex',},
									{_('Gash'),              'Gash',},
									{_('Gassr'),            'Gassr',},
									{_('Ghost'),            'Ghost',},
									{_('Goose'),            'Goose',},
									{_('Hammer'),          'Hammer',},
									{_('Hawk'),              'Hawk',},
									{_('Herc'),              'Herc',},
									{_('Hornet'),          'Hornet',},
									{_('Iceman'),          'Iceman',},
									{_('Igor'),              'Igor',},
									{_('Ivan'),              'Ivan',},
									{_('Jackal'),          'Jackal',},
									{_('Jammer'),          'Jammer',},
									{_('Jester'),          'Jester',},
									{_('Jill'),              'Jill',},
									{_('Jody'),              'Jody',},
									{_('Jurassic'),      'Jurassic',},
									{_('Justice'),        'Justice',},
									{_('King'),              'King',},
									{_('Kiowa'),            'Kiowa',},
									{_('Lifter'),          'Lifter',},
									{_('Marine'),          'Marine',},
									{_('Maverick'),      'Maverick',},
									{_('MiG'),                'MiG',},
									{_('Mustang'),        'Mustang',},
									{_('Navy'),              'Navy',},
									{_('Owl'),                'Owl',},
									{_('Pedro'),            'Pedro',},
									{_('Phantom'),        'Phantom',},
									{_('Piedmont'),      'Piedmont',},
									{_('Raleigh'),        'Raleigh',},
									{_('Raven'),            'Raven',},
									{_('Rawhide'),        'Rawhide',},
									{_('Razor'),            'Razor',},
									{_('Reach'),            'Reach',},
									{_('Reaper'),          'Reaper',},
									{_('Reckless'),      'Reckless',},
									{_('Rescue'),          'Rescue',},
									{_('Rhino'),'            Rhino',},
									{_('Rodeo'),            'Rodeo',},
									{_('Rolex'),            'Rolex',},
									{_('Rotor'),            'Rotor',},
									{_('Sentry'),          'Sentry',},
									{_('Skybird'),        'Skybird',},
									{_('Snake'),            'Snake',},
									{_('Soda'),              'Soda',},
									{_('Spark'),            'Spark',},
									{_('Speed'),            'Speed',},
									{_('Stallion'),      'Stallion',},
									{_('Stud'),              'Stud',},
									{_('Tacamo'),          'Tacamo',},
									{_('Taco'),              'Taco',},
									{_('Talon'),            'Talon',},
									{_('Tiger'),            'Tiger',},
									{_('Trump'),            'Trump',},
									{_('Vampire'),        'Vampire',},
									{_('Viper'),            'Viper',},
									{_('Watch'),            'Watch',},
									{_('Wolf'),              'Wolf',},
									{_('Bull'), 		    'Bull',});

local callsignsHeavy   = makeTable({_('Raider'),		'Raider'});

local vehicleCallsigns = makeTable( 'Axeman', 	 
									'Darknight',
									'Warrior',	
									'Pointer', 
									'Eyeball', 
									'Moonbeam', 
									'Whiplash', 
									'Finger', 	
									'Pinpoint', 
									'Ferret', 	
									'Shaba', 	
									'Playboy', 
									'Hammer', 	
									'Jaguar', 	
									'Deathstar',
									'Anvil', 	
									'Firefly', 
									'Mantis', 	
									'Badger');
									
local refPoints = makeTable ('FORD' ,
							 'EDSEL',
							 'DODGE',
							 'MAZDA',
							 'BANKS',
							 'CHEVY',
							 'TOWEL',
							 'ADDER');
callnames(	country.USA,'AWACS',
			makeTable('Overlord',
					  'Magic'   ,
					  'Wizard'  ,
					  'Focus'   ,
					  'Sentry'  ,
					  'Watch'   ,
					  'Darkstar'));
					  
callnames(	country.UK,		'AWACS',	makeTable('Solex','Image'));
callnames(	country.FRANCE,	'AWACS',	makeTable('Cyrano','Roxanne'	 ));
callnames(	country.USA,	'Tankers',	makeTable('Texaco','Arco','Shell','Backy','Gassr'));

callnames(country.USA,		'Strategic bombers',callsignsHeavy);
callnames(country.USA,		'Transports',		callsignsHeavy);
callnames(country.USA,		'Aux',				callsignsHeavy);
callnames(country.USA,		'Air',				callsignsAircraft);
callnames(country.USA,		'Ground Units',		vehicleCallsigns);
callnames(country.RUSSIA,	'Helipad',			makeTable(	{_('Otkrytka'), 		'Otkrytka',	},
															{_('Vetka'), 			'Vetka',	},
															{_('Yunga'),			'Yunga',	},
															{_('Shpora'),			'Shpora',	},
															{_('Kalitka'),			'Kalitka',	},
															{_('Torba'),			'Torba',	},
															{_('Kaemka'),			'Kaemka',	},
															{_('Podkova'),			'Podkova',	},
															{_('Skala'),			'Skala',	},
															{_('Kapel'),			'Kapel',	}
															));
callnames(country.USA,	'Helipad',				makeTable  ({_('London'), 			'London',	},
															{_('Dallas'), 			'Dallas',	},
															{_('Paris'),			'Paris',	},
															{_('Moscow'),			'Moscow',	},
															{_('Berlin'),			'Berlin',	},
															{_('Rome'),				'Rome',		},
															{_('Madrid'),			'Madrid',	},
															{_('Warsaw'),			'Warsaw',	},
															{_('Dublin'),			'Dublin',	},
															{_('Perth'),			'Perth',	}
															));
callnames(country.RUSSIA,	'GrassAirfield',	makeTable( 	{_('A01'), 			    'A01',	    },
															{_('B01'), 			    'B01',	    }
															));
callnames(country.USA,		'GrassAirfield',	makeTable({_('New York'), 		'New York',	}));
callnames(coalition.BLUE,	'RefPoints',		refPoints);

callnames(country.RUSSIA,	
			'Aircraft Carriers',
			makeTable('Salamander'));

local categories = {
	'AWACS',
	'Tankers',
	'Air',
	'Helipad',
	'Ground Units',
    'GrassAirfield'
}

db.DefaultCountry = {
	[country.UKRAINE]			= country.RUSSIA,
	[country.BELARUS]           = country.RUSSIA,
	[country.INSURGENTS]		= country.RUSSIA,
	[country.ABKHAZIA]			= country.RUSSIA,
	[country.SOUTH_OSETIA]		= country.RUSSIA,
    [country.CHINA]		        = country.RUSSIA,
	[country.YUGOSLAVIA]        = country.RUSSIA,
	[country.USSR]		        = country.RUSSIA,
		
}

db.callnamesRussia = {
    "Russia",
    "Ukraine",
    "Belarus",
    "Insurgents",
    "Abkhazia",
    "South Ossetia",
    "China",
	"Yugoslavia",
	"USSR"
}

function db.isWesternCallnames(country)
    for k,v in pairs(db.callnamesRussia) do
        if v == country then
            return false
        end
    end
    return true
end

function db.getCallnames(countryId, category)
	local callnames = db.Callnames[countryId] and db.Callnames[countryId][category]
	if callnames == nil then
		local countryAsDefault = db.DefaultCountry[countryId] or country.USA
		if countryAsDefault ~= nil then
			callnames = db.Callnames[countryAsDefault] and db.Callnames[countryAsDefault][category]				
		end
	end
	return callnames
end


function db.getUnitCallnames(countryId, unitAttributes)
	for categoryIndex, category in pairs(categories) do
		if findAttribute(unitAttributes, category) then	
			return db.getCallnames(countryId, category)
		end
	end
end

function db.getUnitCallnames2(countryId, unit, checkAttributeFunc)
	for categoryIndex, category in pairs(categories) do
		if checkAttributeFunc(unit, category) then
			return db.getCallnames(countryId, category)
		end
	end
end



function db.getCallnamesRefPoints()
    return db.getCallnames(coalition.BLUE, 'RefPoints')
end

function db.aircraftCallnames(countryId, aircraftTypeName, unitAttributes, callnamesRaw)
	local aircraftCallnames = {}
	local commonCallnames = unitAttributes and db.getUnitCallnames(countryId, unitAttributes)
	if commonCallnames ~= nil then
		for i, commonCallname in pairs(commonCallnames) do
			table.insert(aircraftCallnames,commonCallname)
		end
	end
	local index0 = #aircraftCallnames
	for i, v in pairs(callnamesRaw) do
		table.insert(aircraftCallnames,packToTable(v,index0 + i))
	end

	callnames(countryId, aircraftTypeName, aircraftCallnames);
end

local onlyCallnameCategories = {
	--'AWACS',
	--'Tankers',
}

function db.doesCallsignHasNumericPart(countryId, unitAttributes)
	for attrIndex, unitAttribute in pairs(unitAttributes) do
		for catIndex, category in pairs(onlyCallnameCategories) do
			if unitAttribute == category then
				return false;
			end
		end
	end
	return true
end