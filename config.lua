--[[
$$\    $$\                                         
$$ |   $$ |                                        
$$ |   $$ | $$$$$$\   $$$$$$\   $$$$$$$\  $$$$$$\  
\$$\  $$  |$$  __$$\ $$  __$$\ $$  _____|$$  __$$\ 
 \$$\$$  / $$$$$$$$ |$$ |  \__|\$$$$$$\  $$$$$$$$ |
  \$$$  /  $$   ____|$$ |       \____$$\ $$   ____|
   \$  /   \$$$$$$$\ $$ |      $$$$$$$  |\$$$$$$$\ 
    \_/     \_______|\__|      \_______/  \_______|                                           
            store.VerseScripts.net
--]]
-- Need help? https://discord.gg/rbahmK8kR7

Config = {}
-- Command
Config.CommandName = "meditate" -- The command name, do not include the slash.

-- Notifications
Config.Notify = "okok" -- qb | okok | es.lib | brutal | b-dev
Config.NoStress = "You don't feel the need to meditate." -- Notification when player does not need to meditate.
Config.Success = "You have successfully meditated and relieved " --[[-- {stress amount} --]] Config.Success2 = "% of your stress." 
Config.Interrupted = "You were interrupted while meditating." -- Notification when player fails the minigame.