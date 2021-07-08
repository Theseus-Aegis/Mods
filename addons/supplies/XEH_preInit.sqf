#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

[QGVAR(Medic), "init", LINKFUNC(medicalArsenal)] call CBA_fnc_addClassEventHandler;

GVAR(traitsBlacklist) = ["tacs_Unit_B_TeamLeader"];

ADDON = true;
