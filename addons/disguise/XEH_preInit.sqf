#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(disguiseInitialised) = false;
GVAR(disguiseBlown) = false;

GVAR(civilianVehicles) = [];
GVAR(civilianUniforms) = [];
GVAR(civilianBackpacks) = [];
GVAR(civilianHeadgear) = [];
GVAR(civilianVests) = [];
GVAR(civilianGoggles) = [];
GVAR(civilianExcludeMarkers) = [];

if (hasInterface) then {
    [QGVAR(blowDisguise), {
		GVAR(disguiseBlown) = _this;
	}] call CBA_fnc_addEventHandler;
};

ADDON = true;