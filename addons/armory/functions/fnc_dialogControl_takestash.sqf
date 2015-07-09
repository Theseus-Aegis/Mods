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
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_1(_selectedCategory);

if (_selectedCategory == "stash") then {
    // Stash
    ctrlSetText [TAKESTASHPIC, QUOTE(PATHTOF(UI\btnStash.paa))];
    buttonSetAction [TAKESTASHBTN, QUOTE([ARR_2('stash')] call FUNC(sendData))];
    CTRL(TAKESTASHBTN) ctrlSetTooltip "Stash selected item";
} else {
    // Take
    ctrlSetText [TAKESTASHPIC, QUOTE(PATHTOF(UI\btnTake.paa))];
    buttonSetAction [TAKESTASHBTN, QUOTE([ARR_2('take')] call FUNC(sendData))];
    CTRL(TAKESTASHBTN) ctrlSetTooltip "Take selected item";
};

{
    ctrlShow [_x, true];
} forEach [TAKESTASHPIC, TAKESTASHBTN];
