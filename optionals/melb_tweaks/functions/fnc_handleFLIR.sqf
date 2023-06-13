#include "script_component.hpp"
/*
 * Author: reyhard (original MELB script), Jonpas
 * Handles gunner FLIR camera.
 *
 * Arguments:
 * 0: RscInGameUI Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * _this call tac_melb_tweaks_fnc_handleFLIR
 *
 * Public: No
 */

params ["_display"];

private _player = call CBA_fnc_currentUnit;
private _vehicle = vehicle _player;

private _zoomCtrl = _display displayCtrl 180;
private _distanceCtrl = _display displayCtrl 151;

private _oldMode = (_vehicle currentVisionMode []) select 0; // use turret's vision mode (since 2.08)
private _oldZoom = _vehicle getVariable [QGVAR(zoom), ZOOM_PREOPEN];

[{
    params ["_args", "_handlePFH"];
    _args params ["_player", "_vehicle", "_zoomCtrl", "_distanceCtrl", "_oldMode", "_oldZoom"];

    // open MFD if going into gunner mode
    if (cameraView == "GUNNER" && {_vehicle animationPhase "MFD_CoPilot" == 0}) then {
        _vehicle animate ["copilotpip", 1];
        _vehicle animate ["MFD_CoPilot", 1];
    };

    // instantly sync to these targets
    // global sync will happen on GetOut or SeatSwitched (see postInit) using the setVariable
    private _syncTargets = [driver _vehicle, gunner _vehicle];

    // camera vision mode
    private _mode = (_vehicle currentVisionMode []) select 0;
    if (_oldMode != _mode) then {
        LOG_2("FLIR mode change: %1 -> %2",_oldMode,_mode);
        [QGVAR(visionModeChanged), _mode, _syncTargets] call CBA_fnc_targetEvent;
        _vehicle setVariable [QGVAR(visionMode), _mode];
        _args set [4, _mode]; // set _oldMode
    };

    // camera zoom
    private _zoom = (parseNumber (ctrlText _zoomCtrl));
    if (_oldZoom != _zoom) then {
        LOG_2("FLIR zoom change: %1 -> %2",_oldZoom,_zoom);
        [QGVAR(zoomChanged), _zoom, _syncTargets] call CBA_fnc_targetEvent;
        _vehicle setVariable [QGVAR(zoom), _zoom];
        _args set [5, _zoom]; // set _oldZoom
    };

    // cleanup
    if (isNull _distanceCtrl) then {
        [_handlePFH] call CBA_fnc_removePerFrameHandler;
        LOG("remove FLIR loop");
    };
}, 0.1, [_player, _vehicle, _zoomCtrl, _distanceCtrl, _oldMode, _oldZoom, _syncEvery]] call CBA_fnc_addPerFrameHandler;
