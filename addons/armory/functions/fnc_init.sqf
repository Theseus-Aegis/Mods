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
 * [box] call tac_armory_fnc_init
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_object", this]];

local _armoryAction = [
    QGVAR(OpenAction),
    localize LSTRING(Open),
    "",
    {
        GVAR(box) = _this select 2; // Set global variable for later reference
        createDialog QGVAR(Display);
        ["main"] call FUNC(dialogControl);
    },
    {true},
    {},
    _object
] call ACE_Interact_Menu_fnc_createAction;

[_object, 0, ["ACE_MainActions"], _armoryAction] call ACE_Interact_Menu_fnc_addActionToObject;
