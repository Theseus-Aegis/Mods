#include "script_component.hpp"
/*
 * Author: DaC, Jonpas
 * Prepares the object for heavy lifting.
 *
 * Arguments:
 * 0: Target Object <OBJECT>
 * 1: Called from Interaction Menu <BOOL> (default: true)
 * 2: Attach Position (relative to object) <ARRAY> (default: [0, 0, 0])
 * 3: Attach Direction (relative to object) <NUMBER> (default: 0)
 * 4: Custom Helper Class <STRING> (default: "tac_heavylifter_Helper")
 *
 * Return Value:
 * None
 *
 * Example:
 * [object] call tac_heavylifter_fnc_prepare
 *
 * Public: No
 */

params ["_target", ["_actionCall", true], ["_attachPos", [0, 0, 0]], ["_attachDir", 0], ["_helperClass", QGVAR(Helper)]];

// No need to read config as every object that has attach position in config will already have an action and position cached
if (_actionCall) then {
    _attachPos = GVAR(attachPositions) getOrDefault [typeOf _target, _attachPos];
    _attachDir = GVAR(attachDirections) getOrDefault [typeOf _target, _attachDir];
    _helperClass = GVAR(attachHelpers) getOrDefault [typeOf _target, _helperClass];
};

// Create helper object on original vehicle location, prevent damage
private _helper = createVehicle [_helperClass, [0, 0, 0]];
[_helper, "blockDamage", QUOTE(ADDON), true] call ACEFUNC(common,statusEffect_set);
_helper enableSimulationGlobal false;

#ifndef DEBUG_MODE_FULL
_helper setObjectTextureGlobal [0, ""];
#endif

// Attach helper object to vehicle with offset and set relative orientation
_helper attachTo [_target, _attachPos];
_helper setVectorDirAndUp [[sin _attachDir, cos _attachDir, 0], [0, 0, 1]];

// Set variable with helper object
_target setVariable [QGVAR(prepared), [_target, _helper], true];

if (_actionCall) then {
    [localize LSTRING(Attached), QPATHTOF(UI\attach_ca.paa)] call ACEFUNC(common,displayTextPicture);
};
