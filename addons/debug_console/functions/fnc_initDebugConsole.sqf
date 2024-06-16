#include "..\script_component.hpp"
/*
 * Author: veteran29
 * Initialize debug console display
 *
 * Arguments:
 * 0: Debug console display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

#define ITEMS_PER_ROW   2
#define BUTTON_WIDTH    7.5

params ["_display"];
TRACE_1("initializing debug console",_display);

private _debugConsole = _display displayCtrl IDC_RSCDEBUGCONSOLE_RSCDEBUGCONSOLE;

private _basePositionRow1 = ctrlPosition (_display displayCtrl IDC_RSCDEBUGCONSOLE_BUTTONANIMATIONS);
private _basePositionRow2 = ctrlPosition (_display displayCtrl IDC_RSCDEBUGCONSOLE_BUTTONGUI);

// Create buttons in bottom row
{
    _x params ["_text", "_tooltip", "_code"];
    TRACE_3("adding debug console button",_text,_tooltip,_code);

    private _col = floor (_forEachIndex / ITEMS_PER_ROW);
    private _basePos = +([_basePositionRow1, _basePositionRow2] select (_forEachIndex % 2));

    _basePos set [0, (_basePos select 0) + (BUTTON_WIDTH * (1 + _col)) * GUI_GRID_W]; // adjust X

    private _button = _display ctrlCreate ["RscButtonMenu", -1, _debugConsole];

    _button ctrlSetPosition _basePos;
    _button ctrlCommit 0;

    _button ctrlSetText _text;
    _button ctrlSetTooltip _tooltip;
    _button ctrlAddEventHandler ["ButtonClick", _code];

} forEach GVAR(buttons);

nil
