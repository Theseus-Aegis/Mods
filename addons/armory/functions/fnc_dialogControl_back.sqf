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
    [BACKBTN, LLSTRING(BtnBack), QUOTE(['main'] call FUNC(dialogControl)), LLSTRING(BtnBackTooltip)] call FUNC(setButton);
};

// Set Exit (and destroy GVARs)
if (_type == "exit") then {
    [BACKBTN, LLSTRING(BtnExit), QUOTE(closeDialog 0), LLSTRING(BtnExitTooltip)] call FUNC(setButton);
};
