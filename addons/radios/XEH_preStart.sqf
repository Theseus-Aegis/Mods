#include "script_component.hpp"

#include "XEH_PREP.hpp"

private _tracks = ("true" configClasses (configFile >> "CfgSounds")) apply {toLower (configName _x)} select {_x find QUOTE(ADDON) != -1};
uiNamespace setVariable [QGVAR(tracks), _tracks];
