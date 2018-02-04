[
    QGVAR(enabled),
    "CHECKBOX",
    [ACELSTRING(Common,Enabled), LSTRING(EnabledDesc)],
    format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)],
    false,
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(enabledPlayers),
    "CHECKBOX",
    [LSTRING(EnabledPlayers), LSTRING(EnabledPlayersDesc)],
    format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)],
    true,
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(enabledVehicles),
    "CHECKBOX",
    [LSTRING(EnabledVehicles), LSTRING(EnabledVehiclesDesc)],
    format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)],
    true,
    true
] call CBA_Settings_fnc_init;
