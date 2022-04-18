#include "script_component.hpp"
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

// Set Chronos to debug if flag set
private _debug = [false, true] select EGVAR(apollo,isDebug);
TRACE_2("Chronos Debug",EGVAR(apollo,isDebug),_debug);

private _loadData = "tac_apollo_client" callExtension ["loadArmory", [_selectedCategory, getPlayerUID player, _debug]];

_loadData params ["_result", "_returnCode", "_errorCode"];
if (_result == "queued" && {_returnCode == 0} && {_errorCode == 0}) then {
    _result = [] call EFUNC(apollo,handleExtMultipartReturn);
};

if (_returnCode == 0 && {_errorCode == 0} && {_result != "error"}) then {
    private _armoryData = parseSimpleArray _result;
    TRACE_2("Athena Armory Data",_selectedCategory,_armoryData);
    _armoryData
} else {
    ERROR_2("Armory data failed to load [return: %1, error: %2]!",_returnCode,_errorCode);
    [LSTRING(ChronosError), 2.5] call ACEFUNC(common,displayTextStructured);
    false
};
