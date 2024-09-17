
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'jayzie-giveitem'
description 'Give Item Script using ox_lib and ox_inventory'
version '1.0.0'

shared_script '@es_extended/imports.lua'
shared_script '@ox_lib/init.lua'
client_script 'client.lua'
server_script 'server.lua'

dependencies {
    'es_extended',
    'ox_lib',
    'ox_inventory'
}
