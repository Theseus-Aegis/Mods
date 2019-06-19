#include "script_component.hpp"
/*
 * Author: Jonpas
 * Gets base variant classname of a scripted optic or accessory (CBA).
 *
 * Arguments:
 * 0: Item Classname <STRING>
 *
 * Return Value:
 * Base Item Classname <STRING>
 *
 * Example:
 * ["itemClass"] call tac_armory_fnc_getBaseVariant
 *
 * Public: No
 */

params ["_itemClass"];

private _cfg = configFile >> "CfgWeapons" >> _itemClass;

// Scripted optic
if (toLower (getText (_cfg >> "weaponInfoType")) find "cba_scriptedoptic" > -1) exitWith {
    private _baseClasses = "configName _x == _itemClass" configClasses (configFile >> "CBA_PIPItems");
    if !(_baseClasses isEqualTo []) then {
        configName (_baseClasses select 0)
    };
    _itemClass
};

// Accessory
private _hasNextClass = isText (_cfg > "MRT_SwitchItemNextClass");
private _hasPrevClass = isText (_cfg > "MRT_SwitchItemPrevClass");
if (_hasNextClass || {_hasPrevClass}) exitWith {
    private _nextClass = _itemClass;
    private _nextCfg = _cfg;
    private _switchEntry = ["MRT_SwitchItemPrevClass", "MRT_SwitchItemNextClass"] select _hasNextClass;

    while {getNumber (_nextCfg >> "scope") < 2} do {
        _nextClass = getText (_nextCfg >> _switchEntry);
        _nextCfg = configFile >> "CfgWeapons" >> _baseClass;

        _hasNextClass = isText (_nextCfg > "MRT_SwitchItemNextClass");
        _hasPrevClass = isText (_nextCfg > "MRT_SwitchItemPrevClass");
        _switchEntry = ["MRT_SwitchItemPrevClass", "MRT_SwitchItemNextClass"] select _hasNextClass;
    };

    if (getNumber (_nextCfg >> "scope") == 2) then {
        _nextClass
    };
    _itemClass
};

_itemClass
