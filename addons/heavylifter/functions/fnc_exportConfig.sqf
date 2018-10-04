#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut, 654wak654, Jonpas
 * Generates the CfgVehicles config for heavy lifter compatibility.
 * Must be loaded into the game or Eden editor!
 * Execute in scheduled (spawn) due to canSlingLoad issue!
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] spawn tac_heavylifter_fnc_exportConfig
 *
 * Public: Yes
 */

#define HELPER_CENTER_HEIGHT 1.32

// Recursive function that checks base classes for already defined attach positions
private _fnc_checkBase = {
    params ["_modifyClasses", "_attachPos", "_baseClass"];
    private _baseIndex = (_modifyClasses apply {_x select 0}) find _baseClass;

    if (_baseIndex != -1) exitWith {
        // False if different value defined (reapply), true if same value found (don't apply at all)
        [false, true] select (((_modifyClasses select _baseIndex) select 2) isEqualTo _attachPos);
    };

    // Backtrack to base class of this base class until no base
    private _newBaseClass = inheritsFrom _baseClass;
    if (!isClass _newBaseClass || {configName _newBaseClass == "AllVehicles"}) exitWith {false}; // Exit if no base class left (apply)

    [_modifyClasses, _attachPos, _newBaseClass] call _fnc_checkBase // Check next base class (recursively)
};

private _lifter = createVehicle ["O_Heli_Transport_04_F", [0, 0, 0], [], 0, "NONE"];

private _modifyClasses = [];
private _baseClasses = [];
private _sourcePatches = [];
{
    if (getNumber (_x >> "scope") == 2 && {getArray (_x >> QGVAR(attachPos)) isEqualTo []}) then {
        // Check if it can be slingloaded by default
        private _vehicle = createVehicle [configName _x, [0, 0, 0], [], 0, "NONE"];

        if (!(_lifter canSlingLoad _vehicle) && {getMass _vehicle < 19999}) then { // 20000 is Skycrane, getMass seems to be off by 1
            private _baseClass = inheritsFrom _x;
            private _posWorldVehicle = ASLToAGL (getPosWorld _vehicle);
            private _attachPos = [
                0,
                -((getCenterOfMass _vehicle) select 1),
                -((_vehicle worldToModelVisual [_posWorldVehicle select 0, _posWorldVehicle select 1, HELPER_CENTER_HEIGHT]) select 2) // Must use correct X and Y as well for worldToModel
            ] apply {round (_x * 100) / 100}; // Round to 2 decimal places

            // Backtrack base classes to see if any already has the same value applied, reapply if a different value is found instead of none
            if !([_modifyClasses, _attachPos, _baseClass] call _fnc_checkBase) then {
                // Save class and base class
                _modifyClasses pushBackUnique [_x, _baseClass, _attachPos];
                _sourcePatches pushBackUnique ((configSourceAddonList _x) select 0);
                if !(_baseClass in (_modifyClasses apply {_x select 0})) then {
                    _baseClasses pushBackUnique _baseClass;
                };
            };
        };
        deleteVehicle _vehicle;
    };
    false
} count (
    (
        "((configName _x) isKindOf 'Helicopter' || (configName _x) isKindOf 'Plane' || (configName _x) isKindOf 'Car' || (configName _x) isKindOf 'Tank') || (configName _x) isKindOf 'Ship_F' || (configName _x) isKindOf 'Motorcycle'"
    ) configClasses (configFile >> "CfgVehicles")
);

deleteVehicle _lifter;

// Generate config
private _nl = toString [13, 10];
"ace_clipboard" callExtension format ["class CfgVehicles {%1", _nl];
{
    "ace_clipboard" callExtension format ["    class %2;%1", _nl, configName _x];
    false
} count _baseClasses;
"ace_clipboard" callExtension _nl;
{
    _x params ["_class", "_parent", "_attachPos"];
    "ace_clipboard" callExtension format [
        "    class %2: %3 {%1        GVAR(attachPos)[] = {%4, %5, %6};%1    };%1",
        _nl, configName _class, configName _parent, _attachPos select 0, _attachPos select 1, _attachPos select 2
    ];
    false
} count _modifyClasses;
"ace_clipboard" callExtension format ["};%1", _nl];

"ace_clipboard" callExtension format ["%1        requiredAddons[] = {%1", _nl];
{
    if (_forEachIndex + 1 < count _sourcePatches) then {
        "ace_clipboard" callExtension format ['            "%2",%1', _nl, _x];
    } else {
        "ace_clipboard" callExtension format ['            "%2"%1        };%1', _nl, _x];
    };
} forEach _sourcePatches;

"ace_clipboard" callExtension "--COMPLETE--";
