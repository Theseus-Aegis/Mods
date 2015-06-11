/*
 * Author: Jonpas
 * Adds radio tracks actions.
 *
 * Arguments:
 * 0: Helicopter <OBJECT>
 *
 * Return Value:
 * Children Actions <ARRAY>
 *
 * Example:
 * [heli] call tac_helicopterevents_fnc_addRadioTrackActions;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_heli);

private ["_actions", "_config"];

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
            [_heli, _x]
        ] call ACE_FUNC(interact_menu,createAction),
        [],
        _heli
    ];
} forEach (call FUNC(getRadioTracks));

_actions
