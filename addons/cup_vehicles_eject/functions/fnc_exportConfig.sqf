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

private _modifyClasses = [];
private _baseClasses = [];
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
        _modifyClasses pushBackUnique [configName _x, configName _baseClass, _nonEjectDriver, _nonEjectTurrets];
        _sourcePatches pushBackUnique ((configSourceAddonList _x) select 0);

        if !(_baseClass in (_modifyClasses apply {_x select 0})) then {
            _baseClasses pushBackUnique (configName _baseClass);
        };
    };
} forEach (
    (
        "getNumber (_x >> 'scope') == 2 && {(configName _x) isKindOf 'Air'} && {!((configName _x) isKindOf 'UAV_01_base_F')} && {!((configName _x) isKindOf 'UAV')}"
    ) configClasses (configFile >> "CfgVehicles")
);



// Format data to config
private _nl = toString [13, 10];
"ace_clipboard" callExtension format ["class CfgVehicles {%1", _nl];
{
    "ace_clipboard" callExtension format ["    class %2;%1", _nl, _x];
    //"ace_clipboard" callExtension format ["    class %2: %3 {%1        class Turrets;%1    };%1", _nl, _x, ];
} forEach _baseClasses;

// "ace_clipboard" callExtension _nl;
// {
//     "ace_clipboard" callExtension format ["    class %2: %3 {%1        class Turrets;%1    };%1", _nl, configName _x, configName (/*inheritsFrom _x*/ _grandparentClassesIndexed select _forEachIndex)];
// } forEach _parentClasses;

// "ace_clipboard" callExtension _nl;
// {
//     "ace_clipboard" callExtension format ["    class %2: %3 {%1        class Turrets: Turrets {%1            class CopilotTurret;%1        };%1    };%1", _nl, configName _x, configName (/*inheritsFrom _x*/ _parentClassesIndexed select _forEachIndex)];
// } forEach _baseClasses;

"ace_clipboard" callExtension _nl;
{
    _x params ["_class", "_parent", "_nonEjectDriver", "_nonEjectTurrets"];
    "ace_clipboard" callExtension format ["    class %2: %3 {%1", _nl, _class, _parent];

    if (_nonEjectDriver) then {
        "ace_clipboard" callExtension format ["        driverCanEject = 1;%1", _nl];
    };
    if !(_nonEjectTurrets isEqualTo []) then {
        "ace_clipboard" callExtension format ["        class Turrets: Turrets {%1", _nl];
        {
            _x params ["_turret", "_parent"];
            "ace_clipboard" callExtension format ["            class %2: %3 {%1                canEject = 1;%1            };%1", _nl, _turret, _parent];
        } forEach _nonEjectTurrets;
        "ace_clipboard" callExtension format ["        };%1    };%1", _nl];
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
