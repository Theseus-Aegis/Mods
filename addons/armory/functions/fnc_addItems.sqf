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
    ACE_LOGERROR_1("Non-existent object: %1",_object);
    false
};

if (GVAR(system) != 0) exitWith {
    ACE_LOGERROR_1("Items cannot be added to Armory using non-Vanilla system: %1",GVAR(system));
    false
};

if (_armoryData isEqualTo []) exitWith {
    ACE_LOGERROR_1("No items data supplied: %1",_armoryData);
    false
};

private _return = true;

// Add Armory if not added yet
if (!(_object getVariable [QGVAR(enabled), false]) && {getNumber (configFile >> "CfgVehicles" >> typeOf _object >> QGVAR(enabled)) != 1}) then {
    if ([_object] call FUNC(canAddArmory)) then {
        [_object] call FUNC(init);
    } else {
        ACE_LOGERROR_1("Armory cannot be added to an object without inventory: %1",_object);
        _return = false;
    };
};

if (_return) then {
    _object setVariable [QGVAR(armoryData), _armoryData, true];
};

_return
