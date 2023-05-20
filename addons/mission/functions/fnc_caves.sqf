#include "script_component.hpp"
/*
 * Author: Mike
 * removes Map & MicroDAGR if player has one, ruins radio signal too & makes NVGs impossible to use.
 * Will check an array of markers instead of running multiple per frame handlers on players.
 *
 * No longer handles day/night cycle and now just requires a night mission.
 *
 * Call from initPlayerLocal.sqf.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Markers <ARRAY>
 * 2: Custom Signal <ARRAY> (Optional: Default [0.05, -70])
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, ["Marker_1"]] call MFUNC(caves)
 * [_player, ["Marker_1", "Marker_2"]] call MFUNC(caves)
 */

params ["_player", "_markers", ["_customSignal", [0.05, -70]]];

[{
    params ["_args", "_handle"];
    _args params ["_player", "_markers", "_customSignal", ["_radioSet", false], ["_itemChecks", false]];

    private _inArea = _markers findIf {_player inArea _x};
    private _hasGPS = _player getVariable [QGVAR(hasGPS), false];

    if (_inArea >= 0) then {

        // Wreck Radios
        if (!_radioSet) then {
            [{_customSignal}] call acre_api_fnc_setCustomSignalFunc;
            _args set [4, true];
        };

        // Remove Items
        if (!_itemChecks) then {
            // Check if player has GPS
            private _hasGps = "ACE_microDAGR" in ([_player] call CBA_fnc_uniqueUnitItems);
            _player setVariable [QGVAR(hasGPS), _hasGps];

            if (_hasGps) then {
                _player removeItem "ACE_microDAGR";
            };
            _args set [5, true];

            // Wreck NVGs
            ace_nightvision_aimDownSightsBlur = 2;
            ace_nightvision_effectScaling = 2;
            ace_nightvision_fogScaling = 2;
            ace_nightvision_noiseScaling = 2;

            // Force NVGs off if already on (fails silently if no NVGs equipped)
            _nvg = hmd _player;
            _player unlinkItem _nvg;
            _player linkItem _nvg;

            // annoying ambient sounds you wouldn't hear in a cave/tunnel
            enableEnvironment false;
        };
    };

    if (_inArea == -1) then {
        // Reset Radios
        if (_radioSet) then {
            _args set [4, false];
            [{}] call acre_api_fnc_setCustomSignalFunc;
        };

        // Re-add removed items
        if (_itemChecks) then {
            if (_hasGPS) then {
                _player addItem "ACE_microDAGR";
            };
            _args set [5, false];

            // Reset NVG settings (Defaults from cba_settings)
            ace_nightvision_aimDownSightsBlur = 0.4;
            ace_nightvision_effectScaling = 0.5;
            ace_nightvision_fogScaling = 1;
            ace_nightvision_noiseScaling = 0.3;

            // Enable ambience again
            enableEnvironment [false, true];
        };
    };
}, 2, [_player, _markers, _customSignal]] call CBA_fnc_addPerFrameHandler;
