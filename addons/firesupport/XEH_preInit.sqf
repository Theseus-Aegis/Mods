#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

// Ensure defaults are set.
if (hasInterface) then {
    if (isNil "tac_scripts_ammoTypes") then {
        tac_scripts_ammoTypes = ["SmokeShellOrange", "G_40mm_SmokeOrange"];
    };
};

if (isServer) then {
    if (isNil "tac_scripts_areaSize") then {
        tac_scripts_areaSize = [35, 35];
    };

    if (isNil "tac_scripts_roundCount") then {
        tac_scripts_roundCount = 0;
    };
};

ADDON = true;
