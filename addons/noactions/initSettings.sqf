
#define NO_ACTION_SETTING(NAME, DEFAULT)\
[\
    QGVAR(NAME),\
    "CHECKBOX",\
    [\
        LSTRING(NAME),\
        LSTRING(NAME)\
    ],\
    LSTRING(settings),\
    DEFAULT,\
    2,\
    {\
        profileNamespace setVariable [QGVAR(NAME), parseNumber !_this];\
        saveProfileNamespace;\
    },\
    true\
] call CBA_settings_fnc_init

// Eject
NO_ACTION_SETTING(eject, false);
// Rearm at containers
NO_ACTION_SETTING(rearm, false);
// Vehicle turn in
NO_ACTION_SETTING(turnin, false);
// Vehicle turn out
NO_ACTION_SETTING(turnout, false);
// Lighs on
NO_ACTION_SETTING(lighton, false);
// Lights off
NO_ACTION_SETTING(lightoff, false);
