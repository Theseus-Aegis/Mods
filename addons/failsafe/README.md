# About

What a vehicle does on its own when the player flying or driving it loses the connection (#395): an aircraft is frozen in the air, a ground vehicle or boat stopped. Works in every mission, with or without Chronos.

## Aircraft

- **Frozen:** when the player flying an aircraft (the pilot, or a co-pilot with the controls) leaves above the minimum height, the server freezes it where it is (`enableSimulationGlobal false`) and keeps its speed. The rest of the crew is told. A landed aircraft, or one below the minimum height, is left as it is.
- **Resume Flight** (self-interaction, a 3 s countdown) from the pilot's seat, or from a co-pilot's seat while the pilot's is empty: the aircraft is unfrozen, gets its engine and speed back, and a co-pilot takes the controls.
- **Take Pilot's Seat** (self-interaction): anyone in the frozen aircraft moves to its empty pilot's seat, then resumes.
- **The pilot reconnects:** they're put back in the pilot's seat if it's still free (a few seconds after loading in) and resume when they're ready.

## Ground vehicles and boats

When a driver leaves a vehicle moving faster than 5 km/h, it's stopped a second later, once it's local to someone else. Otherwise it rolls on with nobody steering, into whatever is ahead, with its passengers inside.

## Settings (TAC Failsafe)

- Freeze Aircraft on Disconnect (on)
- Minimum Height (5 m)
- Stop Ground Vehicles on Disconnect (on)

### Authors

- [Jonpas](https://github.com/jonpas)
