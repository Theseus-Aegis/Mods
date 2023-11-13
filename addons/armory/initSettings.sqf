[
    QGVAR(system),
    "LIST",
    [LSTRING(System), LSTRING(SystemDesc)],
    format ["TAC %1", localize LSTRING(DisplayName)],
    [[0, 1], [LSTRING(System_Vanilla), LSTRING(System_Chronos)], 1],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(talkingBoxes),
    "SLIDER",
    [LSTRING(TalkingBoxes), LSTRING(TalkingBoxesDesc)],
    format ["TAC %1", localize LSTRING(DisplayName)],
    [0, 100, 7, 0, true],
    true
] call CBA_fnc_addSetting;
