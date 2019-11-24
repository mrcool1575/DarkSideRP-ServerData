resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Watermark til DayLight Network - Deltarix'

ui_page('html/index.html')

client_scripts {
    'dln_client.lua',
}
server_scripts {
    'dln_server.lua',
}

files({
    'html/index.html',
    'img/logo.png',
    'html/css/style.css',
    'html/css/bootstrap.min.css',
    'html/js/script.js',
    'html/js/bootstrap.min.js'
})
