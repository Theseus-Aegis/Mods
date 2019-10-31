#include "script_component.hpp"
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

private _quantity = CTRL(NLIST) lnbData [lnbCurSelRow NLIST, 2];
_quantity = parseNumber _quantity;
TRACE_1("Amount of selected item",_quantity);

lbClear DROPDOWNAMOUNT;

for "_x" from 1 to _quantity do {
    lbAdd [DROPDOWNAMOUNT, str _x];
};

// Set initial value to max/all (will not fire onLBSelChanged)
lbSetCurSel [DROPDOWNAMOUNT, _quantity];

ctrlShow [DROPDOWNAMOUNT, true];
