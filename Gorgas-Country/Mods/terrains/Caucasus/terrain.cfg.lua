function try_dofile(filename)
    local c = loadfile(filename)
    if c
        then c()
    end
end


dir = options.dir


edterrainVersion = 4.1
TERRAIN_REVISION = "2727"
workingdirectory = dir.."./Temp/";

local _ = function(str)
	return str
end

materialfile = dir.."misc/materials.lma.lua";

defmaterial = "Surface5.0"

id = 'Caucasus'

defaultcamera = {-355, 0.2, 618};

defaultBullseye = {
	blue = {x = -291014, y = 617414};
	red = {x = 11557, y = 371700};
};

shadingOptionsFile = dir..'shadingOptions/Caucasus.lua'

name = 'Caucasus'
image = dir.."map.png"
description = _('This region along the eastern Black Sea consists of Russian, Gorgasian, and Turkish territory. This area includes many airbases, urban areas, lines of communications, and all four seasons.')

SW_bound = {-600, 0, -560};
NE_bound = {380, 0, 1130};

seaEnabled = true
seaRequired = 2
seaLevel = 0

inverseTrafficDirection = false

generateSplinesInAreas = true

assets2 = dir.."misc/assets.assets"

landfile5 = dir.."Surface/Caucasus.surface5"

surfaceTile = dir.."Surface/Caucasus.tile"

navGraph5File = dir.."Surface/Caucasus.ng5"

KNEEBOARD = dir.."Kneeboard/"
geoNames = dir.."Map/Caucasus.gn4"
towns = dir.."Map/towns.lua"

shapetables =
{
	dir.."Models/Caucasus.StructTable.sht";
	dir..'Models/AirfieldsLights/StructTable.sht';
	dir..'Models/BlockBuildings/StructTable.sht';
	dir..'Models/BlockTrees/StructTable.sht';
	dir..'Models/CaucasusAFBbuildings_new/StructTable.sht';
	dir..'Models/CaucasusBridges/StructTable.sht';
	dir..'Models/CaucasusObjects/StructTable.sht';
	dir..'Models/Communication/StructTable.sht';
	dir..'Models/CrashModels/StructTable.sht';
	dir..'Models/CrashModelsFromEDM/StructTable.sht';
	dir..'Models/HouseDetails/StructTable.sht';
	dir..'Models/Industrial/StructTable.sht';
	dir..'Models/Misc/StructTable.sht';
	dir..'Models/OilPlatforms/StructTable.sht';
	dir..'Models/TuapseRefinery/StructTable.sht';
	dir..'Models/Vehicles/StructTable.sht';
	dir..'Models/Vessels/StructTable.sht';
	dir..'Models/Walls/StructTable.sht';
}

modelsdirectory =
{
}

sup4 =
{
	dir.."Surface/Caucasus.onlay.sup4",

}

sup5 =
{
}

map =
{
	dir.."Map/Caucasus.sup5",
}

modelspreview = dir.."Structures/Preview/"

rasterCharts =
{
	dir.."RasterCharts/rasterCharts.sup5",
}

modelspreviews = 
{
	dir.."Models/AirfieldsLights/AirfieldsLights.preview",
	dir.."Models/BlockBuildings/BlockBuildings.preview",
	dir.."Models/BlockTrees/BlockTrees.preview",
	dir.."Models/CaucasusAFBbuildings_new/CaucasusAFBbuildings_new.preview",
	dir.."Models/CaucasusBridges/CaucasusBridges.preview",
	dir.."Models/CaucasusObjects/CaucasusObjects.preview",
	dir.."Models/Communication/Communication.preview",
	dir.."Models/CrashModels/CrashModels.preview",
	dir.."Models/CrashModelsFromEDM/CrashModelsFromEDM.preview",
	dir.."Models/HouseDetails/HouseDetails.preview",
	dir.."Models/Industrial/Industrial.preview",
	dir.."Models/Misc/Misc.preview",
	dir.."Models/OilPlatforms/OilPlatforms.preview",
	dir.."Models/TuapseRefinery/TuapseRefinery.preview",
	dir.."Models/Vehicles/Vehicles.preview",
	dir.."Models/Vessels/Vessels.preview",
	dir.."Models/Walls/Walls.preview",
	dir.."SurfaceDetails/SpeedTrees.preview",
}

modelspreviewsdds = 
{
	dir.."Models/AirfieldsLights/AirfieldsLights.preview.dds",
	dir.."Models/BlockBuildings/BlockBuildings.preview.dds",
	dir.."Models/BlockTrees/BlockTrees.preview.dds",
	dir.."Models/CaucasusAFBbuildings_new/CaucasusAFBbuildings_new.preview.dds",
	dir.."Models/CaucasusBridges/CaucasusBridges.preview.dds",
	dir.."Models/CaucasusObjects/CaucasusObjects.preview.dds",
	dir.."Models/Communication/Communication.preview.dds",
	dir.."Models/CrashModels/CrashModels.preview.dds",
	dir.."Models/CrashModelsFromEDM/CrashModelsFromEDM.preview.dds",
	dir.."Models/HouseDetails/HouseDetails.preview.dds",
	dir.."Models/Industrial/Industrial.preview.dds",
	dir.."Models/Misc/Misc.preview.dds",
	dir.."Models/OilPlatforms/OilPlatforms.preview.dds",
	dir.."Models/TuapseRefinery/TuapseRefinery.preview.dds",
	dir.."Models/Vehicles/Vehicles.preview.dds",
	dir.."Models/Vessels/Vessels.preview.dds",
	dir.."Models/Walls/Walls.preview.dds",
	dir.."SurfaceDetails/SpeedTrees.preview.dds",
}

