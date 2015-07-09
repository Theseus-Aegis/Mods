/*
 * Author: Jonpas
 * Prepares and sends data back to Apollo (Chronos).
 *
 * Arguments:
 * 0: Take/Stash <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["type"] call tac_armory_fnc_sendData
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_type);

GVAR(selectedItem) = lnbData [NLIST, [lnbCurSelRow NLIST, 1]]; // ClassName
GVAR(selectedAmount) = lbText [DROPDOWNAMOUNT, (lbSelection CTRL(DROPDOWNAMOUNT)) select 0]; // Quantity

// Change to ACE Events (in Apollo as well)
chronos_armoryData = [player, _type, GVAR(box), GVAR(selectedItem), GVAR(selectedAmount)];
publicVariableServer "chronos_armoryData";
