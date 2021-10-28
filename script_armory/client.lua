-----------------------------------------------------------
----             Police Armory  Script                 ----
----             Made by Tamir112#5345                 ----
----        For more scripts and updates Join:         ----
----              discord.gg/bDPaRDeBKJ                ----
----                                                   ----
-----------------------------------------------------------







-- DO NOT EDIT BELOW THIS IF YOU DO NOT KNOW WHAT YOU ARE DOING !! -- 
-- DO NOT EDIT BELOW THIS IF YOU DO NOT KNOW WHAT YOU ARE DOING !! -- 
-- DO NOT EDIT BELOW THIS IF YOU DO NOT KNOW WHAT YOU ARE DOING !! -- 
-- DO NOT EDIT BELOW THIS IF YOU DO NOT KNOW WHAT YOU ARE DOING !! -- 






Citizen.CreateThread(function ()
   
    while true do
           Citizen.Wait(1)
           local ped = GetPlayerPed(-1)
   
                   local coords =  GetEntityCoords(ped)
   
   
                   for _,location in ipairs(Config.Stations) do
                       g1 = {
                           x=location[1][1],
                           y=location[1][2],
                           z=location[1][3],
                           
                       }
                       if Config.Marker then
                      DrawMarker(1, g1.x, g1.y, g1.z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 255,0,0, 200, 0, 0, 0, 0)
                       end
                       if CheckPos(coords.x, coords.y, coords.z, g1.x, g1.y, g1.z, 2) then 
                               alert(Config.Message)
                               if IsControlJustPressed(1, Config.Keybind) then 
                              RemoveAllPedWeapons(GetPlayerPed(-1), true)

                              for _,weapon in ipairs(Config.Weapons) do
                                giveWeapon(weapon)


                              end

                              for _,comp in ipairs(Config.Components) do
                                weaponComponent(comp[1], comp[2])
                               

                              end
                        if Config.armor then
                              AddArmourToPed(GetPlayerPed(-1), 100)
                        end



                              ShowNotification("~g~Police loadout has been loaded.")
                            
                            end
                       end
                   
               end
           end
       
       
   end)







   function CheckPos(x, y, z, cx, cy, cz, radius)
    local t1 = x - cx
    local t12 = t1^2

    local t2 = y-cy
    local t21 = t2^2

    local t3 = z - cz
    local t31 = t3^2

    return (t12 + t21 + t31) <= radius^2
end


function alert(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

  
  function giveWeapon(hash)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(hash), 100, false, true)
  end
  
  function weaponComponent(weapon, comp)
    if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey(weapon), false) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(weapon), GetHashKey(comp))
    end
  end