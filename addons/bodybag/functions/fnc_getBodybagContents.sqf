#include "script_component.hpp"
/*
 * Author: JoramD
 * Returns a bodybag's contents in an array for use with FUNC(createBodybagBackup).
 *
 * Arguments:
 * 0: Bodybag <OBJECT>
 *
 * Return Value:
 * Bodybag Contents <ARRAY>
 *
 * Example:
 * [cursorObject] call tac_bodybag_fnc_getBodybagContents
 *
 * Public: Yes
 */

params ["_object"];

private _bodybagContents = [];

_bodybagContents pushBack (getItemCargo _object);
_bodybagContents pushBack (getBackpackCargo _object);
_bodybagContents pushBack (getWeaponCargo _object);
_bodybagContents pushBack (getMagazineCargo _object);

_bodybagContents
