#include "..\script_component.hpp"
/*
 * Author: Mike
 * Fires any selected support on designated position and returns ETA.
 * Called via server event.
 *
 * Arguments:
 * 0: Support Vehicle <OBJECT>
 * 1: Marker <MARKER>
 * 2: Rounds to Fire <NUMBER>
 * 3: Ammo To Fire <STRING>
 * 4: Delay <NUMBER>
 *
 * Return Value:
 * 0: ETA (Seconds) <NUMBER>
 *
 * Example:
 * [] call FUNC(doArtilleryFire);
 */

params ["_supportVehicle", "_marker", "_roundsToFire", "_ammoToFire", "_delay"];

private _eta = round (_supportVehicle getArtilleryETA [(getMarkerPos _marker), _ammoToFire]);
private _gunner = gunner _supportVehicle;

for "_i" from 1 to _roundsToFire do {
    private _position = [_marker, GVAR(perimeterImpact)] call CBA_fnc_randPosArea;

    [{
        params ["_vehicle", "_position", "_ammoToFire", "_gunner"];

        ["tac_mission_doArtilleryFire", [_gunner, [_position, _ammoToFire, 1]], _gunner] call CBA_fnc_targetEvent;
        ["tac_mission_setVehicleAmmo", [_vehicle, 1], _vehicle] call CBA_fnc_targetEvent;

    }, [_supportVehicle, _position, _ammoToFire, _gunner], _i * _delay] call CBA_fnc_waitAndExecute;
};

_eta
