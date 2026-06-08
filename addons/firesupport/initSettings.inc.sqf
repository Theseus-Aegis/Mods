private _category = format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(enabled),
    "CHECKBOX",
    [ACELSTRING(Common,Enabled), LSTRING(EnabledDescription)],
    _category,
    false,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(delay),
    "TIME",
    [LSTRING(delayDisplay), LSTRING(delayDescription)],
    _category,
    [0, 1800, 30],
    true
] call CBA_fnc_addSetting;
