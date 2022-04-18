#include "script_component.hpp"
/*
 * Author: Jonpas
 * Handles multipart return from an extension, concatenating the result for direct use in parseSimpleArray.
 *
 * Arguments:
 * 0: Extension <STRING> (default: tac_apollo_client)
 * 1: Fetch/Get Command <STRING> (default: get)
 * 2: Expected Completed Return <STRING> (default: done)
 * 3: Expected Error Return <STRING> (default: error)
 *
 * Return Value:
 * Extension Result <STRING>
 *
 * Example:
 * [] call tac_apollo_fnc_handleExtMultipartReturn
 * ["tac_apollo_client", "get", "done", "error"] call tac_apollo_fnc_handleExtMultipartReturn
 *
 * Public: No
 */

params [["_ext", "tac_apollo_client"], ["_get", "get"], ["_completed", "done"], ["_error", "error"]];

private _results = [];
private _loading = true;

while {_loading} do {
    private _loadData = _ext callExtension [_get, []];

    _loadData params ["_result", "_returnCode", "_errorCode"];
    if (_returnCode == 0 && {_errorCode == 0} && {_result != _error}) then {
        if (_result == _completed) then {
            _loading = false;
        } else {
            _results pushBack _result;
        };
    } else {
        ERROR_4("Failure on multipart return (Ext: %1 - Command: %2) [return: %3, error: %4]!",_ext,_get,_returnCode,_errorCode);
        _results = ["error"];
        _loading = false;
    };
};

_results joinString ""
