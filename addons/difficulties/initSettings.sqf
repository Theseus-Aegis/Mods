[
    QGVAR(gunnerAccuracyFactor),
    "SLIDER",
    [LSTRING(gunnerAccuracyFactorDisplayName), LSTRING(gunnerAccuracyFactorDesc)],
    format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)],
    [0, 1, 1, 2],
    true
] call CBA_fnc_addSetting;