models5 =
{
	dir.."Models/AirfieldsLights/AirfieldsLights.ref.m5",
	dir.."Models/BlockBuildings/BlockBuildings.ref.m5",
	dir.."Models/BlockTrees/BlockTrees.ref.m5",
	dir.."Models/CaucasusAFBbuildings_new/CaucasusAFBbuildings_new.ref.m5",
	dir.."Models/CaucasusBridges/CaucasusBridges.ref.m5",
	dir.."Models/CaucasusObjects/CaucasusObjects.ref.m5",
	dir.."Models/Communication/Communication.ref.m5",
	dir.."Models/CrashModels/CrashModels.ref.m5",
	dir.."Models/CrashModelsFromEDM/CrashModelsFromEDM.ref.m5",
	dir.."Models/HouseDetails/HouseDetails.ref.m5",
	dir.."Models/Industrial/Industrial.ref.m5",
	dir.."Models/Misc/Misc.ref.m5",
	dir.."Models/OilPlatforms/OilPlatforms.ref.m5",
	dir.."Models/TuapseRefinery/TuapseRefinery.ref.m5",
	dir.."Models/Vehicles/Vehicles.ref.m5",
	dir.."Models/Vessels/Vessels.ref.m5",
	dir.."Models/Walls/Walls.ref.m5",
}

townspreview = dir.."misc/Preview/"
assetspreview = dir.."vfstextures/AssetsPreview"
modelsproxy = dir.."Models/Caucasus.proxy.ofsh"
blocksdir = dir.."Structures/blocks"

instancer2_parseSubobjects = true;
scene5file = dir.."Scenes/Caucasus.scn5"

roads4 = dir.."roads/Caucasus.rn4"
routes4 = dir.."roads/Caucasus.routes"

references =
{
	dir.."SurfaceDetails/Caucasus.ref",
	dir.."Models/AirfieldsLights/AirfieldsLights.ref",
	dir.."Models/BlockBuildings/BlockBuildings.ref",
	dir.."Models/BlockTrees/BlockTrees.ref",
	dir.."Models/CaucasusAFBbuildings_new/CaucasusAFBbuildings_new.ref",
	dir.."Models/CaucasusBridges/CaucasusBridges.ref",
	dir.."Models/CaucasusObjects/CaucasusObjects.ref",
	dir.."Models/Communication/Communication.ref",
	dir.."Models/CrashModels/CrashModels.ref",
	dir.."Models/CrashModelsFromEDM/CrashModelsFromEDM.ref",
	dir.."Models/HouseDetails/HouseDetails.ref",
	dir.."Models/Industrial/Industrial.ref",
	dir.."Models/Misc/Misc.ref",
	dir.."Models/OilPlatforms/OilPlatforms.ref",
	dir.."Models/TuapseRefinery/TuapseRefinery.ref",
	dir.."Models/Vehicles/Vehicles.ref",
	dir.."Models/Vessels/Vessels.ref",
	dir.."Models/Walls/Walls.ref",
	dir.."SurfaceDetails/AmericanBeech.ref",
	dir.."SurfaceDetails/Caucasus_Fir.ref",
	dir.."SurfaceDetails/Cypress_Oak.ref",
	dir.."SurfaceDetails/European_Beech.ref",
	dir.."SurfaceDetails/Green_ash.ref",
	dir.."SurfaceDetails/Honey_Mesquite.ref",
	dir.."SurfaceDetails/ItalianCypress.ref",
	dir.."SurfaceDetails/LombardyPoplar.ref",
	dir.."SurfaceDetails/Mountain_Maple.ref",
	dir.."SurfaceDetails/NorwaySpruce.ref",
	dir.."SurfaceDetails/Shrub.ref",
}

surfacedetails2 =
{
	dir.."SurfaceDetails/Caucasus.sd2"
}

externals = dir.."Models/Caucasus.external.ofsh"
referenceExternals = dir.."SurfaceDetails/Caucasus.external.ofsh"

cloudTypesOffshore = ""
OutputCloudScenes = 
{
}

terrainDefinitions =
{
	"USE_TERRAIN_PALETTE",
	"CAUCASUS_NOISE",
	"GENERATE_NORMALS",
	"COLOR_VTI",
	"PBR_TEXTURES",
	"USE_CAUCASUS_BLEND",
	"HACK_ASSETS_NORMALS",
	"NOISE_OP=PhotoshopOverlay",
	"SURFACE5",
}

shadersList = dir.."misc/shaders.json"
shaderCache = dir.."misc/shadercache"
metaShaderCache = dir.."misc/metacache"

beaconsFile = dir..'Beacons.lua'
radioFile = dir..'Radio.lua'
notInstancedFile = dir..'NotInstances.lua'

shadowmapSettings = 
{
sunriseTime = {4.5, 9};
morningTime = {9, 11};
eveningTime = {20, 22};
sunsetTime = {22, 23};
};

terrainOptions = 
{
	distances = 
	{
		surfaceLod = 
		{
			{0, 0, 8000, 12000};
			{12000, 12000, 20000, 24000};
			{24000, 24000, 40000, 48000};
			{48000, 48000, 116000, 150000};
		}
	};
};

MapCoordsFile = dir.."Caucasus.MapCoords.lua"
dofile(MapCoordsFile)

--for ME
mapModes = {"maptex", "map"};

Airdromes = {}


try_dofile(dir.."AirfieldsCfgs/Anapa.cfg.lua")
try_dofile(dir.."AirfieldsCfgs/Anapa.extra2.cfg.lua")

try_dofile(dir.."AirfieldsCfgs/Batumi.cfg.lua")
try_dofile(dir.."AirfieldsCfgs/Batumi.extra2.cfg.lua")

try_dofile(dir.."AirfieldsCfgs/Beslan.cfg.lua")
try_dofile(dir.."AirfieldsCfgs/Beslan.extra2.cfg.lua")

