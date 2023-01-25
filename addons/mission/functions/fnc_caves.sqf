#include "script_component.hpp"
/*
 * Author: Mike
 * Handles night-time cycle in caves, removes Map & MicroDAGR if player has one.
 * Will check an array of markers instead of running multiple per frame handlers on players.
 *
 * Call from initPlayerLocal.sqf.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Markers <ARRAY>
 * 2: Time <NUMBER> (Optional: Default 23)
 * 3: Custom Signal <ARRAY> (Optional: Default [0.05, -70])
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, ["Marker_1"]] call MFUNC(caves)
 * [_player, ["Marker_1", "Marker_2"]] call MFUNC(caves)
 */

params ["_player", "_markers", ["_time", 23], ["_customSignal", [0.05, -70]]];

private _nightTime = date;
_nightTime set [3, _time];

[{
    params ["_args", "_handle"];
    _args params ["_player", "_markers", "_customSignal", "_nightTime", ["_radioSet", false], ["_itemChecks", false]];

    private _inArea = _markers findIf {_player inArea _x};
    private _hasGPS = _player getVariable [QGVAR(hasGPS), false];
    private _hasWatch = _player getVariable [QGVAR(hasWatch), false];

    if (_inArea >= 0) then {
        setDate _nightTime;

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

            // Check if player has Watch
            private _hasWatch = "ItemWatch" in ([_player] call CBA_fnc_uniqueUnitItems);
            _player setVariable [QGVAR(hasWatch), _hasWatch];

            if (_hasGps) then {
                _player removeItem "ACE_microDAGR";
            };
            if (_hasWatch) then {
                _player unlinkItem "ItemWatch";
            };
            _args set [5, true];
        };
    };

    if (_inArea == -1) then {
        // Single/MP Testing
        if (is3DENPreview) then {
            private _testingDate = date;
            _testingDate set [3, 10];
            setDate _testingDate;
        };

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
            if (_hasWatch) then {
                _player linkItem "ItemWatch";
            };
            _args set [5, false];
        };
    };
}, 1, [_player, _markers, _customSignal, _nightTime]] call CBA_fnc_addPerFrameHandler;
