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

    private _players = [true] call MFUNC(players);
    if (_players isEqualTo []) exitWith {};

    {
        if (!isObjectHidden _x) then {
            _x hideObjectGlobal true;
        };

        // Pick a non-pilot to move to
        _x setPos (getPos selectRandom _players);
    } forEach entities "HeadlessClient_F";
}, 60] call CBA_fnc_addPerFrameHandler;
