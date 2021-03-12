#include "script_component.hpp"
/*
 * Author: JoramD
 * Store a bodybag's contents in an array for later use with tac_bodybag_fnc_createBodybagBackup.
 *
 * Arguments:
 * 0: Bodybag <OBJECT>
 *
 * Return Value:
 * Bodybag contents array <ARRAY>
 *
 * Example:
 * [cursorObject] call tac_bodybag_fnc_getBodybagContents
 *
 * Public: Yes
 */

params ["_object"];

private _bodybagContents = [];

_bodybagContents pushBack getItemCargo _object;
_bodybagContents pushBack getBackpackCargo _object;
_bodybagContents pushBack getWeaponCargo _object;
_bodybagContents pushBack getMagazineCargo _object;

_bodybagContents
