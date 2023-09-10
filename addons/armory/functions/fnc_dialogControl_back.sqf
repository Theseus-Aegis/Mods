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
    ctrlSetText [BACKPIC, QPATHTOF(UI\btnBack.paa)];
    buttonSetAction [BACKBTN, QUOTE(['main'] call FUNC(dialogControl))];
    CTRL(BACKBTN) ctrlSetTooltip localize LSTRING(BtnBackTooltip);
};

// Set Exit (and destroy GVARs)
if (_type == "exit") then {
    ctrlSetText [BACKPIC, QPATHTOF(UI\btnExit.paa)];
    buttonSetAction [BACKBTN, QUOTE(closeDialog 0)];
    CTRL(BACKBTN) ctrlSetTooltip localize LSTRING(BtnExitTooltip);
};
