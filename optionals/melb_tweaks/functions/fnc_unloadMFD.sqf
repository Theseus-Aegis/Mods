#include "script_component.hpp"
/*
 * Author: reyhard (original MELB script), Jonpas
 * Unloads MFD.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle] call tac_melb_tweaks_fnc_unloadMFD
 *
 * Public: No
 */

params ["_vehicle"];
LOG_1("unload MFD: %1",_vehicle);

private _drawID = _vehicle getVariable [QGVAR(drawID), -1];
removeMissionEventHandler ["Draw3D", _drawID];

GVAR(camera) cameraEffect ["terminate", "back"];
camDestroy GVAR(camera);
GVAR(camera) = nil;
