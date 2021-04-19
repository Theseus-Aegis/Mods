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
    format ["TAC %1", localize "str_a3_rscdisplaywelcome_expa_parc_list6_title"],
    [[0, 1, 2], [ACELSTRING(Common,Disabled), LSTRING(QRM_VehiclePos), LSTRING(QRM_ViewPos)], 2]
] call CBA_fnc_addSetting;
