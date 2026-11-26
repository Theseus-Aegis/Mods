[
    QGVAR(enabled),
    "CHECKBOX",
    [ACELSTRING(Common,Enabled), LSTRING(EnabledDesc)],
    format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)],
    false,
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(enabledPlayers),
    "CHECKBOX",
    [LSTRING(EnabledPlayers), LSTRING(EnabledPlayersDesc)],
    format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)],
    true,
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(enabledVehicles),
    "CHECKBOX",
    [LSTRING(EnabledVehicles), LSTRING(EnabledVehiclesDesc)],
    format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)],
    true,
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(allowServerReset),
    "CHECKBOX",
    [LSTRING(AllowServerReset), LSTRING(AllowServerResetDesc)],
    format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)],
    true,
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(vehiclesObjects),
    "CHECKBOX",
    [LSTRING(VehiclesObjects), LSTRING(VehiclesObjectsDesc)],
    [format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)], LSTRING(Vehicles)],
    true,
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(vehiclesStaticWeapons),
    "CHECKBOX",
    [LSTRING(VehiclesStaticWeapons), LSTRING(VehiclesStaticWeaponsDesc)],
    [format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)], LSTRING(Vehicles)],
    true,
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(vehiclesTurrets),
    "CHECKBOX",
    [LSTRING(VehiclesTurrets), LSTRING(VehiclesTurretsDesc)],
    [format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)], LSTRING(Vehicles)],
    true,
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(vehiclesPylons),
    "CHECKBOX",
    [LSTRING(VehiclesPylons), LSTRING(VehiclesPylonsDesc)],
    [format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)], LSTRING(Vehicles)],
    true,
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(vehiclesACECargo),
    "CHECKBOX",
    [LSTRING(VehiclesACECargo), LSTRING(VehiclesACECargoDesc)],
    [format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)], LSTRING(Vehicles)],
    true,
    true,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(vehiclesACESupply),
    "CHECKBOX",
    [LSTRING(VehiclesACESupply), LSTRING(VehiclesACESupplyDesc)],
    [format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)], LSTRING(Vehicles)],
    true,
    true,
    {},
    true
] call CBA_fnc_addSetting;
