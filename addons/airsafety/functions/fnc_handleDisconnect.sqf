#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * When the player flying an aircraft leaves (lost connection, crashed game), freezes the aircraft
 * where it is so it doesn't fall with its crew; the pilot (back in their seat on reconnect), the
 * co-pilot or anyone who takes the pilot's seat resumes the flight (FUNC(resume)). When a
 * driver leaves a moving ground vehicle or boat, it's stopped.
 * Runs on the server (HandleDisconnect), before the unit is deleted.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: ID <NUMBER> (unused)
 * 2: UID <STRING>
 * 3: Name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, 3, "76561198000000000", "Jon"] call tac_airsafety_fnc_handleDisconnect
 *
 * Public: No
 */

params ["_unit", "", "_uid", "_name"];

if (!GVAR(enabled)) exitWith {};

private _vehicle = objectParent _unit;
if (isNull _vehicle || {!alive _vehicle} || {unitIsUAV _vehicle}) exitWith {};
// The one flying or driving it (a co-pilot with the controls too)
if (currentPilot _vehicle != _unit && {driver _vehicle != _unit}) exitWith {};

if (_vehicle isKindOf "Air") exitWith {
    // Landed, or about to: left as it is
    if (isTouchingGround _vehicle || {((getPos _vehicle) select 2) < GVAR(minHeight)}) exitWith {};
    if (!isNil {_vehicle getVariable QGVAR(frozen)}) exitWith {};

    _vehicle setVariable [QGVAR(frozen), [velocityModelSpace _vehicle, _uid, _name], true];
    _vehicle enableSimulationGlobal false;
    GVAR(frozen) set [_uid, _vehicle];
    INFO_3("%1 (%2) left while flying %3: frozen",_name,_uid,typeOf _vehicle);

    private _crew = (crew _vehicle) - [_unit];
    if (_crew isNotEqualTo []) then {
        [QGVAR(notify), [format [LLSTRING(Frozen), _name]], _crew] call CBA_fnc_targetEvent;
    };
};

// A moving ground vehicle or boat: stopped once it's local elsewhere (it still is the leaving player's now)
if (GVAR(groundVehicles) && {speed _vehicle > MIN_SPEED_GROUND}) then {
    INFO_3("%1 (%2) left while driving %3: stopped",_name,_uid,typeOf _vehicle);
    [{
        params ["_vehicle"];
        if (alive _vehicle) then {
            [_vehicle, [0, 0, 0]] remoteExecCall ["setVelocity", _vehicle];
        };
    }, [_vehicle], 1] call CBA_fnc_waitAndExecute;
};
