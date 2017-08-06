/*
 * Author: BaerMitUmlaut, 654wak654, Jonpas
 * Generates the CfgVehicles config to allow ejection from all seats.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call tac_cup_vehicles_eject_fnc_exportConfig
 *
 * Public: No
 */
#include "script_component.hpp"

private _fnc_insertArranged = {
    params ["_classes", "_data"];
    _data params ["_class"];

    private _baseIndex = (_classes apply {_x select 1}) find _class;
    if (_baseIndex == -1) then {
        _classes pushBack _data;
    } else {
        [_classes, _baseIndex, [_data]] call CBA_fnc_insert;
    };
};

private _fnc_addMergeTurrets = {
    params ["_classes", "_class", "_nonEjectTurrets"];

    private _baseClass = inheritsFrom _class;
    private _index = (_classes apply {_x select 0}) find _class;
    if (_index == -1) then {
        [_classes, [_class, _baseClass, _nonEjectTurrets]] call _fnc_insertArranged;
    } else {
        // Add only turrets that don't already exist
        _nonEjectTurrets = _nonEjectTurrets + ((_classes select _index) select 2); // Copy array to not change it in other classes arrays
        _nonEjectTurrets = _nonEjectTurrets arrayIntersect _nonEjectTurrets;
        _classes set [_index, [_class, _baseClass, _nonEjectTurrets]]
    };
};

private _modifyClasses = [];
private _baseClasses = [];
private _baseBaseClasses = [];
private _baseBaseBaseClasses = [];
private _sourcePatches = [];
{
    private _nonEjectDriver = isNumber (_x >> "driverCanEject") && {getNumber (_x >> "driverCanEject") == 0};
    private _nonEjectTurrets = []; // [["turretClass1", "turretParent1"], ["turretClass2", "turretParent2"]]
    {
        if (isNumber (_x >> "canEject") && {getNumber (_x >> "canEject") == 0}) then {
            _nonEjectTurrets pushBack [configName _x, configName (inheritsFrom _x)];
        };
    } forEach ("true" configClasses (_x >> "Turrets"));

    if (_nonEjectDriver || {!(_nonEjectTurrets isEqualTo [])}) then {
        private _baseClass = inheritsFrom _x;
        _modifyClasses pushBackUnique [_x, _baseClass, _nonEjectDriver, _nonEjectTurrets];
        _sourcePatches pushBackUnique ((configSourceAddonList _x) select 0);

        if !(_baseClass in (_modifyClasses apply {_x select 0})) then {
            [_baseClasses, _baseClass, _nonEjectTurrets] call _fnc_addMergeTurrets;

            if (!(_baseBaseClass in (_modifyClasses apply {_x select 0})) && {!(_baseBaseClass in (_baseClasses apply {_x select 0}))}) then {
                [_baseBaseClasses, _baseBaseClass, _nonEjectTurrets] call _fnc_addMergeTurrets;
            };
        };
    };
} forEach (
    (
        "getNumber (_x >> 'scope') == 2 && {(configName _x) isKindOf 'Air'} && {!((configName _x) isKindOf 'UAV_01_base_F')} && {!((configName _x) isKindOf 'UAV')}"
    ) configClasses (configFile >> "CfgVehicles")
);

// Filter baseBase classes, easier as we need turrets
_baseBaseClasses = _baseBaseClasses select {
    !((_x select 0) in (_baseClasses apply {_x select 0}))
};

// Generate most root classes (no need for turrets, so we just do it here to not waste performance with filtering)
{
    private _baseBaseBaseClass = _x select 1;
    if (!(_baseBaseBaseClass in (_modifyClasses apply {_x select 0})) && {!(_baseBaseBaseClass in (_baseClasses apply {_x select 0}))} && {!(_baseBaseBaseClass in (_baseBaseClasses apply {_x select 0}))}) then {
        _baseBaseBaseClasses pushBackUnique _baseBaseBaseClass;
    };
} forEach _baseBaseClasses;


