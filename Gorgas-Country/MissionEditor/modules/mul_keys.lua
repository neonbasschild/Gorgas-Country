local base = _G

module('mul_keys')

local require       = base.require

local i18n 				= require('i18n')
local DB                = require('me_db_api')

i18n.setup(_M)

function getDisplayName(a_type)
    if DB.isInitialized() == false then 
        return a_type
    end

    local unitTypeDesc = DB.unit_by_type[a_type]
    
    if unitTypeDesc and unitTypeDesc.DisplayName then
        return unitTypeDesc.DisplayName
    end
    return a_type
end

tabTr = {
    artillery_commander     =   _("Tactical_cmdr_mp","Tactical cmdr"),
    forward_observer        =   _("Forward_observer_mp","Forward observer"),  
    observer                =   _("Observer_mp","Observer"),
    instructor              =   _("Game_master_mp","Game master"),
    pilot                   =   _("Pilot_mp","Pilot"),
    pilot2                  =   _("Pilot2_mp","Pilot2"),
}

tabTask = {
    Nothing         = _("Nothing"),
    SEAD            = _("SEAD"),
    AntishipStrike  = _("AntishipStrike"),
    AWACS           =_("AWACS"),
    CAS             =_("CAS"),
    CAP             =_("CAP"),
    Escort          =_("Escort"),
    FighterSweep    =_("FighterSweep"),
    GAI             =_("GAI"),
    GroundAttack    =_("GroundAttack"),
    Intercept       =_("Intercept"),
    AFAC            =_("AFAC"),
    PinpointStrike  =_("PinpointStrike"),
    Reconnaissance  =_("Reconnaissance"),
    Refueling       =_("Refueling"),
    RunwayAttack    =_("RunwayAttack"),
    Transport       =_("Transport"),
}

tabCountries = {
["Russia"]	        =	_("sr_RUS","RUS"),
["Ukraine"]	        =	_("sr_UKR","UKR"),
["USA"]	            =	_("sr_USA","USA"),
["Turkey"]	        =	_("sr_TUR","TUR"),
["UK"]	            =	_("sr_UK","UK"),  
["France"]	        =	_("sr_FRA","FRA"),
["Germany"]	        =	_("sr_GER","GER"),
["USAF Aggressors"]	=	_("sr_AUSAF","AUSAF"),
["Canada"]	        =	_("sr_CAN","CAN"),
["Spain"]	        =	_("sr_SPN","SPN"),
["The Netherlands"]	=	_("sr_NETH","NETH"),
["Belgium"]	        =	_("sr_BEL","BEL"),
["Norway"]	        =	_("sr_NOR","NOR"),
["Denmark"]	        =	_("sr_DEN","DEN"),
["Israel"]	        =	_("sr_ISR","ISR"),
["Gorgas"]	        =	_("sr_GRG","GRG"),
["Insurgents"]	    =	_("sr_INS","INS"),
["Abkhazia"]	    =	_("sr_ABH","ABH"),
["South Ossetia"]	=	_("sr_RSO","RSO"),
["Italy"]	        =	_("sr_ITA","ITA"),
["Australia"]	    =	_("sr_AUS","AUS"),
["Switzerland"]	    =	_("sr_SUI","SUI"),
["Austria"]	        =	_("sr_AUT","AUT"),
["Belarus"]	        =	_("sr_BLR","BLR"),
["Bulgaria"]	    =	_("sr_BGR","BGR"),
["Czech Republic"]	=	_("sr_CZE","CZE"),
["China"]	        =	_("sr_CHN","CHN"),
["Croatia"]	        =	_("sr_HRV","HRV"),
["Egypt"]	        =	_("sr_EGY","EGY"),
["Finland"]	        =	_("sr_FIN","FIN"),
["Greece"]	        =	_("sr_GRC","GRC"),
["Hungary"]	        =	_("sr_HUN","HUN"),
["India"]	        =	_("sr_IND","IND"),
["Iran"]	        =	_("sr_IRN","IRN"),
["Iraq"]	        =	_("sr_IRQ","IRQ"),
["Japan"]	        =	_("sr_JPN","JPN"),
["Kazakhstan"]	    =	_("sr_KAZ","KAZ"),
["North Korea"]	    =	_("sr_PRK","PRK"),
["Pakistan"]	    =	_("sr_PAK","PAK"),
["Poland"]	        =	_("sr_POL","POL"),
["Romania"]	        =	_("sr_ROU","ROU"),
["Saudi Arabia"]	=	_("sr_SAU","SAU"),
["Serbia"]	        =	_("sr_SRB","SRB"),
["Slovakia"]	    =	_("sr_SVK","SVK"),
["South Korea"]	    =	_("sr_KOR","KOR"),
["Sweden"]	        =	_("sr_SWE","SWE"),
["Syria"]	        =	_("sr_SYR","SYR"),

["Yemen"]	        =	_("sr_YEM","YEM"),
["Vietnam"]	        =	_("sr_VNM","VNM"),
["Venezuela"]	    =	_("sr_VEN","VEN"),
["Tunisia"]	        =	_("sr_TUN","TUN"),
["Thailand"]	    =	_("sr_THA","THA"),
["Sudan"]	        =	_("sr_SDN","SDN"),
["Philippines"]	    =	_("sr_PHL","PHL"),
["Morocco"]	        =	_("sr_MAR","MAR"),
["Mexico"]	        =	_("sr_MEX","MEX"),
["Malaysia"]	    =	_("sr_MYS","MYS"),
["Libya"]	        =	_("sr_LBY","LBY"),
["Jordan"]	        =	_("sr_JOR","JOR"),
["Indonesia"]	    =	_("sr_IDN","IDN"),
["Honduras"]	    =	_("sr_HND","HND"),
["Ethiopia"]	    =	_("sr_ETH","ETH"),
["Chile"]	        =	_("sr_CHL","CHL"),
["Brazil"]	        =	_("sr_BRA","BRA"), 
["Bahrain"]	        =	_("sr_BHR","BHR"),
["Third Reich"]      =	_("sr_NZG","NZG"),
["Yugoslavia"]      =	_("sr_YUG","YUG"),
["USSR"]	        =	_("sr_SUN","SUN"),
["Italian Social Republic"]   =	_("sr_RSI","RSI"),
}