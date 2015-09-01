/*
 * Author: Jonpas
 * Adds radio tracks actions.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Children Actions <ARRAY>
 *
 * Example:
 * [vehicle] call tac_radios_fnc_addRadioTrackActions;
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_actions", "_config"];
params ["_vehicle"];

_actions = [];
{
    _config = configFile >> "CfgSounds" >> _x;
    _actions pushBack
    [
        [
            format ["RadioTrack%1", _forEachIndex],
            getText (_config >> "name"),
            "",
            {(_this select 2) call FUNC(playRadio)},
            {true},
            {},
            [_vehicle, _x]
        ] call ACE_Interact_Menu_fnc_createAction,
        [],
        _vehicle
    ];
} forEach (call FUNC(getRadioTracks));

_actions
