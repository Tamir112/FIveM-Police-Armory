-----------------------------------------------------------
----             Police Armory  Script                 ----
----             Made by Tamir112#5345                 ----
----        For more scripts and updates Join:         ----
----              discord.gg/bDPaRDeBKJ                ----
----                                                   ----
-----------------------------------------------------------



-- DO NOT EDIT BELOW THIS IF YOU DO NOT KNOW WHAT YOU ARE DOING !! --

local closestArmory = { -- Closest armory to the player
    loc = {},
    isInMarker = false
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

        local lowestDist = Config.Marker.DrawDistance -- Set the lowest distance to the max distance

        for _,armory in pairs(Config.Armories) do -- Loop through all armories
            local distance = #(coords - vector3(armory.x, armory.y, armory.z)) -- Get distance between player and armory
            if distance < lowestDist then -- If distance is lower than the lowest distance
                closestArmory.loc = armory -- Set the closest armory to the current armory
                lowestDist = distance -- Set the lowest distance to the current distance

                if distance < Config.Marker.Radius then -- If distance is lower than the radius
                    closestArmory.isInMarker = true -- Set isInMarker to true
                else -- If distance is higher than the radius
                    closestArmory.isInMarker = false -- Set isInMarker to false
                end
            end
        end

        if lowestDist == Config.Marker.DrawDistance then -- If the lowest distance is the default distance
            closestArmory.loc = {} -- Set the closest armory to an empty table
        end
    end
end)

Citizen.CreateThread(function()
    local letSleep

    while true do
        Citizen.Wait(0)
        letSleep = true

        if closestArmory.loc ~= {} then -- If the closest armory is not empty
            letSleep = false

            local markerScale = Config.Marker.Scale
            local markerColor = Config.Marker.Color -- {r, g, b, a}

            DrawMarker(1, closestArmory.loc.x, closestArmory.loc.y, closestArmory.loc.z, 0, 0, 0, 0, 0, 0, markerScale.x, markerScale.y, markerScale.z, markerColor.r, markerColor.g, markerColor.b, markerColor.a, false, false, 2, false, nil, nil, false)

            if closestArmory.isInMarker then -- If we're in the marker, we can interact with the armory
                ShowAlert(Config.Message) -- Show the message

                if IsControlJustPressed(0, Config.Keybind) then -- If we press the keybind
                    local ped = PlayerPedId() -- Get the player ped

                    RemoveAllPedWeapons(ped, true) -- Remove all weapons

                    for _,weapon in ipairs(Config.Weapons) do -- Give the player weapons
                        giveWeapon(ped, weapon)
                    end

                    for _,comp in ipairs(Config.Components) do -- Give the player components
                        weaponComponent(ped, comp.weapon, comp.component)
                    end

                    if Config.Armor then -- Give the player armor
                        AddArmourToPed(ped, 100)
                    end

                    ShowNotification("~g~Police loadout has been loaded.")
                end
            end
        end

        if letSleep then
            Citizen.Wait(1000) -- If we're not in render distance of an armory, we can sleep
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


function giveWeapon(ped, hash)
    GiveWeaponToPed(ped, hash, 100, false, false)
end

function weaponComponent(ped, weapon, comp)
    if HasPedGotWeapon(ped, weapon, false) then
        GiveWeaponComponentToPed(ped, weapon, comp)
    end
end
