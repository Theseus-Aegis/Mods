[
    QGVAR(talkingBoxes),
    "SLIDER",
    [LSTRING(TalkingBoxes), LSTRING(TalkingBoxesDesc)],
    format ["TAC %1", localize LSTRING(DisplayName)],
    [0, 1, 0.07, 0, true],
    true
] call CBA_fnc_addSetting;
