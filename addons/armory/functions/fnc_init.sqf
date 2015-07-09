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
 * Public: No
 */
#include "script_component.hpp"

DEFAULT_PARAM(0,_object,this);

// Change to ACE Interaction
_object addAction ["<t color='#ff1111'>Open Armory</t>", {
    PARAMS_2(_object,_player);

    GVAR(box) = _object;

    createDialog QGVAR(Display);
    ["main"] call FUNC(dialogControl);
}, nil, 6, true, true, "", QUOTE(_this distance _target < 3)];
