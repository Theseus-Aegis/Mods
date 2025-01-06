private _category = format ["TAC %1", QUOTE(COMPONENT_BEAUTIFIED)];
[
    QGVAR(disabled),
    "CHECKBOX",
    [LSTRING(Disable), LSTRING(Disable_Description)],
    _category,
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(walk), "CHECKBOX",
    [LSTRING(forceWalk), LSTRING(forceWalk_Description)],
    category,
    true,
    true
] call CBA_fnc_addSetting;

// Blacklisted variables for mods that don't want variables to be transferred. Useful for very particular cases.
GVAR(VarBlacklist) = [];
