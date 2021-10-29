-----------------------------------------------------------
----             Police Armory  Script                 ----
----             Made by Tamir112#5345                 ----
----        For more scripts and updates Join:         ----
----              discord.gg/bDPaRDeBKJ                ----
----                                                   ----
-----------------------------------------------------------



-- DO NOT EDIT BELOW THIS IF YOU DO NOT KNOW WHAT YOU ARE DOING !! --

local closestArmory = {
    loc = {},
    isInMarker = false
}

Citizen.CreateThread(function() -- Main Thread
    while true do
        Citizen.Wait(200)

        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

        local lowestDist = Config.Marker.DrawDistance
        for _,armory in pairs(Config.Armories) do
            local distance = GetDistanceBetweenCoords(coords, armory.x, armory.y, armory.z, true)
            if distance < lowestDist then
                closestArmory.loc = armory
                lowestDist = distance

                if distance < Config.Marker.Radius then
                    closestArmory.isInMarker = true
                else
                    closestArmory.isInMarker = false
                end
            end
        end

        if lowestDist == Config.Marker.DrawDistance then
            closestArmory.loc = {}
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if closestArmory.loc ~= {} then
            local markerScale = Config.Marker.Scale
            local markerColor = Config.Marker.Color

            DrawMarker(1, closestArmory.loc.x, closestArmory.loc.y, closestArmory.loc.z, 0, 0, 0, 0, 0, 0, markerScale.x, markerScale.y, markerScale.z, markerColor.r, markerColor.g, markerColor.b, markerColor.a, false, false, 2, false, nil, nil, false)

            if closestArmory.isInMarker then
                ShowAlert(Config.Message)

                if IsControlJustPressed(0, Config.Keybind) then
                    local ped = PlayerPedId()

                    RemoveAllPedWeapons(ped, true)

                    for _,weapon in ipairs(Config.Weapons) do
                        giveWeapon(weapon)
                    end

                    for _,comp in ipairs(Config.Components) do
                        weaponComponent(comp.weapon, comp.component)
                    end

                    if Config.Armor then
                        AddArmourToPed(ped, 100)
                    end

                    ShowNotification("~g~Police loadout has been loaded.")
                end
            end
        end
    end
end)

Citizen.CreateThread(function() -- Garbage collection thread
    while true do
        Citizen.Wait(10000)

        collectgarbage()
    end
end)


function ShowAlert(msg)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

function ShowNotification(text)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandThefeedPostTicker(false, false)
end


function giveWeapon(hash)
    GiveWeaponToPed(PlayerPedId(), hash, 100, false, false)
end

function weaponComponent(weapon, comp)
    local ped = PlayerPedId()
    if HasPedGotWeapon(ped, weapon, false) then
        GiveWeaponComponentToPed(ped, weapon, comp)
    end
end
