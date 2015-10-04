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
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_selectedCategory"];

private ["_loadData", "_armoryData", "_updateInfo", "_entry", "_serverReply"];

hintSilent "Retrieving data, please stand by!";

// Call Chronos for Data - no further HTTP calls are needed after this one
_loadData = "ApolloClient" callExtension "loadArmory" + (_selectedCategory + "/" + getPlayerUID player);

if (_loadData == "loaded") then {
    _armoryData = [];
    _updateInfo = true;
    _entry = [];

    while {_updateInfo} do {
        // Retrieve the data which is stored in the client's heap
        _serverReply = "ApolloClient" callExtension "get";
        TRACE_1("Get Chronos Data",_serverReply);

        if (_serverReply == "done") then {
            _updateInfo = false;
            hintSilent "";
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
    hintSilent "Athena server is down!\n(Contact server administrator)";
    false
};
