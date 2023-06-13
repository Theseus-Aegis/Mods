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

if (_player != gunner _vehicle) exitWith {};
LOG_1("handleFLIR: %1",_vehicle);

private _zoomCtrl = _display displayCtrl 180;

private _oldMode = (_vehicle currentVisionMode []) select 0; // use turret's vision mode (since 2.08)
private _oldZoom = _vehicle getVariable [QGVAR(zoom), ZOOM_PREOPEN];

// Wait a frame for display controls to be fully initialized
[{
    // Sync properties every second to conserve on network, camera direction (more important for fluidity) is synced by the game
    [{
        params ["_args", "_handlePFH"];
        _args params ["_zoomCtrl", "_player", "_vehicle", "_oldMode", "_oldZoom"];

        if (isNull _zoomCtrl) then {
            [_handlePFH] call CBA_fnc_removePerFrameHandler;
            LOG_1("remove FLIR loop: %1",_vehicle);
        };

        private _syncTargets = [driver _vehicle, gunner _vehicle];

        // Camera vision mode (can change without being in camera view)
        private _mode = (_vehicle currentVisionMode []) select 0;
        if (_oldMode != _mode) then {
            LOG_2("FLIR mode change: %1 -> %2",_oldMode,_mode);
            _vehicle setVariable [QGVAR(mode), _mode, true];
            [QGVAR(syncMode), _mode, _syncTargets] call CBA_fnc_targetEvent;
            _args set [3, _mode]; // set _oldMode
        };

        private _inFlirCamera = cameraView == "GUNNER";
        if (_inFlirCamera) then {
            // Camera zoom
            private _zoom = parseNumber (ctrlText _zoomCtrl);
            if (_oldZoom != _zoom) then {
                LOG_2("FLIR zoom change: %1 -> %2",_oldZoom,_zoom);
                _vehicle setVariable [QGVAR(zoom), _zoom, true];
                [QGVAR(syncZoom), _zoom, _syncTargets] call CBA_fnc_targetEvent;
                _args set [4, _zoom]; // set _oldZoom
            };

            // Open MFD if going into gunner mode
            if (_vehicle animationPhase "MFD_CoPilot" == 0) then {
                _vehicle animate ["MFD_CoPilot", 1];
                _vehicle animate ["copilotpip", 1];
            };

            // Stabilization
            private _geolock = inputAction "vehLockTurretView";
            if (_geolock > 0) then {
                diag_log "geolock!";
            };
        };
    }, 0.1, _this] call CBA_fnc_addPerFrameHandler;
}, [_zoomCtrl, _player, _vehicle, _oldMode, _oldZoom]] call CBA_fnc_execNextFrame;
