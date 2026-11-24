#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * OK on a message (FUNC(showMessage)): hides it and loads the screen again, as the locker or box may have changed.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call tac_armory_fnc_dismissMessage
 *
 * Public: No
 */

call FUNC(hideMessage);

if (GVAR(selectedCategory) == "kits") then {
    [lbCurSel DROPDOWN] call FUNC(dialogControl_kits);
} else {
    [GVAR(selectedCategory)] call FUNC(dialogControl_list);
};
