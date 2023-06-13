#include "script_component.hpp"
/*
 * Author: reyhard (original MELB script), Jonpas
 * Handles gunner FLIR display.
 *
 * Arguments:
 * 0: Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_melb_tweaks_fnc_handleFLIR
 *
 * Public: No
 */

params ["_ctrl"];

LOG("FLIR handler");

private _player = call CBA_fnc_currentUnit;
private _vehicle = vehicle _player;

private _zoomCtrl = _ctrl displayCtrl 180;
private _distanceCtrl = _ctrl displayCtrl 151;

// high refresh rate loop (0.1 second)
private _oldMode = (_vehicle currentVisionMode []) select 0; // use turret's vision mode (since 2.08)

[{
    params ["_args", "_handlePFH"];
    _args params ["_player", "_vehicle", "_zoomCtrl", "_distanceCtrl", "_oldMode"];

    // camera mode handler
    private _mode = (_vehicle currentVisionMode []) select 0;
    if (_oldMode == _mode) then {
        _vehicle setVariable ["MELB_mode", _mode, true];
        _args set [4, _mode]; // set _oldMode
    };

    // open MFD if going into gunner mode
    if (cameraView == "gunner" && {_vehicle animationPhase "MFD_CoPilot" == 0}) then {
        _vehicle animate ["copilotpip", 1];
        _vehicle animate ["MFD_CoPilot", 1];
    };

    // cam zoom handler - gui part
    private _zoomLevel = (parseNumber (ctrlText _zoomCtrl)) * 70;
    private _prependZoomLevel = ["", "0"] select (_zoomLevel <= 99);
    _zoomLevel = [_prependZoomLevel, _zoomLevel] joinString "";

    private _gridA = toArray _zoomLevel;
    private _gridaA = toString [_gridA select 0, _gridA select 1, 32, _gridA select 2];
    _zoom ctrlSetText _gridaA;

    if (isNull _distanceCtrl) then {
        [_handlePFH] call CBA_fnc_removePerFrameHandler;
        LOG("remove FLIR slow refresh loop");
    };
}, 0.1, [_player, _vehicle, _zoomCtrl, _distanceCtrl, _oldMode]] call CBA_fnc_addPerFrameHandler;


// low refresh rate loop (1 second)
// zoom is refreshed at low rate to avoid excessive mp traffic + data is transfered only in case of change
private _oldZoom = 0.3;

[{
    params ["_args", "_handlePFH"];
    _args params ["_vehicle", "_zoomCtrl", "_distanceCtrl", "_oldZoom"];

    // cam zoom handler - visible in gunner cam
    private _zoomLevel = (parseNumber (ctrlText _zoomCtrl)) * 70;

    if (_oldZoom != _zoomLevel) then {
        _vehicle setVariable ["MELB_zoom", _zoomLevel, true];
        _args set [2, _zoomLevel]; // set _oldZoom
        LOG_2("FLIR zoom change",_oldZoom,_zoomLevel);
    };

    if (isNull _distanceCtrl) then {
        [_handlePFH] call CBA_fnc_removePerFrameHandler;
        LOG("remove FLIR high refresh loop");
    };
}, 1, [_vehicle, _zoomCtrl, _distanceCtrl, _oldZoom]] call CBA_fnc_addPerFrameHandler;
