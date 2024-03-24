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

if (!GVAR(moveHeadless) || !acex_headless_enabled) exitWith {
    GVAR(moveHeadlessThread) = false;
};

private _playersAll = (call CBA_fnc_players) select {!(_x getVariable [QACEGVAR(spectator,isSet), false])};
private _players = _playersAll select {isTouchingGround (vehicle _x)};

// If ground players are minority (<20%), include air/water as well
if (count _players < 0.2 * (count _playersAll)) then {
    _players = _playersAll;
};

if (_players isEqualTo []) exitWith {};

// Find average position of all players, removing 10% bottom and 10% top outliers
private _positions = _players apply {getPosASL _x};
private _positionsX = _positions apply {_x select 0};
private _positionsY = _positions apply {_x select 1};
_positionsX sort true;
_positionsY sort true;

private _positionsCount = count _positions;
_positionsX = _positionsX select [0.1 * _positionsCount, 0.8 * _positionsCount];
_positionsY = _positionsY select [0.1 * _positionsCount, 0.8 * _positionsCount];
_positionsCount = count _positionsX;

private _positionX = 0;
private _positionY = 0;
{ _positionX = _positionX + _x } forEach _positionsX;
{ _positionY = _positionY + _x } forEach _positionsY;
_positionX = _positionX / _positionsCount;
_positionY = _positionY / _positionsCount;

private _position = [_positionX, _positionY, 0]; // always at ground level

// Move
{
    if (!isObjectHidden _x) then {
        _x hideObjectGlobal true;
    };

    _x setPosASL (AGLToASL _position);
} forEach ACEGVAR(headless,headlessClients);

[FUNC(moveHeadless), [], 60] call CBA_fnc_waitAndExecute;
