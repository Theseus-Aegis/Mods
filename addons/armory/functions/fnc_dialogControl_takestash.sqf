/*
 * Author: Jonpas
 * Shows Take/Stash buttons.
 *
 * Arguments:
 * 0: Category <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["category"] call tac_armory_fnc_dialogControl_takestash
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_selectedCategory);

private ["_selectedItem"];

GVAR(selectedItem) = lnbData [NLIST, [lnbCurSelRow NLIST, 1]]; // ClassName of selected item in list

if (_selectedCategory == "stash") then {
    // Stash
    ctrlSetText [TAKESTASHPIC, QUOTE(PATHTOF(UI\btnStash.paa))];
    buttonSetAction [TAKESTASHBTN, QUOTE([ARR_2('stash',player)] call FUNC(sendData))];
    CTRL(TAKESTASHBTN) ctrlSetTooltip "Stash selected item";
} else {
    // Take
    ctrlSetText [TAKESTASHPIC, QUOTE(PATHTOF(UI\btnTake.paa))];
    buttonSetAction [TAKESTASHBTN, QUOTE([ARR_2('take',player)] call FUNC(sendData))];
    CTRL(TAKESTASHBTN) ctrlSetTooltip "Take selected item";
};

{
    ctrlShow [_x, true];
} forEach [TAKESTASHPIC, TAKESTASHBTN];