try_dofile(dir.."AirfieldsCfgs/Gelendzhik.cfg.lua")
try_dofile(dir.."AirfieldsCfgs/Gelendzhik.extra2.cfg.lua")

try_dofile(dir.."AirfieldsCfgs/Gudauta.cfg.lua")
try_dofile(dir.."AirfieldsCfgs/Gudauta.extra2.cfg.lua")

try_dofile(dir.."AirfieldsCfgs/KOBULETI.cfg.lua")
try_dofile(dir.."AirfieldsCfgs/KOBULETI.extra2.cfg.lua")

try_dofile(dir.."AirfieldsCfgs/Krasnodar.cfg.lua")
try_dofile(dir.."AirfieldsCfgs/Krasnodar.extra2.cfg.lua")

try_dofile(dir.."AirfieldsCfgs/Krasnodar_P.cfg.lua")
try_dofile(dir.."AirfieldsCfgs/Krasnodar_P.extra2.cfg.lua")

try_dofile(dir.."AirfieldsCfgs/Krymsk.cfg.lua")
try_dofile(dir.."AirfieldsCfgs/Krymsk.extra2.cfg.lua")

try_dofile(dir.."AirfieldsCfgs/KUTAISI.cfg.lua")
try_dofile(dir.."AirfieldsCfgs/KUTAISI.extra2.cfg.lua")

try_dofile(dir.."AirfieldsCfgs/Lochini.cfg.lua")
try_dofile(dir.."AirfieldsCfgs/Lochini.extra2.cfg.lua")

try_dofile(dir.."AirfieldsCfgs/Maykop.cfg.lua")
try_dofile(dir.."AirfieldsCfgs/Maykop.extra2.cfg.lua")

try_dofile(dir.."AirfieldsCfgs/MinVody.cfg.lua")
try_dofile(dir.."AirfieldsCfgs/MinVody.extra2.cfg.lua")

try_dofile(dir.."AirfieldsCfgs/Mozdok.cfg.lua")
try_dofile(dir.."AirfieldsCfgs/Mozdok.extra2.cfg.lua")

try_dofile(dir.."AirfieldsCfgs/Nalchick.cfg.lua")
try_dofile(dir.."AirfieldsCfgs/Nalchick.extra2.cfg.lua")

try_dofile(dir.."AirfieldsCfgs/Novorossiysk.cfg.lua")
try_dofile(dir.."AirfieldsCfgs/Novorossiysk.extra2.cfg.lua")

try_dofile(dir.."AirfieldsCfgs/Senaki.cfg.lua")
try_dofile(dir.."AirfieldsCfgs/Senaki.extra2.cfg.lua")

try_dofile(dir.."AirfieldsCfgs/Sochi.cfg.lua")
try_dofile(dir.."AirfieldsCfgs/Sochi.extra2.cfg.lua")

try_dofile(dir.."AirfieldsCfgs/Sukhumi.cfg.lua")
try_dofile(dir.."AirfieldsCfgs/Sukhumi.extra2.cfg.lua")

try_dofile(dir.."AirfieldsCfgs/TbilisiMilitary.cfg.lua")
try_dofile(dir.."AirfieldsCfgs/TbilisiMilitary.extra2.cfg.lua")

try_dofile(dir.."AirfieldsCfgs/Vaziani.cfg.lua")
try_dofile(dir.."AirfieldsCfgs/Vaziani.extra2.cfg.lua")

MaterialLibrarySource = dir.."../../Source/FabricLibrary/"
LibrarySource = 
{
	dir.."../../Source/ModelsLibrary/AirfieldsLights/",
	dir.."../../Source/ModelsLibrary/CaucasusBlockBuildings/",
	dir.."../../Source/ModelsLibrary/CaucasusBlockTrees/",
	dir.."../../Source/ModelsLibrary/CaucasusAFBbuildings_new/",
	dir.."../../Source/ModelsLibrary/CaucasusBridges/",
	dir.."../../Source/ModelsLibrary/CaucasusObjects/",
	dir.."../../Source/ModelsLibrary/Communication/",
	dir.."../../Source/ModelsLibrary/CrashModels/",
	dir.."../../Source/ModelsLibrary/CrashModelsFromEDM/",
	dir.."../../Source/ModelsLibrary/HouseDetails/",
	dir.."../../Source/ModelsLibrary/Industrial/",
	dir.."../../Source/ModelsLibrary/Misc/",
	dir.."../../Source/ModelsLibrary/OilPlatforms/",
	dir.."../../Source/ModelsLibrary/TuapseRefinery/",
	dir.."../../Source/ModelsLibrary/Vehicles/",
	dir.."../../Source/ModelsLibrary/Vessels/",
	dir.."../../Source/ModelsLibrary/Walls/",
}

seasons = 
{
	autumn = 
	{
		startDate = "01.09";
		techSkin = "autumn";
		maxTemperature = 26.5;
		minTemperature = -6.6;
		snowLineMin = 2500;
		snowLineTransition = 900;
	},
	spring = 
	{
		startDate = "01.03";
		techSkin = "spring";
		maxTemperature = 23.2;
		minTemperature = -3.1;
		snowLineMin = 2800;
		snowLineTransition = 900;
	},
	summer = 
	{
		startDate = "01.06";
		techSkin = "summer";
		maxTemperature = 50;
		minTemperature = 8.4;
		snowLineMin = 3000;
		snowLineTransition = 900;
	},
	winter = 
	{
		startDate = "01.12";
		techSkin = "winter";
		maxTemperature = 10.4;
		minTemperature = -12.4;
		snowLineMin = 2300;
		snowLineTransition = 900;
	},
}

