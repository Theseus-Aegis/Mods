#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Sets up a text button: its frame (the picture under it, unless the game draws it), its label (in the pad's LCD font, see Dialog.hpp),
 * what it does and its tooltip.
 *
 * Arguments:
 * 0: Picture control ID <NUMBER>
 * 1: Button control ID <NUMBER>
 * 2: Label <STRING>
 * 3: Action <STRING>
 * 4: Tooltip <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [MAINPIC1, MAINBTN1, LLSTRING(BtnRifles), QUOTE(['rifle'] call FUNC(dialogControl)), LLSTRING(BtnRiflesTooltip)] call tac_armory_fnc_setButton
 *
 * Public: No
 */

params ["_picture", "_button", "_label", "_action", "_tooltip"];

// A frame drawn by the game (GVAR(RscFrame)) takes no picture: its text would be a caption in its border
if (ctrlStyle CTRL(_picture) != ST_FRAME) then {
    ctrlSetText [_picture, BUTTON_FRAME];
};
ctrlSetText [_button, _label];
buttonSetAction [_button, _action];
CTRL(_button) ctrlSetTooltip _tooltip;
