// add setting for all gear from settings
{
    private _class = configName _x;
    [
        GEAR_SETTING(_class),
        "CHECKBOX",
        [format [LLSTRING(GearEnabled), _class], LSTRING(GearEnabled_Description)],
        [LSTRING(DisplayName), LSTRING(Gear)],
        true,
        1,
        {},
        true
    ] call CBA_fnc_addSetting;
} forEach ("true" configClasses (configFile >> QGVAR(gear)));

[
    QGVAR(Chance_Headgear),
    "SLIDER",
    [LSTRING(Headgear_Chance), LSTRING(Chance_Description)],
    [LSTRING(DisplayName), LSTRING(Gear)],
    [0, 1, 0.95, 1, true],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(Chance_Facewear),
    "SLIDER",
    [LSTRING(Facewear_Chance), LSTRING(Chance_Description)],
    [LSTRING(DisplayName), LSTRING(Gear)],
    [0, 1, 0.5, 1, true],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(Chance_Pistol),
    "SLIDER",
    [LSTRING(Pistol_Chance), LSTRING(Chance_Description)],
    [LSTRING(DisplayName), LSTRING(Gear)],
    [0, 1, 0.3, 1, true],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(Chance_Launcher),
    "SLIDER",
    [LSTRING(Launcher_Chance), LSTRING(Chance_Description)],
    [LSTRING(DisplayName), LSTRING(Gear)],
    [0, 1, 0.2, 1, true],
    true
] call CBA_fnc_addSetting;