localization = 
{
	en = 
	{
		dir.."l10n/en/LC_MESSAGES/messages.mo",
	},
	ru = 
	{
		dir.."l10n/ru/LC_MESSAGES/messages.mo",
	},
	cn = 
	{
		dir.."l10n/cn/LC_MESSAGES/messages.mo",
	},
	ko = 
	{
		dir.."l10n/ko/LC_MESSAGES/messages.mo",
	},
	de = 
	{
		dir.."l10n/de/LC_MESSAGES/messages.mo",
	},
	cs = 
	{
		dir.."l10n/cs/LC_MESSAGES/messages.mo",
	},
	es = 
	{
		dir.."l10n/es/LC_MESSAGES/messages.mo",
	},
	fr = 
	{
		dir.."l10n/fr/LC_MESSAGES/messages.mo",
	},
}


vfstextures = 
{
	dir.."vfstextures/AirfieldsTextures",
	dir.."vfstextures/cracksMask",
	dir.."vfstextures/cracksMask.nm",
	dir.."vfstextures/decal",
	dir.."vfstextures/dirtMask",
	dir.."vfstextures/fabric",
	dir.."vfstextures/fabric.nm",
	dir.."vfstextures/fabric.si",
	dir.."vfstextures/fabric.spec",
	dir.."vfstextures/ForestOnlay",
	dir.."vfstextures/HardSplatSelfillum",
	dir.."vfstextures/LandNoiseSummer",
	dir.."vfstextures/MapTextures",
	dir.."vfstextures/References",
	dir.."vfstextures/TerrainPalette",
	dir.."vfstextures/Textures_for_EDM_models",
	dir.."vfstextures/VectorDataAssets",
	dir.."vfstextures/AmericanBeech",
	dir.."vfstextures/Caucasus_Fir",
	dir.."vfstextures/Cypress_Oak",
	dir.."vfstextures/European_Beech",
	dir.."vfstextures/Green_ash",
	dir.."vfstextures/Honey_Mesquite",
	dir.."vfstextures/ItalianCypress",
	dir.."vfstextures/LombardyPoplar",
	dir.."vfstextures/Mountain_Maple",
	dir.."vfstextures/NorwaySpruce",
	dir.."vfstextures/Shrub",
	dir.."Models/AirfieldsLights/AirfieldsLights.texture",
	dir.."Models/BlockBuildings/BlockBuildings.texture",
	dir.."Models/BlockTrees/BlockTrees.texture",
	dir.."Models/CaucasusAFBbuildings_new/CaucasusAFBbuildings_new.texture",
	dir.."Models/CaucasusBridges/CaucasusBridges.texture",
	dir.."Models/CaucasusObjects/CaucasusObjects.texture",
	dir.."Models/Communication/Communication.texture",
	dir.."Models/CrashModels/CrashModels.texture",
	dir.."Models/CrashModelsFromEDM/CrashModelsFromEDM.texture",
	dir.."Models/HouseDetails/HouseDetails.texture",
	dir.."Models/Industrial/Industrial.texture",
	dir.."Models/Misc/Misc.texture",
	dir.."Models/OilPlatforms/OilPlatforms.texture",
	dir.."Models/TuapseRefinery/TuapseRefinery.texture",
	dir.."Models/Vehicles/Vehicles.texture",
	dir.."Models/Vessels/Vessels.texture",
	dir.."Models/Walls/Walls.texture",
	dir.."RasterCharts/1M/64mAA00.zip",
	dir.."RasterCharts/1M/64mAA01.zip",
	dir.."RasterCharts/1M/64mxAB00.zip",
	dir.."RasterCharts/1M/64mxAB01.zip",
	dir.."RasterCharts/2M/128mAA00.zip",
	dir.."RasterCharts/2M/128mAA-1.zip",
	dir.."RasterCharts/2M/128mxAB00.zip",
	dir.."RasterCharts/2M/128mxAB-1.zip",
	dir.."RasterCharts/0.25M/16m_AA00.zip",
	dir.."RasterCharts/0.25M/16m_AA01.zip",
	dir.."RasterCharts/0.25M/16m_AA02.zip",
	dir.."RasterCharts/0.25M/16m_AA03.zip",
	dir.."RasterCharts/0.25M/16m_AA04.zip",
	dir.."RasterCharts/0.25M/16m_AA-1.zip",
	dir.."RasterCharts/0.25M/16m_AA-2.zip",
	dir.."RasterCharts/0.25M/16m_AA-3.zip",
	dir.."RasterCharts/0.25M/16m_AB00.zip",
	dir.."RasterCharts/0.25M/16m_AB-1.zip",
	dir.."RasterCharts/0.25M/16m_AB-2.zip",
	dir.."RasterCharts/0.25M/16m_AB-3.zip",
	dir.."RasterCharts/0.25M/16m_AC00.zip",
	dir.."RasterCharts/0.25M/16m_AC-1.zip",
	dir.."RasterCharts/0.25M/16m_AC-2.zip",
	dir.."RasterCharts/0.25M/16m_AC-3.zip",
	dir.."RasterCharts/0.25M/16m_xAB00.zip",
	dir.."RasterCharts/0.25M/16m_xAB01.zip",
	dir.."RasterCharts/0.25M/16m_xAB02.zip",
	dir.."RasterCharts/0.25M/16m_xAB03.zip",
	dir.."RasterCharts/0.25M/16m_xAB04.zip",
	dir.."RasterCharts/0.25M/16m_xAB05.zip",
	dir.."RasterCharts/0.25M/16m_xAB-1.zip",
	dir.."RasterCharts/0.25M/16m_xAC03.zip",
	dir.."RasterCharts/0.25M/16m_xAC04.zip",
	dir.."RasterCharts/0.25M/16m_xAC05.zip",
	dir.."RasterCharts/0.25M/16m_xAC06.zip",
	dir.."RasterCharts/0.25M/16m_xAD04.zip",
	dir.."RasterCharts/0.25M/16m_xAD05.zip",
	dir.."RasterCharts/0.25M/16m_xAD06.zip",
	dir.."RasterCharts/0.25M/16m_xAE04.zip",
	dir.."RasterCharts/0.25M/16m_xAE05.zip",
	dir.."RasterCharts/0.5M/32m_AH01.zip",
	dir.."RasterCharts/0.5M/32m_AH02.zip",
	dir.."RasterCharts/0.5M/32m_AH03.zip",
	dir.."RasterCharts/0.5M/32m_AH04.zip",
	dir.."RasterCharts/0.5M/32m_AH05.zip",
	dir.."RasterCharts/0.5M/32m_AH06.zip",
	dir.."RasterCharts/0.5M/32m_AI01.zip",
	dir.."RasterCharts/0.5M/32m_AI02.zip",
	dir.."RasterCharts/0.5M/32m_AI03.zip",
	dir.."RasterCharts/0.5M/32m_AI04.zip",
	dir.."RasterCharts/0.5M/32m_AI05.zip",
	dir.."RasterCharts/0.5M/32m_AI06.zip",
	dir.."RasterCharts/0.5M/32m_AJ01.zip",
	dir.."RasterCharts/0.5M/32m_AJ02.zip",
	dir.."RasterCharts/0.5M/32m_AJ03.zip",
	dir.."RasterCharts/0.5M/32m_AJ04.zip",
	dir.."RasterCharts/0.5M/32m_AJ05.zip",
	dir.."RasterCharts/0.5M/32m_AJ06.zip",
	dir.."RasterCharts/0.5M/32m_AK01.zip",
	dir.."RasterCharts/0.5M/32m_AK02.zip",
	dir.."RasterCharts/0.5M/32m_AK03.zip",
	dir.."RasterCharts/0.5M/32m_AK04.zip",
	dir.."RasterCharts/0.5M/32m_AK05.zip",
	dir.."RasterCharts/0.5M/32m_AK06.zip",
	dir.."RasterCharts/5M/256m_AA00.zip",
	dir.."RasterCharts/5M/256m_AA-1.zip",
	dir.."RasterCharts/5M/256m_xAB00.zip",
	dir.."RasterCharts/5M/256m_xAB-1.zip",

}

