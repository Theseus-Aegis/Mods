#include "..\script_component.hpp"
/*
 * Author: DaC, Jonpas
 * Gets data from Apollo Client / Athena (Chronos).
 *
 * Arguments:
 * 0: Category <STRING>
 *
 * Return Value:
 * Armory Data <ARRAY>
 *
 * Example:
 * ["category"] call tac_armory_fnc_getDataChronos
 *
 * Public: No
 */

params ["_selectedCategory"];

// Exit if Apollo not loaded
if !(["tac_apollo"] call ACEFUNC(common,isModLoaded)) exitWith {
    ERROR_MSG("Apollo is not loaded! Chronos data cannot be retrieved.");
    false
};

private _result = ["loadArmory", [_selectedCategory, getPlayerUID player, EGVAR(apollo,isDebug)]] call EFUNC(apollo,callExt);

if (!isNil "_result") then {
    TRACE_2("Athena Armory Data",_selectedCategory,_result);
    _result
} else {
    ERROR("Armory data failed to load!");
    [LSTRING(ChronosError), 2.5] call ACEFUNC(common,displayTextStructured);
    false
};
