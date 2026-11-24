#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Sets up a text button: its label (in the pad's LCD font, see Dialog.hpp), what it does and its tooltip.
 * Its frame is drawn by the game (GVAR(RscFrame)), shown and hidden with the button.
 *
 * Arguments:
 * 0: Button control ID <NUMBER>
 * 1: Label <STRING>
 * 2: Action <STRING>
 * 3: Tooltip <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [MAINBTN1, LLSTRING(BtnRifles), QUOTE(['rifle'] call FUNC(dialogControl)), LLSTRING(BtnRiflesTooltip)] call tac_armory_fnc_setButton
 *
 * Public: No
 */

params ["_button", "_label", "_action", "_tooltip"];

ctrlSetText [_button, _label];
buttonSetAction [_button, _action];
CTRL(_button) ctrlSetTooltip _tooltip;
