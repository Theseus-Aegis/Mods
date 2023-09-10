#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Calls Apollo Client extension and handles result, errors and possible multi-part return.
 *
 * Ignores extension warnings (error code 301: EXECUTION_WARNING_TAKES_TOO_LONG).
 * Errors on any unexpected return code, error code or a result indicating an internal unhandled error.
 *
 * Arguments:
 * 0: Extension Function Identifier <STRING>
 * 1: Function arguments <ARRAY> (default: [])
 *
 * Return Value:
 * Extension Result <STRING>
 *
 * Example:
 * ["getAccessibleItemClasses", [<player UID>]] call tac_apollo_fnc_callExt
 *
 * Public: No
 */

params ["_fnc", ["_args", []]];

TRACE_2("Call extension",_fnc,_args);
private _loadData = "tac_apollo_client" callExtension [_fnc, _args];
_loadData params ["_result", "_returnCode", "_errorCode"];

if (_returnCode != 0 || {!(_errorCode in EXT_VALID_ERROR_CODES)} || {_result == "error"}) exitWith {
    ERROR_4("Apollo Client error (%1)! [result: %2, return: %3, error: %4]",_this,_result,_returnCode,_errorCode);
    nil
};

// Handle multi-part return
if (_result == "queued") then {
    private _results = [];
    private _loading = true;

    while {_loading} do {
        _loadData = "tac_apollo_client" callExtension ["get", []];
        _loadData params ["_result", "_returnCode", "_errorCode"];

        if (_returnCode == 0 && {_errorCode in EXT_VALID_ERROR_CODES} && {_result != "error"}) then {
            if (_result == "done") then {
                _loading = false;
            } else {
                _results pushBack _result;
            };
        } else {
            ERROR_2("Failure on multipart return! [return: %1, error: %2]",_returnCode,_errorCode);
            _results = ["error"];
            _loading = false;
        };
    };

    _result = _results joinString "";
    TRACE_1("Multipart result",_result);
};

if (_result == "error") exitWith {
    ERROR_1("Apollo Client error on %1!",_this);
    nil
};

private _parsedResult = parseSimpleArray _result;
TRACE_1("Parsed Result",_parsedResult);
_parsedResult
