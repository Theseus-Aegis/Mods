#include "..\script_component.hpp"
/*
 * Author: Jonpas, Rory, Mike
 * Orders a unit to target an object and begin firing until either the shooter or target is dead or the timer elapses.
 * Firemode types Single (0) and Full auto (1)
 * Set firing timer to 0.1 for full auto
 * Designed ONLY for infantry, using with vehicles will result in undefined behaviour.
 *
 * Arguments:
 * 0: AI Shooter <OBJECT>
 * 1: Target <OBJECT>
 * 2: Firemode <NUMBER> (default: 0)
 * 3: Timer <NUMBER> (default: 10)
 * 4: Time between shots <NUMBER> (default: 1)
 *
 * Return Value:
 * None
 *
 * Example:
 * [shooter, target] call MFUNC(forceShooting)
 * [shooter, target, 20] call MFUNC(forceShooting)
 * [shooter, target, 30, 0.5] call MFUNC(forceShooting)
*/

#define FIREMODE_TYPES ["Single", "FullAuto"]

params ["_shooter", "_target", ["_firemode", 0], ["_timer", 10], ["_firingTimer", 1]];

if !(local _shooter) exitWith {};

private _weapon = currentWeapon _shooter;
private _time = CBA_missionTime;
private _firemodeType = FIREMODE_TYPES select _firemode;

// Limit firing timer.
_firingTimer = _firingTimer max 0.1;

_shooter doTarget _target;

// Replace magazines so unit doesn't run out.
private _ehIndex = _shooter addEventHandler ["Reloaded", {
    params ["_unit", "", "", "_newMagazine"];
    private _magazine = _newMagazine select 0;
    _unit addMagazine _magazine;
}];

// Wait for unit to actually target.
[{
    private _firingTimer = (_this select 0) select 4;

    [{
        params ["_args", "_handle"];
        _args params ["_functionArgs", "_additionalArgs"];
        _functionArgs params ["_shooter", "_target", "", "_timer"];
        _additionalArgs params ["_weapon", "_time", "_firemodeType", "_ehIndex"];

        // Exit if unit is dead, target is dead or time has elapsed.
        if (!alive _shooter || {!alive _target} || {CBA_missionTime >= _time + _timer}) then {
            [_handle] call CBA_fnc_removePerFrameHandler;
            _shooter removeEventHandler ["Reloaded", _ehIndex];
            _shooter doWatch objNull;
        };

        _shooter forceWeaponFire [_weapon, _firemodeType];

    }, _firingTimer, _this] call CBA_fnc_addPerFrameHandler;
}, [_this, [_weapon, _time, _firemodeType, _ehIndex]], 1] call CBA_fnc_waitAndExecute;
