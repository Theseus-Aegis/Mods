# About

Adds mortar support on thrown (or GL launched) classname. Will utilise the closest mortar unit to the smoke position. Defaulted to Orange smoke.

## Required:

Firesupport must be enabled via CBA settings, as is the delay and ensure that ACE ammo handling for mortars is off.
```sqf
force ace_mk6mortar_useAmmoHandling = false;
force tac_firesupport_enabled = true;
force tac_firesupport_delay = 30;
```

Mortars must be defined via mission template like so (`initServer.sqf`):

`GVAR(mortarList) = [Mortar_1, Mortar_2, Mortar_3];`    
Or    
`tac_scripts_mortarList = [Mortar_1, Mortar_2, Mortar_3];`

## Optional:
Ammo types that activate fire support can be defined in the mission template by using the ammo classname (`initPlayerLocal.sqf`):


`GVAR(ammoTypes) = ["SmokeShellOrange", "G_40mm_SmokeOrange"];`    
Or    
`tac_scripts_ammoTypes = ["SmokeShellOrange", "G_40mm_SmokeOrange"];`


Mortars can be named via mission template (`initServer.sqf`):

`Mortar_1 setVariable [QGVAR(mortarName), "Templar - 1"];`    
Or    
`Mortar_1 setVariable ["tac_scripts_mortarName", "Templar - 1"];`


Area of effect can also be defined via (`initServer.sqf`):

`GVAR(areaSize) = [35, 35];`    
Or    
`tac_scripts_areaSize = [50, 50];`


Amount of rounds fired can be defined via (`initServer.sqf`):    
`GVAR(roundCount) = 5;`    
Or    
`tac_scripts_roundCount = 5;`

## Defaults:
- Area Size is defaulted to `[35, 35]`
- Ammo types is defaulted to `["SmokeShellOrange", "G_40mm_SmokeOrange"]`
- Round count is defaulted to `0` (Random from 1-8 handled inside `mortarStrike` function)

### Authors

- [MikeMF](http://github.com/Mike-MF)
