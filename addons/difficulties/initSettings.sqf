[
    QGVAR(armorAccuracyFactor),
    "SLIDER",
    [LSTRING(armorAccuracyFactor_DisplayName), LSTRING(armorAccuracyFactor_Description)],
    format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)],
    [0, 2, 1, 2],
    true
] call CBA_fnc_addSetting;
