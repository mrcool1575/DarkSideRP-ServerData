resource_manifest_version "77731fab-63ca-442c-a67b-abc70f28dfa5"

ui_page "client/html/ui.html"
files {
	"client/html/ui.html",
	"client/html/styles.css",
	"client/html/scripts.js",
	"client/html/debounce.min.js"
}

client_scripts {
	"config.lua",
	"client/main.lua"
}

server_scripts {
	"config.lua",
	"server/main.lua"
}
