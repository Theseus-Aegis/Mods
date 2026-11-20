#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

if (isServer) then {
    GVAR(vehiclesLoaded) = false;
    GVAR(vehicles) = createHashMap; // vehicle ID -> object, the persistent ones (FUNC(registerVehicle))
    GVAR(playerRuntimeData) = createHashMap; // UID -> state kept for the mission (FUNC(runtimeSave))
};

GVAR(liveApi) = false; // the live website only when the server uses it, otherwise the development one

ADDON = true;
