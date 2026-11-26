#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Adds the Armory action to an Object and handles the GUI initialization.
 *
 * Arguments:
 * 0: Object <OBJECT> (Optional)
 *
 * Return Value:
 * None
 *
 * Example:
 * [object] call tac_armory_fnc_init
 *
 * Public: Yes
 */

params [["_object", this]];

// Check if object has inventory and Armory is not yet enabled on it
if !([_object] call FUNC(canAddArmory)) exitWith {};

// Add action
private _armoryAction = [
    QGVAR(OpenAction),
    LLSTRING(Open),
    "",
    {[_this select 2] call FUNC(openArmory)},
    {[_this select 2] call FUNC(canOpenArmory)},
    {},
    _object
] call ACEFUNC(interact_menu,createAction);

[_object, 0, ["ACE_MainActions"], _armoryAction] call ACEFUNC(interact_menu,addActionToObject);

_object setVariable [QGVAR(enabled), true];

// Known as an Armory (bodybags within reach of one can be returned to their owner: tac_bodybag_fnc_isAtBase)
if (isNil QGVAR(objects)) then {
    GVAR(objects) = [];
};
GVAR(objects) pushBackUnique _object;
