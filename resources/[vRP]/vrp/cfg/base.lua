
local cfg = {}

-- mysql credentials
cfg.db = {
  host = "127.0.0.1", --ip
  database = "vrori",   -- name of database
  user = "root",    --  name of user 
  password = ""   -- password of you database i'm use xampp and no password
}

cfg.save_interval = 30 -- seconds
cfg.whitelist = false -- true/false whitelist

-- delay the tunnel at loading (for weak connections)
cfg.load_duration = 30 -- seconds, player duration in loading mode at the first spawn
cfg.load_delay = 60 -- milliseconds, delay the tunnel communication when in loading mode
cfg.global_delay = 0 -- milliseconds, delay the tunnel communication when not in loading mode

cfg.ping_timeout = 5 -- number of minutes after a client should be kicked if not sending pings

-- identify users only with steam or ros identifiers (solve same ip issue, recommended)
-- if enabled, steam auth should be forced in the FiveM server config
cfg.ignore_ip_identifier = true
cfg.ignore_license_identifier = true
cfg.ignore_xbox_identifier = true
cfg.ignore_live_identifier = true

cfg.lang = "da" -- en / fr / pt-br
cfg.debug = false

return cfg