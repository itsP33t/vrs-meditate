--[[
 /$$$$$$$   /$$$$$$   /$$$$$$    /$$    
| $$__  $$ /$$__  $$ /$$__  $$  | $$    
| $$  \ $$|__/  \ $$|__/  \ $$ /$$$$$$  
| $$$$$$$/   /$$$$$/   /$$$$$/|_  $$_/  
| $$____/   |___  $$  |___  $$  | $$    
| $$       /$$  \ $$ /$$  \ $$  | $$ /$$
| $$      |  $$$$$$/|  $$$$$$/  |  $$$$/
|__/       \______/  \______/    \___/  
            P33t.tebex.io
    With collaboration from tpeterka1
--]]

Config = {}
-- Command
Config.CommandName = "meditate" -- The command name, do not include the slash.
Config.CommandHint = "Meditate to relieve stress"

-- Notifications
Config.NoStress = "You don't feel the need to meditate." -- Notification when player does not need to meditate.
Config.Success = "You have successfully meditated and relieved " --[[-- {stress amount} --]] Config.Success2 = "% of your stress." 
Config.Interrupted = "You were interrupted while meditating." -- Notification when player fails the minigame.


Config.Debug = true -- Set to true to enable debug mode.