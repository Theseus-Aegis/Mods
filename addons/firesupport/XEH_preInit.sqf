#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

// Ensure defaults are set.
GVAR(ammoTypes) = ["SmokeShellOrange", "G_40mm_SmokeOrange"];
GVAR(areaSize) = [35, 35];
GVAR(roundCount) = 0;
GVAR(mortarList) = [];
GVAR(mortarsBusy) = false;

ADDON = true;
