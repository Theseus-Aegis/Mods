#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

["tac_Supply_Medic", "init", {(_this select 0) call FUNC(medicalArsenal)}, false, [], true] call CBA_fnc_addClassEventHandler;

ADDON = true;
