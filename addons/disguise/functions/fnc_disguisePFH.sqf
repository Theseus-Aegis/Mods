/*
 * Author: Corello
 * Handles the PerFrameHandler for the disguise system.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call FUNC(disguisePFH);
 */
#include "script_component.hpp"

params ["_args", "_idPFH"];
_args params ["_playerObject"];

if (!alive _playerObject) exitWith {false};

private _setPlayerCaptive = false;

if (_playerObject != vehicle _playerObject) then {
    _setPlayerCaptive = (typeOf (vehicle _playerObject)) in GVAR(civilianVehicles);
} else {
    _setPlayerCaptive = (primaryWeapon _playerObject == "") && {secondaryWeapon _playerObject == ""} && {currentWeapon _playerObject == ""} && {hmd player == ""} && {(uniform _playerObject) in GVAR(civilianUniforms)} && {(headgear _playerObject) in GVAR(civilianHeadgear)} && {(backpack _playerObject) in GVAR(civilianBackpacks)} && {(vest _playerObject) in GVAR(civilianVests)} && {(goggles _playerObject) in GVAR(civilianGoggles)};
};

if (GVAR(disguiseBlown)) then {
    _setPlayerCaptive = false;
};

{
    if(_playerObject inArea _x) exitWith {
        _setPlayerCaptive = false;
    }
} forEach GVAR(civilianExcludeMarkers);

[_playerObject, "setCaptive", QGVAR(disguise), _setPlayerCaptive] call ACEFUNC(common,statusEffect_set);