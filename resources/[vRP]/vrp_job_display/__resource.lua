resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description "vRP holdup"
--ui_page "ui/index.html"

dependency "vrp"

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}


 