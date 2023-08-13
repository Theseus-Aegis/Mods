#include "script_component.hpp"

[QGVAR(play), {
    private _source = (_this select 0) say3D [(_this select 1), 10, 1, 2];
    (_this select 0) setVariable [QGVAR(playingRadio), _source];
}] call CBA_fnc_addEventHandler;

[QGVAR(stop), {deleteVehicle (_this select 0)}] call CBA_fnc_addEventHandler;
