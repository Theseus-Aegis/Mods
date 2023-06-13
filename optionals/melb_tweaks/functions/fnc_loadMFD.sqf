#include "script_component.hpp"
/*
 * Author: reyhard (original MELB script), Jonpas
 * Loads and initializes MFD.
 *
 * Arguments:
 * 0: RscInGameUI Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * _this call tac_melb_tweaks_fnc_loadMFD
 *
 * Public: No
 */

params ["_display"];
LOG_1("load MFD: %1",_display);

private _vehicle = vehicle (call CBA_fnc_currentUnit);

// core r2t handling
GVAR(camera) = "camera" camCreate [0, 0, 0];
GVAR(camera) attachTo [_vehicle, [0, 0, 0], "commanderview"];
GVAR(camera) cameraEffect ["Internal", "Back", "rendertarget0"];

private _drawID = addMissionEventHandler ["Draw3D", {
    _thisArgs params ["_vehicle"];
    private _dir = (_vehicle selectionPosition "laserstart") vectorFromTo (_vehicle selectionPosition "commanderview");
    GVAR(camera) setVectorDirAndUp [_dir, _dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]];
}, [_vehicle]];
_vehicle setVariable [QGVAR(drawID), _drawID];

// initialize vision mode and zoom
private _mode = _vehicle getVariable [QGVAR(visionMode), 0];
LOG_1("MFD mode init: %1",_mode);
[_mode] call FUNC(setMFDVisionMode);

private _zoom = _vehicle getVariable [QGVAR(zoom), ZOOM_DEFAULT];
LOG_1("MFD zoom init: %1",_zoom);
[_zoom] call FUNC(setMFDZoom);
