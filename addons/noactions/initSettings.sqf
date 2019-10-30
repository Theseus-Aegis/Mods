#define NO_ACTION_SETTING(NAME, DEFAULT) [ \
    QGVAR(NAME), \
    "CHECKBOX", \
    [LSTRING(NAME), LSTRING(NAME##_desc)], \
    ["TAC %1", localize LSTRING(DisplayName)], \
    DEFAULT, \
    2, \
    { \
        profileNamespace setVariable [QGVAR(NAME), parseNumber !_this]; \
        saveProfileNamespace; \
    }, \
    true \
] call CBA_fnc_addSetting

// Rearm at containers
NO_ACTION_SETTING(Rearm,false);
// Vehicle turn in
NO_ACTION_SETTING(Turnin,false);
// Vehicle turn out
NO_ACTION_SETTING(TurnOut,false);
// Lighs on
NO_ACTION_SETTING(LightOn,false);
// Lights off
NO_ACTION_SETTING(LightOff,false);
