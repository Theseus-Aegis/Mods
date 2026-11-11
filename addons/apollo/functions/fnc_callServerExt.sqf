#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Calls the Apollo Server extension (Chronos persistence through Minotaur's game API) and returns its answer.
 * Non-string arguments are passed as their string representation.
 *
 * Arguments:
 * 0: Command <STRING>
 * 1-inf: Arguments <ANY>
 *
 * Return Value:
 * Extension Return Value <STRING>
 *
 * Example:
 * ["storeInfantry", "save", "76561198000000000", "Name", [1, 2, 3], 90, [], "", []] call tac_apollo_fnc_callServerExt
 *
 * Public: No
 */

params ["_command"];

if (isNil "_this" || {!(_this isEqualType [])} || {_this isEqualTo []} || {!(_command isEqualType "")}) exitWith {""};

private _arguments = (_this select [1]) apply {[str _x, _x] select (_x isEqualType "")};

private _return = "tac_apollo_server" callExtension [_command, _arguments];
_return params ["_result", "_returnCode", "_errorCode"];

if (_returnCode != 0 || {!(_errorCode in EXT_VALID_ERROR_CODES)} || {_result == "error"}) then {
    ERROR_4("Apollo Server failed! [command: %1, result: %2, return: %3, error: %4]",_command,_result,_returnCode,_errorCode);
};

_result
