#include "script_component.hpp"

private _itemList = getArray (configFile >> "CfgWeapons" >> QGVAR(replacementBase) >> QGVAR(replacementList));
[QGVAR(replacementBase), _itemList] call ace_common_fnc_registerItemReplacement;
