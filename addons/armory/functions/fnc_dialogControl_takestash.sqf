#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Shows Take/Stash buttons.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call tac_armory_fnc_dialogControl_takestash
 *
 * Public: No
 */

// Kits: Take kit, when the locker has anything of it
if (GVAR(selectedCategory) == "kits") exitWith {
    private _items = (GVAR(kits) param [lbCurSel DROPDOWN, []]) param [3, []];
    private _takeable = _items findIf {(_x select 2) > 0} != -1;
    [TAKESTASHPIC, TAKESTASHBTN, LSTRING(BtnTakeKit), QUOTE(call FUNC(takeKit)), LSTRING(BtnTakeKitTooltip)] call FUNC(setButton);
    {
        ctrlShow [_x, _takeable];
    } forEach [TAKESTASHPIC, TAKESTASHBTN];
};

// Hide take/stash if quantity of dropdown amount selection is not set
if (lbText [DROPDOWNAMOUNT, lbCurSel CTRL(DROPDOWNAMOUNT)] == "") exitWith {
    {
        ctrlShow [_x, false];
    } forEach [TAKESTASHPIC, TAKESTASHBTN];
};

if (GVAR(selectedCategory) == "stash") then {
    // Stash
    [TAKESTASHPIC, TAKESTASHBTN, LSTRING(BtnStashItem), QUOTE(['stash'] call FUNC(processAction)), LSTRING(BtnStashItemTooltip)] call FUNC(setButton);
} else {
    // Take
    [TAKESTASHPIC, TAKESTASHBTN, LSTRING(BtnTakeItem), QUOTE(['take'] call FUNC(processAction)), LSTRING(BtnTakeItemTooltip)] call FUNC(setButton);
};

{
    ctrlShow [_x, true];
} forEach [TAKESTASHPIC, TAKESTASHBTN];
