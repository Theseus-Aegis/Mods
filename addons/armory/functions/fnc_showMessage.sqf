#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Shows a message on the pad, in a panel over the list (the list, amount and Take/Stash are hidden): a title and lines
 * under it. One that waits for OK (FUNC(dismissMessage)) stays until then; the others go when the list has something
 * to show again (FUNC(dialogControl_populateList)) or the screen changes.
 * With the pad closed, or on another screen than the one it is for, it is shown as a hint instead.
 *
 * Arguments:
 * 0: Title <STRING>
 * 1: Lines <ARRAY> (default: [])
 * 2: Waits for OK <BOOL> (default: false)
 * 3: Screen it is for (category, "kits", or "" for the one shown) <STRING> (default: "")
 *
 * Return Value:
 * None
 *
 * Example:
 * [LLSTRING(MsgBoxFull), [LLSTRING(MsgBoxFullText)], true] call tac_armory_fnc_showMessage
 *
 * Public: No
 */

params ["_title", ["_lines", []], ["_dismissable", false], ["_screen", ""]];

// A long list (items) ends with how many more there are
if (count _lines > 8) then {
    _lines = (_lines select [0, 7]) + [format [LLSTRING(MsgMore), count _lines - 7]];
};

if (isNull findDisplay DISPLAYID || {_screen != "" && {GVAR(selectedCategory) != _screen}}) exitWith {
    [([_title] + _lines) joinString "<br/>", 4] call ACEFUNC(common,displayTextStructured);
};

// The pad's LCD text is upper case; item names are text, not markup
private _escape = {((toUpper _this regexReplace ["&", "&amp;"]) regexReplace ["<", "&lt;"]) regexReplace [">", "&gt;"]};
private _text = format ["<t size='1.33'>%1</t>", _title call _escape];
if (_lines isNotEqualTo []) then {
    _text = _text + "<br/><br/>" + ((_lines apply {_x call _escape}) joinString "<br/>");
};

{
    ctrlShow [_x, false];
} forEach [NLIST, AMOUNT, AMOUNTFRAME, DROPDOWNAMOUNT, TAKESTASHFRAME, TAKESTASHBTN];
{
    ctrlShow [_x, true];
} forEach [MESSAGEFRAME, MESSAGETEXT];
{
    ctrlShow [_x, _dismissable];
} forEach [MESSAGEOKFRAME, MESSAGEOKBTN];
GVAR(messageDismissable) = _dismissable;

// The text in the middle of the panel (above OK, when it has it)
(ctrlPosition CTRL(MESSAGEFRAME)) params ["", "_top", "", "_height"];
if (_dismissable) then {
    _height = ((ctrlPosition CTRL(MESSAGEOKFRAME)) select 1) - _top;
};
private _ctrlText = CTRL(MESSAGETEXT);
_ctrlText ctrlSetStructuredText parseText _text;
private _textHeight = (ctrlTextHeight _ctrlText) min _height;
_ctrlText ctrlSetPositionY (_top + (_height - _textHeight) / 2);
_ctrlText ctrlSetPositionH _textHeight;
_ctrlText ctrlCommit 0;
