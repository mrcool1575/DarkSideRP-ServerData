local cfg = {}

-- size of the sms history
cfg.sms_history = 100

-- maximum size of an sms
cfg.sms_size = 750

-- duration of a sms position marker (in seconds)
cfg.smspos_duration = 300

-- define phone services
-- blipid, blipcolor (customize alert blip)
-- alert_time (alert blip display duration in seconds)
-- alert_permission (permission required to receive the alert)
-- alert_notify (notification received when an alert is sent)
-- notify (notification when sending an alert)
cfg.services = {
	["Politi"] = {
		blipid = 304,
		blipcolor = 38,
		alert_time = 300, -- 5 minutes
		alert_permission = "police.service",
		alert_notify = "Alarmcentral: ",
		notify = "Du ringede til politet.",
		answer_notify = "Politiet er på vej."
	},
	["Læge"] = {
		blipid = 153,
		blipcolor = 1,
		alert_time = 300, -- 5 minutes
		alert_permission = "emergency.service",
		alert_notify = "Alarmcentral: ",
		notify = "Du tilkaldte en ambulance.",
		answer_notify = "En ambulance er på vej."
	},
	["Taxa"] = {
		blipid = 198,
		blipcolor = 5,
		alert_time = 300,
		alert_permission = "taxi.service",
		alert_notify = "Taxacentral: ",
		notify = "Du tilkaldte en taxa.",
		answer_notify = "En taxa er på vej."
	},
	["Mekaniker"] = {
		blipid = 446,
		blipcolor = 5,
		alert_time = 300,
		alert_permission = "repair.service",
		alert_notify = "Værkføre: ",
		notify = "Du tilkaldte en mekaniker.",
		answer_notify = "En mekaniker er på vej."
	},
	["Advokat"] = {
		blipid = 133,
		blipcolor = 16,
		alert_time = 600,
		alert_permission = "lawyer.service",
		alert_notify = "Advokatkontor: ",
		notify = "Du tilkaldte en advokat.",
		answer_notify = "En advokat er på vej."
	},
	["Journalist"] = {
		blipid = 184,
		blipcolor = 45,
		alert_time = 600,
		alert_permission = "journalist.service",
		alert_notify = "Journalist: ",
		notify = "Du tilkaldte en journalist.",
		answer_notify = "En journalist er på vej."
	}
}

-- define phone announces
-- image: background image for the announce (800x150 px)
-- price: amount to pay to post the announce
-- description (optional)
-- permission (optional): permission required to post the announce
cfg.announces = {
	["admin"] = {
		image = "https://cdn.discordapp.com/attachments/521709826900885516/526187254058844180/Untitled-6.png",
		price = 0,
		description = "Adminstrator",
		permission = "admin.announce"
	},
	["Politi"] = {
		image = "https://cdn.discordapp.com/attachments/521709826900885516/526187253181972480/Untitled-4.png",
		price = 0,
		description = "Politi - Eftersøgelser mm.",
		permission = "police.announce"
	},
	["Læge"] = {
		image = "https://cdn.discordapp.com/attachments/521709826900885516/526187259381415937/Untitled-8.png",
		price = 0,
		description = "Ambulance - Travlhed mm.",
		permission = "emergency.announce"
	},
	["Taxa"] = {
		image = "https://cdn.discordapp.com/attachments/521709826900885516/526187249549836298/Untitled-2.png",
		price = 0,
		description = "Taxa - Meld dig on duty!",
		permission = "taxi.announce"
	},
	["Mekaniker"] = {
		image = "https://cdn.discordapp.com/attachments/521709826900885516/526187248220372992/mekaniker.png",
		price = 0,
		description = "Mekaniker - Kan vi fikse det? Ja vi kan!",
		permission = "mech.announce"
	},
	["Reklame"] = {
		image = "https://cdn.discordapp.com/attachments/521709826900885516/526187250954797071/Untitled-3.png",
		description = "Kommercielt - Arbejde, salg, køb",
		price = 5000
	},
	["Advokat"] = {
		image = "https://cdn.discordapp.com/attachments/521709826900885516/526187257829261327/Untitled-7.png",
		description = "Advokat - Problemer med loven? Intet problem!",
		price = 0,
		permission = "lawyer.announce"
	},
	["Socialt"] = {
		image = "https://cdn.discordapp.com/attachments/521709826900885516/526187254398451712/Untitled-5.png",
		description = "Til sociale arrangementer",
		price = 5000
	}
}

return cfg
