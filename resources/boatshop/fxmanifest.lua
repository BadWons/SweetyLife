-- This file is a private content. Create for SweetyLife Roleplay Server. You don't have to rename anything.
-- File created at [19/07/2021 00:06]

fx_version('bodacious')
game('gta5')

author 'Alcao'
description 'A simple script for buy and store boats. With a garage. (compatible w/ESX)'
version '2.0'

dependency 'Sw-Framework'

client_scripts {
    -----------------------
	-------- Libs ---------
	-----------------------

    "vendors/RageUI/RMenu.lua",
    "vendors/RageUI/menu/RageUI.lua",
    "vendors/RageUI/menu/Menu.lua",
    "vendors/RageUI/menu/MenuController.lua",

    "vendors/RageUI/components/*.lua",

    "vendors/RageUI/menu/elements/*.lua",

    "vendors/RageUI/menu/items/*.lua",

    "vendors/RageUI/menu/panels/*.lua",

    "vendors/RageUI/menu/panels/*.lua",
    "vendors/RageUI/menu/windows/*.lua",

}

client_scripts {
    -----------------------
	-------- Main ---------
	-----------------------

    '@Sw-Framework/locale.lua',
    'config.lua',
    'client/main.lua'
}

server_scripts {
    -----------------------
	-------- Main ---------
	-----------------------

    
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server/main.lua'
}