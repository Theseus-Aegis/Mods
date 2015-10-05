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
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

local _quantity = CTRL(NLIST) lnbData [lnbCurSelRow NLIST, 2];
TRACE_1("Amount of selected item",_quantity);

lbClear DROPDOWNAMOUNT;

for "_x" from 1 to (parseNumber _quantity) do {
    lbAdd [DROPDOWNAMOUNT, str(_x)];
};

ctrlShow [DROPDOWNAMOUNT, true];