vfstexturesMin = 
{
	dir.."vfstextures/AirfieldsTextures.min",
	dir.."vfstextures/cracksMask.min",
	dir.."vfstextures/cracksMask.nm.min",
	dir.."vfstextures/decal.min",
	dir.."vfstextures/dirtMask.min",
	dir.."vfstextures/fabric.min",
	dir.."vfstextures/fabric.nm.min",
	dir.."vfstextures/fabric.si.min",
	dir.."vfstextures/fabric.spec.min",
	dir.."vfstextures/ForestOnlay.min",
	dir.."vfstextures/HardSplatSelfillum.min",
	dir.."vfstextures/LandNoiseSummer.min",
	dir.."vfstextures/MapTextures",
	dir.."vfstextures/References.min",
	dir.."vfstextures/TerrainPalette.min",
	dir.."vfstextures/Textures_for_EDM_models",
	dir.."vfstextures/VectorDataAssets",
	dir.."vfstextures/AmericanBeech",
	dir.."vfstextures/Caucasus_Fir",
	dir.."vfstextures/Cypress_Oak",
	dir.."vfstextures/European_Beech",
	dir.."vfstextures/Green_ash",
	dir.."vfstextures/Honey_Mesquite",
	dir.."vfstextures/ItalianCypress",
	dir.."vfstextures/LombardyPoplar",
	dir.."vfstextures/Mountain_Maple",
	dir.."vfstextures/NorwaySpruce",
	dir.."vfstextures/Shrub",
	dir.."Models/AirfieldsLights/AirfieldsLights.texture.min",
	dir.."Models/BlockBuildings/BlockBuildings.texture.min",
	dir.."Models/BlockTrees/BlockTrees.texture",
	dir.."Models/CaucasusAFBbuildings_new/CaucasusAFBbuildings_new.texture.min",
	dir.."Models/CaucasusBridges/CaucasusBridges.texture",
	dir.."Models/CaucasusObjects/CaucasusObjects.texture.min",
	dir.."Models/Communication/Communication.texture",
	dir.."Models/CrashModels/CrashModels.texture",
	dir.."Models/CrashModelsFromEDM/CrashModelsFromEDM.texture.min",
	dir.."Models/HouseDetails/HouseDetails.texture.min",
	dir.."Models/Industrial/Industrial.texture",
	dir.."Models/Misc/Misc.texture",
	dir.."Models/OilPlatforms/OilPlatforms.texture.min",
	dir.."Models/TuapseRefinery/TuapseRefinery.texture.min",
	dir.."Models/Vehicles/Vehicles.texture.min",
	dir.."Models/Vessels/Vessels.texture.min",
	dir.."Models/Walls/Walls.texture.min",
	dir.."RasterCharts/1M/64mAA00.zip",
	dir.."RasterCharts/1M/64mAA01.zip",
	dir.."RasterCharts/1M/64mxAB00.zip",
	dir.."RasterCharts/1M/64mxAB01.zip",
	dir.."RasterCharts/2M/128mAA00.zip",
	dir.."RasterCharts/2M/128mAA-1.zip",
	dir.."RasterCharts/2M/128mxAB00.zip",
	dir.."RasterCharts/2M/128mxAB-1.zip",
	dir.."RasterCharts/0.25M/16m_AA00.zip",
	dir.."RasterCharts/0.25M/16m_AA01.zip",
	dir.."RasterCharts/0.25M/16m_AA02.zip",
	dir.."RasterCharts/0.25M/16m_AA03.zip",
	dir.."RasterCharts/0.25M/16m_AA04.zip",
	dir.."RasterCharts/0.25M/16m_AA-1.zip",
	dir.."RasterCharts/0.25M/16m_AA-2.zip",
	dir.."RasterCharts/0.25M/16m_AA-3.zip",
	dir.."RasterCharts/0.25M/16m_AB00.zip",
	dir.."RasterCharts/0.25M/16m_AB-1.zip",
	dir.."RasterCharts/0.25M/16m_AB-2.zip",
	dir.."RasterCharts/0.25M/16m_AB-3.zip",
	dir.."RasterCharts/0.25M/16m_AC00.zip",
	dir.."RasterCharts/0.25M/16m_AC-1.zip",
	dir.."RasterCharts/0.25M/16m_AC-2.zip",
	dir.."RasterCharts/0.25M/16m_AC-3.zip",
	dir.."RasterCharts/0.25M/16m_xAB00.zip",
	dir.."RasterCharts/0.25M/16m_xAB01.zip",
	dir.."RasterCharts/0.25M/16m_xAB02.zip",
	dir.."RasterCharts/0.25M/16m_xAB03.zip",
	dir.."RasterCharts/0.25M/16m_xAB04.zip",
	dir.."RasterCharts/0.25M/16m_xAB05.zip",
	dir.."RasterCharts/0.25M/16m_xAB-1.zip",
	dir.."RasterCharts/0.25M/16m_xAC03.zip",
	dir.."RasterCharts/0.25M/16m_xAC04.zip",
	dir.."RasterCharts/0.25M/16m_xAC05.zip",
	dir.."RasterCharts/0.25M/16m_xAC06.zip",
	dir.."RasterCharts/0.25M/16m_xAD04.zip",
	dir.."RasterCharts/0.25M/16m_xAD05.zip",
	dir.."RasterCharts/0.25M/16m_xAD06.zip",
	dir.."RasterCharts/0.25M/16m_xAE04.zip",
	dir.."RasterCharts/0.25M/16m_xAE05.zip",
	dir.."RasterCharts/0.5M/32m_AH01.zip",
	dir.."RasterCharts/0.5M/32m_AH02.zip",
	dir.."RasterCharts/0.5M/32m_AH03.zip",
	dir.."RasterCharts/0.5M/32m_AH04.zip",
	dir.."RasterCharts/0.5M/32m_AH05.zip",
	dir.."RasterCharts/0.5M/32m_AH06.zip",
	dir.."RasterCharts/0.5M/32m_AI01.zip",
	dir.."RasterCharts/0.5M/32m_AI02.zip",
	dir.."RasterCharts/0.5M/32m_AI03.zip",
	dir.."RasterCharts/0.5M/32m_AI04.zip",
	dir.."RasterCharts/0.5M/32m_AI05.zip",
	dir.."RasterCharts/0.5M/32m_AI06.zip",
	dir.."RasterCharts/0.5M/32m_AJ01.zip",
	dir.."RasterCharts/0.5M/32m_AJ02.zip",
	dir.."RasterCharts/0.5M/32m_AJ03.zip",
	dir.."RasterCharts/0.5M/32m_AJ04.zip",
	dir.."RasterCharts/0.5M/32m_AJ05.zip",
	dir.."RasterCharts/0.5M/32m_AJ06.zip",
	dir.."RasterCharts/0.5M/32m_AK01.zip",
	dir.."RasterCharts/0.5M/32m_AK02.zip",
	dir.."RasterCharts/0.5M/32m_AK03.zip",
	dir.."RasterCharts/0.5M/32m_AK04.zip",
	dir.."RasterCharts/0.5M/32m_AK05.zip",
	dir.."RasterCharts/0.5M/32m_AK06.zip",
	dir.."RasterCharts/5M/256m_AA00.zip",
	dir.."RasterCharts/5M/256m_AA-1.zip",
	dir.."RasterCharts/5M/256m_xAB00.zip",
	dir.."RasterCharts/5M/256m_xAB-1.zip",

}

