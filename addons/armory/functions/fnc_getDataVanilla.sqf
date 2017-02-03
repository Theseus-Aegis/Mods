/*
 * Author: Jonpas
 * Gets preset Armory data.
 *
 * Arguments:
 * 0: Category <STRING>
 *
 * Return Value:
 * Armory Data <ARRAY>
 *
 * Example:
 * ["category"] call tac_armory_fnc_getDataVanilla
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_selectedCategory"];

private _object = ACE_player getVariable [QGVAR(object), objNull];

if (isNull _object) exitWith {
    ERROR_1("Object non-existent: %1",_object);
    []
};

private _armoryDataVar = _object getVariable [QGVAR(armoryData), []];
private _armoryData = [];

// Verify armory data
{
    _x params [
        ["_category", "", [""]],
        ["_className", "", [""]],
        ["_subCategory", "", [""]],
        ["_description", "", [""]],
        ["_quantity", 1, [0]]
    ];

    if (_category == _selectedCategory && {_className != ""} && {_subCategory != ""} && {_quantity > 0}) then {
        _armoryData pushBack [_className, _subCategory, _description, str _quantity];
    };
} forEach _armoryDataVar;

_armoryData
