#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

GVAR(boxLinesMain) = ('getNumber (_x >> QGVAR(boxLine)) > 0' configClasses (configFile >> "CfgSounds")) apply {configName _x};
GVAR(boxLines) = [];

ADDON = true;
