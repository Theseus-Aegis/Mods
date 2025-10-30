# About

Adds mortar support on thrown (or GL launched) classname. Will utilise the closest mortar unit to the smoke position. Defaulted to Orange smoke.

Mortars can be named via mission template:

`Mortar_1 setVariable [QGVAR(mortarName), "Templar - 1"];`
Or
`Mortar_1 setVariable ["tac_scripts_mortarName", "Templar - 1"];`

Mortars must also be defined via mission template like so:

`GVAR(mortarList) = [Mortar_1, Mortar_2, Mortar_3];`
Or
`tac_scripts_mortarList = [Mortar_1, Mortar_2, Mortar_3];`

Ammo types that activate fire support must be defined in the mission template:

`GVAR(ammoTypes) = ["SmokeShellOrange", "G_40mm_SmokeOrange"];`
Or
`tac_scripts_ammoTypes = ["SmokeShellOrange", "G_40mm_SmokeOrange"];`

Firesupport must be enabled via CBA settings, as is the delay and ensure that ACE ammo handling for mortars is off.
```sqf
force ace_mk6mortar_useAmmoHandling = false;
force tac_firesupport_enabled = true;
force tac_firesupport_delay = 30;
```

That will allow you to utilise fire support every 30 seconds using Orange smoke.

### Authors

- [MikeMF](http://github.com/Mike-MF)
