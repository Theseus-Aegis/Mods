#include "script_component.hpp"

[QGVAR(play), {
    params ["_vehicle", "_track"];
    private _source = _vehicle say3D [_track, 10, 1, 2];
    _vehicle setVariable [QGVAR(source), _source];
}] call CBA_fnc_addEventHandler;

[QGVAR(stop), {
    params ["_vehicle"];
    private _source = _vehicle getVariable [QGVAR(source), objNull];
    if (isNull _source) exitWith {}; // Handles Killed & JIP
    deleteVehicle _source;
    _vehicle setVariable [QGVAR(source), objNull];
}] call CBA_fnc_addEventHandler;

{
    _x call FUNC(init);
} forEach ["Car", "Tank", "Helicopter", "Plane", "Ship_F", "Land_SurvivalRadio_F", "Land_FMradio_F"];
