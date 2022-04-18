#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

GVAR(vehiclesLoaded) = false;
GVAR(isDebug) = false;
GVAR(vehiclesList) = [];

// Preload extensions
"tac_apollo_client" callExtension "";

if (isServer) then {
    "jni" callExtension "";
};

ADDON = true;
