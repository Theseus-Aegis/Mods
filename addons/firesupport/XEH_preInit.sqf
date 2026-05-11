#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

// Ensure defaults are set.
if (hasInterface) then {
    tac_scripts_ammoTypes = ["SmokeShellOrange", "G_40mm_SmokeOrange"];
};

if (isServer) then {
    tac_scripts_areaSize = [35, 35];
    tac_scripts_roundCount = 0;
};

ADDON = true;
