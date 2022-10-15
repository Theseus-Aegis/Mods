#include "script_component.hpp"
/*
 * Author: DaC, Jonpas
 * Toggles the ability to lift this object.
 * Call on server or only one client
 *
 * To verify Attach Position is setup appropriately, check it visually and walk up to it to check for collision issues,
 * then spawn a heavy-duty helicopter and run: `HELI canSlingLoad (attachedObjects OBJECT select 0)`.
 *
 * Arguments:
 * 0: Target Object <OBJECT>
 * 1: Attach Position (relative to object) <ARRAY> (default: [0, 0, 0])
 * 2: Custom Helper Class <STRING> (default: "tac_heavylifter_Helper")
 *
 * Return Value:
 * Helper <OBJECT> (objNull if unpreparing)
 *
 * Example:
 * [object, [0, 0, 1]] call tac_heavylifter_fnc_makeLiftable
 * [object, [0, 0, 1], "B_Quadbike_01_F"] call tac_heavylifter_fnc_makeLiftable
 *
 * Public: Yes
 */

params ["_target", ["_attachPos", [0, 0, 0]], ["_helperClass", QGVAR(Helper)]];

if (_target call FUNC(canAttach)) exitWith {
    [_target, false, _attachPos, _helperClass] call FUNC(prepare)
};

if (_target call FUNC(canDetach)) exitWith {
    [_target, false] call FUNC(unprepare);
    objNull
};
