/*
 * Author: DaC, Jonpas
 * Gets data from ApolloClient/Athena (Chronos).
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
#include "script_component.hpp"

params ["_selectedCategory"];

// Exit if Apollo not loaded
if !(["tac_apollo"] call ACEFUNC(common,isModLoaded)) exitWith {
    ERROR_MSG("Apollo is not loaded! Chronos data cannot be retrieved.");
    false
};

// Set Chronos to debug if flag set
private _debug = [false, true] select EGVAR(apollo,isDebug);
TRACE_2("Chronos Debug",EGVAR(apollo,isDebug),_debug);

// Call Chronos for Data - no further HTTP calls are needed after this one
private _loadData = "ApolloClient" callExtension format ["%1%2/%3/%4", "loadArmory", _selectedCategory, getPlayerUID player, _debug];

if (_loadData == "loaded") then {
    private _armoryData = [];
    private _updateInfo = true;
    private _entry = [];

    while {_updateInfo} do {
        // Retrieve the data which is stored in the client's heap
        private _serverReply = "ApolloClient" callExtension "get";
        TRACE_1("Get Chronos Data",_serverReply);

        if (_serverReply == "done") then {
            _updateInfo = false;
        } else {
            _entry pushBack _serverReply;

            // Reset
            if (_serverReply == "next") then {
                _armoryData pushBack _entry;
                _entry = [];
            };
        };
    };
    TRACE_2("Athena Armory Data",_selectedCategory,_armoryData);
    _armoryData
} else {
    ERROR("Armory data failed to load!");
    [LSTRING(ChronosError), 2.5] call ACEFUNC(common,displayTextStructured);
    false
};
