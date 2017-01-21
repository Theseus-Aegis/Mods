/*
 * Author: BaerMitUmlaut, 654wak654
 * Generates the CfgVehicles config to allow ejection from all seats.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * CfgVehicles Content <STRING>
 *
 * Example:
 * [] call tac_cup_vehicles_eject_fnc_exportConfig
 *
 * Public: No
 */
#include "script_component.hpp"

private _modifyClasses = [];
private _sourcePatches = [];
private _baseClasses = [];
/*private _parentClasses = [];
private _grandparentClasses = [];*/
{
    private _baseClass = inheritsFrom _x;
    _modifyClasses pushBackUnique [_x, _baseClass, configSourceAddonList _x];
    _sourcePatches pushBackUnique ((configSourceAddonList _x) select 0);

    if !(_baseClass in (_modifyClasses apply {_x select 0})) then {
        _baseClasses pushBackUnique _baseClass;
        /*if (_baseClasses pushBackUnique _baseClass == -1) then {
            private _parentClass = inheritsFrom _baseClass;
            if !(_parentClass in _baseClasses) then {
                if (_parentClasses pushBackUnique _parentClass == -1) then {
                    private _grandparentClass = inheritsFrom _parentClass;
                    if (!(_grandparentClass in _baseClasses) && !(_grandparentClass in _parentClasses)) then {
                        _grandparentClasses pushBackUnique (inheritsFrom _parentClass);
                    };
                };
            };
        };*/
    };

    false
} count (
    ("(configName _x) select [0, 4] == 'CUP_' &&" +
    "{(configName _x) isKindOf 'Air'} && {!((configName _x) isKindOf 'UAV_01_base_F')} && {!((configName _x) isKindOf 'UAV')} &&" +
    "{!isNull (_x >> 'driverCanEject')} &&" +
    "{getNumber (_x >> 'scope') == 2} &&" +
    "{getNumber (_x >> 'driverCanEject') == 0 || {getNumber (_x >> 'Turrets' >> 'CopilotTurret' >> 'canEject') == 0}}")
    configClasses (configFile >> "CfgVehicles")
);

private _parentClasses = [];
private _parentClassesIndexed = [];
private _grandparentClasses = [];
private _grandparentClassesIndexed = [];
{
    private _parentClass = inheritsFrom _x;
    if (_parentClass in _baseClasses) then {
        _baseClasses deleteAt (_baseClasses find _parentClass);
    };
    _parentClasses pushBackUnique _parentClass;
    _parentClassesIndexed pushBack _parentClass;
} forEach _baseClasses;

{
    private _grandparentClass = inheritsFrom _x;
    /*if (_grandparentClass in _parentClasses) then {
        _parentClasses deleteAt (_parentClasses find _grandparentClass);
    };*/
    if (_grandparentClass in _baseClasses) then {
        _baseClasses deleteAt (_baseClasses find _grandparentClass);
    };
    if !(_grandparentClass in _parentClasses) then {
        _grandparentClasses pushBackUnique _grandparentClass;
    };
    _grandparentClassesIndexed pushBack _grandparentClass;
} forEach _parentClasses;


// Format data to config
private _nl = toString [13, 10];
"ace_clipboard" callExtension (format ["class CfgVehicles {%1", _nl]);
{
    "ace_clipboard" callExtension (format ["    class %2;%1", _nl, configName _x]);
} forEach _grandparentClasses;

"ace_clipboard" callExtension _nl;
{
    "ace_clipboard" callExtension (format ["    class %2: %3 {%1        class Turrets;%1    };%1", _nl, configName _x, configName (/*inheritsFrom _x*/ _grandparentClassesIndexed select _forEachIndex)]);
} forEach _parentClasses;

"ace_clipboard" callExtension _nl;
{
    "ace_clipboard" callExtension (format ["    class %2: %3 {%1        class Turrets: Turrets {%1            class CopilotTurret;%1        };%1    };%1", _nl, configName _x, configName (/*inheritsFrom _x*/ _parentClassesIndexed select _forEachIndex)]);
} forEach _baseClasses;

"ace_clipboard" callExtension _nl;
{
    _x params ["_class", "_parent", "_sources"];
    "ace_clipboard" callExtension (format ["    class %2: %3 { // Sources: %4%1        driverCanEject = 1;%1        class Turrets: Turrets {%1            class CopilotTurret: CopilotTurret {%1                canEject = 1;%1            };%1        };%1    };%1", _nl, configName _class, configName _parent, _sources]);
} forEach _modifyClasses;
"ace_clipboard" callExtension (format ["};%1", _nl]);

"ace_clipboard" callExtension (format ["%1        requiredAddons[] = {%1", _nl]);
{
    if (_forEachIndex + 1 < count _sourcePatches) then {
        "ace_clipboard" callExtension (format ["            %2,%1", _nl, str _x]);
    } else {
        "ace_clipboard" callExtension (format ["            %2%1        };%1", _nl, str _x]);
    };
} forEach _sourcePatches;

"ace_clipboard" callExtension "--COMPLETE--";
//copyToClipboard str [_grandparentClasses apply {configName _x}, _parentClasses apply {configName _x}, _baseClasses apply {configName _x}];
_output
