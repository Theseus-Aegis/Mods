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
private _isScriptedOpticClass = isClass (_cfg >> "CBA_ScriptedOptic");
private _isScriptedOpticType = (toLower (getText (_cfg >> "weaponInfoType"))) find "cba_scriptedoptic" > -1;
if (_isScriptedOpticClass || {_isScriptedOpticType}) exitWith {
    // PIP
    private _baseClasses = configProperties [configFile >> "CBA_PIPItems", "getText _x == _itemClass"];

    // Carry Handle
    {
        _baseClasses append (configProperties [_x, "getText _x == _itemClass"]);
    } forEach configProperties [configFile >> "CBA_CarryHandleTypes"];

    TRACE_2("Base classes",_itemClass,_baseClasses);
    if !(_baseClasses isEqualTo []) exitWith {
        configName (_baseClasses select 0)
    };
    _itemClass
};

// Accessory
private _hasNextClass = isText (_cfg >> "MRT_SwitchItemNextClass");
private _hasPrevClass = isText (_cfg >> "MRT_SwitchItemPrevClass");
if (_hasNextClass || {_hasPrevClass}) exitWith {
    private _nextClass = _itemClass;
    private _nextCfg = _cfg;
    private _switchEntry = ["MRT_SwitchItemPrevClass", "MRT_SwitchItemNextClass"] select _hasNextClass;

    while {getNumber (_nextCfg >> "scope") < 2} do {
        _nextClass = getText (_nextCfg >> _switchEntry);
        _nextCfg = configFile >> "CfgWeapons" >> _nextClass;

        _hasNextClass = isText (_nextCfg >> "MRT_SwitchItemNextClass");
        _hasPrevClass = isText (_nextCfg >> "MRT_SwitchItemPrevClass");
        _switchEntry = ["MRT_SwitchItemPrevClass", "MRT_SwitchItemNextClass"] select _hasNextClass;
    };

    TRACE_3("Found class",_itemClass,_nextClass,_nextCfg);
    if (getNumber (_nextCfg >> "scope") == 2) exitWIth {
        _nextClass
    };
    _itemClass
};

// Disposable launcher
_itemClass = cba_disposable_LoadedLaunchers getVariable [_itemClass, _itemClass];

_itemClass
