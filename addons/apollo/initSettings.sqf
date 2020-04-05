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
