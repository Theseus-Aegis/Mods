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
    ctrlSetText [TAKESTASHPIC, QPATHTOF(UI\btnTake.paa)];
    buttonSetAction [TAKESTASHBTN, QUOTE(call FUNC(takeKit))];
    CTRL(TAKESTASHBTN) ctrlSetTooltip localize LSTRING(BtnTakeKitTooltip);
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
    ctrlSetText [TAKESTASHPIC, QPATHTOF(UI\btnStash.paa)];
    buttonSetAction [TAKESTASHBTN, QUOTE(['stash'] call FUNC(processAction))];
    CTRL(TAKESTASHBTN) ctrlSetTooltip localize LSTRING(BtnStashItemTooltip);
} else {
    // Take
    ctrlSetText [TAKESTASHPIC, QPATHTOF(UI\btnTake.paa)];
    buttonSetAction [TAKESTASHBTN, QUOTE(['take'] call FUNC(processAction))];
    CTRL(TAKESTASHBTN) ctrlSetTooltip localize LSTRING(BtnTakeItemTooltip);
};

{
    ctrlShow [_x, true];
} forEach [TAKESTASHPIC, TAKESTASHBTN];
