vcf_files = {
	"PBUS.xml",
	"POLICE3.xml",
	"POLICE4.xml",
	"POLICE.xml",
	"POLICE2.xml",
	"FLATBED.xml",
	"POLICE5.xml",
	"FBI.xml",
	"FBI2.xml",
	"SHERIFF.xml",
	"POLICE7.xml",
	"POLICEB.xml",
	"POLICEOLD5.xml",
	"POLICE6.xml",
	"paramed.xml",
	"TOWTRUCK2.xml",
	"POLICEGT350R.xml",
	"towtruck2.xml",
	"oambu.xml",
	"towtruck.xml",
	"policet.xml",
	"oakut.xml",
	"POLICERS6.xml",
	"PRANGER.xml",
	"Flatbed.xml",
	"FBIRS6.xml",
	"POLICEB2.xml",
	"SHERIFF2.xml",
	"psp_bmwgs.xml",
	"DUNE2.xml",
	"EMSMERC.xml"
}

pattern_files = {
	"WIGWAG.xml",
	"WIGWAG3.xml",
	"FAST.xml",
	"COMPLEX.xml",
	"BACKFOURTH.xml",
	"BACKFOURTH2.xml",
	"T_ADVIS_RIGHT_LEFT.xml",
	"T_ADVIS_LEFT_RIGHT.xml",
	"T_ADVIS_BACKFOURTH.xml",
	"WIGWAG5.xml"
}

modelsWithTrafficAdvisor = {
	"FBI2"
}

modelsWithFireSiren =
{
    "FIRETRUK",
}

modelsWithAmbWarnSiren =
{   
    "AMBULANCE",
	"AMBUCAR",
	"AKUT2",
    "FIRETRUK",
    "LGUARD",
}

stagethreewithsiren = false
playButtonPressSounds = true
vehicleStageThreeAdvisor = {
    "FBI3",
}


vehicleSyncDistance = 150
envirementLightBrightness = 0.2

build = "master"

shared = {
	horn = 86,
}

keyboard = {
	modifyKey = 132,
	stageChange = 85,
	guiKey = 243,
	takedown = 245,
	siren = {
		tone_one = 157,
		tone_two = 158,
		tone_three = 160,
		dual_toggle = 164,
		dual_one = 165,
		dual_two = 159,
		dual_three = 161,
	},
	pattern = {
		primary = 246,
		secondary = 303,
		advisor = 182,
	},
}

controller = {
	modifyKey = 73,
	stageChange = 80,
	takedown = 74,
	siren = {
		tone_one = 173,
		tone_two = 85,
		tone_three = 172,
	},
}