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
#include "script_component.hpp"

params ["_itemClass"];

_itemClass = toLower _itemClass;

{
    private _compatibleItems = ([_x] call CBA_fnc_compatibleItems) apply {toLower _x};
    _compatibleItems append ((getArray (configFile >> "CfgWeapons" >> _x >> "magazines")) apply {toLower _x});

    TRACE_2("Compatible Items",_x,_compatibleItems);

    if (_itemClass in _compatibleItems) exitWith {
        true
    };
    false
} forEach (weapons ACE_player);
