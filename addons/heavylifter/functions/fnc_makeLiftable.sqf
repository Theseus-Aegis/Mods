#include "script_component.hpp"
/*
 * Author: DaC, Jonpas
 * Toggles the ability to lift this object.
 *
 * Attach Position defines offset in X, Y, Z of the helper object attachment.
 * Some objects (eg. IDAP cargo containers) require helper object to be higher
 * up for slingloading to work, eg. [0, 0, 1.4].
 *
 * Arguments:
 * 0: Target Object <OBJECT>
 * 1: Attach Position (relative to object) <ARRAY> (default: [0, 0, 0])
 * 2: Attach Orientation (relative to object) <NUMBER> (default: 0)
 * 3: Custom Helper Class <STRING> (default: "tac_heavylifter_Helper")
 *
 * Return Value:
 * None
 *
 * Example:
 * [object, [0, 0, 1]] call tac_heavylifter_fnc_makeLiftable
 * [object, [0, 0, 1], 0, "B_Quadbike_01_F"] call tac_heavylifter_fnc_makeLiftable
 *
 * Public: Yes
 */

params ["_target", ["_attachPos", [0, 0, 0]], ["_attachDir", 0], ["_helperClass", QGVAR(Helper)]];

if (_target call FUNC(canAttach)) exitWith {
    [_target, false, _attachPos, _attachDir, _helperClass] call FUNC(prepare);
};

if (_target call FUNC(canDetach)) exitWith {
    [_target, false] call FUNC(unprepare);
};
