#include "script_component.hpp"
/*
 * Author: Jonpas
 * Checks if magazine or attachment is compatible with any weapon carried by player.
 *
 * Arguments:
 * 0: Item Classname <STRING>
 *
 * Return Value:
 * Compatible <BOOL>
 *
 * Example:
 * ["itemClass"] call tac_armory_fnc_isCompatible
 *
 * Public: No
 */

params ["_itemClass"];

_itemClass = toLower _itemClass;

{
    private _cfg = configFile >> "CfgWeapons" >> _x;

    private _compatibles = [_x] call CBA_fnc_compatibleItems;
    _compatibles append ([_x, true] call CBA_fnc_compatibleMagazines);
    _compatibles = _compatibles apply {toLower _x};

    TRACE_2("Compatibles",_x,_compatibles);

    if (_itemClass in _compatibles) exitWith {
        true
    };
    false
} forEach (weapons ACE_player);
