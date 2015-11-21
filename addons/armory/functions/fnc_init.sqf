/*
 * Author: Jonpas
 * Adds the Armory action to an Object and handles the GUI initialization.
 *
 * Arguments:
 * Object <OBJECT/ARRAY> (Optional)
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
if !([_object] call FUNC(canAddArmory)) exitWith {
    ACE_LOGWARNING_1("Aborted adding Armory to an object without inventory. Object classname: %1",typeOf _object);
};

// Add action
private _armoryAction = [
    QGVAR(OpenAction),
    localize LSTRING(Open),
    "",
    {[_this select 2] call FUNC(openArmory)},
    {true},
    {},
    _object
] call ACE_Interact_Menu_fnc_createAction;

[_object, 0, ["ACE_MainActions"], _armoryAction] call ACE_Interact_Menu_fnc_addActionToObject;
