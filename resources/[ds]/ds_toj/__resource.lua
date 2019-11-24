version '1.0.0'

dependency "vrp"

client_scripts {
	"lib/Tunnel.lua",
	"lib/Proxy.lua",
	'client.lua'
}
server_scripts {
	"@vrp/lib/utils.lua",
	"server.lua"
}
