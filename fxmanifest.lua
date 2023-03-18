
fx_version 'cerulean'
game 'gta5'

author 'P33t, tpeterka1'
version '2.0.0'

client_scripts {
    'config.lua',
    'client.lua'
}

dependencies {
    'ox_lib',
    'qb-core'
}

shared_script '@ox_lib/init.lua'

escrow_ignore {
    'client.lua',
    'config.lua'
}

lua54 'yes'