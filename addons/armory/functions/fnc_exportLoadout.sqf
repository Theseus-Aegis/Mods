#include "script_component.hpp"
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

[LSTRING(ExportComplete), QPATHTOF(UI\btnExport.paa)] call ACEFUNC(common,displayTextPicture);
