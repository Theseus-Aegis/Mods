#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

[QGVAR(Medic), "init", LINKFUNC(medicalArsenal)] call CBA_fnc_addClassEventHandler;

ADDON = true;
