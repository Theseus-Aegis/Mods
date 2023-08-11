[
    QGVAR(enabledRemoteSensors),
    "CHECKBOX",
    [LSTRING(EnabledRemoteSensors), LSTRING(EnabledRemoteSensorsDesc)],
    format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)],
    false,
    true,
    {
        if (isServer || {!hasInterface}) exitWith {};
        disableRemoteSensors !_this;
        INFO_1("disableRemoteSensors %1",!_this);
    }
] call CBA_fnc_addSetting;
