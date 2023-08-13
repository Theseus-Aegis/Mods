[
    QGVAR(enabled),
    "CHECKBOX",
    [ACELSTRING(Common,Enabled), LSTRING(EnabledDesc)],
    format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)],
    true, // default value
    true // isGlobal
] call CBA_fnc_addSetting;
