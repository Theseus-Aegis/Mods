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

private _vehicle = vehicle ACE_player;

if (ACE_player != gunner _vehicle) exitWith {};
LOG_1("handleFLIR: %1",_vehicle);

private _zoomCtrl = _display displayCtrl 180;

// Geolock
_vehicle enableDirectionStabilization [false, [0]]; // disable by default (config enables it and is required to use at all)
(_display displayCtrl 333) ctrlSetText "----";
private _lockActionID = addUserActionEventHandler ["vehLockTurretView", "Activate", {
    [vehicle ACE_player] call FUNC(geolock);
}];

// Wait a frame for display controls to be fully initialized
[{
    // Sync properties every second to conserve on network, camera direction (more important for fluidity) is synced by the game
    [{
        params ["_args", "_handlePFH"];
        _args params ["_zoomCtrl", "_vehicle", "_lockActionID"];

        if (isNull _zoomCtrl) exitWith {
            [_handlePFH] call CBA_fnc_removePerFrameHandler;
            removeUserActionEventHandler ["vehLockTurretView", "Activate", _lockActionID];
            LOG_1("remove FLIR loop: %1",_vehicle);
        };

        private _syncTargets = [driver _vehicle, gunner _vehicle];

        // Camera vision mode (can change without being in camera view)
        private _oldMode = _vehicle getVariable [QGVAR(mode), MODE_DEFAULT];
        private _mode = _vehicle currentVisionMode []; // use turret's vision mode (since 2.08)
        if (_oldMode isNotEqualTo _mode) then {
            LOG_2("FLIR mode change: %1 -> %2",_oldMode,_mode);
            _vehicle setVariable [QGVAR(mode), _mode, true];
            [QGVAR(syncMode), [_mode], _syncTargets] call CBA_fnc_targetEvent;
        };

        private _inFlirCamera = cameraView == "GUNNER";
        if (_inFlirCamera) then {
            // Camera zoom
            private _oldZoom = _vehicle getVariable [QGVAR(zoom), ZOOM_PREOPEN];
            private _zoom = parseNumber (ctrlText _zoomCtrl);
            if (_oldZoom != _zoom) then {
                LOG_2("FLIR zoom change: %1 -> %2",_oldZoom,_zoom);
                _vehicle setVariable [QGVAR(zoom), _zoom, true];
                [QGVAR(syncZoom), [_zoom], _syncTargets] call CBA_fnc_targetEvent;
            };

            // Open MFD if going into gunner mode
            if (_vehicle animationPhase "MFD_CoPilot" == 0) then {
                _vehicle call FUNC(toggleMFD);
            };
        };
    }, 0.1, _this] call CBA_fnc_addPerFrameHandler;
}, [_zoomCtrl, _vehicle, _lockActionID]] call CBA_fnc_execNextFrame;