vfstextures2 = 
{
	{
		season = "winter";
		filename = dir.."vfstextures/AirfieldsTexturesWinter";
		filenameMin = dir.."vfstextures/AirfieldsTexturesWinter.min";
	},
	{
		season = "autumn";
		filename = dir.."vfstextures/CloseupTexturesAutumn";
		filenameMin = dir.."vfstextures/CloseupTexturesAutumn.min";
	},
	{
		season = "spring";
		filename = dir.."vfstextures/CloseupTexturesSpring";
		filenameMin = dir.."vfstextures/CloseupTexturesSpring.min";
	},
	{
		season = "summer";
		filename = dir.."vfstextures/CloseupTexturesSummer";
		filenameMin = dir.."vfstextures/CloseupTexturesSummer.min";
	},
	{
		season = "winter";
		filename = dir.."vfstextures/CloseupTexturesWinter";
		filenameMin = dir.."vfstextures/CloseupTexturesWinter.min";
	},
	{
		season = "autumn";
		filename = dir.."vfstextures/DefaultLandTexturesAutumn";
		filenameMin = dir.."vfstextures/DefaultLandTexturesAutumn";
	},
	{
		season = "spring";
		filename = dir.."vfstextures/DefaultLandTexturesSpring";
		filenameMin = dir.."vfstextures/DefaultLandTexturesSpring";
	},
	{
		season = "summer";
		filename = dir.."vfstextures/DefaultLandTexturesSummer";
		filenameMin = dir.."vfstextures/DefaultLandTexturesSummer";
	},
	{
		season = "winter";
		filename = dir.."vfstextures/DefaultLandTexturesWinter";
		filenameMin = dir.."vfstextures/DefaultLandTexturesWinter";
	},
	{
		season = "autumn";
		filename = dir.."vfstextures/ForestSubctrateAutumn";
		filenameMin = dir.."vfstextures/ForestSubctrateAutumn.min";
	},
	{
		season = "spring";
		filename = dir.."vfstextures/ForestSubctrateSpring";
		filenameMin = dir.."vfstextures/ForestSubctrateSpring.min";
	},
	{
		season = "summer";
		filename = dir.."vfstextures/ForestSubctrateSummer";
		filenameMin = dir.."vfstextures/ForestSubctrateSummer.min";
	},
	{
		season = "winter";
		filename = dir.."vfstextures/ForestSubctrateWinter";
		filenameMin = dir.."vfstextures/ForestSubctrateWinter.min";
	},
	{
		season = "autumn";
		filename = dir.."vfstextures/Grounds_TexturesAutumn";
		filenameMin = dir.."vfstextures/Grounds_TexturesAutumn.min";
	},
	{
		season = "spring";
		filename = dir.."vfstextures/Grounds_TexturesSpring";
		filenameMin = dir.."vfstextures/Grounds_TexturesSpring.min";
	},
	{
		season = "summer";
		filename = dir.."vfstextures/Grounds_TexturesSummer";
		filenameMin = dir.."vfstextures/Grounds_TexturesSummer.min";
	},
	{
		season = "winter";
		filename = dir.."vfstextures/Grounds_TexturesWinter";
		filenameMin = dir.."vfstextures/Grounds_TexturesWinter.min";
	},
	{
		season = "autumn";
		filename = dir.."vfstextures/HardSplatAutumn";
		filenameMin = dir.."vfstextures/HardSplatAutumn.min";
	},
	{
		season = "spring";
		filename = dir.."vfstextures/HardSplatSpring";
		filenameMin = dir.."vfstextures/HardSplatSpring.min";
	},
	{
		season = "summer";
		filename = dir.."vfstextures/HardSplatSummer";
		filenameMin = dir.."vfstextures/HardSplatSummer.min";
	},
	{
		season = "winter";
		filename = dir.."vfstextures/HardSplatWinter";
		filenameMin = dir.."vfstextures/HardSplatWinter.min";
	},
	{
		season = "winter";
		filename = dir.."vfstextures/LandNoiseWinter";
		filenameMin = dir.."vfstextures/LandNoiseWinter.min";
	},
	{
		season = "autumn";
		filename = dir.."vfstextures/NoiseAutumn";
		filenameMin = dir.."vfstextures/NoiseAutumn.min";
	},
	{
		season = "spring";
		filename = dir.."vfstextures/NoiseSpring";
		filenameMin = dir.."vfstextures/NoiseSpring.min";
	},
	{
		season = "summer";
		filename = dir.."vfstextures/NoiseSummer";
		filenameMin = dir.."vfstextures/NoiseSummer.min";
	},
	{
		season = "winter";
		filename = dir.."vfstextures/NoiseWinter";
		filenameMin = dir.."vfstextures/NoiseWinter.min";
	},
	{
		season = "autumn";
		filename = dir.."vfstextures/SimpleOnlayArrayAutumn";
		filenameMin = dir.."vfstextures/SimpleOnlayArrayAutumn.min";
	},
	{
		season = "spring";
		filename = dir.."vfstextures/SimpleOnlayArraySpring";
		filenameMin = dir.."vfstextures/SimpleOnlayArraySpring.min";
	},
	{
		season = "summer";
		filename = dir.."vfstextures/SimpleOnlayArraySummer";
		filenameMin = dir.."vfstextures/SimpleOnlayArraySummer.min";
	},
	{
		season = "winter";
		filename = dir.."vfstextures/SimpleOnlayArrayWinter";
		filenameMin = dir.."vfstextures/SimpleOnlayArrayWinter.min";
	},
	{
		season = "autumn";
		filename = dir.."vfstextures/Trees7Autumn";
		filenameMin = dir.."vfstextures/Trees7Autumn.min";
	},
	{
		season = "spring";
		filename = dir.."vfstextures/Trees7Spring";
		filenameMin = dir.."vfstextures/Trees7Spring.min";
	},
	{
		season = "summer";
		filename = dir.."vfstextures/Trees7Summer";
		filenameMin = dir.."vfstextures/Trees7Summer.min";
	},
	{
		season = "winter";
		filename = dir.."vfstextures/Trees7Winter";
		filenameMin = dir.."vfstextures/Trees7Winter.min";
	},
	{
		season = "autumn";
		filename = dir.."vfstextures/VectorDataAssetAutumn";
		filenameMin = dir.."vfstextures/VectorDataAssetAutumn";
	},
	{
		season = "spring";
		filename = dir.."vfstextures/VectorDataAssetSpring";
		filenameMin = dir.."vfstextures/VectorDataAssetSpring";
	},
	{
		season = "summer";
		filename = dir.."vfstextures/VectorDataAssetSummer";
		filenameMin = dir.."vfstextures/VectorDataAssetSummer";
	},
	{
		season = "winter";
		filename = dir.."vfstextures/VectorDataAssetWinter";
		filenameMin = dir.."vfstextures/VectorDataAssetWinter";
	},
	{
		season = "autumn";
		filename = dir.."vfstextures/LandTexturesAutumn";
		filenameMin = dir.."vfstextures/LandTexturesAutumn";
	},
	{
		season = "spring";
		filename = dir.."vfstextures/LandTexturesSpring";
		filenameMin = dir.."vfstextures/LandTexturesSpring";
	},
	{
		season = "summer";
		filename = dir.."vfstextures/LandTexturesSummer";
		filenameMin = dir.."vfstextures/LandTexturesSummer";
	},
	{
		season = "winter";
		filename = dir.."vfstextures/LandTexturesWinter";
		filenameMin = dir.."vfstextures/LandTexturesWinter";
	},
}

