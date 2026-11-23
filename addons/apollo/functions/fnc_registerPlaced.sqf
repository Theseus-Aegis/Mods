#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Makes an object a player placed persistent (a trench, sandbags, a fortification, a tripod, a
 * deployed static weapon), if its setting is on: registered and saved a second later, once placing
 * is done. Objects made before the vehicles are loaded (the mission's, Chronos' own) are left
 * alone. Server only.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Its setting is on <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_trench, GVAR(vehiclesObjects)] call tac_apollo_fnc_registerPlaced
 *
 * Public: No
 */

params ["_object", "_enabled"];

if (!_enabled || {!GVAR(vehiclesLoaded)} || {isNull _object}) exitWith {};

[{
    params ["_object"];
    if (isNull _object || {(_object getVariable [QGVAR(vehicleID), ""]) != ""}) exitWith {};
    [_object] call FUNC(registerVehicle);
    [_object] call FUNC(vehicleSingletonSave);
    INFO_2("Placed %1 made persistent (%2)",typeOf _object,_object getVariable QGVAR(vehicleID));
}, [_object], 1] call CBA_fnc_waitAndExecute;
