/*
 * Author: Jonpas
 * Adds items to vanilla Armory system.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Items <ARRAY>
 *   0: Category <STRING>
 *   1: Class Name <STRING>
 *   2: SubCategory <STRING>
 *   3: Description <STRING> (default: "") - not implemented
 *   4: Quantity <NUMBER> (default: 1)
 *
 * Return Value:
 * Successfully Added <BOOL>
 *
 * Example:
 * [object, [["rifle", "arifle_MX_F", "Assault Rifle", "", 5], ["rifle", "srifle_EBR_F", "Marksman Rifle", "", 5]] ] call tac_armory_fnc_addItems
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [
    ["_object", objNull, [objNull]],
    ["_armoryData", [], [[]] ]
];

if (isNull _object) exitWith {
    ERROR_1("Non-existent object: %1",_object);
    false
};

if (GVAR(system) != 0) exitWith {
    ERROR_1("Items cannot be added to Armory using non-Vanilla system: %1",GVAR(system));
    false
};

if (_armoryData isEqualTo []) exitWith {
    ERROR_1("No items data supplied: %1",_armoryData);
    false
};

// Add Armory if not added yet
[_object] call FUNC(init);

if (_object getVariable [QGVAR(enabled), false]) exitWith {
    _object setVariable [QGVAR(armoryData), _armoryData, true];
    true
};

false
