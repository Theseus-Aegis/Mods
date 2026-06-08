#include "..\script_component.hpp"
/*
 * Author: Mike
 * Clears armory box of ghost cargo
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object] call tac_armory_fnc_clearArmoryBox
 *
 * Public: No
 */

params ["_object"];

clearItemCargoGlobal _object;
clearWeaponCargoGlobal _object;
clearMagazineCargoGlobal _object;
clearBackpackCargoGlobal _object;
