#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Puts the local player's ACRE radio settings back (see FUNC(getRadios)), matching radios by base class, in order.
 * Waits for ACRE to give the radios their IDs.
 *
 * Arguments:
 * 0: Radio settings <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[[["ACRE_PRC343", 2, 0.8, "LEFT"]], 0, [0]]] call tac_apollo_fnc_setRadios
 *
 * Public: No
 */

params ["_settings"];

if (_settings isEqualTo [] || {!(["acre_api"] call ACEFUNC(common,isModLoaded))}) exitWith {};

[{[] call acre_api_fnc_isInitialized}, {
    params ["_settings"];
    _settings params [["_radios", []], ["_active", -1], ["_ptt", []]];

    private _list = [] call acre_api_fnc_getCurrentRadioList;
    private _bases = _list apply {[_x] call acre_api_fnc_getBaseRadio};

    // The saved radios' IDs now ("" if not carried any more)
    private _matched = _radios apply {
        _x params ["_base", "_channel", "_volume", "_spatial"];
        private _index = _bases find _base;
        if (_index == -1) then {
            ""
        } else {
            _bases set [_index, ""]; // taken: the next of that base gets the next settings
            private _radio = _list select _index;
            [_radio, _channel] call acre_api_fnc_setRadioChannel;
            [_radio, _volume] call acre_api_fnc_setRadioVolume;
            [_radio, _spatial] call acre_api_fnc_setRadioSpatial;
            _radio
        };
    };

    private _activeRadio = if (_active >= 0) then {_matched param [_active, ""]} else {""};
    if (_activeRadio != "") then {
        [_activeRadio] call acre_api_fnc_setCurrentRadio;
    };
    private _pttRadios = ((_ptt select {_x >= 0}) apply {_matched param [_x, ""]}) - [""];
    if (_pttRadios isNotEqualTo []) then {
        [_pttRadios] call acre_api_fnc_setMultiPushToTalkAssignment;
    };
}, [_settings], 30] call CBA_fnc_waitUntilAndExecute;
