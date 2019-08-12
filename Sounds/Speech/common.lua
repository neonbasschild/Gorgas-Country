--Common part of all speech construction protocols

local base = _G

module('common')
__index = base.getfenv()

local p = base.require('phrase')
local u = base.require('utils')

local gettext = base.require("i_18n")
local _ = gettext.translate

--Game Modules

local defaultModuleName = 'Common'

local function getModuleByLocalPlayer()
	local localPlayer = base.world.getPlayer()
	if localPlayer ~= nil then
		return localPlayer:getTypeName()
	else
		return nil
	end
end

local function getModuleName(message)
	if message.event > base.Message.wMsgLeaderNull and message.event < base.Message.wMsgLeaderMaximum then
		return message.sender:getUnit():getTypeName()
	elseif message.event > base.Message.wMsgWingmenNull and message.event < base.Message.wMsgWingmenMaximum then
		return message.sender:getUnit():getTypeName()
	elseif message.event > base.Message.wMsgServiceNull and message.event < base.Message.wMsgGroundCrewNull then
		return message.receiver:getUnit():getTypeName()
	else
		return getModuleByLocalPlayer() or defaultModuleName
	end
end

--Units

local unitSystems = {
	metric = {
		distance = u.units.km,
		altitude = u.units.m,
		velocity = u.units.kmh,
		verticalVelocity = u.units.ms,
		pressure = u.units.mmHg
	},
	imperial = {
		distance = u.units.nm,
		altitude = u.units.feet,
		velocity = u.units.kts,
		verticalVelocity = u.units.fpm,
		pressure = u.units.im
	}
}

unitSystemByCountry = {
	[base.country.id.RUSSIA]			= unitSystems.metric,
	[base.country.id.UKRAINE]			= unitSystems.metric,
	[base.country.id.USA]				= unitSystems.imperial,
	[base.country.id.TURKEY]			= unitSystems.imperial,
	[base.country.id.UK]				= unitSystems.imperial,
	[base.country.id.FRANCE]			= unitSystems.imperial,
	[base.country.id.GERMANY]			= unitSystems.imperial,
	[base.country.id.CANADA]			= unitSystems.imperial,
	[base.country.id.SPAIN]				= unitSystems.imperial,
	[base.country.id.THE_NETHERLANDS]	= unitSystems.imperial,
	[base.country.id.BELGIUM]			= unitSystems.imperial,
	[base.country.id.NORWAY]			= unitSystems.imperial,
	[base.country.id.DENMARK]			= unitSystems.imperial,
	[base.country.id.ISRAEL]			= unitSystems.imperial,
	[base.country.id.GEORGIA]			= unitSystems.imperial,
	[base.country.id.INSURGENTS]		= unitSystems.metric,
	[base.country.id.ABKHAZIA]			= unitSystems.metric,
	[base.country.id.SOUTH_OSETIA]		= unitSystems.metric,
	[base.country.id.ITALY]				= unitSystems.imperial,
	[base.country.id.AUSTRALIA]			= unitSystems.imperial,
    [base.country.id.SWITZERLAND] 	    = unitSystems.imperial,
    [base.country.id.AUSTRIA] 	        = unitSystems.imperial,
    [base.country.id.BELARUS] 	        = unitSystems.metric,
    [base.country.id.BULGARIA] 	        = unitSystems.imperial,
    [base.country.id.CHEZH_REPUBLIC]    = unitSystems.imperial,
    [base.country.id.CHINA]             = unitSystems.metric,
    [base.country.id.CROATIA] 	        = unitSystems.imperial,
    [base.country.id.EGYPT]	            = unitSystems.imperial,
    [base.country.id.FINLAND] 	        = unitSystems.imperial,
    [base.country.id.GREECE] 	        = unitSystems.imperial,
    [base.country.id.HUNGARY] 	        = unitSystems.imperial,
    [base.country.id.INDIA] 	        = unitSystems.imperial,
    [base.country.id.IRAN] 	            = unitSystems.imperial,
    [base.country.id.IRAQ] 	            = unitSystems.imperial,
    [base.country.id.JAPAN]	            = unitSystems.imperial,
    [base.country.id.KAZAKHSTAN] 	    = unitSystems.imperial,
    [base.country.id.NORTH_KOREA] 	    = unitSystems.imperial,
    [base.country.id.PAKISTAN] 	        = unitSystems.imperial,
    [base.country.id.POLAND] 	        = unitSystems.imperial,
    [base.country.id.ROMANIA] 	        = unitSystems.imperial,
    [base.country.id.SAUDI_ARABIA] 	    = unitSystems.imperial,
    [base.country.id.SERBIA] 	        = unitSystems.imperial,
    [base.country.id.SLOVAKIA] 	        = unitSystems.imperial,
    [base.country.id.SOUTH_KOREA] 	    = unitSystems.imperial,
    [base.country.id.SWEDEN] 	        = unitSystems.imperial,
    [base.country.id.SYRIA]	            = unitSystems.imperial,
    [base.country.id.AGGRESSORS]	    = unitSystems.imperial,

    [base.country.id.YEMEN]	            = unitSystems.imperial,
    [base.country.id.VIETNAM]	        = unitSystems.imperial,
    [base.country.id.VENEZUELA]	        = unitSystems.imperial,
    [base.country.id.TUNISIA]	        = unitSystems.imperial,
    [base.country.id.THAILAND]	        = unitSystems.imperial,
    [base.country.id.SUDAN]	            = unitSystems.imperial,
    [base.country.id.PHILIPPINES]	    = unitSystems.imperial,
    [base.country.id.MOROCCO]	        = unitSystems.imperial,
    [base.country.id.MEXICO]	        = unitSystems.imperial,
    [base.country.id.MALAYSIA]	        = unitSystems.imperial,
    [base.country.id.LIBYA]			    = unitSystems.imperial,
    [base.country.id.JORDAN]	        = unitSystems.imperial,
    [base.country.id.INDONESIA]	        = unitSystems.imperial,
    [base.country.id.HONDURAS]	        = unitSystems.imperial,
    [base.country.id.ETHIOPIA]	        = unitSystems.imperial,
    [base.country.id.CHILE]			    = unitSystems.imperial,
    [base.country.id.BRAZIL]	        = unitSystems.imperial,
    [base.country.id.BAHRAIN]	        = unitSystems.imperial,

	[base.country.id.THIRDREICH]				= unitSystems.metric,	
	[base.country.id.YUGOSLAVIA]				= unitSystems.metric,
	[base.country.id.USSR]						= unitSystems.metric,	
	[base.country.id.ITALIAN_SOCIAL_REPUBLIC]	= unitSystems.metric,
	[base.country.id.GORGAS] 					= unitSystems.imperial,		
}

space_ 			= p.separator(' ')
comma_space_  	= p._p({', ',	'delimeter',	','})
CR_  			= p._p({'\n',	'CR',			'\n'})

Phrase = {
	new = function(self, phraseIn, directoryIn)
		base.assert(phraseIn ~= nil)
		local newPhrase = { phrase = phraseIn, directory = directoryIn }
		base.setmetatable(newPhrase, self)
		return newPhrase
	end,
	make = function(self)
		return p._p(self.phrase, self.directory)
	end
}
Phrase.__index = Phrase

