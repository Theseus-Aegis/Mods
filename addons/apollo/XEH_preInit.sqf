#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

if (isServer) then {
    GVAR(vehiclesLoaded) = false;
    GVAR(vehiclesList) = [];
};

GVAR(isDebug) = false;

ADDON = true;
