#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Hides the message on the pad (FUNC(showMessage)), leaving what was under it hidden.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call tac_armory_fnc_hideMessage
 *
 * Public: No
 */

{
    ctrlShow [_x, false];
} forEach [MESSAGEFRAME, MESSAGETEXT, MESSAGEOKFRAME, MESSAGEOKBTN];
GVAR(messageDismissable) = false;
