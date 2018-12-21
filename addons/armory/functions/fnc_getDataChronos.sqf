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

private _success = false;
private _armoryData = [];

// Call Chronos for Data - no further HTTP calls are needed after this one
private _loadData = "tac_apollo_client" callExtension format ["%1%2/%3/%4", "loadArmory", _selectedCategory, getPlayerUID player, _debug];
if (_loadData == "loaded") then {
    private _updateInfo = true;
    private _entry = [];

    while {_updateInfo} do {
        // Retrieve the data which is stored in the client's heap
        _loadData = "tac_apollo_client" callExtension "get";
        TRACE_1("Get Chronos Data",_loadData);

        if (_loadData == "error") then {
            // Bad things happened, stop executing
            _updateInfo = false;
        } else {
            if (_loadData == "done") then {
                _updateInfo = false;
                _success = true;
            } else {
                _entry pushBack _loadData;

                // Reset
                if (_loadData == "next") then {
                    _armoryData pushBack _entry;
                    _entry = [];
                };
            };
        };
    };
};

if (_success) then {
    TRACE_2("Athena Armory Data",_selectedCategory,_armoryData);
    _armoryData
} else {
    ERROR("Armory data failed to load!");
    [LSTRING(ChronosError), 2.5] call ACEFUNC(common,displayTextStructured);
    false
};
