#include "..\script_component.hpp"
/*
 * Author: Mike
 * Handles automatically moving headless clients to randomly selected players.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call FUNC(moveHeadless)
 *
 * Public: No
 */

[{
    params ["_args", "_handle"];

    if (!GVAR(headlessMove)) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    private _players = [true] call EFUNC(mission,players);
    if (_players isEqualTo []) exitWith {};

    // If ground players are minority (<10%), include air as well
    if (count _players < 0.1 * (call CBA_fnc_players)) then {
        _players = [] call EFUNC(mission,players);
    };

    // Pick a player to move to
    private _position = ASLtoAGL (getPosASL (selectRandom _players));
    _position set [2, 0];

    {
        if (!isObjectHidden _x) then {
            _x hideObjectGlobal true;
        };

        _x setPosASL (AGLToASL _position);
    } forEach (entities "HeadlessClient_F");
}, 60] call CBA_fnc_addPerFrameHandler;
