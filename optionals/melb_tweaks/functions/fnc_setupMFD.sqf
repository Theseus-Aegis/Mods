#include "script_component.hpp"
/*
 * Author: Jonpas
 * Sets up MFD (after load or monitor toggle).
 *
 * Arguments:
 * 0: Vehicle <OBJECt>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle] call tac_melb_tweaks_fnc_setupMFD
 *
 * Public: No
 */

params ["_vehicle"];
LOG_1("setup MFD: %1",_vehicle);

GVAR(camera) cameraEffect ["Internal", "BACK", "rendertarget0"];

private _mode = _vehicle getVariable [QGVAR(mode), MODE_DEFAULT];
LOG_1("MFD mode init: %1",_mode);
[_mode] call FUNC(setMFDMode);

private _zoom = _vehicle getVariable [QGVAR(zoom), ZOOM_DEFAULT];
LOG_1("MFD zoom init: %1",_zoom);
[_zoom] call FUNC(setMFDZoom);
