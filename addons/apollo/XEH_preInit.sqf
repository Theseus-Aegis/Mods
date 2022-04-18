#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

GVAR(vehiclesLoaded) = false;
GVAR(isDebug) = false;
GVAR(vehiclesList) = [];

// Preload extension
"tac_apollo_client" callExtension "";

ADDON = true;
