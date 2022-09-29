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

-- For support join our discord: https://p33t.net/discord
-- Want more? check out my tebex: https://p33t.tebex.io

local QBCore = exports["qb-core"]:GetCoreObject()

function Main(source)
    -- Get stress level
    local PData = QBCore.Functions.GetPlayerData()
    local Stress = PData.metadata["stress"]

    -- Check if player even needs to meditate
    if Stress <= 0 then
        QBCore.Functions.Notify(Config.NoStress, "error")
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
    exports['ps-ui']:Circle(function(success)
        if success then
            -- Remove rand. amount of stress
            local removeAmt = math.random(12, 24)
            if Stress - removeAmt <= 0 then
                removeAmt = Stress
            end
            TriggerServerEvent('hud:server:RelieveStress', removeAmt)

            QBCore.Functions.Notify(Config.Success..removeAmt..Config.Success2, "success")
        else
            TriggerServerEvent('hud:server:GainStress', math.random(1, 3))
            QBCore.Functions.Notify(Config.Interrupted, "error")
        end
        -- Stop anim
        ClearPedTasks(PlayerPedId())
    end, 5, 15) -- NumberOfCircles, MS
end


Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/'..Config.CommandName, Config.CommandHint)
end)

RegisterCommand(Config.CommandName, function(source)
    Main(source)
end)
    
RegisterNetEvent('p33t-meditate:client:meditate', function(source)
    Main(source)
end)

if Config.Debug == true then
RegisterCommand("debug_gainstress", function(source)
    TriggerServerEvent('hud:server:GainStress', 100)
end)

RegisterCommand("debug_cancelanim", function(source)
    ClearPedTasks(PlayerPedId())
end)
end