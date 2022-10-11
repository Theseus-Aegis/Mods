#include "script_component.hpp"
/*
 * Author: Jonpas
 * Adds Heavy Lifter actions.
 *
 * Arguments:
 * 0: Target <OBJECT/STRING>
 * 1: Only Given Object (don't apply to all of same class) <BOOL> (default: false)
 * 2: Attach Position (relative to object) <ARRAY> (default: [], use config)
 * 3: Attach Direction (relative to object) <NUMBER> (default: 0)
 * 4: Custom Helper Class <STRING> (default: "")
 *
 * Return Value:
 * None
 *
 * Example:
 * [object] call tac_heavylifter_fnc_addActions
 * [object, true] call tac_heavylifter_fnc_addActions
 * [object, false, [0, 0, 1]] call tac_heavylifter_fnc_addActions
 * [object, false, [0, 0, 1], 90, "B_Quadbike_01_F"] call tac_heavylifter_fnc_addActions
 *
 * Public: Yes
 */

params ["_target", ["_onlyObject", false], ["_attachPos", []], ["_attachDir", 0], ["_helperClass", QGVAR(Helper)]];

private _type = _target;
if (_target isEqualType objNull) then {
    _type = typeOf _target;

    if (!_onlyObject) then {
        _target = typeOf _target;
    };
};

// Exit if class already initialized
if (_type in GVAR(initializedClasses)) exitWith {};

// Attach Position
if (_attachPos isEqualTo []) then {
    _attachPos = getArray (configFile >> "CfgVehicles" >> _type >> QGVAR(attachPos));
};

// Cache
if (!_onlyObject) then {
    GVAR(initializedClasses) pushBack _type;
};
if (count _attachPos == 3 && {_attachPos isNotEqualTo [0, 0, 0]}) then {
    GVAR(attachPositions) set [_type, _attachPos];
};
if (_attachDir != 0) then {
    GVAR(attachDirections) set [_type, _attachDir];
};
if (_helperClass != "") then {
    GVAR(attachHelpers) set [_type, _helperClass];
};

// Actions
private _attachAction = [
    QGVAR(Attach),
    LLSTRING(Attach),
    QPATHTOF(UI\attach_ca.paa),
    {_this call FUNC(progress)},
    {_this call FUNC(canAttach)}
] call ACEFUNC(interact_menu,createAction);

private _detachAction = [
    QGVAR(Detach),
    LLSTRING(Detach),
    QPATHTOF(UI\detach_ca.paa),
    {_this call FUNC(progress)},
    {_this call FUNC(canDetach)}
] call ACEFUNC(interact_menu,createAction);

if (_onlyObject) then {
    [_target, 0, ["ACE_MainActions"], _attachAction] call ACEFUNC(interact_menu,addActionToObject);
    [_target, 0, ["ACE_MainActions"], _detachAction] call ACEFUNC(interact_menu,addActionToObject);
} else {
    [_type, 0, ["ACE_MainActions"], _attachAction] call ACEFUNC(interact_menu,addActionToClass);
    [_type, 0, ["ACE_MainActions"], _detachAction] call ACEFUNC(interact_menu,addActionToClass);
};
