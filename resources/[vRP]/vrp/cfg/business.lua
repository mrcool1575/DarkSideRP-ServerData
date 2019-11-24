
local cfg = {}

-- minimum capital to open a business
cfg.minimum_capital = 500000

-- capital transfer reset interval in minutes
-- default: reset every 24h
cfg.transfer_reset_interval = 24*30

-- commerce chamber {blipid,blipcolor}
cfg.blip = {431,70}

-- positions of commerce chambers
cfg.commerce_chambers = {
	{440.2685546875,-976.13635253906,30.689594268799}
}

return cfg
