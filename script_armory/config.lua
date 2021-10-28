-----------------------------------------------------------
----              Police Armory Script                 ----
----             Made by Tamir112#5345                 ----
----        For more scripts and updates Join:         ----
----              discord.gg/bDPaRDeBKJ                ----
----                                                   ----
-----------------------------------------------------------




Config = { -- DO NOT TOUCH THIS LINE!


Stations = { -- Configure all the locations here for each armory.
-- Format {X, Y, Z},
    {{1851.89, 3690.13, 33.27}},

},
Keybind = 38, -- Default keybind is E, to choose a different one get the ID you want from https://docs.fivem.net/docs/game-references/controls/

Marker = true, -- Set to false if you do not want a hologram to be placed where the armory is.

Message = "Press ~g~E ~w~to equip your LEO loadout", -- This is the message that appears when the player is at the armory.

armor = true, -- Set to false if you do not want the player to recive full armor upon equipping his loadout

Weapons = { -- These are all the weapons you want to be added, add each weapon by its hash.  https://wiki.rage.mp/index.php?title=Weapons
"weapon_combatpistol",
"weapon_flashlight",
"weapon_flashbang",
"weapon_nightstick",
"weapon_stungun",



},

Components = { -- This is completely optional, this is used to add components to different weapons. https://wiki.rage.mp/index.php?title=Weapons_Components
-- Format {Weapon hash, component hash}
{"weapon_combatpistol", "COMPONENT_AT_PI_FLSH" }

}
}
