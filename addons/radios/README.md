# About

Enables pilots to secure the passengers and play radio inside the helicopters.

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
