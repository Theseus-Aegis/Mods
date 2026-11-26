# About

Adds Apollo in-game persistence system (part of Chronos).

## Persistent vehicles

- **Saving:** every 60 s the server saves each persistent vehicle (`fnc_vehicleSaveServer`): one SQF array of `[key, value]` pairs (`fnc_vehicleSingletonSave`), sent with apollo-server's `storeVehicle`. Minotaur keeps it (`apollo/vehicles.py`).
- **Loading:** Minotaur sends the same pairs back as data, in pieces (`getVehicle`), and `fnc_vehicleSingletonLoad` makes the vehicle from them (`fnc_setCargo` for inventories). Minotaur sends no SQF code: a new saved property needs its save here, its field in Minotaur, and its load here.
- **Saved:** position and tilt, damage and hit points, fuel, lock, customization, cargo (backpacks, uniforms and vests with their contents, magazines with their rounds, weapons with their attachments), turret magazines, pylons, ACE cargo, ACE fuel (finite) and ACE ammo (the "limited" supply's count, or the "only specific magazines" supply's magazines), grad_trenches progress.
- **Settings** (TAC Apollo › Vehicles, all on by default): a mission can turn off objects that aren't vehicles (trenches, sandbags, fortifications, crates), static weapons (with ACE CSW tripods), turret ammo, pylons, ACE cargo, and ACE fuel and ammo supply. Each is then neither saved nor loaded (a vehicle keeps what it's made with).
- **Persistent:** vehicles loaded from Chronos, objects added with Zeus "Add object to Chronos", and what players place, a second later (`fnc_registerPlaced`, if its setting is on): static weapons (ACE CSW `deployWeaponSucceeded`, vanilla `WeaponAssembled`), trenches (`ace_trenches_placed`), ACE fortify objects (`acex_fortify_objectPlaced`), and, with no event for them, ACE sandbags and tripods (server class init handlers). Objects that exist before the vehicles are loaded (the mission's) aren't. All go through `fnc_registerVehicle`.
- **Removal:** a persistent vehicle is removed from Chronos a second after it's deleted (packed up, deleted in Zeus, a wreck cleaned up; a `Deleted` handler from `fnc_registerVehicle`, `removeVehicle`). A mission ending runs no more timers, so it removes nothing. Any that went without the handler are removed at the next save round. A vehicle loaded as ACE cargo is saved inside its carrier only.
- **Round-trip test** (test servers only): from the debug console, `[cursorObject] remoteExec ["tac_apollo_fnc_testVehicleRoundTrip", 2]` saves the vehicle, deletes it, loads it back with the same functions as a restart, and reports the differences (RPT and chat).

## Deaths

A player's death is registered when they're killed (`fnc_handleKilled`, `playerDied`), with the loadout and variables at that moment and the death's key (its bodybag's ID). The respawn only reloads the player (`fnc_handleRespawn`, `playerRespawned`); if the killed event didn't register the death, the server registers it then. A player who leaves while dead isn't saved, and their corpse stays for its bodybag.

## Locker (Armory)

The Armory's stash and take go through `fnc_lockerAction` (and kits through `fnc_lockerTakeKit`). Minotaur replies with data only: nothing for a stash (the box is changed here once it accepted), `[class, count, rounds]` entries for what to add to the box when taking (`fnc_lockerQueue`). `fnc_boxCargo` adds or removes by the item's type.

**Stash All** (the Armory's Stash screen): one server event; `fnc_lockerStashAll` empties backpacks, vests and uniforms into the box, then stashes each class with `fnc_lockerAction` (weapons first, then what they leave behind with the rest), as a single stash works it out (`tac_armory_fnc_getStashVariant`). What the locker refuses stays in the box; `lockerStashAllDone` tells the player.

The mod, apollo-server and Minotaur must be updated together: the save format, the data replies and `removeVehicle` are new (apollo-server stays 1.0.0 until the end of development).

### Authors

- [Jonpas](https://github.com/jonpas)
