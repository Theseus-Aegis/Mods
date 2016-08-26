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
#include "script_component.hpp"

params [["_object", this]];

// Check if object has inventory
if !([_object] call FUNC(canAddArmory)) exitWith {};

// Add action
private _armoryAction = [
    QGVAR(OpenAction),
    localize LSTRING(Open),
    "",
    {[_this select 2] call FUNC(openArmory)},
    {[_this select 2] call FUNC(canOpenArmory)},
    {},
    _object
] call ACE_Interact_Menu_fnc_createAction;

[_object, 0, ["ACE_MainActions"], _armoryAction] call ACE_Interact_Menu_fnc_addActionToObject;

_object setVariable [QGVAR(enabled), true];
