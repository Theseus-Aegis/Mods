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
