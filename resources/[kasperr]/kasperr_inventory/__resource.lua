resource_manifest_version "77731fab-63ca-442c-a67b-abc70f28dfa5"

ui_page "client/html/ui.html"
files {
	"client/html/ui.html",
	"client/html/styles.css",
	"client/html/scripts.js",
	"configNui.js",
	"client/html/debounce.min.js",
	"client/html/sweetalert2.all.min.js",
	-- ICONS
	"client/html/assets/icons/water.png",
	"client/html/assets/icons/bread.png",
	"client/html/assets/icons/combatpistol.png",
	"client/html/assets/icons/pistol_ammo.png",
	"client/html/assets/icons/pills.png",
	"client/html/assets/icons/weed.png"
}

client_scripts {
	"lib/Tunnel.lua",
	"lib/Proxy.lua",
	"config.lua",
	"client/main.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"config.lua",
	"server/main.lua"
}
