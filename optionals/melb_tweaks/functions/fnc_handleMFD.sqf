#include "script_component.hpp"
/*
 * Author: reyhard (original MELB script), Jonpas
 * Handles MFDs.
 *
 * Arguments:
 * 0: Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_ctrl] call tac_melb_tweaks_fnc_handleMFD
 *
 * Public: No
 */

params ["_ctrl"];

LOG("handler");

// initialization
private _oldZoom = 0.3;
private _vehicle = vehicle (call CBA_fnc_currentUnit);
private _widget = _ctrl displayCtrl 120;

// core r2t handling
GVAR(camera) = "camera" camCreate [0, 0, 0];
GVAR(camera) cameraEffect ["Internal", "Back", "rendertarget0"];

GVAR(camera) attachTo [_vehicle, [0, 0, 0], "commanderview"];
GVAR(camera) camSetFov (0.3 / _oldZoom);

"rendertarget0" setPiPEffect [3, 1, 1, 0.8, -0.01, [0, 0, 0, 0], [1, 1, 1, 1], [1, 1, 1, 0]];

private _drawID = addMissionEventHandler ["Draw3D", {
    _thisArgs params ["_vehicle"];

    private _dir = (_vehicle selectionPosition "laserstart") vectorFromTo (_vehicle selectionPosition "commanderview");

    _dir params ["_x", "_y"];
    GVAR(camera) setVectorDirAndUp [_dir, _dir vectorCrossProduct [-y, _x, 0]];
}, [_vehicle]];

// low refresh rate loop (1 second)
[{
    params ["_args", "_handlePFH"];
    _args params ["_vehicle", "_widget", "_drawID", "_oldZoom"];

    // pip camera zoom - as zoom data is synced max at each seconds, there is small transition applied
    private _zoom = (_vehicle getVariable ["MELB_zoom", 42]) / 40;
    if (_oldZoom != _zoom) then {
        GVAR(camera) camSetFov (0.3 / _zoom);
        _args set [3, _zoom]; // set _oldZoom
    };

    if (isNull _widget) then {
        [_handlePFH] call CBA_fnc_removePerFrameHandler;
        removeMissionEventHandler ["Draw3D", _drawID];
        LOG("remove low refresh loop");

        GVAR(camera) cameraEffect ["terminate", "back"];
        camDestroy GVAR(camera);
        GVAR(camera) = nil;
    };
}, 1, [_vehicle, _widget, _drawID, _oldZoom]] call CBA_fnc_addPerFrameHandler;

// high refresh rate loop (0.1 second)
private _old = 0;

[{
    params ["_args", "_handlePFH"];
    _args params ["_vehicle", "_widget", "_old"];

    // camera mode handler
    private _mode = _vehicle getVariable ["MELB_mode", 0];
    if (_mode != _old) then {
        GVAR(camera) cameraEffect ["terminate","back"];
        GVAR(camera) cameraEffect ["internal", "Back", "rendertarget0"];

        [_mode] call FUNC(setModeMFD);

        _args set [2, _mode]; // set _old
        LOG_2("mode change",_old,_mode);
    };

    if (isNull _widget) then {
        [_handlePFH] call CBA_fnc_removePerFrameHandler;
        LOG("remove high refresh loop");
    };
}, 0.1, [_vehicle, _widget, _old]] call CBA_fnc_addPerFrameHandler;
