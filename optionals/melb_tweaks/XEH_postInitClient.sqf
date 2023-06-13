#include "script_component.hpp"

// Exit on Server and Headless Clients
if (!hasInterface) exitWith {};

[QGVAR(visionModeChanged), {
    params ["_mode"];
    LOG_1("MFD mode update: %1",_mode);
    [_mode] call FUNC(setMFDVisionMode);
}] call CBA_fnc_addEventHandler;

[QGVAR(zoomChanged), {
    params ["_zoom"];
    LOG_1("MFD zoom update: %1",_zoom);
    [_zoom] call FUNC(setMFDZoom);
}] call CBA_fnc_addEventHandler;

private _syncFLIR = {
    params ["_vehicle"];

    private _mode = _vehicle getVariable [QGVAR(visionMode), 0];
    _vehicle setVariable [QGVAR(visionMode), _mode, true];
    private _mode = _vehicle getVariable [QGVAR(zoom), ZOOM_DEFAULT];
    _vehicle setVariable [QGVAR(zoom), _zoom, true];

    [_vehicle] call FUNC(unloadMFD);
};
["MELB_base", "GetOut", _syncFLIR] call CBA_fnc_addClassEventHandler;
["MELB_base", "SeatSwitched", _syncFLIR] call CBA_fnc_addClassEventHandler;
