private _category = format ["TAC %1", localize LSTRING(DisplayName)];

[
    QGVAR(system),
    "LIST",
    [LSTRING(System), LSTRING(SystemDesc)],
    _category,
    [[0, 1], [LSTRING(System_Vanilla), LSTRING(System_Chronos)], 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(lockerClear),
    "CHECKBOX",
    [LSTRING(LockerClear), LSTRING(LockerClearDesc)],
    _category,
    true,
    true
] call CBA_fnc_addSetting;
