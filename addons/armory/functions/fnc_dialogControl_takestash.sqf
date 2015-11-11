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
#include "script_component.hpp"

// Hide take/stash if quantity of dropdown amount selection is not set
if (lbText [DROPDOWNAMOUNT, lbCurSel CTRL(DROPDOWNAMOUNT)] == "") exitWith {
    {
        ctrlShow [_x, false];
    } forEach [TAKESTASHPIC, TAKESTASHBTN];
};

if (GVAR(selectedCategory) == "stash") then {
    // Stash
    ctrlSetText [TAKESTASHPIC, QUOTE(PATHTOF(UI\btnStash.paa))];
    buttonSetAction [TAKESTASHBTN, QUOTE(['stash'] call FUNC(sendData))];
    CTRL(TAKESTASHBTN) ctrlSetTooltip "Stash selected item";
} else {
    // Take
    ctrlSetText [TAKESTASHPIC, QUOTE(PATHTOF(UI\btnTake.paa))];
    buttonSetAction [TAKESTASHBTN, QUOTE(['take'] call FUNC(sendData))];
    CTRL(TAKESTASHBTN) ctrlSetTooltip "Take selected item";
};

{
    ctrlShow [_x, true];
} forEach [TAKESTASHPIC, TAKESTASHBTN];
