#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

[QGVAR(Medic), "init", LINKFUNC(medicalArsenal), false] call CBA_fnc_addClassEventHandler;
[QGVAR(Medic_NCO), "init", LINKFUNC(medicalArsenal), false] call CBA_fnc_addClassEventHandler;

ADDON = true;
