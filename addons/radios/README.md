# About

Enables pilots to secure the passengers and play radio inside the helicopters, as well as crew personnel to create RATEL markers on the map without sacrificing the control of the helicopter.

### Authors

- [DaC](http://github.com/DavidCamre)
- [Jonpas](http://github.com/jonpas)

### Features

Security:
- Ability to Secure and Unsecure Crew in helicopters
- Plays an open/close door animation for helicopters that support it
- When Pilot or Copilot is present, Cargo can't Secure themselves
- Anyone can always Secure or Unsecure from outside
- When Pilot and Copilot die, anyone can Unsecure
- Mission makers can use the following to prevent players from unlocking a certain vehicle:
    `this setVariable ["TAC_HelicopterEvents_preventUnlock",true,true];`

Radio:
- Ability to Play Music in Pilot and Copilot seats
- Can be heard outside and inside the helicopter
- Shuts down upon helicopter destroyal
- When Pilot and Copilot are dead or not present anyone can Stop Music

RATEL Marker:
- Supports all Air vehicles
- Ability to create a local KIA marker through an easy interface
- Synchronizes between all Turrets (excluding FFV), Pilot and Copilot
- Supports (theoretically) infinite length of a coordinate
- Removes previous marker when a new one is created
