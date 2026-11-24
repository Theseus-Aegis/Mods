#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

if (isServer) then {
    GVAR(frozen) = createHashMap; // pilot UID -> the aircraft frozen when they left

    // Added here, before any postInit, so it runs before other handlers delete the unit (Apollo)
    addMissionEventHandler ["HandleDisconnect", {
        _this call FUNC(handleDisconnect);
        false // the unit isn't kept as AI
    }];

    [QGVAR(resume), FUNC(resumeServer)] call CBA_fnc_addEventHandler;
    [QGVAR(reconnected), FUNC(handleReconnect)] call CBA_fnc_addEventHandler;
};

ADDON = true;