clipmaptextures = 
{
}

virtualTextures = 
{
	colortexture = {vti = dir.."VirtualTextures/colortexture.vti"},
}

vectorDataSettings = 
{
	welddistance = 15,
	intersectiondelta = 5,
	minstripeheight = 0,
	segmentlengthlimit = 100,
}


mapPalette = "mapModePalette.tif"


-- регулировка дистанции отображения кварталов
mainEditor =
{
 maxProcessNodes = 200;
}
-- Шум дороги
roadNoise = 
{
	tilingNear = 0.1,
}
-- Шумы городов
townNoise = 
{
	tilingFar = 15,
	tilingNear = 1,
}
-- Шумы полей
fieldNoise = 
{
 tilingNear = 50,
}
-- Маппинг fft текстуры для имитации ветра
fftNoise = 
{
	tilingFar = 32.0,
}

-- Настройки шумов для Кавказа
terrainOldNoise = 
{

 noiseMin = { 0.3, 0.3, 0.3},
 noiseMax = { 0.95, 0.95, 0.95}, 
 

 noiseFront = 2000.0,
 noiseBack = 50000.0,
 --noiseTop = 2600.0, --верхний передел шума гор
 noise1PerSquare = 3.0, -- тайлинг дальних шумов
 noise2PerSquare = 256,-- тайлинг ближних шумов
}

