// Included via init.sqf from mission template.

// Sets ACRE2 channel names
{
    [_x, "default", "theseus"] call acre_api_fnc_copyPreset;
    [_x, "theseus", 1, "label", "ARES 1"] call acre_api_fnc_setPresetChannelField;
    [_x, "theseus", 2, "label", "ARES 2"] call acre_api_fnc_setPresetChannelField;
    [_x, "theseus", 3, "label", "ARES 3"] call acre_api_fnc_setPresetChannelField;
    [_x, "theseus", 4, "label", "ARES 4"] call acre_api_fnc_setPresetChannelField;
    [_x, "theseus", 5, "label", "COMMAND"] call acre_api_fnc_setPresetChannelField;
    [_x, "theseus", 11, "label", "HELIOS 1"] call acre_api_fnc_setPresetChannelField;
    [_x, "theseus", 12, "label", "HELIOS 2"] call acre_api_fnc_setPresetChannelField;
    [_x, "theseus", 13, "label", "HELIOS 3"] call acre_api_fnc_setPresetChannelField;
    [_x, "theseus", 14, "label", "HELIOS 4"] call acre_api_fnc_setPresetChannelField;
    [_x, "theseus", 15, "label", "HELIOS CMND"] call acre_api_fnc_setPresetChannelField;
    [_x, "theseus"] call acre_api_fnc_setPreset;
} forEach ["ACRE_PRC152", "ACRE_PRC117F"];
