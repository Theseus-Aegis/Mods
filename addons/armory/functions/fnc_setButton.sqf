#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Sets up a text button: its frame (the picture under it), its label (in the pad's LCD font, see Dialog.hpp),
 * what it does and its tooltip.
 *
 * Arguments:
 * 0: Picture control ID <NUMBER>
 * 1: Button control ID <NUMBER>
 * 2: Label stringtable key <STRING>
 * 3: Action <STRING>
 * 4: Tooltip stringtable key <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [MAINPIC1, MAINBTN1, "STR_TAC_Armory_BtnRifles", "['rifle'] call tac_armory_fnc_dialogControl", "STR_TAC_Armory_BtnRiflesTooltip"] call tac_armory_fnc_setButton
 *
 * Public: No
 */

params ["_picture", "_button", "_label", "_action", "_tooltip"];

ctrlSetText [_picture, BUTTON_FRAME];
ctrlSetText [_button, localize _label];
buttonSetAction [_button, _action];
CTRL(_button) ctrlSetTooltip localize _tooltip;
