#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

[
    QGVAR(QuickReferenceMarkerMode),
    "LIST",
    LSTRING(QRM_Mode),
    LSTRING(QRM_settingsCategory),
    [[0, 1, 2], [LSTRING(QRM_Disabled), LSTRING(QRM_VehiclePos), LSTRING(QRM_ViewPos)], 2]
] call CBA_fnc_addSetting;
