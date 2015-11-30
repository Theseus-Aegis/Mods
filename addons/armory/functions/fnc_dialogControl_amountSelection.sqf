/*
 * Author: Jonpas
 * Sets up amount selection dropdown.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call tac_armory_fnc_dialogControl_amountSelection
 *
 * Public: No
 */
#include "script_component.hpp"

private _quantity = CTRL(NLIST) lnbData [lnbCurSelRow NLIST, 2];
TRACE_1("Amount of selected item",_quantity);

lbClear DROPDOWNAMOUNT;

for "_x" from 1 to (parseNumber _quantity) do {
    lbAdd [DROPDOWNAMOUNT, str(_x)];
};

// Set initial value to 1 (will not fire onLBSelChanged)
lbSetCurSel [DROPDOWNAMOUNT, 0];

ctrlShow [DROPDOWNAMOUNT, true];
