private _category = format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    [LSTRING(Enabled), LSTRING(EnabledDesc)],
    _category,
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(minHeight),
    "SLIDER",
    [LSTRING(MinHeight), LSTRING(MinHeightDesc)],
    _category,
    [1, 50, 5, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(groundVehicles),
    "CHECKBOX",
    [LSTRING(GroundVehicles), LSTRING(GroundVehiclesDesc)],
    _category,
    true,
    true
] call CBA_fnc_addSetting;
