/*
 * Author: Jonpas
 * Gets data from Apollo (Chronos).
 *
 * Arguments:
 * 0: Category <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["category"] call tac_armory_fnc_getDataChronos
 *
 * Public: No
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_selectedCategory"];

hintSilent "Retrieving data, please stand by!\n(Timeout in 15 seconds in case of connection failure)";

// Call Chronos for Data @todo - change to ACE Events (in Apollo as well)
getArmoryData = [player, _selectedCategory];
publicVariableServer "getArmoryData";

// Local Debug
//[player, _selectedCategory] call usec_fnc_fetchArmory;
