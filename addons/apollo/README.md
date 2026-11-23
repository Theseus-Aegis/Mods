# About

Adds Apollo in-game persistence system (part of Chronos).

## Persistent vehicles

- **Saving:** every 60 s the server saves each persistent vehicle (`fnc_vehicleSaveServer`): one SQF array of `[key, value]` pairs (`fnc_vehicleSingletonSave`), sent with apollo-server's `storeVehicle`. Minotaur reads it and builds the statements that restore it (`apollo/vehicles.py`), so new saved properties need only their save side here.
- **Saved:** position and tilt, damage and hit points, fuel, lock, customization, cargo (backpacks, uniforms and vests with their contents, magazines with their rounds, weapons with their attachments), turret magazines, pylons, ACE cargo, ACE fuel (and ACE ammo with the "limited" supply setting), grad_trenches progress.
- **Persistent:** vehicles loaded from Chronos, objects added with Zeus "Add object to Chronos", and static weapons when a player deploys one (ACE CSW or vanilla assembly). All go through `fnc_registerVehicle`.
- **Removal:** a persistent vehicle whose object is gone (deleted, packed up, a wreck cleaned up) is removed from Chronos at the next save round (`removeVehicle`). A vehicle loaded as ACE cargo is saved inside its carrier only.
- **Round-trip test** (test servers only): from the debug console, `[cursorObject] remoteExec ["tac_apollo_fnc_testVehicleRoundTrip", 2]` saves the vehicle, deletes it, loads it back and reports the differences (RPT and chat).

The mod, apollo-server and Minotaur must be updated together: the save format and `removeVehicle` are new. What to check before release is in Minotaur's `docs/apollo-rework-plan.md` ("Before merging"), the in-game checks in its `docs/game-tests.md` (section 7).

### Authors

- [Jonpas](https://github.com/jonpas)
