#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

if (hasInterface) then {
    GVAR(tracks) = ('getNumber (_x >> QGVAR(isTrack)) > 0' configClasses (configFile >> "CfgSounds")) apply {configName _x};
};

ADDON = true;
