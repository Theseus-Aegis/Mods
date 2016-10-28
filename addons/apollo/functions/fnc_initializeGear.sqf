/*
 * Author: alganthe
 * Prepare the player for the apollo extension
 *
 * Arguments:
 * 0: Target unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call tac_apollo_fnc_initializeGear
 *
 * Public: No
 */
#include "script_component.hpp"
params [["_player", objNull, [objNull]]];

_player allowDamage false;
_player setUnitLoadout [[],[],[],[],[],[],"","",[],["","","","","",""]];
