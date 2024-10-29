private _category = format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(fatalInjuriesCardiacArrestTimeCoefficient),
    "SLIDER",
    [LSTRING(FatalInjuriesCardiacArrestTimeCoefficient_DisplayName), LSTRING(FatalInjuriesCardiacArrestTimeCoefficient_Description)],
    _category,
    [0.01, 1, 0.2, 2],
    true // isGlobal
] call CBA_fnc_addSetting;

[
    QGVAR(unconsciousFXEnabled),
    "CHECKBOX",
    [LSTRING(UnconsciousFX_DisplayName), LSTRING(UnconsciousFX_Description)],
    _category,
    true,
    1
] call CBA_fnc_addSetting;

[
    QGVAR(unconsciousFXChance),
    "SLIDER",
    [LSTRING(UnconsciousFXChance_DisplayName), LSTRING(UnconsciousFXChance_Description)],
    _category,
    [0, 1, 0.5, 1, true],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(unconsciousFXTimer),
    "SLIDER",
    [LSTRING(UnconsciousFXTimer_DisplayName), LSTRING(UnconsciousFXTimer_Description)],
    _category,
    [5, 60, 30, 1, false],
    1
] call CBA_fnc_addSetting;
