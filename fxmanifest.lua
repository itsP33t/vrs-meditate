
fx_version 'cerulean'
game 'gta5'

author 'P33t, tpeterka1'
version '1.0.0'

client_scripts {
    'config.lua',
    'client.lua'
}

dependencies {
    'ps-ui',
    'qb-core'
}

escrow_ignore {
    'client.lua',
    'config.lua'
}

lua54 'yes'
dependency '/assetpacks'