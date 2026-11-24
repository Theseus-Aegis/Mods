#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Goes back to menu or exits Armory.
 *
 * Arguments:
 * 0: Type <STRING>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * ["type"] call tac_armory_fnc_dialogControl_back
 *
 * Public: No
 */

params ["_type"];

// Set Back
if (_type == "back") then {
    [BACKPIC, BACKBTN, LSTRING(BtnBack), QUOTE(['main'] call FUNC(dialogControl)), LSTRING(BtnBackTooltip)] call FUNC(setButton);
};

// Set Exit (and destroy GVARs)
if (_type == "exit") then {
    [BACKPIC, BACKBTN, LSTRING(BtnExit), QUOTE(closeDialog 0), LSTRING(BtnExitTooltip)] call FUNC(setButton);
};
