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
            by P33t and tpeterka1
--]]
-- Need help? https://discord.gg/rbahmK8kR7

-- Want more? check out our tebex: https://store.versescripts.net

local QBCore = exports["qb-core"]:GetCoreObject()

function Main(source)
    -- Get stress level
    local PData = QBCore.Functions.GetPlayerData()
    local Stress = PData.metadata["stress"]

    -- Check if player even needs to meditate
    if Stress <= 0 then
       Notify("", Config.NoStress, 5000, "error")
        return
    end

    -- Setup anim
    local AnimDict = "rcmcollect_paperleadinout@"
    local Anim = "meditiate_idle"

    RequestAnimDict(AnimDict)
    while not HasAnimDictLoaded(AnimDict) do
        Wait(10)
    end

    -- Play anim
    TaskPlayAnim(PlayerPedId(), AnimDict, Anim, 1.0, 1.0, -1, 1, 0, 0, 0, 0)

    -- Start minigame
    local success = lib.skillCheck({'easy', 'easy', 'medium'}, {'w', 'a', 's', 'd'})
        if success then
            -- Remove rand. amount of stress
            local removeAmt = math.random(12, 24)
            if Stress - removeAmt <= 0 then
                removeAmt = Stress
            end
            TriggerServerEvent('hud:server:RelieveStress', removeAmt)

            Notify("", Config.Success..removeAmt..Config.Success2, 2000, "success")
        else
            TriggerServerEvent('hud:server:GainStress', math.random(1, 3))
            Notify("", Config.Interrupted, 2000, "error")
        end
        -- Stop anim
        ClearPedTasks(PlayerPedId()) -- NumberOfCircles, MS
end


RegisterCommand(Config.CommandName, function(source)
    Main(source)
end)
    
RegisterNetEvent('p33t-meditate:client:meditate', function(source)
    Main(source)
end)


function Notify(title, text, length, type, src)
    if IsDuplicityVersion() then
        -- Running on server
        if Config.Notify == "qb" then
            -- https://docs.qbcore.org/qbcore-documentation/qb-core/client-event-reference#qbcore-notify
            TriggerClientEvent("QBCore:Notify", src, text, type, length)
        elseif Config.Notify == "okok" then
            -- https://docs.okokscripts.io/scripts/okoknotify
            TriggerClientEvent('okokNotify:Alert', src, title, text, length, type)
        elseif Config.Notify == "es.lib" then
            -- https://github.com/ESFramework/es.lib
            TriggerClientEvent("es.lib:showNotify", src, title, "noicon", text, length, type)
        elseif Config.Notify == "brutal" then
            -- https://docs.brutalscripts.com/site/scripts/brutal-notify
            TriggerClientEvent('brutal_notify:SendAlert', src, title, text, length, type)
        elseif Config.Notify == "b-dev" then
            -- https://forum.cfx.re/t/paid-standalone-notify-the-best-notify-with-6-different-types/4905568
            TriggerClientEvent("b-notify:notify", src, type, title, text)
        end
    else
        -- Running on client
        if Config.Notify == "qb" then
            -- https://docs.qbcore.org/qbcore-documentation/qb-core/client-event-reference#qbcore-notify
            TriggerEvent("QBCore:Notify", text, type, length)
        elseif Config.Notify == "okok" then
            -- https://docs.okokscripts.io/scripts/okoknotify
            exports["okokNotify"]:Alert(title, text, length, type)
        elseif Config.Notify == "es.lib" then
            -- https://github.com/ESFramework/es.lib
            TriggerEvent("es.lib:showNotify", title, "noicon", text, length, type)
        elseif Config.Notify == "brutal" then
            -- https://docs.brutalscripts.com/site/scripts/brutal-notify
            exports["brutal_notify"]:SendAlert(title, text, length, type)
        elseif Config.Notify == "b-dev" then
            -- https://forum.cfx.re/t/paid-standalone-notify-the-best-notify-with-6-different-types/4905568
            TriggerEvent("b-notify:notify", type, title, text)
        end
    end
end