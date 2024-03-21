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
    params ["", "_handle"];

    if (!GVAR(headlessMove)) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    private _players = [true] call EFUNC(mission,players);

    // If ground players are minority (<10%), include air as well
    if (count _players < 0.1 * (call CBA_fnc_players)) then {
        _players = [] call EFUNC(mission,players);
    };

    if (_players isEqualTo []) exitWith {};

    // Find average position of all players, removing 10% bottom and 10% top outliers
    private _positions = _players apply {getPosASL _x};
    private _positionsX = _positions apply {_x select 0};
    private _positionsY = _positions apply {_x select 1};
    _positionsX sort true;
    _positionsY sort true;

    private _positionsCount = count _positions;
    _positionsX = _positionsX select [0.1 * _positionsCount, 0.9 * _positionsCount];
    _positionsY = _positionsY select [0.1 * _positionsCount, 0.9 * _positionsCount];
    _positionsCount = count _positionsX;

    private _positionX = 0;
    private _positionY = 0;
    { _positionX = _positionX + _x } forEach _positionsX;
    { _positionY = _positionY + _x } forEach _positionsY;
    _positionsX = _positionsX / _positionsCount;
    _positionsY = _positionsY / _positionsCount;

    private _position = [_positionX, _positionY, 0]; // always at ground level

    // Move
    {
        if (!isObjectHidden _x) then {
            _x hideObjectGlobal true;
        };

        _x setPosASL (AGLToASL _position);
    } forEach (entities "HeadlessClient_F");
}, 60] call CBA_fnc_addPerFrameHandler;
