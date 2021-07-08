#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

[QGVAR(Medic), "init", LINKFUNC(medicalArsenal)] call CBA_fnc_addClassEventHandler;

GVAR(traitsBlacklist) = ["tacs_Unit_B_TeamLeader"];
[QGVAR(Medic), "init", {[(_this select 0), "medic"] call FUNC(traitActions)}] call CBA_fnc_addClassEventHandler;
[QGVAR(Engineer), "init", {[(_this select 0), "engineer"] call FUNC(traitActions)}] call CBA_fnc_addClassEventHandler;

ADDON = true;
