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

// Kits: Take kit (where Stash All is), when the locker has anything of it, and Take the selected item, when the
// locker has it
if (GVAR(selectedCategory) == "kits") exitWith {
    private _items = (GVAR(kits) param [lbCurSel DROPDOWN, []]) param [3, []];
    private _takeable = _items findIf {(_x select 2) > 0} != -1;
    [STASHALLBTN, LLSTRING(BtnTakeKit), QUOTE(call FUNC(takeKit)), LLSTRING(BtnTakeKitTooltip)] call FUNC(setButton);
    {
        ctrlShow [_x, _takeable];
    } forEach [STASHALLFRAME, STASHALLBTN];

    private _itemTakeable = lnbCurSelRow NLIST >= 0 && {lbText [DROPDOWNAMOUNT, lbCurSel CTRL(DROPDOWNAMOUNT)] != ""};
    [TAKESTASHBTN, LLSTRING(BtnTakeItem), QUOTE(['take'] call FUNC(processAction)), LLSTRING(BtnTakeItemTooltip)] call FUNC(setButton);
    {
        ctrlShow [_x, _itemTakeable];
    } forEach [TAKESTASHFRAME, TAKESTASHBTN];
};

// Hide take/stash if quantity of dropdown amount selection is not set
if (lbText [DROPDOWNAMOUNT, lbCurSel CTRL(DROPDOWNAMOUNT)] == "") exitWith {
    {
        ctrlShow [_x, false];
    } forEach [TAKESTASHFRAME, TAKESTASHBTN];
};

if (GVAR(selectedCategory) == "stash") then {
    // Stash
    [TAKESTASHBTN, LLSTRING(BtnStashItem), QUOTE(['stash'] call FUNC(processAction)), LLSTRING(BtnStashItemTooltip)] call FUNC(setButton);
} else {
    // Take
    [TAKESTASHBTN, LLSTRING(BtnTakeItem), QUOTE(['take'] call FUNC(processAction)), LLSTRING(BtnTakeItemTooltip)] call FUNC(setButton);
};

{
    ctrlShow [_x, true];
} forEach [TAKESTASHFRAME, TAKESTASHBTN];
