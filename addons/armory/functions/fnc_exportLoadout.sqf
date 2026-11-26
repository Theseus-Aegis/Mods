#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Exports current loadout to clipboard.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_armory_fnc_exportLoadout
 *
 * Public: No
 */

private _loadout = getUnitLoadout ACE_player;

"ace_clipboard" callExtension (format ["%1%2", _loadout, endl]);
"ace_clipboard" callExtension "--COMPLETE--";

// On the pad over the main menu for a moment (no OK), then the main menu again
[false] call FUNC(dialogControl_main);
[LLSTRING(MsgExported), [LLSTRING(MsgExportedText)], false, "main"] call FUNC(showMessage);

GVAR(exportShown) = CBA_missionTime;
[{
    params ["_shown"];
    // Not if the pad was left, or exported again since
    if (isNull findDisplay DISPLAYID || {GVAR(selectedCategory) != "main"} || {GVAR(exportShown) != _shown}) exitWith {};
    call FUNC(hideMessage);
    [true] call FUNC(dialogControl_main);
}, [GVAR(exportShown)], 2.5] call CBA_fnc_waitAndExecute;
