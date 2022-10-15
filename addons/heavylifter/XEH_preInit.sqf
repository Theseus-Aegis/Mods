#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if (hasInterface) then {
    GVAR(initializedClasses) = [];
    GVAR(attachPositions) = createHashMap;
    GVAR(attachHelpers) = createHashMap;
};

ADDON = true;
