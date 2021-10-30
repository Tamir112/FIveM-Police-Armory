-----------------------------------------------------------
----              Police Armory Script                 ----
----             Made by Tamir112#5345                 ----
----        For more scripts and updates Join:         ----
----              discord.gg/bDPaRDeBKJ                ----
----                                                   ----
-----------------------------------------------------------



Config = {} -- DO NOT TOUCH THIS LINE!

Config.Armories = { -- Configure all the locations here for each armory.
    {x = 1851.89, y = 3690.13, z = 33.27}, -- Sandy Shores Station
}

Config.Keybind = 38 -- Default keybind is E, to choose a different one get the ID you want from https://docs.fivem.net/docs/game-references/controls/

Config.Marker = {
    State = true, -- Set to false if you do not want a hologram to be placed where the armory is.
    DrawDistance = 10.0, -- How far away the marker will be drawn. (Should be bigger than Radius)
    Radius = 1.5, -- How big the marker will be.
    Color = {r = 255, g = 0, b = 0, a = 200}, -- The color of the marker.
    Scale = {x = 1.5, y = 1.5, z = 0.5}, -- The scale of the marker. (x and y values should be the same as Radius)
}

Config.Message = 'Press ~g~E ~w~to equip your LEO loadout' -- This is the message that appears when the player is at the armory.

Config.Armor = true -- Set to false if you do not want the player to recive full armor upon equipping his loadout

Config.Weapons = { -- These are all the weapons you want to be added, add each weapon by it's hash.  https://wiki.rage.mp/index.php?title=Weapons
    `weapon_combatpistol`,
    `weapon_flashlight`,
    `weapon_flashbang`,
    `weapon_nightstick`,
    `weapon_stungun`,
}

Config.Components = { -- This is completely optional, this is used to add components to different weapons. https://wiki.rage.mp/index.php?title=Weapons_Components
    -- Format: {Weapon hash, component hash}
    {weapon = `weapon_combatpistol`, component = `COMPONENT_AT_PI_FLSH`}
}