terrainNoise = 
{
	tilingFar = 40.0,
	tilingNear = 20.0,
}



Bookmarks = 
{
Batumi ={-356.039035, 0.087966, 618.671086},
fieldNroadsRegion = {-318, 1.3, 647},
vd_failed = {-289, 2, 641},
Kobuleti = {-317.722660, 0.202281, 637.332077},
Kutaisi ={-284.801664, 0.468810, 686.693634},
Senaki ={-281.573739, 0.237872, 648.712533},
Sukhumi ={-220.359977, 0.255626, 565.913987},
Anapa ={-4.77, 0.255626, 246.32},
Beslan ={-148.680000, 0.255626, 845.328264},
Gelendzhik ={-50.123947, 0.134412, 299.171076},
Gudauta ={-197.209214, 0.311835, 517.721476},
Krasnodar={11.850257, 0.200000, 368.335906},
Lochini={-314.756059, 0.530900, 896.644301},
Krasnodar_P={7.912793, 0.200000, 386.666500},
--Krymsk={0.031231, 0.200000, 0.030424},
Krymsk={-6.857264, 0.200000, 295.043482},
Maykop ={-26.332349, 0.200000, 458.390655},
MinVody ={-51.265375, 0.200000, 705.437625},
Mozdok ={-83.800172, 0.200000, 834.184082},
Nalchik ={-124.961148, 0.513230, 761.269196},
Novorossiysk ={-40.888976, 0.200000, 279.912578},
Sochi_Adler ={-164.100612, 0.200000, 462.987444},
TbilisiMilitary ={-317.901222, 0.543299, 895.932783},
Vaziani ={-318.801309, 0.592528, 904.292199},
noname_01 ={-328.330659, 0.274255, 632.415029},
noname_02 ={-273.434985, 0.340922, 698.525659},
Dum = {-224.018729, 0.690242, 639.789622},
};



grass = 
{
	enabled = true, --если false - будет рисоваться старая трава
	
	lodsCount = 6,		--количество лодов, чем больше число тем гуще перед камерой, максимум - 6
	lodsCount2 = 10,
	radiusMin = 12,		--радиус ближнего лода
	radiusMax = 100,		--радиус дальнего лода
	grassDiameter = 200,		--диаметр круга травы, м
	quadSize = 0.400,		--размер ячейки травы, м
	
	grassHalfWidth = 0.0015*12,--половина ширины травинки, м
	grassHeight = 0.4,	--масимальная средняя высота травинки, м
	bendDistMax = 0.25,	--максимальная проекция наклона травинки в сторону, м
	pointSpread = 0.8,	--разброс травинок одной Ячейки, как бы метры
	grassHeightJitter = 0.6, -- разброс высоты травинок (на сколько травинка может быть меньше от максимальной высоты. 0.4 - 40% от высоты, 0.6 - 60%)
	grassColorJitter = 0.05, -- разброс оттенков травинок 0.0 - нет, 1.0 - до 100%
	grassShadowIntensity = 0.95,

	grassBendJitter = 0.4, -- разброс начального изгиба травинок
	grassInclinationJitter = 0.2, -- разброс начального наклона травинок

	grassCellBendJitter = 0.2,  --      разброс начального изгиба в ячейке с травинками
	grassCellInclinationJitter = 0.1, -- разброс начального наклона в ячейке с травинками 	


};


grassHeight = 
{

gravel_01 = 0.2,
gravel_02 = 0.2,
gravel_03 = 0.2,
gravel_04 = 0.2,
gravel_05 = 0.2,
gravel_06 = 0.2,
grass = 0.8,
grass_02 = 0.8,
grass_03 = 0.8,
grass_04 = 0.8,
grass_05 = 0.8,
grass_06 = 0.8,
greendark1 = 1,
greendark2 = 1,
greendark3 = 1,
greendark4 = 1,
greendark5 = 1,
greendark6 = 1,
noise1 = 1,
noise2 = 1,
noise3 = 1,
noise4 = 1,
noise5 = 1,
noise6 = 1,
}
newTerrainAlbedo  = true;
roofTextureDistanceMinMax = {5000, 6000};
 
terrainDistanceFactor = 3;

terrainPalette = "varyhousePalette.png"
waterParams = 
{
seaDeepColor = {0.23,0.38,0.36},
seaScatterColor = {0.31,0.72,0.20},
seaOpacity = 2,

riverDeepColor = {0.30,0.42,0.25},
riverScatterColor = {0.35,0.85,0.05},
riverOpacity = 8,
}

if options.edge then
	try_dofile(dir.."Caucasus.local.lua")
end
