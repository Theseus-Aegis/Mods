// Tripflares
[
    QGVAR(improvedFlaresEnabled),
    "CHECKBOX",
    [LSTRING(Improved_Flares_Enabled_DisplayName), LSTRING(Improved_Flares_Enabled_Description)],
    format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)],
    true,
    1,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(improvedFlaresColour),
    "LIST",
    [LSTRING(Improved_Flares_Colour_DisplayName), LSTRING(Improved_Flares_Colour_Description)],
    format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)],
    [[0, 1, 2], ["$str_cfg_markercol_white", "$str_cfg_markercol_red", "$str_cfg_markercol_green"]],
    1,
    {},
    true
] call CBA_fnc_addSetting;
