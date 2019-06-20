[
    QGVAR(system),
    "LIST",
    [LSTRING(System), LSTRING(SystemDesc)],
    format ["TAC %1", localize LSTRING(DisplayName)],
    [[0, 1], [LSTRING(System_Vanilla), LSTRING(System_Chronos)], 0],
    true
] call CBA_fnc_addSetting;
