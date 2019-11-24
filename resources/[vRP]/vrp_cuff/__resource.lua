dependency "vrp"

server_script {
	'@vrp/lib/utils.lua',
	'server.lua'
}

client_script {
	'lib/Tunnel.lua',
	'lib/Proxy.lua',
	'client.lua'
}