private _fnc_formatBaseClass = {
    params ["_baseClass", "_baseBaseClass", "_nonEjectTurrets"];

    if (_nonEjectTurrets isEqualTo []) then {
        "ace_clipboard" callExtension format ["    class %2;%1", _nl, configName _baseClass];
    } else {
        "ace_clipboard" callExtension format ["    class %2: %3 {%1        class Turrets: Turrets {%1", _nl, configName _baseClass, configName _baseBaseClass];
        private _addedTurrets = [];
        {
            if !((_x select 1) in _addedTurrets) then { // Filter turrets so we don't add more than 1 of same type
                "ace_clipboard" callExtension format ["            class %2;%1", _nl, _x select 1];
                _addedTurrets pushBack (_x select 1);
            };
        } forEach _nonEjectTurrets;
        "ace_clipboard" callExtension format ["        };%1    };%1", _nl];
    };
};

// Format data to config
private _nl = toString [13, 10];
"ace_clipboard" callExtension format ["class CfgVehicles {%1", _nl];
{
    "ace_clipboard" callExtension format ["    class %2;%1", _nl, configName _x];
} forEach _baseBaseBaseClasses;

"ace_clipboard" callExtension _nl;
{
    _x params ["_baseBaseClass", "_baseBaseBaseClass", "_nonEjectTurrets"];
    if (_nonEjectTurrets isEqualTo []) then {
        "ace_clipboard" callExtension format ["    class %2;%1", _nl, configName _baseBaseClass];
    } else {
        "ace_clipboard" callExtension format ["    class %2: %3 {%1        class Turrets;%1    };%1", _nl, configName _baseBaseClass, configName _baseBaseBaseClass];
    };
} forEach _baseBaseClasses;

"ace_clipboard" callExtension _nl;
private _waiting = [];
{
    _x params ["_baseClass", "_baseBaseClass", "_nonEjectTurrets"];

    if (!(_baseBaseClass in (_baseClasses apply {_x select 0})) && {!(_baseBaseClass in (_baseBaseClasses apply {_x select 0}))}) then {
        _waiting pushBack _x; // Base class of this class not yet defined, write later after it has been defined
    } else {
        _x call _fnc_formatBaseClass;
    };
} forEach _baseClasses;

"ace_clipboard" callExtension _nl;
{
    _x params ["_class", "_parent", "_nonEjectDriver", "_nonEjectTurrets"];
    "ace_clipboard" callExtension format ["    class %2: %3 {%1", _nl, configName _class, configName _parent];

    if (_nonEjectDriver) then {
        "ace_clipboard" callExtension format ["        driverCanEject = 1;%1", _nl];
    };
    if !(_nonEjectTurrets isEqualTo []) then {
        "ace_clipboard" callExtension format ["        class Turrets: Turrets {%1", _nl];
        {
            _x params ["_turret", "_parent"];
            "ace_clipboard" callExtension format ["            class %2: %3 {%1                canEject = 1;%1            };%1", _nl, _turret, _parent];
        } forEach _nonEjectTurrets;
        "ace_clipboard" callExtension format ["        };%1", _nl];
    };
    "ace_clipboard" callExtension format ["    };%1", _nl];

    // Write the base class which is now defined
    private _waitingIndex = (_waiting apply {_x select 1}) find _class;
    if (_waitingIndex != -1) then {
        (_waiting select _waitingIndex) call _fnc_formatBaseClass;
    };
} forEach _modifyClasses;
"ace_clipboard" callExtension format ["};%1", _nl];

"ace_clipboard" callExtension format ["%1        requiredAddons[] = {%1", _nl];
{
    if (_forEachIndex + 1 < count _sourcePatches) then {
        "ace_clipboard" callExtension format ["            %2,%1", _nl, str _x];
    } else {
        "ace_clipboard" callExtension format ["            %2%1        };%1", _nl, str _x];
    };
} forEach _sourcePatches;

"ace_clipboard" callExtension "--COMPLETE--";
