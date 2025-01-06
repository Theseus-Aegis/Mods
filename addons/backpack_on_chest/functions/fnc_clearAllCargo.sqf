#include "..\script_component.hpp"
/*
 * Author: Ampersand
 * Called locally by event. Clears all the cargo of given container.
 *
 * Arguments:
 * 0: Container <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [_container] call tac_backpack_on_chest_fnc_clearAllCargo;
 *
 * Public: No
 */

params ["_container"];

clearItemCargo _container;
clearWeaponCargo _container;
clearMagazineCargo _container;
clearBackpackCargo _container;
