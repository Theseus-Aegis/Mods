/*
 * Author: Jonpas
 * Adds the Armory action to an Object and handles the GUI initialization.
 *
 * Arguments:
 * Object <OBJECT> (Optional)
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

// Change to ACE Interaction
_object addAction ["<t color='#ff1111'>Open Armory</t>", {
    GVAR(box) = _this select 0;

    createDialog QGVAR(Display);
    ["main"] call FUNC(dialogControl);
}, nil, 6, true, true, "", QUOTE(_this distance _target < 3)];