PhraseRandom = {
	new = function(self, phrasesIn, directoryIn)
		base.assert(phrasesIn ~= nil and #phrasesIn > 0)
		local newPhrases = { phrases = phrasesIn, directory = directoryIn }
		base.setmetatable(newPhrases, self)
		return newPhrases
	end,
	make = function(self)
		local number = base.math.random(1, base.table.getn(self.phrases))
		base.assert(self.phrases[number] ~= nil)
		return p._p(self.phrases[number], self.directory)
	end,
}
PhraseRandom.__index = PhraseRandom

Phrases = {
	new = function(self, phrasesIn, directoryIn, defaultIn)
		base.assert(phrasesIn ~= nil)
		local newPhrases = { phrases = phrasesIn, directory = directoryIn, default = defaultIn }
		base.setmetatable(newPhrases, self)
		return newPhrases
	end,
	make = function(self, number ,custom_data)
		base.assert(number ~= nil)	
		if 	self.phrases[number] == nil and
			self.default == nil and 
			custom_data  == nil then
			--if base._DEBUG then
				local counter = 0
				for phraseIndex, phraseValue in base.pairs(self.phrases) do
					-- base.print(p._p(phraseValue).subtitle)
					counter = counter + 1
					if counter > 5 then
						break
					end
				end
			--end
			base.error('Phrases: no phrase with number = '..number)
		end
		local phrase = self.phrases[number] or custom_data or self.default
		return p._p( phrase, self.directory )
	end,
}
Phrases.__index = Phrases

Digits = {
	make = function(self, number, fmt)
		return p.digits(number, fmt)
	end
}

DigitGroups = {
	make = function(self, fmt, ...)
		return p.digit_groups(fmt, ...)
	end
}

Number = {
	make = function(self, number)
		return p.number(number)
	end
}

Index = {
	make = function(self, number)
		return p.index(number)
	end
}

do
	Digits.phrases = {}
	Digits.pos3 = true
	Digits.directory = 'Digits'
	for i = 0, 9 do
		base.table.insert(Digits.phrases, base.tostring(i))
	end
	base.table.insert(Digits.phrases, {'point', nil, 'decimal'})
	Number.phrases = {}
	Number.pos3 = true
	Number.directory = 'Numbers'
	for i = 10, 19, 1 do
		base.table.insert(Number.phrases, base.tostring(i))
	end
	for i = 20, 90, 10 do
		base.table.insert(Number.phrases, base.tostring(i))
	end
	base.table.insert(Number.phrases, {'100',	nil, 'hundred'})
	base.table.insert(Number.phrases, {'1000',	nil, 'thousand'})
	base.table.insert(Number.phrases, {'point', nil, 'decimal'})
end

do
	local function checkEvents(events)
		local missedEvents = 0
		for msgName, msgValue in base.pairs(base.Message) do
			if 	base.string.find(msgName,'wMsg') == 1 and
				base.string.find(msgName,'Maximum') ~= base.string.len(msgName) - 7 + 1 and
				base.string.find(msgName,'Null') ~= base.string.len(msgName) - 4 + 1 then
				if events[msgValue] == nil then
					missedEvents = missedEvents + 1
					base.error('Error: no phrase for '..msgName..' message!')			
				end
			end
		end
		return missedEvents == 0
	end

	local space = {
		Message = base.Message,
		_		= _
	}
	local eventsLoader, errorMsg = base.loadfile('Sounds/Speech/common_events.lua')
	if eventsLoader == nil then
		base.error(errorMsg)
	end
	base.setfenv(eventsLoader, space)
	eventsLoader()
	base.assert(space.events ~= nil)
	if base._DEBUG then
		base.assert(checkEvents(space.events))
	end
	Event = Phrases:new(space.events, 'Messages')
end

EventHandler = {
	make = function(self, message)
		return Event:make(message.event)
	end,
}

CompassDirection8 = {
	make = function(self, bearing_rad)
		local cardinal_direction_num = base.math.floor(base.math.mod(bearing_rad + 2 * u.PI / 16, 2 * u.PI) / (2 * u.PI / 8)) + 1	
		return self.sub.dir:make(cardinal_direction_num)
	end,
	sub = {
		dir = Phrases:new( { {_('north'),		'N',	'north'},
							{_('northeast'),	'NE',	'northeast'},
							{_('east'),			'E',	'east'},
							{_('southeast'),	'SE',	'southeast'},
							{_('south'),		'S',	'south'},
							{_('southwest'),	'SW',	'southwest'},
							{_('west'),			'W',	'west'},
							{_('northwest'),	'NW',	'northwest'} } )
	}
}

FromCompassDirection8 = {
	make = function(self, bearing_rad)
		local cardinal_direction_num = base.math.floor(base.math.mod(bearing_rad + 2 * u.PI / 16, 2 * u.PI) / (2 * u.PI / 8)) + 1	
		return self.sub.dir:make(cardinal_direction_num)
	end,
	sub = {
		dir = Phrases:new( { 	{_('from the north'),		'from the N',	'from the north'},
								{_('from the northeast'),	'from the NE',	'from the northeast'},
								{_('from the east'),		'from the E',	'from the east'},
								{_('from the southeast'),	'from the SE',	'from the southeast'},
								{_('from the south'),		'from the S',	'from the south'},
								{_('from the southwest'),	'from the SW',	'from the southwest'},
								{_('from the west'),		'from the W',	'from the west'},
								{_('from the northwest'),	'from the NW',	'from the northwest'} } )
	}
}

CompassDirection4 = {
	make = function(self, bearing_rad)
		local cardinal_direction_num = base.math.floor(base.math.mod(bearing_rad + u.PI / 4, 2 * u.PI) / (u.PI / 2)) + 1	
		return self.sub.dir:make(cardinal_direction_num)
	end,
	sub = {
		dir = Phrases:new( { {_('north'),		'N',	'north'},
							{_('east'),			'E',	'east'},
							{_('south'),		'S',	'south'},
							{_('west'),			'W',	'west'} } )
	}
}

UnitName = {
	new = function(self, unitName)
		local unitNames = {}
		for country, unitSystem in base.pairs(unitSystemByCountry) do
			unitNames[country] = unitSystem[unitName].name
		end
		return Phrases:new(unitNames)
	end
}

Wind = {
	make = function(self, dir)
		if dir then
			local windDir = u.round(u.get_azimuth(dir) * u.units.deg.coeff, 1)
			local windVel = u.round(u.get_lengthZX(dir) + 0.5, 1)
			if windVel > 1.5 then
				return p.start() + self.sub.wind:make() + space_ + self.sub.Digits:make(windDir, '%03d') + space_ + self.sub.at:make() + space_ + self.sub.Digits:make(windVel) + space_ + self.sub.mps:make()
			end
		end
		return nil
	end,
	sub = {
		wind	= Phrase:new({_('wind'),				'wind'}),
		at		= Phrase:new({_('at wind'),				'at'}),
		mps		= Phrase:new({_('meters per second'),	'meters per second'}),
		Digits	= Digits
	}
}

Runway = {
	make = function(self, runwayCode)
		local runwaySide = base.math.floor(runwayCode / 100)
		local runwayDir = runwayCode - runwaySide * 100
		return self.sub.runway:make() + space_ + self.sub.Digits:make(runwayDir, '%02d') + self.sub.side:make(runwaySide)
	end,
	sub = {
		runway = Phrase:new({_('runway'), 'runway'}),
		side = Phrases:new({'L', 'R'}, nil, ''),
		Digits = Digits
	}	
}

do

Pressure = {
	make = function(self, pressure, aircraftType, fmt)
		local country = aircraftNativeCountry[aircraftType] or base.country.id.USA
		local unit = unitSystemByCountry[country].pressure
		return self.sub.Digits:make(u.round(pressure * unit.coeff, 0.01), fmt)
	end,
	sub = {
		Digits	= Digits
	}
}

end

BearingAndRange = {
	make = function(self, dir, country)
		local distanceUnit = unitSystemByCountry[country].distance
		return 	self.sub.Digits:make(u.round(u.get_azimuth(dir) * u.units.deg.coeff, 1)) +
				space_ + self.sub.pfor:make() + space_ + self.sub.Digits:make(u.adv_round(u.get_lengthZX(dir) * distanceUnit.coeff))
	end,
	sub = {
		pfor	= Phrase:new({_('for'), 'for'}),
		Digits	= Digits
	}
}

local function from_db_callname(v)
	return { v.Name, v.soundFile or v.Name }
end

Callname = {
	new = function(self, country, category, directory, default)
		local callnames = base.db.getCallnames(country, category)
		local callnameList = {}
		for callnameNum, callnameValue in base.pairs(callnames) do
			base.table.insert(callnameList,from_db_callname(callnameValue))
		end
		return Phrases:new(callnameList, directory, callnameList[default])
	end
}

do

	local function findInTable(tbl, element)
		for i, v in base.pairs(tbl) do
			if v == element then
				return true
			end
		end
		return false
	end

	local function _getUnitCallnames(self,pUnit,countryCallnames, callname)
		if countryCallnames then
			local typeCallname = countryCallnames.sub.callnameByTypeName.sub[pUnit:getTypeName()]
			if typeCallname ~= nil then
				return typeCallname:make(callname)
			end					
			for category, sub in base.pairs(countryCallnames.sub.callnameByAttributes.sub) do
				if pUnit:hasAttribute(category) then
					return sub:make(callname)
				end
			end
		end	
	end
	
	local function getUnitCallnames(self,pUnit,country_id, callname)
        local default          = base.db.DefaultCountry[country_id] or 2
        local countryCallnames = self.sub[country_id]
		local res = _getUnitCallnames(self, pUnit, countryCallnames, callname)
		if res ~= nil then
			return res
		end
		countryCallnames = self.sub[default]		
		res = _getUnitCallnames(self, pUnit, countryCallnames, callname)
		return res
	end	

	UnitCallname = {
		new = function(self, attribute, deep, typeName, directory)
			base.assert(attribute ~= nil or typeName ~= nil)
			local unitCallname = { sub = {} }		
			for countryId, countryCallnames in base.pairs(base.db.Callnames) do
				unitCallname.sub[countryId] = { sub = { callnameByAttributes = { sub = {} } , callnameByTypeName  =  { sub = {} } } }
				for category, callsignList in base.pairs(countryCallnames) do
					if attribute ~= nil then
						if	(deep and (	base.type(attribute) == 'table' and base.hasAttributes(category, attribute) or
										base.type(attribute) == 'string' and base.hasAttribute(category, attribute)))
								or
							(not deep and (	base.type(attribute) == 'table' and findInTable(attribute, category) or
											base.type(attribute) == 'string' and attribute == category)) then									
							local callnameTbl = {}
							for i, v in base.pairs(callsignList) do
								callnameTbl[v.WorldID] = from_db_callname(v)
							end		
							unitCallname.sub[countryId].sub.callnameByAttributes.sub[category] = Phrases:new(callnameTbl, directory)
						end
					end
					if typeName ~= nil then
						if	base.type(typeName) == 'table' and findInTable(typeName, category) or
							base.type(typeName) == 'string' and typeName == category then
							local callnameTbl = {}
							for i, v in base.pairs(callsignList) do
								callnameTbl[v.WorldID] = from_db_callname(v)
							end					
							unitCallname.sub[countryId].sub.callnameByTypeName.sub[category] = Phrases:new(callnameTbl, directory)
						end
					end
				end
			end
			base.setmetatable(unitCallname, self)
			return unitCallname
		end,
		make = function(self, pUnit, callname)
			local country = pUnit:getCountry()
			local result =	getUnitCallnames(self,pUnit,country,callname)
			if result ~= nil then
				return result
			end
			base.error('Callname '..base.tostring(callname)..' not found for '..pUnit:getName()..' !')
		end
	}
	UnitCallname.__index = UnitCallname
end

function encodeCallsign(callsign)
	local groupCallname = base.math.floor(callsign / 100)
	callsign = callsign - groupCallname * 100
	local flightNumber = base.math.floor(callsign / 10)
	callsign = callsign - flightNumber * 10
	local aircraftNumber = callsign
	flightNumber = base.math.max(1, flightNumber)
	aircraftNumber = base.math.max(1, base.math.min(aircraftNumber, 4))
	return groupCallname, flightNumber, aircraftNumber
end

function hasNumericCallsign(country)
	return 	country == base.country.RUSSIA or
			country == base.country.UKRAINE or
			country == base.country.BELARUS or
			country == base.country.INSURGENTS or
			country == base.country.ABKHAZIA or
			country == base.country.SOUTH_OSETIA or
			country == base.country.CHINA or
			country == base.country.VIETNAM
end

local airdromeNameVariants = {
	['Common'] = 'Common',
	['USSR'] = 'USSR',
	['NATO'] = 'NATO'
}

local defaultAirdromeNameVariant = airdromeNameVariants['Common']

function getAirdromeNameVariant(language)
	if language == 'RUS' then
		return airdromeNameVariants['USSR']
	else
		return airdromeNameVariants['NATO']
	end
end

PlayerAircraftCallsign = {
	make = function(self, pComm, useIndex)
		if pComm == nil then
			return p.start()
		end	
		local pUnit = pComm:getUnit()
		base.assert(pUnit:hasAttribute('Air'))
		base.assert(pUnit ~= nil)
		local country = pUnit:getCountry()
		local callsign = pComm:getCallsign()
		if hasNumericCallsign(country) then
			base.assert(base.type(callsign) == 'number')
			if useIndex then
				return self.sub.Index:make(callsign)
			else
				return self.sub.Digits:make(callsign)
			end
		else
			local groupName, flightNum, aircraftNum = encodeCallsign(callsign)
			return self.sub.PlayerAircraftCallname:make(pUnit, groupName) + ' ' + self.sub.DigitGroups:make('%d-%d', flightNum, aircraftNum)
		end
		
	end,
	sub = {	Index					= Index,
			Digits					= Digits,
			PlayerAircraftCallname	= UnitCallname:new('Air', false, {'A-10A', 'A-10C'}, 'Callsign'),
			DigitGroups				= DigitGroups },
}

function isHeavyAircraft(pUnit)
	return	pUnit:hasAttribute('AWACS') or
			pUnit:hasAttribute('Tankers') or
			pUnit:hasAttribute('Strategic bombers') or
			pUnit:hasAttribute('Transports') or
			pUnit:hasAttribute('Aux')
end

local function checkUnitAttribute(pUnit, attribute)
	return pUnit:hasAttribute(attribute)
end

local function getCallname(pUnit, callnameId)
	local callnames = base.db.getCallnames(pUnit:getCountry(), pUnit:getTypeName())
	if callnames and callnames[callnameId] then
		return callnames[callnameId].Name
	end
	callnames = base.db.getUnitCallnames2(pUnit:getCountry(), pUnit, checkUnitAttribute)
	if callnames and callnames[callnameId] then
		return callnames[callnameId].Name
	end
end

function getCallname_(self,pComm, callnameId)
	local pUnit = pComm:getUnit()
	return getCallname(pUnit, callnameId)
end

local function makeCallsignString_(pComm, airdromeNameVariant)
	if pComm == nil then
		return nil
	end	

	local pUnit = pComm:getUnit()
	base.assert(pUnit ~= nil)
	local country = pUnit:getCountry()
	local callsign = pComm:getCallsign()

	if 	pUnit:getCategory() == base.Object.Category.BASE then
		if pUnit:getDesc().category == base.Airbase.Category.HELIPAD then
			return getCallname(pUnit, callsign)
		else
			local name = (airdromeNames[airdromeNameVariant] ~= nil and airdromeNames[airdromeNameVariant][callsign] ~= nil) and
							airdromeNames[airdromeNameVariant][callsign]
						or
							airdromeNames[defaultAirdromeNameVariant][callsign]		
			if name==nil then
				return nil
			end	
			return name[1]
		end		
	else
		if hasNumericCallsign(country) then
			return callsign
			--[[
			if pUnit:hasAttribute('Air') then
				base.assert(base.type(callsign) == 'number')
				return callsign
			else
				return getCallname(pUnit, base.math.floor(callsign / 100 + 0.5))
			end
			--]]
		else
			local groupName, flightNum, aircraftNum = encodeCallsign(callsign)
			local callname = getCallname(pUnit, groupName)
			if callname ~= nil then
				if isHeavyAircraft(pUnit) then
					return callname
				else				
					return callname..flightNum..aircraftNum
				end
			end
		end
	end
	return nil
end

function makeCallsignString(self, pComm)
	return makeCallsignString_(pComm, 'NATO')
end

do

local temper = {
	CALM = 1,
	BRIGHT = 2,
	LOUD = 3
}

local temperByMessage = {
	[base.Message.wMsgWingmenCopy] 						= temper.BRIGHT,
	[base.Message.wMsgWingmenFlightCheckInPositive] 	= temper.BRIGHT,
	[base.Message.wMsgWingmenTargetDestroyed]			= temper.LOUD,
	[base.Message.wMsgWingmenEjecting]					= temper.LOUD,
	[base.Message.wMsgWingmenIamHit]					= temper.LOUD,
	[base.Message.wMsgWingmenMissileAway]				= temper.BRIGHT,
	[base.Message.wMsgWingmenGuns]                 		= temper.BRIGHT,
	[base.Message.wMsgWingmenEngagedDefensive]     		= temper.BRIGHT,	
	[base.Message.wMsgWingmenEngagingSAM]				= temper.BRIGHT,
	[base.Message.wMsgWingmenEngagingAAA]				= temper.BRIGHT,
	[base.Message.wMsgWingmenEngagingArmor]				= temper.BRIGHT,
	[base.Message.wMsgWingmenEngagingArtillery]			= temper.BRIGHT,
	[base.Message.wMsgWingmenEngagingVehicle]			= temper.BRIGHT,
	[base.Message.wMsgWingmenEngagingShip]				= temper.BRIGHT,
	[base.Message.wMsgWingmenEngagingBunker]			= temper.BRIGHT,
	[base.Message.wMsgWingmenEngagingStructure]			= temper.BRIGHT,
	[base.Message.wMsgWingmenRequestPermissionToAttack] = temper.BRIGHT,
	[base.Message.wMsgWingmenBombsAway]					= temper.BRIGHT,
	[base.Message.wMsgWingmenRockets]					= temper.BRIGHT,
	[base.Message.wMsgWingmenRunningIn]					= temper.BRIGHT,
	[base.Message.wMsgWingmenWinchester]				= temper.BRIGHT,
	[base.Message.wMsgWingmenTallyBandit]				= temper.BRIGHT,
	[base.Message.wMsgWingmenSAMLaunch]					= temper.LOUD,
	[base.Message.wMsgWingmenMudSpike]					= temper.BRIGHT,
	[base.Message.wMsgWingmenSpike]						= temper.BRIGHT, 
	[base.Message.wMsgWingmenCheckYourSix]				= temper.LOUD,
	[base.Message.wMsgWingmenHelReconBearing]			= temper.BRIGHT,
	[base.Message.wMsgWingmenFollowScanMode]			= temper.BRIGHT,
	[base.Message.wMsgWingmenHelLaunchAbortTask]		= temper.BRIGHT,
	[base.Message.wMsgWingmenBugout]					= temper.LOUD,
}

WingmanMessageHandler = {
	make = function(self, message)
		local messageTemper = temperByMessage[message.event] or temper.CALM
		local number = message.sender:getUnit():getNumber()
		base.assert(number >= 2 and number <= 4)
		return self.sub[messageTemper]:make(number - 1)  + comma_space_ + Event:make(message.event)
	end,
	sub = {
		[temper.CALM] = Phrases:new({	{_('2nd'), '2-calm'},
										{_('3rd'), '3-calm'},
										{_('4th'), '4-calm'} }),
		[temper.BRIGHT] = Phrases:new({	{_('2nd'), '2-bright'},
										{_('3rd'), '3-bright'},
										{_('4th'), '4-bright'} }),
		[temper.LOUD] = Phrases:new({	{_('2nd'), '2-loud'},
										{_('3rd'), '3-loud'},
										{_('4th'), '4-loud'} })
	}
}

end

BearingOClock = {
	make = function(self, bearing_rad)
		local hour = base.math.floor((bearing_rad * u.units.deg.coeff + 15) / 30)
		if hour == 0 then
			hour = 12
		end
		return self.sub.clocks:make(hour)
	end,
	sub = {
		clocks = Phrases:new( { 	{_('1 o\'clock'), '1oclock'},
									{_('2 o\'clock'), '2oclock'},
									{_('3 o\'clock'), '3oclock'},
									{_('4 o\'clock'), '4oclock'},
									{_('5 o\'clock'), '5oclock'},
									{_('6 o\'clock'), '6oclock'},
									{_('7 o\'clock'), '7oclock'},
									{_('8 o\'clock'), '8oclock'},
									{_('9 o\'clock'), '9oclock'},
									{_('10 o\'clock'), '10oclock'},
									{_('11 o\'clock'), '11oclock'},
									{_('12 o\'clock'), '12oclock'} } )
	}
}

WingmanBearingHandler = {
	make = function(self, message)
		return self.sub.WingmanMessageHandler:make(message) + ' ' + self.sub.BearingOClock:make(u.get_azimuth(message.parameters.dir))
	end,
	sub = { WingmanMessageHandler	= WingmanMessageHandler,
			BearingOClock			= BearingOClock}
}

WingmanContactHandler = {
	make = function(self, message)
		local country = message.sender:getUnit():getCountry()
		local distanceUnit = unitSystemByCountry[country].distance
		return 	self.sub.WingmanMessageHandler:make(message) + ' ' +
				self.sub.targetType:make(message.parameters.type) + ' ' +
				self.sub.BearingOClock:make(u.get_azimuth(message.parameters.dir)) + comma_space_ +
				self.sub.pfor:make() + ' ' +
				self.sub.Digits:make(u.round(u.get_lengthZX(message.parameters.dir) * distanceUnit.coeff + 0.5, 1))
	end,
	sub = {	WingmanMessageHandler	= WingmanMessageHandler,
			targetType				= Phrases:new({	{_('armor target'), 		'armor target'},
													{_('air defence target'), 	'air defence target'},
													{_('target'), 				'target'}}),
			BearingOClock			= BearingOClock,
			pfor					= Phrase:new({_('for'), 'for'}),
			Digits					= Digits}
}

airdromeNames = {}
do
	for moduleIndex, airdromeNameVariant in base.pairs(airdromeNameVariants) do
		airdromeNames[airdromeNameVariant] = {}
	end
end

AirbaseName = {
	make = function(self, comm, airdromeNameVariant)
		local airbaseCategory = comm:getUnit():getDesc().category
		if airbaseCategory == base.Airbase.Category.AIRDROME then
			return self.sub[airbaseCategory]:make(comm:getUnit(), comm:getCallsign(), airdromeNameVariant)
		elseif airbaseCategory == base.Airbase.Category.HELIPAD then
			return self.sub[airbaseCategory]:make(comm:getUnit(), comm:getCallsign())
		else
			return _('Ship')
		end		
	end,
	sub = {
		[base.Airbase.Category.AIRDROME]	= {
			make = function(self, pUnit, callsign, airdromeNameVariant)
				local names = 	(airdromeNames[airdromeNameVariant] ~= nil and airdromeNames[airdromeNameVariant][callsign] ~= nil) and
									self.sub[airdromeNameVariant]
								or
									self.sub[defaultModuleName]
				return names:make(callsign)
			end,
			sub = {}
		},		
		[base.Airbase.Category.HELIPAD]		= UnitCallname:new('Helipad', false, nil, 'Callsign')
	}
}
do
	for moduleIndex, airdromeNameVariant in base.pairs(airdromeNameVariants) do
		AirbaseName.sub[base.Airbase.Category.AIRDROME].sub[airdromeNameVariant] = Phrases:new(airdromeNames[airdromeNameVariant], 'Callsign')
	end
end

ATCToLeaderHandler = {
	make = function(self, message, language)
		return 	self.sub.PlayerAircraftCallsign:make(message.receiver) + comma_space_ +
				self.sub.AirbaseName:make(message.sender, getAirdromeNameVariant(language)) +
				comma_space_ + Event:make(message.event)
	end,
	sub = { AirbaseName				= AirbaseName,
			PlayerAircraftCallsign	= PlayerAircraftCallsign }
}

ToWingmen = {
	make = function(self, message)
		base.assert(message.parameters and message.parameters.whom and message.parameters.whom > 0 and message.parameters.whom <= 5)
		local whom = message.parameters.whom
		local result = p.start()
		if whom == 5 then
			return self.sub.flight:make()
		elseif whom == 4 then
			return self.sub.toWingmen:make(2)
		else
			return self.sub.toWingmen:make(whom)
		end
	end,
	sub = {
		toWingmen	= Phrases:new({	{_('to 2'), 	'to 2'},
									{_('to 3'), 	'to 3'},
									{_('to 4'), 	'to 4'}}),
		flight = Phrase:new({_('to flight'), 'to flight'})
	}
}

Direction = {
	make = function(self, dir, country)
		local distanceUnit = unitSystemByCountry[country].distance
		return 	self.sub.Digits:make(u.round(u.get_azimuth(dir) * u.units.deg.coeff, 1), '%03d') + ' ' +
				self.sub.pfor:make() + ' ' + self.sub.Number:make(u.adv_round(u.get_lengthZX(dir) * distanceUnit.coeff, 1))
	end,
	sub = {
		Digits	= Digits,
		Number	= Number,
		pfor	= Phrase:new({_('for'), 'for'})
	}
}

BullseyeCoords = {
	make = function(self, point, coalition, country)
		local bullsEye = base.coalition.getMainRefPoint(coalition)
		local bullsEyeDir = { x = point.x - bullsEye.x, y = point.y - bullsEye.y, z = point.z - bullsEye.z }
		return self.sub.atBulls:make() + ' ' + self.sub.Direction:make(bullsEyeDir, country)
	end,
	sub = { atBulls		= PhraseRandom:new({{_('at bulls'),		'at bulls'},
											{_('at bullseye'),	'at bullseye'}}),
			Direction	= Direction	}
}

Altitude = {
	make = function(self, alt, country, accuracy)
		base.assert(alt > 0.0)
		local altitudeUnit = unitSystemByCountry[country].altitude
		return self.sub.at:make() + ' ' + self.sub.Number:make(u.adv_round(alt * altitudeUnit.coeff, accuracy or 1.0))
	end,
	sub = {	at		= Phrase:new({_('at altitude'), 'at'}),
			Number	= Number }
}

--AWACS

ClientAndAWACSHandler = {
	make = function(self, message, direction, useIndex)
		if direction  then
			return self.sub.AWACSCallsign:make(message.receiver, useIndex) + comma_space_ + self.sub.PlayerAircraftCallsign:make(message.sender, useIndex) + comma_space_ + Event:make(message.event)
		else
			return self.sub.PlayerAircraftCallsign:make(message.receiver, useIndex) + comma_space_ + self.sub.AWACSCallsign:make(message.sender, useIndex) + comma_space_ + Event:make(message.event)
		end
	end,
	sub = {	PlayerAircraftCallsign	= PlayerAircraftCallsign,
			AWACSCallsign 			= {
										make = function(self, pComm, useIndex)
											if hasNumericCallsign(pComm:getUnit():getCountry()) then
												local callsign = pComm:getCallsign()
												if useIndex then
													return self.sub.Index:make(callsign)
												else
													return self.sub.Digits:make(callsign)
												end
											else											
												return self.sub.AWACSCallname:make(pComm:getUnit(), base.math.floor(pComm:getCallsign() / 100))
											end
										end,
										sub = { AWACSCallname = UnitCallname:new('AWACS', false, nil, 'Callsign'),
												Digits = Digits,
												Index = Index },
									}	
		}
}

ClientToAWACSHandler = {
	make = function(self, message, language)
		return self.sub.ClientAndAWACSHandler:make(message, true, language == 'RUS')
	end,
	sub = { ClientAndAWACSHandler = ClientAndAWACSHandler }
}

AWACSToClientHandler = {
	make = function(self, message, language)
		return self.sub.ClientAndAWACSHandler:make(message, false, language == 'RUS')
	end,
	sub = { ClientAndAWACSHandler = ClientAndAWACSHandler }
}

AWACSTargetBullseye = {
	make = function(self, target, bullsEyeForCoalition, country)
		return 	self.sub.BullseyeCoords:make(target.point, bullsEyeForCoalition, country) +
				comma_space_ + self.sub.Altitude:make(target.altitude, country, 500)
	end,
	sub = {	Number			= Number,
			BullseyeCoords	= BullseyeCoords,
			Altitude		= Altitude }
}

AWACSTargetDir = {
	make = function(self, target, receiver, country)
		local aspects = {
			self.sub.cold,
			self.sub.hot,
			self.sub.flanking	
		}
		local receiverPos = receiver:getUnit():getPosition().p
		local dir = {	x = target.point.x - receiverPos.x,
						y = target.point.y - receiverPos.y,
						z = target.point.z - receiverPos.z }
		return 	self.sub.Direction:make(dir, country) + comma_space_ + self.sub.Altitude:make(target.altitude, country, 500) +
				comma_space_ + aspects[target.aspect]:make()					
	end,
	sub = {	Number			= Number,
			Direction		= Direction,
			Altitude		= Altitude,
			cold			= Phrase:new({_('cold'),		'cold'}),
			hot				= Phrase:new({_('hot'),			'hot'}),
			flanking		= Phrase:new({_('flanking'),	'flanking'}) }
}

AWACSbanditBearingHandler = {
	make = function(self, message, language)
		local pUnit = message.sender:getUnit()
		return 	self.sub.AWACSToClientHandler:make(message, language) + comma_space_ +
				self.sub.AWACSTargetDir:make(message.parameters, message.receiver, pUnit:getCountry())
	end,
	sub = {	AWACSToClientHandler	= AWACSToClientHandler,
			AWACSTargetDir			= AWACSTargetDir }
}

--Flight

do

local armor		= {_('_armor'), 	'armor'}
local utility	= {_('_utility'), 	'utility'}
local ship		= {_('_ship'), 		'ship'}
local bandit	= {_('_bandit'), 	'bandit'}

TargetShortDescription = {
	make = function(self, targetDesc, level, coalition, country)
		local level = base.math.min(level, #targetDesc.type)
		return self.sub.targetType:make(targetDesc.type[level] + 1) + ' ' + self.sub.BullseyeCoords:make(targetDesc.point, coalition, country)
	end,
	sub = {
		BullseyeCoords	= BullseyeCoords,
		targetType		= Phrases:new({	{_('_ground targets'),	'ground targets'},
										{_('_vehicles'),		'vehicles'},
										armor,
										{_('_infantry'),		'infantry'},
										armor,
										armor,
										armor,
										armor,
										{_('_artillery'),		'artillery'},
										utility,
										utility,
										utility,
										{_('_bunker'),			'bunker'},
										{_('_radar'),			'radar'},
										{_('_AAA'),				'AAA',		 'tripple A',		_('tripple A') },
										{_('_SAM'), 			'SAM'},
										ship,
										ship,
										ship,
										ship,
										ship,
										ship,
										ship,
										ship,
										bandit,
										bandit,
										bandit}, 'Target')
	}
}

end

AirGroupCallsign = {
	make = function(self, pComm, useIndex)
		if pComm == nil then
			return p.start()
		end
		local pUnit = pComm:getUnit()
		local callsign = pComm:getCallsign()
		local callsign2 = pUnit:getCallsign()
		if callsign2 == "" then
			return p.start()
		end
		base.assert(callsign ~= nil)
		if hasNumericCallsign(pUnit:getCountry()) then
			base.assert(base.type(callsign) == 'number')
			if useIndex then
				return self.sub.Index:make(callsign)
			else
				return self.sub.Digits:make(callsign)
			end
		else
			base.assert(pUnit ~= nil)
			local groupName, flightNum, aircraftNum = encodeCallsign(callsign)
			if isHeavyAircraft(pUnit) then
				if pUnit:hasAttribute('AWACS') then
					return self.sub.AWACSCallname:make(pUnit, groupName)
				else
					if pUnit:hasAttribute('Tankers') then
						return self.sub.TankerCallname:make(pUnit, groupName)
					else
						return self.sub.AirGroupCallname:make(pUnit, groupName)
					end
				end
			else
				return self.sub.AirGroupCallname:make(pUnit, groupName) + ' ' + self.sub.Digits:make(flightNum)
			end	
		end	
	end,
	sub = { AirGroupCallname	= UnitCallname:new('Air', true, {'A-10A', 'A-10C'}, 'Callsign'),
			AWACSCallname		= UnitCallname:new('AWACS', true, {'A-10A', 'A-10C'}, 'Callsign'),
			TankerCallname		= UnitCallname:new('Tankers', true, {'A-10A', 'A-10C'}, 'Callsign'),
			Index				= Index,
			Digits 				= Digits }
}

FlightMessageHandler = {
	make = function(self, message, language)
		return self.sub.AirGroupCallsign:make(message.sender, language == 'RUS') + comma_space_ + Event:make(message.event)
	end,
	sub = {	AirGroupCallsign	= AirGroupCallsign }
}

PassingWaypointHandler = {
	make = function(self, message, language)
		return 	self.sub.FlightMessageHandler:make(message, language) + ' ' +
				self.sub.Number:make(message.parameters.waypoint) + ' ' +
				self.sub.Altitude:make(message.parameters.altitude, message.sender:getUnit():getCountry())
	end,
	sub = {	FlightMessageHandler	= FlightMessageHandler,
			Number					= Number,
			Altitude				= Altitude }
}

OnStationHandler = {
	make = function(self, message, language)
		return 	self.sub.FlightMessageHandler:make(message, language) + ' ' +
				self.sub.BullseyeCoords:make(message.parameters.point, message.sender:getUnit():getCoalition(), message.sender:getUnit():getCountry()) +
				' ' + self.sub.Altitude:make(message.parameters.altitude, message.sender:getUnit():getCountry(), message.sender:getUnit():getCountry())
	end,
	sub = { FlightMessageHandler	= FlightMessageHandler,
			BullseyeCoords			= BullseyeCoords,
			Altitude				= Altitude}
}

DepartingWaypointHandler = {
	make = function(self, message, language)
		return	self.sub.FlightMessageHandler:make(message, language) + ' ' + self.sub.Number:make(message.parameters.waypoint) + ' ' +
				self.sub.Altitude:make(message.parameters.altitude, message.sender:getUnit():getCountry())
	end,
	sub = {	FlightMessageHandler	= FlightMessageHandler,
			Number					= Number,
			Altitude				= Altitude}
}

TargetHandler = {
	make = function(self, message, language)
		return 	self.sub.FlightMessageHandler:make(message, language) + ' ' +
				self.sub.TargetShortDescription:make(message.parameters.targetDesc, 3, message.sender:getUnit():getCoalition(), message.sender:getUnit():getCountry())
	end,
	sub = { FlightMessageHandler	= FlightMessageHandler,
			TargetShortDescription	= TargetShortDescription }
}

EngagingHandler = {
	make = function(self, message, language)
		return 	self.sub.FlightMessageHandler:make(message, language) + ' ' +
				self.sub.FromCompassDirection8:make(u.get_azimuth(message.parameters.back_dir)) + comma_space_ +
				self.sub.engaging:make() + ' ' +
				self.sub.TargetShortDescription:make(message.parameters.targetDesc, 3, message.sender:getUnit():getCoalition(), message.sender:getUnit():getCountry())
	end,
	sub = { FlightMessageHandler	= FlightMessageHandler,
			FromCompassDirection8	= FromCompassDirection8,
			engaging				= Phrase:new({_('engaging'), 'engaging'}),
			TargetShortDescription	= TargetShortDescription }
}

BanditHandler = {
	make = function(self, message, language)
		return 	self.sub.FlightMessageHandler:make(message, language) + ' ' +
				self.sub.BullseyeCoords:make(message.parameters.point, message.sender:getUnit():getCoalition(), message.sender:getUnit():getCountry()) + comma_space_ +
				self.sub.Altitude:make(message.parameters.altitude, message.sender:getUnit():getCountry())
	end,
	sub = { FlightMessageHandler	= FlightMessageHandler,
			BullseyeCoords			= BullseyeCoords,
			Altitude				= Altitude}
}

RTBHandler = {
	make = function(self, message, language)
		return 	self.sub.FlightMessageHandler:make(message, language) + ' ' +
				self.sub.Altitude:make(message.parameters.altitude, message.sender:getUnit():getCountry())
	end,
	sub = { FlightMessageHandler	= FlightMessageHandler,
			Altitude				= Altitude}
}

MemberDownHandler = {
	make = function(self, message, language)
		return 	self.sub.FlightMessageHandler:make(message, language) + ' ' +
				self.sub.BullseyeCoords:make(message.parameters.point, message.sender:getUnit():getCoalition(), message.sender:getUnit():getCountry()) +
				'. ' + self.sub.requestCSAR:make() + '. '
	end,
	sub = { FlightMessageHandler	= FlightMessageHandler,
			BullseyeCoords			= BullseyeCoords,
			requestCSAR				= Phrase:new({_('Request CSAR'), 'Request CSAR'})}
}

handlersTable = {
	--PLAYER -> WINGMAN
	[base.Message.wMsgLeaderMakeRecon] = {
		make = function(self, message)
			return 	self.sub.ToWingmen:make(message) + comma_space_ + Event:make(message.event) +
					space_ + self.sub.distance:make(u.round(message.parameters.range * u.units.km.coeff, 1)) +
					comma_space_ + self.sub.bearing:make() + ' ' + self.sub.Digits:make(message.parameters.bearing * u.units.deg.coeff, '%03d')
		end,
		sub = {	ToWingmen = ToWingmen,
				distance = Phrases:new({[1] = {_('1 km'), '1 km'},
										[2] = {_('2 km'), '2 km'},
										[3] = {_('3 km'), '3 km'},
										[5] = {_('5 km'), '5 km'},
										[8] = {_('8 km'), '8 km'},
										[10] = {_('10 km'), '10 km'}} ),
				bearing = Phrase:new({_('bearing'), 'bearing'}),
				Digits = Digits }
	},
	--WINGMAN -> PLAYER	
	[base.Message.wMsgWingmenCopy] = {
		make = function(self, message)
			return 	self.sub.WingmanMessageHandler:make(message) + ' ' + self.sub.report:make()
		end,
		sub = {	WingmanMessageHandler	= WingmanMessageHandler,				
				report					= PhraseRandom:new({{_('copy'),		'copy'},
															{_('roger'),	'roger'},
															{_('affirm'),	'affirm'}}) }
	},
	[base.Message.wMsgWingmenNegative] = {
		make = function(self, message)
			return 	self.sub.WingmanMessageHandler:make(message) + ' ' + self.sub.report:make()
		end,
		sub = {	WingmanMessageHandler	= WingmanMessageHandler,				
				report					= PhraseRandom:new({{_('unable'),			'unable'},
															{_('negative'),			'negative'}}) }
	},	
	[base.Message.wMsgWingmenRadarContact]			= {
		make = function(self, message)
			return 	self.sub.WingmanMessageHandler:make(message) + ' ' + 
					self.sub.BearingAndRange:make(message.parameters.dir, message.sender:getUnit():getCountry())
		end,
		sub = {	WingmanMessageHandler	= WingmanMessageHandler,
				BearingAndRange			= BearingAndRange}
	},
	[base.Message.wMsgWingmenContact]				= WingmanContactHandler,
	[base.Message.wMsgWingmenHelReconBearing]		= WingmanContactHandler,
	[base.Message.wMsgWingmenTallyBandit]			= WingmanBearingHandler,
	[base.Message.wMsgWingmenNails]					= WingmanBearingHandler,
	[base.Message.wMsgWingmenSpike]					= WingmanBearingHandler,
	[base.Message.wMsgWingmenMudSpike]				= WingmanBearingHandler,
	[base.Message.wMsgWingmenSAMLaunch]				= WingmanBearingHandler,
	[base.Message.wMsgWingmenMissileLaunch]			= WingmanBearingHandler,
	[base.Message.wMsgWingmenTargetDestroyed] = {
		make = function(self, message)
			local result = self.sub.WingmanMessageHandler:make(message) + ' '
			if message.sender:getUnit():hasAttribute("Helicopters") then
				result = result + self.sub.reportHelicopter:make()
			else
				result = result + self.sub.reportAirplane:make()
			end
			return result
		end,
		sub = {	WingmanMessageHandler	= WingmanMessageHandler,				
				reportAirplane			= PhraseRandom:new({{_('target destroyed'),			'target destroyed'},
															{_('rounds on target'),			'rounds on target'}}),
				reportHelicopter		= PhraseRandom:new({{_('shack'),					'shack'},
															{_('rounds on target'),			'rounds on target'},
															{_('good hits on target'),		'good hits on target'},
															{_('target hit'),				'target hit'} }) }
	},
	-- ATC2
	[base.Message.wMsgWingmenFlightCheckInPositive] = {
		make = function(self, message)
			return 	self.sub.WingmanMessageHandler:make(message) + ' ' + self.sub.report:make()
		end,
		sub = {	WingmanMessageHandler	= WingmanMessageHandler,				
				report					= PhraseRandom:new({{_('roger'),	'roger'},
															{_('roger'),	'roger'} }) }
	},
	--ATC -> PLAYER
	[base.Message.wMsgATCClearedForEngineStartUp]	= {
		make = function(self, message, language)
			local wind = self.sub.Wind:make(message.parameters.wind)
			return self.sub.ATCToLeaderHandler:make(message, language) + (wind ~= nil and (comma_space_ + wind) or '')
		end,
		sub = { ATCToLeaderHandler = ATCToLeaderHandler, Wind = Wind }
	},
	[base.Message.wMsgATCClearedToTaxiRunWay]		= {
		make = function(self, message, language)
			return self.sub.ATCToLeaderHandler:make(message, language) + space_ + self.sub.Digits:make(message.parameters.runway)
		end,
		sub = { ATCToLeaderHandler = ATCToLeaderHandler, Digits = Digits }
	},
	[base.Message.wMsgATCYouAreClearedForTO]		= {
		make = function(self, message, language)
			local aircraftType = message.receiver:getUnit():getTypeName()
			return 	self.sub.ATCToLeaderHandler:make(message, language) + comma_space_ +
					self.sub.climb300AtQFE:make() + space_ + self.sub.Pressure:make(message.parameters.pressure, aircraftType, '%.2f')
		end,
		sub = {	ATCToLeaderHandler	= ATCToLeaderHandler,
				Runway			= Runway,
				climb300AtQFE	= Phrase:new({_('climb 300 at QFE'), 'climb 300 at QFE', 'climb three hundred at Qu eF E'}),
				Pressure		= Pressure }
	},	
	[base.Message.wMsgATCTrafficBearing]			= nil,
	[base.Message.wMsgATCYouAreClearedForLanding]	= {
		make = function(self, message, language)
			local wind = self.sub.Wind:make(message.parameters.wind)
			return 	self.sub.ATCToLeaderHandler:make(message, language) +
					(message.parameters.runway ~= nil and (comma_space_ + self.sub.Runway:make(message.parameters.runway)) or '') +
					(wind ~= nil and (comma_space_ + wind) or '')
		end,	
		sub = {	ATCToLeaderHandler	= ATCToLeaderHandler,
				Runway				= Runway,
				Wind				= Wind}
	},
	[base.Message.wMsgATCAzimuth]					= {
		make = function(self, message, language)
				return 	self.sub.PlayerAircraftCallsign:make(message.receiver) + comma_space_ +
						self.sub.AirbaseName:make(message.sender, getAirdromeNameVariant(language)) +
						Event:make(message.event) + ' ' +
						self.sub.Digits:make(u.round(u.get_azimuth(message.parameters.direction) * u.units.deg.coeff, 1))
		end,
		sub = {	AirbaseName				= AirbaseName,
				PlayerAircraftCallsign	= PlayerAircraftCallsign,
				Digits					= Digits}
	},
	[base.Message.wMsgATCFlyHeading]				= {
		make = function(self, message, language)
			local country = message.receiver:getUnit():getCountry()
			local aircraftType = message.receiver:getUnit():getTypeName()
			return 	self.sub.ATCToLeaderHandler:make(message, language) + space_ + self.sub.BearingAndRange:make(message.parameters.direction, country) +
					comma_space_ + self.sub.QFE:make() + space_ + self.sub.Pressure:make(message.parameters.pressure, aircraftType, '%.2f') + comma_space_ +
					(message.parameters.runway ~= nil and (self.sub.Runway:make(message.parameters.runway) + comma_space_) or '') +
					self.sub.toPatternAlt:make()
		end,
		sub = {	ATCToLeaderHandler	= ATCToLeaderHandler,
				BearingAndRange		= BearingAndRange,
				Runway				= Runway,
				QFE					= Phrase:new({_('QFE'), 'QFE', 'Qu eF E'}),
				Pressure			= Pressure,
				toPatternAlt		= Phrase:new({_('to pattern altitude'), 'to pattern altitude', 'to pattern altitude two thousand'}) }
	},
	[base.Message.wMsgATCClearedControlHover]		= {
		make = function(self, message, language)
			local wind = self.sub.Wind:make(message.parameters.wind)
			return self.sub.ATCToLeaderHandler:make(message, language) + (wind ~= nil and (comma_space_ + wind) or '')
		end,
		sub = {	ATCToLeaderHandler	= ATCToLeaderHandler,
				Wind				= Wind }
	},
	[base.Message.wMsgATCCheckLandingGear]			= {
		make = function(self, message, language)
			local wind = self.sub.Wind:make(message.parameters.wind)
			return	self.sub.ATCToLeaderHandler:make(message, language) + (wind ~= nil and (comma_space_ + wind) or '') +
					(message.parameters.runway ~= nil and (comma_space_ + self.sub.Runway:make(message.parameters.runway)) or '')
		end,
		sub = { ATCToLeaderHandler	= ATCToLeaderHandler,
				Runway				= Runway,
				Wind				= Wind }
	},
	[base.Message.wMsgATCFlightCheckIn]	= {
		make = function(self, message, language)
			local wind = self.sub.Wind:make(message.parameters.wind)
			return self.sub.ATCToLeaderHandler:make(message, language) + (wind ~= nil and (comma_space_ + wind) or '')
		end,
		sub = { ATCToLeaderHandler = ATCToLeaderHandler, Wind = Wind }
	},
	--PLAYER -> GROUND CREW
	[base.Message.wMsgLeaderGroundToggleElecPower] = {
		make = function(self, message)
			if message.parameters.on then
				return self.sub.on:make()
			else
				return self.sub.off:make()
			end
		end,
		sub = { on	= Phrase:new({_('request to turn on ground power'),		'request to turn on ground power'}),
				off	= Phrase:new({_('request to turn off ground power'),	'request to turn off ground power'}) }
	},
	[base.Message.wMsgLeaderGroundToggleWheelChocks] = {
		make = function(self, message)
			if message.parameters.on then
				return self.sub.on:make()
			else
				return self.sub.off:make()
			end
		end,
		sub = { on	= Phrase:new({_('request to place wheel chocks'),	'request to place the wheel chocks'}),
				off	= Phrase:new({_('request to remove wheel chocks'),	'request to remove wheel chocks'}) }
	},
	[base.Message.wMsgLeaderGroundToggleCanopy] = {
		make = function(self, message)
			if message.parameters.on then
				return self.sub.on:make()
			else
				return self.sub.off:make()
			end
		end,
		sub = { on	= Phrase:new({_('request to open canopy'),	'open the canopy'}),
				off	= Phrase:new({_('request to close canopy'),	'close the canopy'}) }
	},
	[base.Message.wMsgLeaderGroundToggleAir] = {
		make = function(self, message)
			if message.parameters.on then
				return self.sub.on:make()
			else
				return self.sub.off:make()
			end
		end,
		sub = { on	= Phrase:new({_('request to connect ground air supply'),	'request to connect ground air supply'}),
				off	= Phrase:new({_('request to disconnect ground air supply'),	'request to disconnect ground air supply'}) }
	},
	[base.Message.wMsgLeaderGroundApplyAir] = {
		make = function(self, message)
			if message.parameters.on then
				return self.sub.on:make()
			end
		end,
		sub = { on	= Phrase:new({_('request to apply air'),	'request to apply air'}),
			  }
	},
	[base.Message.wMsgLeaderSpecialCommand] = {
		make = function(self, message)	
			if 	   message.parameters.type == 7   then  		return self.sub.ladder:make()-- fix alert message when stow ladder was called
			elseif message.parameters.type == 9   then  		return self.sub.INERTIAL_STARTER:make()
			elseif message.parameters.type == 5   then  		
				if message.parameters.power_source == 0 then	return self.sub.USE_TURBO:make()
				else											return self.sub.USE_REGULAR:make()
				end
			elseif message.parameters.type   == 4 then
				if message.parameters.device == 0 then			return self.sub.HMS:make()
				else											return self.sub.NVG:make()
				end
			else
				return self.sub[message.parameters.name][message.parameters.value]:make()
			end
		end,		
		sub = {
			['EPPU'] = {
				sub = {
					[true]	= Phrase:new({_('request to turn on EPPU'),		'request to turn on EPPU'}),
					[false]	= Phrase:new({_('request to turn off EPPU'),	'request to turn off EPPU'}),
				}
			},
			ladder = Phrase:new({_('request to stow boarding ladder'),	'request to stow boarding ladder'}),
			HMS    = Phrase:new({_('request HMD installation'),	'request HMD installation'}),
			NVG    = Phrase:new({_('request NVG installation'),	'request NVG installation'}),
			USE_TURBO      = Phrase:new({_('request to turn on turbo-gear'),	'request to turn on turbo-gear'}),
			USE_REGULAR    = Phrase:new({_('request to turn off turbo-gear'),	'request to turn off turbo-gear'}),			
			INERTIAL_STARTER   = Phrase:new({_('run inertial starter'),	'Run the starter'}),
		}
	},
	--GROUND CREW -> PLAYER
	[base.Message.wMsgGroundDone] = {
		make = function(self, message)
			return self.sub[message.parameters.name][message.parameters.value]:make()
		end,		
		sub = {
			['EPPU'] = {
				sub = {
					[true]	= Phrase:new({_('EPPU is now on'),	'EPPU is now on'}),
					[false]	= Phrase:new({_('EPPU is now off'),	'EPPU is now off'}),
				}
			}
		}
	},

	--AI flight
	[base.Message.wMsgFlightAirbone]				= FlightMessageHandler,
	[base.Message.wMsgFlightPassingWaypoint] 		= PassingWaypointHandler,
	[base.Message.wMsgFlightOnStation]				= OnStationHandler,
	[base.Message.wMsgFlightDepartingStation]		= DepartingWaypointHandler,	
	[base.Message.wMsgFlightTallyBandit]			= BanditHandler,
	[base.Message.wMsgFlightTally] 					= TargetHandler,
	[base.Message.wMsgFlightEngagingBandit]			= BanditHandler,
	[base.Message.wMsgFlightEngaging] 				= EngagingHandler,
	[base.Message.wMsgFlightSplashBandit]			= BanditHandler,
	[base.Message.wMsgFlightTargetDestroyed]		= TargetHandler,
	[base.Message.wMsgFlightDefensive] 				= TargetHandler,
	[base.Message.wMsgFlightRTB]					= RTBHandler,
	[base.Message.wMsgFlightMemberDown]				= MemberDownHandler,
}

handlersTable_mt = {
	__index = handlersTable
}

LeaderToATCHandler = {
	make = function(self, message, language)
		return 	self.sub.AirbaseName:make(message.receiver, getAirdromeNameVariant(language)) +
				comma_space_ + self.sub.PlayerAircraftCallsign:make(message.sender, language == 'RUS') + comma_space_ + Event:make(message.event)
	end,
	sub = { PlayerAircraftCallsign	= PlayerAircraftCallsign,
			AirbaseName				= AirbaseName }
}

SimpleHandler = {
	make = function(self, message)
		return Event:make(message.event)
	end
}

rangeHandlersTable = {
	{
		range = { base.Message.wMsgLeaderEngageGroundTargets, 	base.Message.wMsgLeaderEngageNavalTargets },
		handler = {
			make = function(self, message)
				local result = self.sub.ToWingmen:make(message) + comma_space_ + Event:make(message.event)
				if message.parameters.atSPI then
					result = result + space_ + self.sub.atMySPI:make()
				end
				if message.parameters.weaponType ~= nil then
					result = result + comma_space_ + self.sub.Weapon:make(message.parameters.weaponType)
				end
				if message.parameters.atSPI then
					if message.parameters.direction then
						result = result + space_ + self.sub.FromCompassDirection8:make(message.parameters.direction)
					end
				end				
				return result 
			end,
			sub = {
				atMySPI					= Phrase:new({_('at my SPI'),	'at my SPI'}),
				ToWingmen				= ToWingmen,
				FromCompassDirection8	= FromCompassDirection8,				
				Weapon 					= Phrases:new( { 	{_('with missiles'), 		'with missiles'},
															{_('with unguided bombs'), 	'with unguided bombs'},
															{_('with guided bombs'), 	'with guided bombs'},
															{_('with rockets'), 		'with rockets'},
															{_('with markers'), 		'with markers'},
															{_('with guns'),			'with guns'}
														}, 
														'Weapon' )
			}
		}
	},
	--PLAYER -> WINGMAN
	{
		range = { base.Message.wMsgLeaderToWingmenNull, 		base.Message.wMsgLeaderToWingmenMaximum },
		handler = {
			make = function(self, message)
				return self.sub.ToWingmen:make(message) + comma_space_ + Event:make(message.event)
			end,
			sub = { ToWingmen = ToWingmen }
		}
	},
	--WINGMAN -> PLAYER
	{
		range = { base.Message.wMsgWingmenNull,					base.Message.wMsgWingmenMaximum },
		handler = WingmanMessageHandler
	},
	--PLAYER -> ATC
	{
		range = { base.Message.wMsgLeaderToATCNull,				base.Message.wMsgLeaderToATCMaximum },
		handler = LeaderToATCHandler
	},	
	--ATC -> PLAYER
	{
		range = { base.Message.wMsgATCNull, 					base.Message.wMsgATCMaximum },
		handler = {
			make = function(self, message)
				return self.sub.PlayerAircraftCallsign:make(message.receiver) + comma_space_ + Event:make(message.event)
			end,
			sub = { PlayerAircraftCallsign = PlayerAircraftCallsign }
		}		
	},
	--BETTY
	{
		range = { base.Message.wMsgBettyNull, 					base.Message.wMsgBettyMaximum },
		handler = SimpleHandler
	},
	--ALMAZ
	{
		range = { base.Message.wMsgALMAZ_Null, 					base.Message.wMsgALMAZ_Maximum },
		handler = SimpleHandler
	},
	--RI65
	{
		range = { base.Message.wMsgRI65_Null, 					base.Message.wMsgRI65_Maximum },
		handler = SimpleHandler
	},
	--AutopilotAdjustment
	{
		range = { base.Message.wMsgAutopilotAdjustment_Null, 	base.Message.wMsgAutopilotAdjustment_Maximum },
		handler = SimpleHandler
	},
	--ExternalCargo
	{
		range = { base.Message.wMsgExternalCargo_Null, 	base.Message.wMsgExternalCargo_Maximum },
		handler = SimpleHandler	
	},
	--Mi8 Checklist
	{
		range = { base.Message.wMsgMi8_Checklist_Null, 	base.Message.wMsgMi8_Checklist_Maximum },
		handler = SimpleHandler	
	},
	--Mi8 Procedures Messages
	{
		range = { base.Message.wMsgMi8_CrewProcedures_Null, 	base.Message.wMsgMi8_CrewProcedures_Maximum },
		handler = SimpleHandler	
	},
	--A-10 VMU
	{
		range = { base.Message.wMsgA10_VMU_Null, 				base.Message.wMsgA10_VMU_Maximum },
		handler = SimpleHandler
	},
	-- PLAYER -> GROUND CREW
	{
		range = {base.Message.wMsgLeaderToGroundCrewNull,		base.Message.wMsgLeaderToGroundCrewMaximum },
		handler = SimpleHandler
	},	
	--GROUND CREW -> PLAYER
	{
		range = {base.Message.wMsgGroundCrewNull,				base.Message.wMsgGroundCrewMaximum },
		handler = SimpleHandler
	}
}

function findRangeHandler(self, event)
	for i, v in base.pairs(self.rangeHandlersTable) do
		if v.range[1] <= event and event <= v.range[2]  then
			return v.handler
		end
	end
	for i, v in base.pairs(base.getfenv().rangeHandlersTable) do
		if v.range[1] <= event and event <= v.range[2]  then
			return v.handler
		end
	end	
	return nil
end

--Languages

local language = {
	RUS	= 'RUS',
	ENG	= 'ENG',
	GER	= 'GER',
	FR	= 'FR',
	SPA = 'SPA',
	CHN = 'CHN',--by uboats
}

local defaultLanguage = language.ENG

local languageByCountry = {
	[base.country.id.RUSSIA]		= language.RUS,
	[base.country.id.UKRAINE]		= language.RUS,
	[base.country.id.BELARUS]		= language.RUS,
	[base.country.id.USA]			= language.ENG,
	[base.country.id.UK]			= language.ENG,
	[base.country.id.GERMANY]		= language.GER,
	[base.country.id.FRANCE]		= language.FR,
	[base.country.id.SPAIN]			= language.SPA,
	[base.country.id.INSURGENTS]	= language.RUS,
	[base.country.id.ABKHAZIA]		= language.RUS,
	[base.country.id.SOUTH_OSETIA]	= language.RUS,	
	[base.country.id.ITALY]			= language.ENG,
	[base.country.id.AUSTRALIA]		= language.ENG,
	[base.country.id.SWITZERLAND]	= language.GER,
	[base.country.id.CHINA]			= language.CHN,--by uboats
	[base.country.id.THIRDREICH]	= language.GER,
	[base.country.id.YUGOSLAVIA]	= language.RUS,
	[base.country.id.USSR]			= language.RUS,
	[base.country.id.GORGAS] 		= language.ENG,
	
}

--Accents

local accent = base.country

local accentTable = {
	[language.ENG] = {
		[base.country.id.RUSSIA]			= accent.RUSSIA,
		[base.country.id.UKRAINE]			= accent.RUSSIA,
		[base.country.id.BELARUS]			= accent.RUSSIA,
		[base.country.id.USA]				= accent.USA,
		[base.country.id.TURKEY]			= accent.USA,
		[base.country.id.UK]				= accent.UK,
		[base.country.id.FRANCE]			= accent.FRANCE,
		[base.country.id.GERMANY]			= accent.GERMANY,
		[base.country.id.THIRDREICH]		= accent.GERMANY,
		[base.country.id.CANADA]			= accent.USA,
		[base.country.id.SPAIN]				= accent.SPAIN,
		[base.country.id.THE_NETHERLANDS]	= accent.GERMANY,
		[base.country.id.BELGIUM]			= accent.FRANCE,
		[base.country.id.NORWAY]			= accent.GERMANY,
		[base.country.id.DENMARK]			= accent.GERMANY,
		[base.country.id.ISRAEL]			= accent.USA,
		[base.country.id.GEORGIA]			= accent.USA,
		[base.country.id.INSURGENTS]		= accent.RUSSIA,
		[base.country.id.ABKHAZIA]			= accent.RUSSIA,
		[base.country.id.SOUTH_OSETIA]		= accent.RUSSIA,
		[base.country.id.ITALY]						= accent.USA,
		[base.country.id.ITALIAN_SOCIAL_REPUBLIC]	= accent.USA,
		[base.country.id.AUSTRALIA]			= accent.UK,
        [base.country.id.SWITZERLAND]		= accent.GERMANY,
		[base.country.id.CHINA]				= accent.CHINA,--by uboats
		[base.country.id.GORGAS] 		= accent.USA,
	}
}

role = {
	PLAYER		= 	{
						name = _('PLAYER'),
						dir = 'PLAYER',
						range = { base.Message.wMsgLeaderNull,  	base.Message.wMsgLeaderMaximum },
						singletone = true
					},
	WINGMAN		= 	{
						name = _('WINGMAN'),
						dir = 'WINGMAN',
						range = { base.Message.wMsgWingmenNull, 	base.Message.wMsgWingmenMaximum },
					},	
	ATC			= 	{
						name = _('ATC'),
						dir = 'ATC',
						range = { base.Message.wMsgATCNull, 		base.Message.wMsgATCMaximum },
					},	
	AWACS		= 	{
						name = _('AWACS'),
						dir = 'AWACS',
						range = { base.Message.wMsgAWACSNull,		base.Message.wMsgAWACSMaximum },
					},	
	TANKER		= 	{
						name = _('TANKER'),
						dir = 'TANKER',					
						range = { base.Message.wMsgTankerNull,		base.Message.wMsgTankerMaximum },
					},	
	JTAC		= 	{
						name = _('JTAC'),
						dir = 'JTAC',
						range = { base.Message.wMsgFACNull, 		base.Message.wMsgFACMaximum },
					},	
	CCC			= 	{
						name = _('CCC'),
						dir = 'CCC',					
						range = { base.Message.wMsgCCCNull, 		base.Message.wMsgCCCMaximum },
					},
	ALLIED_FLIGHT=	{
						name = _('Allied Flight'),
						dir = 'Allied Flight',
						range = { base.Message.wMsgFlightNull, 		base.Message.wMsgFlightMaximum },
					},	
	BETTY		= 	{
						name = _('BETTY'),
						dir = 'BETTY',						
						range = { base.Message.wMsgBettyNull,		base.Message.wMsgBettyMaximum },
						singletone = true
					},
	ALMAZ		=	{
						name = _('ALMAZ'),
						dir = 'ALMAZ',						
						range = { base.Message.wMsgALMAZ_Null,		base.Message.wMsgALMAZ_Maximum },
						singletone = true
					},
	RI65		=	{
						name = _('RI65'),
						dir = 'RI65',						
						range = { base.Message.wMsgRI65_Null,		base.Message.wMsgRI65_Maximum },
						singletone = true
					},					
	AutopilotAdjustment	=	{
						name = _('AutopilotAdjustment'),
						dir = '',						
						range = { base.Message.wMsgAutopilotAdjustment_Null,	base.Message.wMsgAutopilotAdjustment_Maximum },
						singletone = true
					},	
	ExternalCargo = {
						name = _('ExternalCargo'),
						dir = 'External Cargo',						
						range = { base.Message.wMsgExternalCargo_Null,	base.Message.wMsgExternalCargo_Maximum },
						singletone = true	
					},
	Mi8_Checklist	= 	{
						name = _('Mi-8 Checklist'),
						dir = '',						
						range = { base.Message.wMsgMi8_Checklist_Null,	base.Message.wMsgMi8_Checklist_Maximum },
						singletone = true
					},
	Mi8_CrewProcedures	= 	{
						name = _('Mi-8 Crew Procedures'),
						dir = '',						
						range = { base.Message.wMsgMi8_CrewProcedures_Null,	base.Message.wMsgMi8_CrewProcedures_Maximum },
						singletone = true
					},
	A10_VMU		= 	{
						name = _('A-10 VMU'),
						dir = 'A-10 VMU',						
						range = { base.Message.wMsgA10_VMU_Null,	base.Message.wMsgA10_VMU_Maximum },
						singletone = true
					},
	GROUND_CREW	= 	{
						name = _('Ground Crew'),
						dir = 'Ground Crew',
						range = { base.Message.wMsgGroundCrewNull,	base.Message.wMsgGroundCrewMaximum },
						singletone = true
					}
}

local speechRootDir = 'Sounds/Speech/Sound/'

do
	local lfs = base.require('lfs')

	local function findVoices(dir, tbl)
		local voiceCounter = 0
		while lfs.attributes(dir..(voiceCounter + 1)) do
			--base.print('\t\t\tvoice '..(voiceCounter + 1)..' found')
			voiceCounter = voiceCounter + 1
		end
		if voiceCounter > 0 then
			tbl.voices = voiceCounter
		end	
	end	
	
	local function findAccents(dir, tbl)
		local found = false
		for accentName, accentValue in base.pairs(accent) do
			local subDir = dir..accentName..'/'
			if lfs.attributes(subDir) ~= nil then
				found = true
				--base.print('\t\t\"'..accentName..'\" accent found')
				tbl.accents = tbl.accents or {}
				tbl.accents[accentValue] = {}				
				findVoices(subDir, tbl.accents[accentValue])
			end
		end
		if not found then
			findVoices(dir, tbl)
		end
	end
	
	local function findModules(dir, languageValue, roleDir, tbl)
		local iter, dir_obj = lfs.dir(dir..'/'..languageValue)
		local item = iter(dir_obj)
		while item ~= nil do
			if item ~= '.' and item ~= '..' then
				local attr = lfs.attributes(dir..'/'..languageValue..'/'..item)
				if attr.mode == 'directory' then
					local moduleName = item
					local subDir = dir..'/'..languageValue..'/'..moduleName..'/'..roleDir..'/'
					if lfs.attributes(subDir) ~= nil then						
						--base.print('\t\"'..moduleName..'\" - \"'..languageValue..'\" found')						
						local moduleTbl = nil
						if moduleName ~= nil then
							tbl.modules = tbl.modules or {}
							tbl.modules[moduleName] = tbl.modules[moduleName] or {}
							moduleTbl = tbl.modules[moduleName]
						end
						
						if moduleTbl.language ~= nil then
							moduleTbl.languages = {
								[moduleTbl.language] = {
									accents = moduleTbl.accents,
									voices = moduleTbl.voices
								},
								[languageValue] = {}
							}
							moduleTbl.language = nil
							moduleTbl.accents = nil
							moduleTbl.voices = nil
							findAccents(subDir, moduleTbl.languages[languageValue])
						elseif moduleTbl.languages ~= nil then
							moduleTbl.languages[languageValue] = {}
							findAccents(subDir, moduleTbl.languages[languageValue])
						else
							moduleTbl.language = languageValue
							findAccents(subDir, moduleTbl)
						end
					end
				end
			end
			item = iter(dir_obj)
		end
	end
		
	local function findLanguages(dir, roleDir, tbl)
		-- Modules + langugages or languages
		for languageIndex, languageValue in base.pairs(language) do
			findModules(dir, languageValue, roleDir, tbl)
		end
	end
	
	for roleIndex, roleTbl in base.pairs(role) do
		--base.print('\"'..roleTbl.dir..'\" role')
		findLanguages(speechRootDir, roleTbl.dir, roleTbl)
	end
end

function findRole(self, event)
	for roleName, roleData in base.pairs(self.role) do
		if event > roleData.range[1] and event < roleData.range[2] then
			return roleData
		end
	end
end

function getHandler(self, event)
	local handler = self.handlersTable[event]	
	if handler == nil then
		handler = self:findRangeHandler(event)
	end
	if handler == nil then
		handler = self.SimpleHandler
	end	
	return handler
end

function makeCaption(self, role, sender, airdromeNameVariant)
	local caption = ''
	if role.singletone then
		caption = role.name..': '
	else
		if sender then
			local callsignString = makeCallsignString_(sender, airdromeNameVariant)
			if callsignString ~= nil then
				caption = role.name..' ('..callsignString..'): '
			end
		end
	end
	return caption
end

local function getMessageLanguage(roleData, language)
	if roleData.languages ~= nil then
		if language ~= nil then
			if roleData.languages[language] ~= nil then
				return language
			end
		else
			return defaultLanguage
		end
	elseif roleData.language ~= nil then
		if language ~= nil then
			if roleData.language == language then
				return language
			end
		else
			return roleData.language
		end
	else
		return nil
	end
end

local function getMessageModuleAndLanguage(roleData, module, language)
	if roleData.modules[module] ~= nil then
		local messageLanguage = getMessageLanguage(roleData.modules[module], language)
		if messageLanguage ~= nil then
			return { module, messageLanguage }
		end
	end
end

function make(self, message)
	
	local role = self:findRole(message.event)
	base.assert(role ~= nil)
	
	local roleData = role
	
	--Country
	local country = getCountry(message)

	--Module & language
	local messageModuleName = nil
	local messageLanguage = nil
	local module = getModuleName(message)
	local desiredLanguage = languageByCountry[country]
	if 	module ~= nil and
		roleData.modules ~= nil then
		local messageModuleAndLanguage = 	getMessageModuleAndLanguage(roleData, module, desiredLanguage) or
											getMessageModuleAndLanguage(roleData, defaultModuleName, desiredLanguage) or
											getMessageModuleAndLanguage(roleData, module, nil) or
											getMessageModuleAndLanguage(roleData, defaultModuleName, nil)
		messageModuleName = messageModuleAndLanguage[1]
		messageLanguage = messageModuleAndLanguage[2]
		roleData = roleData.modules[messageModuleName]
	else
		messageLanguage = 	getMessageLanguage(roleData, desiredLanguage) or
							getMessageLanguage(roleData, nil)
	end
	if 	messageLanguage ~= nil and
		roleData.languages ~= nil then
		roleData = roleData.languages[messageLanguage]
	end
	
	--handler
	local handler = (message.parameters and message.parameters.simple) and self.SimpleHandler or self:getHandler(message.event)
	
	local result = handler:make(message, messageLanguage)
	
	if result == nil then
		return nil
	end

	result.directory = speechRootDir	
	
	--Module and language to path
	if messageLanguage ~= nil then
		result.directory = result.directory..messageLanguage..'/'
	end
	if messageModuleName ~= nil then
		result.directory = result.directory..messageModuleName..'/'
	end	
	
	--Role
	result.directory = result.directory..role.dir..'/'
	
	--Accent
	if roleData.accents ~= nil then
		local messageAccent = accentTable[messageLanguage][country] or accent.USA
		result.directory = result.directory..base.country.name[messageAccent]..'/'
		roleData = roleData.accents[messageAccent]
	end
	
	--Voice
	if 	roleData.voices ~= nil and
		roleData.voices > 0 then
		local voice = message.sender:getVoice()	or 1
		voice = base.math.fmod(voice, roleData.voices)
		if voice == 0 then
			voice = roleData.voices
		end
		result.directory = result.directory..base.tostring(voice)..'/'
	end
	
	--Sender caption for subtitles
	local caption = self:makeCaption(role, message.sender, getAirdromeNameVariant(messageLanguage))
	
	--Radio clicks
	if message.radio then
		p.addRadioClicks(result)
	end
	
	--Result
	result.subtitle = caption..result.subtitle
	return result
	
end	

--base.print('Speech.common modules loaded')