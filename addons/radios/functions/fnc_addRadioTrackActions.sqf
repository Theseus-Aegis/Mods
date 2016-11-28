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

params ["_vehicle"];

private _actions = [];
{
    _actions pushBack
    [
        [
            format ["RadioTrack%1", _forEachIndex],
            getText (configFile >> "CfgSounds" >> _x >> "name") splitString "_" joinString " ",
            "",
            {(_this select 2) call FUNC(playRadio)},
            {true},
            {},
            [_vehicle, _x]
        ] call ACEFUNC(interact_menu,createAction)),
        [],
        _vehicle
    ];
} forEach (call FUNC(getRadioTracks));

_actions
