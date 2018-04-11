/*
 * Author: Corello
 * Initialises the disguise system for the client.
 * Call from initPlayerLocal.sqf
 *
 * Arguments:
 * 0: The player <OBJECT>
 * 1: List of civilian uniforms <ARRAY>
 * 2: List of civilian vests <ARRAY> (default: [])
 * 3: List of civilian backpacks <ARRAY> (default: [])
 * 4: List of civilian goggles <ARRAY> (default: [])
 * 5: List of civilian headgear <ARRAY> (default: [])
 * 6: List of civilian vehicles <ARRAY> (default: [])
 * 7: List of no civilians allowed markers <ARRAY> (default: [])
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, uniforms] call FUNC(init);
 */
#include "script_component.hpp"

params ["_playerObject", "_uniforms", ["_vests", []], ["_backpacks", []], ["_goggles", []], ["_headgear", []], ["_vehicles", []], ["_markers", []]];

GVAR(civilianUniforms) = _uniforms;
GVAR(civilianVests) = _vests;
GVAR(civilianBackpacks) = _backpacks;
GVAR(civilianGoggles) = _goggles;
GVAR(civilianHeadgear) = _headgear;
GVAR(civilianVehicles) = _vehicles;
GVAR(civilianExcludeMarkers) = _markers;

[_playerObject] call FUNC(addCheckDisguiseAction);
[_playerObject] call FUNC(addDisguiseHandler);