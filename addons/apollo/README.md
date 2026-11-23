# About

Adds Apollo in-game persistence system (part of Chronos).

## Persistent vehicles

- **Saving:** every 60 s the server saves each persistent vehicle (`fnc_vehicleSaveServer`): one SQF array of `[key, value]` pairs (`fnc_vehicleSingletonSave`), sent with apollo-server's `storeVehicle`. Minotaur keeps it (`apollo/vehicles.py`).
- **Loading:** Minotaur sends the same pairs back as data, in pieces (`getVehicle`), and `fnc_vehicleSingletonLoad` makes the vehicle from them (`fnc_setCargo` for inventories). Minotaur sends no SQF code: a new saved property needs its save here, its field in Minotaur, and its load here.
- **Saved:** position and tilt, damage and hit points, fuel, lock, customization, cargo (backpacks, uniforms and vests with their contents, magazines with their rounds, weapons with their attachments), turret magazines, pylons, ACE cargo, ACE fuel (and ACE ammo with the "limited" supply setting), grad_trenches progress.
- **Persistent:** vehicles loaded from Chronos, objects added with Zeus "Add object to Chronos", and static weapons when a player deploys one (ACE CSW or vanilla assembly). All go through `fnc_registerVehicle`.
- **Removal:** a persistent vehicle is removed from Chronos a second after it's deleted (packed up, deleted in Zeus, a wreck cleaned up; a `Deleted` handler from `fnc_registerVehicle`, `removeVehicle`). A mission ending runs no more timers, so it removes nothing. Any that went without the handler are removed at the next save round. A vehicle loaded as ACE cargo is saved inside its carrier only.
- **Round-trip test** (test servers only): from the debug console, `[cursorObject] remoteExec ["tac_apollo_fnc_testVehicleRoundTrip", 2]` saves the vehicle, deletes it, loads it back with the same functions as a restart, and reports the differences (RPT and chat). Minotaur's `docs/game-tests.md` section 7 has snippets that set up test vehicles.

## Locker (Armory)

The Armory's stash and take go through `fnc_lockerAction` (and kits through `fnc_lockerTakeKit`). Minotaur replies with data only: nothing for a stash (the box is changed here once it accepted), `[class, count, rounds]` entries for what to add to the box when taking (`fnc_lockerQueue`). `fnc_boxCargo` adds or removes by the item's type.

The mod, apollo-server and Minotaur must be updated together: the save format, the data replies and `removeVehicle` are new (apollo-server stays 1.0.0 until the end of development). What to check before release is in Minotaur's `docs/apollo-rework-plan.md` ("Before merging"), the in-game checks in its `docs/game-tests.md` (section 7).

### Authors

- [Jonpas](https://github.com/jonpas)
