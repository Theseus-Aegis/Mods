[
    QGVAR(fatalInjuriesCardiacArrestTimeCoefficient),
    "SLIDER",
    [LSTRING(FatalInjuriesCardiacArrestTimeCoefficient_DisplayName), LSTRING(FatalInjuriesCardiacArrestTimeCoefficient_Description)],
    format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)],
    [0, 1, 0.2, 2],
    true // isGlobal
] call CBA_fnc_addSetting;
