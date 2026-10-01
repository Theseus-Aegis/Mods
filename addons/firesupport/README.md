# About

Adds mortar support on thrown / GL launched markers.

## Classnames:

**Grenade Launched:**
```sqf
tac_firesupport_artilleryHESignalGL
tac_firesupport_artillerySmokeSignalGL
tac_firesupport_mortarHESignalGL
tac_firesupport_mortarSmokeSignalGL
tac_firesupport_rocketHESignalGL
```

## Required:

Firesupport must be enabled via CBA settings, as is the delay and ensure that ACE ammo handling for mortars is off.
```sqf
force ace_mk6mortar_useAmmoHandling = false;
force tac_firesupport_enabled = true;
force tac_firesupport_mortarDelay = 300;
force tac_firesupport_artilleryDelay = 300;
force tac_firesupport_rocketDelay = 300;
force tac_firesupport_perimeterImpact = false;
```

All variables should be added to `init.sqf`

Supports must be defined via mission template like so:

```sqf
tac_firesupport_mortarList = [M1, M2];
tac_firesupport_artilleryList = [A1, A2];
tac_firesupport_rocketList = [R1];
```

## Optional:

Area of effect can be defined via:

```sqf
tac_firesupport_mortarAreaSize = [35, 35];
tac_firesupport_artilleryAreaSize = [90, 90];
tac_firesupport_rocketAreaSize = [150, 150];
```

Amount of rounds fired can be defined via:    
```sqf
tac_firesupport_mortarRoundCount = 0;
tac_firesupport_artilleryRoundCount = 6;
tac_firesupport_rocketRoundCount = 4;
```

## Notes:

- Fire support is limited to:
 - Mortars (of any kind)
 - Sholef (B_MBT_01_arty_F) and any inheriting ones. (From NATO faction)
 - Seara (B_MBT_01_mlrs_F) and any inheriting ones. (From NATO faction)
 - None NATO artillery pieces outside of Mortars use different ammo.

### Authors

- [MikeMF](http://github.com/Mike-MF)
